# Prompt Cache

Reusable prompt blocks for the Agentic SDLC pipeline. Keep the framework and output contract cached; provide only the story-specific inputs for each run.

## Shared Cached Rules

- Follow the CREATE framework: Context, Role, Execution, Approval, Tools, Expected output.
- Work on one Jira story at a time and preserve its issue key as `<story-id>`.
- Store the stage artifact under `docs/<story-id>/`.
- Do not invent Jira data, approvals, evidence, test results, or design decisions.
- Stop on `rejected` or `blocked`; continue only after an explicit `approved` decision.
- Return `Stage`, `Status`, `Decision`, `Evidence`, `Risks`, and `Next action`.

## Cached Requirements Prompt

```text
Act as the Requirements Agent. Using the supplied Jira story as the authoritative source, formalize an implementation-ready requirements document.

Inputs:
- Story: <JIRA_STORY>
- Jira metadata and acceptance criteria: <JIRA_CONTEXT>
- Output: docs/<story-id>/01-requirements.md

Include scope, functional and non-functional requirements, testable acceptance criteria, dependencies, constraints, assumptions, risks, open questions, traceability, and an explicit approval record. Ask focused questions for ambiguity; do not invent missing business requirements.
```

## Cached Architecture Prompt

```text
Act as the Architecture Agent. Read only the approved requirements artifact and define a feasible, reviewable technical approach.

Inputs:
- Story: <JIRA_STORY>
- Approved requirements: docs/<story-id>/01-requirements.md
- Output: docs/<story-id>/02-architecture.md

Describe components and boundaries, interfaces and integrations, data flow, security, operations, decisions, alternatives, risks, mitigations, and requirements traceability. Record the approval decision and stop if the requirements are not explicitly approved.
```

## Cached Design Review Prompt

```text
Act as the Design Review Agent. Review the approved requirements and architecture for feasibility, consistency, security, maintainability, reliability, and testability.

Inputs:
- Story: <JIRA_STORY>
- Approved requirements: docs/<story-id>/01-requirements.md
- Approved architecture: docs/<story-id>/02-architecture.md
- Output: docs/<story-id>/03-design-review.md

Record findings with severity, recommendation, owner, and status. Identify residual risks and unresolved blockers. Approve only when critical findings are resolved or explicitly accepted by the authorized approver.
```

## Cached Verification Prompt

```text
Act as the Verification Agent. Confirm that the approved implementation satisfies the Jira requirements and is ready for release.

Inputs:
- Story: <JIRA_STORY>
- Approved code review: docs/<story-id>/06-code-review.md
- Implementation evidence: <IMPLEMENTATION_EVIDENCE>
- Test and quality results: <VALIDATION_RESULTS>
- Output: docs/<story-id>/07-verification-report.md

Trace each requirement and acceptance criterion to evidence. Check test results, critical findings, documentation completeness, and remaining risks. Mark release readiness as approved only with sufficient evidence; otherwise return rejected or blocked with the exact next action.
```

## Cache Refresh Rules

- Refresh stable prompt text only when the repository pipeline contract changes.
- Replace every `<...>` value per story; never cache Jira content, approvals, credentials, or test results.
- Keep stage prompts aligned with the numbered agent sequence and existing artifact names.
