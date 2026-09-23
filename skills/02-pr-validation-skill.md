# PR Validation Skill

## Purpose
Confirm GitHub pull-request readiness and record only verified PR details.

## Input
Approved verification report, repository, branch, commit, and change context.

## Output
Validated PR readiness, confirmed branch comparison, and PR URL or a precise blocking reason.

## GitHub MCP
Inspect branches, commits, existing pull requests, and create a PR only when a valid source-to-base diff exists; never fabricate PR details.

## Used By
PR Creator Agent.