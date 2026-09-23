# Jira Retrieval Skill

## Purpose
Retrieve authoritative Jira story data for requirements intake.

## Input
Jira issue key such as `PROJ-123`.

## Output
Verified story metadata, description, acceptance criteria, priority, labels, dependencies, and status.

## Atlassian MCP
Use `getJiraIssue` with the configured Atlassian cloud ID; block if retrieval fails or required fields are unavailable.

## Used By
Requirements Agent.