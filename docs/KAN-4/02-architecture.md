# Overview
KAN-4 uses a sequential, approval-gated workflow that turns one Jira story into story-scoped SDLC artifacts under `docs/<story-id>/`.
# Components
- Pipeline orchestrator for stage order and handoffs.
- Specialized agents for requirements, architecture, design review, planning, implementation, code review, verification, and PR creation.
- Story artifact directory and compact pipeline state record.
# Flow
Jira story intake -> requirements -> architecture -> design review -> implementation plan -> implementation -> code review -> verification -> pull request.
Each stage consumes the prior approved artifact and produces the next stage artifact.
# Risks
- MCP or repository access failure can pause the workflow.
- Missing artifacts or premature handoffs can invalidate stage progress.
- Requirements may leave later design decisions for planning.
# Approval
- **Status:** approved
- **Decision:** Architecture is accepted for Design Review.
- **Next:** Hand off `docs/KAN-4/02-architecture.md` to the Design Review Agent.
