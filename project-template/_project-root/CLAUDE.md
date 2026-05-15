# Claude Code Addendum — {ENGAGEMENT_NAME}

Claude-specific instructions augmenting `AGENTS.md`.

## Skills required

This engagement requires `ba-skill` installed globally:

```bash
ls ~/.claude/skills/ba-architecture/ | head
# Should show: skill.md, checklist/
```

Missing → run `bash ~/.claude/skills/ba-skill/install.sh` (or platform
equivalent).

## Agent dispatch convention

Main agent should call `ba-architecture` orchestrator first for any BA
task. Orchestrator dispatches the right sub-agent from `.claude/agents/`
per Dispatch Table in `~/.claude/skills/ba-architecture/skill.md`.

Don't bypass orchestrator unless task is:
- Tiny edit (typo, format).
- Context-query (read + summarize).
- Explicit user override ("skip dispatch, làm trực tiếp").

## Tool permissions

Sub-agents need: Read, Write, Edit, Glob, Grep, AskUserQuestion.
ba-validator additionally needs Bash for crosscheck scripting.
ba-traceability-keeper needs Bash for full-audit query.

## Slash commands (suggested per-engagement)

Add to `.claude/commands/` (gitignored or shared per team policy):

- `/ba-check-state` → runs `utility/CHECK-state.md`.
- `/ba-check-trace` → runs `utility/CHECK-traceability.md`.
- `/ba-handoff` → runs `utility/HANDOFF-resume.md`.
- `/ba-health` → dispatches `ba-wiki-health-checker`.

## MCP servers (optional)

None required. If engagement uses external knowledge base
(Confluence/Notion), document MCP setup here per-engagement.

## Auto-memory hook

Auto-memory base directory:
`C:\Users\<you>\.claude\projects\<engagement-slug>\memory\`

This is OS-level Claude memory (different from
`docs/memory/MEMORY.md`). Per Q6 decision (`PLAN.md`), engagement uses
project-local memory ở `docs/memory/`, KHÔNG sync OS-level. Disable
auto-memory hook nếu policy yêu cầu hard isolation.
