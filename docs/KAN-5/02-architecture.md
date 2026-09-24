# Architecture: KAN-5

## Context
- **Input:** `docs/KAN-5/01-requirements.md`
- **Output:** `docs/KAN-5/02-architecture.md`
- **State:** `docs/KAN-5/pipeline-state.json`
- **Story:** KAN-5, Agentic SDLC Automation for Test Execution Evidence Management

## Components
- **Pipeline Agent:** Orchestrates stages 00-08 and updates story-local state only after approved artifacts.
- **Stage Agents:** Generate requirements, architecture, design review, plan, implementation summary, code review, verification, and PR summary under `docs/KAN-5/`.
- **Atlassian MCP:** Retrieves authoritative Jira story details for requirements intake.
- **GitHub MCP:** Validates repository, branch, commit, and pull-request readiness during final PR flow.
- **Hooks:** Enforce pre-step readiness, approval gates, and post-step state persistence against `docs/KAN-5/pipeline-state.json`.
- **Skills:** `01-jira-retrieval-skill.md` supports Jira intake; `02-pr-validation-skill.md` supports PR readiness.

## Flow
Jira MCP retrieval -> requirements approval -> architecture -> design review -> implementation plan -> implementation summary -> code review -> verification -> GitHub MCP PR validation -> PR summary.

## Design Decisions
- Keep every KAN-5 artifact and pipeline state file inside `docs/KAN-5/` to preserve independent story execution.
- Treat each stage artifact as the handoff contract for the next agent and require an explicit approval decision before progression.
- Keep MCP responsibilities separated: Atlassian for Jira source data, GitHub for repository and PR readiness evidence.
- Record test execution evidence through generated SDLC artifacts rather than shared global state.

## Requirement Coverage
| Requirement | Architecture coverage |
|---|---|
| REQ-KAN5-01 - REQ-KAN5-02 | Atlassian MCP and Requirements Agent produce approved intake evidence. |
| REQ-KAN5-03 - REQ-KAN5-09 | Stage agents produce ordered artifacts under `docs/KAN-5/`. |
| REQ-KAN5-10 - REQ-KAN5-11 | Story-local state and hooks enforce scoped artifacts and approval gates. |
| REQ-KAN5-12 | GitHub MCP and PR validation skill confirm PR readiness before summary. |

## Risks
- Repository and branch details for GitHub MCP are not specified in KAN-5 and must be resolved before PR validation.
- Test execution evidence format is not defined by the story and must be finalized during implementation planning.
- Missing approval metadata in any stage artifact must block progression to preserve traceability.

## Approval
- **Status:** approved
- **Approver:** Architecture Agent
- **Rationale:** Approved KAN-5 requirements map cleanly to the existing Agentic SDLC agents, hooks, skills, MCP contracts, and story-local state model.
- **Evidence:** `docs/KAN-5/01-requirements.md`; `docs/KAN-5/pipeline-state.json`; repository agent, hook, skill, and MCP definitions.
- **Timestamp:** 2026-09-24
- **Next action:** Hand off `docs/KAN-5/02-architecture.md` to the Design Review Agent.