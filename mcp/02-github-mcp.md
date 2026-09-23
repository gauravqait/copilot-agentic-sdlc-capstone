# GitHub MCP

## Purpose
Provide verified repository context and controlled pull request operations for the Agentic SDLC pipeline.

## Authentication
- Configure the GitHub MCP server with the repository owner, repository name, and a secret-backed token or GitHub App identity.
- Grant least-privilege access for repository inspection, branch checks, and pull request creation.
- Store credentials in the MCP host or environment secret store; never place tokens in prompts, artifacts, or source control.

## Actions
- Inspect repository, branch, commit, changed-file, and pull request context.
- Confirm source and target branches before PR creation.
- Validate release evidence and unresolved blocking findings.
- Create a pull request only after verification approval and any required user confirmation.
- Return confirmed PR number, URL, branches, and repository; never fabricate GitHub results.

## Contract
- Input: repository, source branch, target branch, and approved release evidence; read-only inspection until PR creation is explicitly authorized.
- Output: repository and branch/commit facts for inspection, or confirmed PR number and URL after creation.
- Timeout: fail with an actionable `GitHub MCP request timed out` message and preserve the current pipeline state; retry only through the host's bounded retry policy.
- Unavailable service: distinguish authentication, permission, rate-limit, missing repository/branch, and malformed-response failures; never report a PR as created without a confirmed response.

## Consuming Agents
- `00-sdlc-pipeline.agent.md`: repository context and final lifecycle coordination.
- `08-pr-creator.agent.md`: branch validation, repository inspection, and pull request creation.
