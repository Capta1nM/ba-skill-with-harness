#!/usr/bin/env bash
# bootstrap.sh — Scaffold a new BA engagement từ ba-skill project template
#
# Behavior:
#   1. Tạo <engagement-path>/ (nếu chưa có)
#   2. Copy _project-root/* → <engagement-path>/
#   3. Copy docs/* → <engagement-path>/docs/
#   4. Copy ~/.claude/skills/ba-skill/agents/* → <engagement-path>/.claude/agents/
#   5. Substitute placeholders: {ENGAGEMENT_NAME}, {METHODOLOGY}, {BOOTSTRAP_DATE}
#   6. Print next steps
#
# Usage:
#   bash bootstrap.sh /path/to/engagement [--engagement-name=NAME] [--methodology=SHAPE]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -lt 1 ]]; then
  echo "Usage: bash bootstrap.sh <engagement-path> [--engagement-name=NAME] [--methodology=undecided|srs-only|prd-stories|stories-only]"
  exit 1
fi

ENGAGEMENT_PATH="$1"
shift

ENGAGEMENT_NAME=""
METHODOLOGY="undecided"
DRY_RUN=false

for arg in "$@"; do
  case "$arg" in
    --engagement-name=*) ENGAGEMENT_NAME="${arg#*=}" ;;
    --methodology=*)     METHODOLOGY="${arg#*=}" ;;
    --dry-run)           DRY_RUN=true ;;
    *) echo "Unknown arg: $arg" >&2; exit 1 ;;
  esac
done

# Default engagement-name from path basename
if [[ -z "$ENGAGEMENT_NAME" ]]; then
  ENGAGEMENT_NAME="$(basename "$ENGAGEMENT_PATH")"
fi

# Validate methodology
case "$METHODOLOGY" in
  undecided|srs-only|prd-stories|stories-only) ;;
  *) echo "Invalid methodology: $METHODOLOGY (must be undecided|srs-only|prd-stories|stories-only)" >&2; exit 1 ;;
esac

BOOTSTRAP_DATE="$(date +%Y-%m-%d)"

# Resolve agents source — try npx skills location first (per install.sh),
# then claude native skills location, then sibling of project-template/.
AGENTS_SRC=""
for candidate in \
  "${HOME}/.agents/skills/ba-skill/agents" \
  "${HOME}/.claude/skills/ba-skill/agents" \
  "${SCRIPT_DIR}/../agents" \
  "$(dirname "$(dirname "$SCRIPT_DIR")")/agents"; do
  if [[ -d "$candidate" ]]; then
    AGENTS_SRC="$candidate"
    break
  fi
done

if [[ -z "$AGENTS_SRC" ]]; then
  echo "❌ Cannot find agents/ source. Have you run install.sh?" >&2
  echo "   Checked:" >&2
  echo "     ${HOME}/.agents/skills/ba-skill/agents" >&2
  echo "     ${HOME}/.claude/skills/ba-skill/agents" >&2
  echo "     ${SCRIPT_DIR}/../agents" >&2
  exit 1
fi

echo "📦 Bootstrapping engagement..."
echo "   Target: ${ENGAGEMENT_PATH}"
echo "   Engagement name: ${ENGAGEMENT_NAME}"
echo "   Methodology: ${METHODOLOGY}"
echo "   Bootstrap date: ${BOOTSTRAP_DATE}"
echo "   Agents source: ${AGENTS_SRC}"
echo ""

run() {
  echo "  $ $*"
  if [[ "$DRY_RUN" == "false" ]]; then
    eval "$@"
  fi
}

# Safety check
if [[ -d "$ENGAGEMENT_PATH" ]] && [[ -n "$(ls -A "$ENGAGEMENT_PATH" 2>/dev/null)" ]]; then
  if [[ -f "$ENGAGEMENT_PATH/.project-config.yml" ]]; then
    echo "❌ ${ENGAGEMENT_PATH} already has .project-config.yml — engagement already bootstrapped." >&2
    echo "   To re-bootstrap, archive and clear the folder first." >&2
    exit 1
  fi
  echo "⚠️  Target folder is not empty. Proceeding (will overlay)."
fi

# Step 1: create + copy _project-root
echo "[1/3] Copy _project-root/* → ${ENGAGEMENT_PATH}/"
run "mkdir -p ${ENGAGEMENT_PATH}"
run "cp -r ${SCRIPT_DIR}/_project-root/. ${ENGAGEMENT_PATH}/"

# Step 2: copy docs
echo "[2/3] Copy docs/* → ${ENGAGEMENT_PATH}/docs/"
run "mkdir -p ${ENGAGEMENT_PATH}/docs"
run "cp -r ${SCRIPT_DIR}/docs/. ${ENGAGEMENT_PATH}/docs/"

# Step 3: copy agents
echo "[3/3] Copy agents/*.md → ${ENGAGEMENT_PATH}/.claude/agents/"
run "mkdir -p ${ENGAGEMENT_PATH}/.claude/agents"
for f in "${AGENTS_SRC}"/*.md; do
  name="$(basename "$f")"
  run "cp ${f} ${ENGAGEMENT_PATH}/.claude/agents/${name}"
done
echo ""

# Step 4: substitute placeholders
echo "🔧 Substituting placeholders..."
if [[ "$DRY_RUN" == "false" ]]; then
  find "$ENGAGEMENT_PATH" -type f \( -name "*.md" -o -name "*.yml" -o -name "*.yaml" \) -print0 | \
  while IFS= read -r -d '' file; do
    sed -i.bak \
      -e "s|{ENGAGEMENT_NAME}|${ENGAGEMENT_NAME}|g" \
      -e "s|{METHODOLOGY}|${METHODOLOGY}|g" \
      -e "s|{BOOTSTRAP_DATE}|${BOOTSTRAP_DATE}|g" \
      "$file" 2>/dev/null && rm -f "${file}.bak"
  done
fi
echo ""

# Verify
if [[ "$DRY_RUN" == "false" ]]; then
  echo "✅ Bootstrap done."
  echo ""
  echo "Engagement structure:"
  echo "   ${ENGAGEMENT_PATH}/AGENTS.md"
  echo "   ${ENGAGEMENT_PATH}/CLAUDE.md"
  echo "   ${ENGAGEMENT_PATH}/.project-config.yml"
  echo "   ${ENGAGEMENT_PATH}/.claude/agents/ ($(ls ${ENGAGEMENT_PATH}/.claude/agents/ 2>/dev/null | wc -l) agents)"
  echo "   ${ENGAGEMENT_PATH}/docs/ ($(find ${ENGAGEMENT_PATH}/docs -name '*.md' 2>/dev/null | wc -l) markdown files)"
  echo ""
  echo "Next steps:"
  echo "   1. cd ${ENGAGEMENT_PATH}"
  echo "   2. Open Claude Code in this folder"
  echo "   3. Paste content of docs/prompt/ba/template/00-kickoff.md with your engagement brief"
else
  echo "ℹ️  Dry run complete. Re-run without --dry-run to apply."
fi
