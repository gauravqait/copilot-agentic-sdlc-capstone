# Tasks
1. Define the pipeline orchestrator contract for sequential stages, predecessor approvals, story-scoped artifact paths, and stage handoffs.
2. Specify minimal Atlassian MCP and GitHub MCP inputs, outputs, permissions, timeouts, and actionable unavailable-service errors.
3. Define required schemas and validation checks for every lifecycle artifact, including the story ID, required headings, predecessor approval, and output path.
4. Implement atomic or recoverable artifact/state updates, including repeated execution and partial-output handling.
5. Add security controls for secret handling, least-privilege MCP access, and untrusted Jira content.
6. Define focused tests for stage ordering, approval gates, MCP failures, artifact validation, state consistency, and recovery behavior.
7. Validate the implementation against KAN-4 acceptance criteria and hand off the approved implementation plan to the Implementation Agent.

# Dependencies
- KAN-4 requirements, architecture, and design review remain approved.
- Atlassian MCP and GitHub MCP contracts and permissions must be available before integration implementation.
- Artifact schemas and pipeline-state rules must be agreed before implementation and verification tests.
- Implementation must complete before code review, verification, and PR creation stages can begin.

# Approval
- **Status:** approved
- **Approver:** User requesting execution of the KAN-4 Implementation Planner Agent
- **Rationale:** The approved requirements, architecture, and design review provide sufficient direction; their recommendations are captured as executable tasks and no blocker is recorded.
- **Next:** Hand off `docs/KAN-4/04-impl-plan.md` to the Implementation Agent.
