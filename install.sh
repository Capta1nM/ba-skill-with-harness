#!/usr/bin/env bash
# install.sh — Cài ba-skill global cho Claude Code (+ optionally Cursor)
#
# Wraps:
#   1. npx skills add — register skills (ba-architecture, ba-*) → ~/.agents/skills/
#      (+ ~/.claude/skills/ via npx skills system)
#   2. cp -r project-template → ~/.agents/skills/project-template/ + ~/.claude/skills/project-template/
#   3. KHÔNG copy agents/ vào ~/.claude/agents/ — agents đi per-engagement
#      qua bootstrap.sh vào <engagement>/.claude/agents/.
#
# Usage:
#   bash install.sh                  # install for claude-code only
#   bash install.sh --with-cursor    # install for claude-code + cursor
#   bash install.sh --dry-run        # show what would be done
#   bash install.sh --uninstall      # remove

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
CLAUDE_SKILLS_DIR="${CLAUDE_DIR}/skills"
# npx skills install location (per `npx skills add -g`)
NPX_SKILLS_DIR="${HOME}/.agents/skills"
# Template copy vào CẢ 2 location để đảm bảo discoverable
TEMPLATE_DIR_NPX="${NPX_SKILLS_DIR}/project-template"
TEMPLATE_DIR_CLAUDE="${CLAUDE_SKILLS_DIR}/project-template"

WITH_CURSOR=false
DRY_RUN=false
UNINSTALL=false
NO_PAUSE=false

for arg in "$@"; do
  case "$arg" in
    --with-cursor) WITH_CURSOR=true ;;
    --dry-run)     DRY_RUN=true ;;
    --uninstall)   UNINSTALL=true ;;
    --no-pause)    NO_PAUSE=true ;;
    -h|--help)
      head -n 14 "$0" | tail -n 13
      exit 0
      ;;
    *) echo "Unknown arg: $arg" >&2; exit 1 ;;
  esac
done

# Pause on close (Windows double-click friendly)
pause_at_end() {
  local exit_code=$?
  if [[ "$NO_PAUSE" == "true" ]]; then
    exit $exit_code
  fi
  echo ""
  if [[ $exit_code -ne 0 ]]; then
    echo "❌ Install FAILED with exit code $exit_code — đọc log ở trên."
  fi
  echo ""
  read -rp "Press Enter to close... " _
  exit $exit_code
}
trap pause_at_end EXIT

run() {
  echo "  $ $*"
  if [[ "$DRY_RUN" == "false" ]]; then
    eval "$@"
  fi
}

# ─────────────────────────────────────────────
# Uninstall
# ─────────────────────────────────────────────
if [[ "$UNINSTALL" == "true" ]]; then
  echo "🗑  Uninstalling ba-skill..."
  run "rm -rf ${NPX_SKILLS_DIR}/ba-architecture"
  for d in "${SCRIPT_DIR}"/ba-*/; do
    name="$(basename "$d")"
    run "rm -rf ${NPX_SKILLS_DIR}/${name}"
    run "rm -rf ${CLAUDE_SKILLS_DIR}/${name}"
  done
  run "rm -rf ${TEMPLATE_DIR_NPX}"
  run "rm -rf ${TEMPLATE_DIR_CLAUDE}"
  echo "✅ Uninstalled. Per-engagement agents/docs remain at their engagement paths."
  exit 0
fi

# ─────────────────────────────────────────────
# Install
# ─────────────────────────────────────────────
echo "📦 Installing ba-skill global..."
echo "   Source: ${SCRIPT_DIR}"
echo "   Target (npx): ${NPX_SKILLS_DIR}/"
echo "   Target (claude): ${CLAUDE_SKILLS_DIR}/"
echo ""

# Step 1: skills via npx skills add
echo "[1/2] Skills (ba-architecture + ba-*) → ${NPX_SKILLS_DIR}/"
NPX_AGENTS="-a claude-code"
[[ "$WITH_CURSOR" == "true" ]] && NPX_AGENTS="${NPX_AGENTS} -a cursor"

if command -v npx &>/dev/null; then
  run "cd ${SCRIPT_DIR} && npx skills add . --all ${NPX_AGENTS} -g"
else
  echo "  ⚠️  npx not found — fallback to manual cp"
  run "mkdir -p ${NPX_SKILLS_DIR} ${CLAUDE_SKILLS_DIR}"
  for d in "${SCRIPT_DIR}"/ba-*/; do
    name="$(basename "$d")"
    run "rm -rf ${NPX_SKILLS_DIR}/${name} ${CLAUDE_SKILLS_DIR}/${name}"
    run "cp -r ${d} ${NPX_SKILLS_DIR}/"
    run "cp -r ${d} ${CLAUDE_SKILLS_DIR}/"
  done
fi
echo ""

# Step 2: project template — copy vào CẢ 2 location (npx + claude native)
echo "[2/2] Project template → cả 2 location"
run "mkdir -p ${NPX_SKILLS_DIR} ${CLAUDE_SKILLS_DIR}"
run "rm -rf ${TEMPLATE_DIR_NPX}"
run "rm -rf ${TEMPLATE_DIR_CLAUDE}"
run "cp -r ${SCRIPT_DIR}/project-template ${TEMPLATE_DIR_NPX}"
run "cp -r ${SCRIPT_DIR}/project-template ${TEMPLATE_DIR_CLAUDE}"
echo "   → ${TEMPLATE_DIR_NPX}/"
echo "   → ${TEMPLATE_DIR_CLAUDE}/"

# Make bootstrap executable
run "chmod +x ${TEMPLATE_DIR_NPX}/bootstrap.sh 2>/dev/null || true"
run "chmod +x ${TEMPLATE_DIR_CLAUDE}/bootstrap.sh 2>/dev/null || true"
echo ""

# ─────────────────────────────────────────────
# Verify
# ─────────────────────────────────────────────
if [[ "$DRY_RUN" == "false" ]]; then
  echo "✅ Installed:"
  echo "   - $(ls ${NPX_SKILLS_DIR} 2>/dev/null | grep -c '^ba-') skills in ${NPX_SKILLS_DIR}/"
  echo "   - template in ${TEMPLATE_DIR_NPX}/"
  echo "   - template in ${TEMPLATE_DIR_CLAUDE}/"
  echo ""
  echo "Next: bootstrap an engagement →"
  echo "   bash ${TEMPLATE_DIR_CLAUDE}/bootstrap.sh /path/to/your-engagement"
else
  echo "ℹ️  Dry run complete. Re-run without --dry-run to apply."
fi
