# Post-Step Hook

**Event:** After each approved SDLC agent stage.

**Purpose:** Close the stage and prepare an efficient handoff.

**Checks:**
- Persist the stage status, artifact path, decision, evidence, and risks.
- Append exactly one history entry after validation and replace the state file atomically; repeated execution must not duplicate an identical approved entry.
- Trigger configured lifecycle hooks when defined and record their result.
- Summarize stable context for prompt caching and pass only changed context forward.
- Identify the next ordered agent and required input artifact.

**Block when:** The stage artifact or approval evidence cannot be persisted.

**Output:** Completed stage summary and next-agent handoff context.

**Recovery:** If state persistence fails, report the failure and leave the previous state and approval gate intact for safe retry.
