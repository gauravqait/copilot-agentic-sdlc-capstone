# Atlassian MCP

## Purpose
Provide authoritative Jira story intake and metadata to the Agentic SDLC pipeline.

## Authentication
- Configure the Atlassian MCP server with the Jira base URL and a secret-backed API token.
- Use the authenticated Atlassian account permitted to read Jira issues and related metadata.
- Store credentials in the MCP host or environment secret store; never place tokens in prompts, artifacts, or source control.

## Actions
- Retrieve a Jira story by issue key.
- Read title, description, status, priority, labels, dependencies, and acceptance criteria.
- Confirm story identity and return structured intake data.
- Report missing access, missing fields, or ambiguous requirements without inventing values.

## Contract
- Input: validated Jira issue key; read-only access to the requested issue and its metadata.
- Output: issue key plus the requested fields, with absent fields represented as errors rather than guessed values.
- Timeout: fail with an actionable `Atlassian MCP request timed out` message and preserve the current pipeline state; retry only through the host's bounded retry policy.
- Unavailable service: report access, authentication, rate-limit, malformed-response, and timeout failures separately; do not create an artifact from partial data.

## Consuming Agents
- `00-sdlc-pipeline.agent.md`: authoritative story intake and validation.
- `01-requirements.agent.md`: requirements analysis and acceptance-criteria clarification.
