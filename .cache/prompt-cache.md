# Requirements Prompt
Use Jira as the source of truth; produce concise, testable requirements at `docs/<story-id>/01-requirements.md`.
# Architecture Prompt
Read approved requirements; produce the concise architecture at `docs/<story-id>/02-architecture.md`.
# Design Review Prompt
Review approved requirements and architecture; record concise findings, risks, recommendations, and approval at `docs/<story-id>/03-design-review.md`.
# Verification Prompt
Check approved artifacts, implementation evidence, tests, acceptance coverage, and release readiness at `docs/<story-id>/07-verification-report.md`.
# Cache Rule
Cache only stable stage contracts and artifact paths; inject current story context, approvals, evidence, and results per run. Never cache secrets or Jira content.
