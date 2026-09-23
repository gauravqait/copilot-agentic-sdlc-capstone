# Validation Hook

**Event:** After implementation, review, and verification actions.

**Purpose:** Ensure stage outputs are valid before approval.

**Checks:**
- Confirm the expected artifact exists under `docs/<story-id>/`.
- Run or inspect the stage-appropriate tests and quality checks.
- Confirm requirements, acceptance criteria, risks, and evidence are traceable.
- Confirm the artifact has the expected stage heading, story ID, predecessor approval, output path, and final `# Approval` heading.
- Validate `docs/pipeline-state.json` as JSON and verify its history is append-only, ordered, and points to the validated artifact.
- Record failures and unresolved blocking findings.

**Block when:** Required checks fail, evidence is missing, or a critical finding remains unresolved.

**Output:** Validation results, evidence references, risks, and `pass` or `fail` status.

**Recovery:** A validation failure prevents state replacement; remove only an unapproved temporary artifact and preserve the prior approved artifact.
