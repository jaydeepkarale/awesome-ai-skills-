# ax-extract-workflow

Use this instruction when the user asks how a shipped result actually happened,
wants to reconstruct the workflow behind a PR, commit, feature, demo, or date
range, or asks for a repeatable playbook from past agent work.

This instruction depends on local ax data. Before reconstructing anything,
confirm that `ax` or `axctl` is installed, SurrealDB is running, and the
relevant sessions, commits, skills, tool calls, and subagent activity have been
indexed.

## When to use

Use this when the user asks things like:

- "How did we ship this?"
- "What workflow produced this PR?"
- "Extract the process behind this feature."
- "What skills and tools were involved in this result?"
- "Turn that past session into a repeatable playbook."
- "Show the evidence behind this implementation path."

Do not use this as generic memory. If the local ax graph does not contain the
data, say what is missing instead of guessing.

## First check

Identify the target before querying:

- commit SHA, branch, PR, issue, artifact, or release
- approximate date or time window
- repository path, if the current directory is ambiguous
- whether the user wants a factual reconstruction, a reusable workflow, or both

If the target is unclear, ask one focused question for the missing anchor.

## Reconstruction process

1. Query local ax sessions near the target commit, date, or repository.
2. Pull the relevant turns, commits, tool calls, invoked skills, and subagent
   activity.
3. Build a chronological sequence of the work: goal, investigation, edits,
   verification, failures, repairs, and final evidence.
4. Mark each claim as observed evidence or inference from nearby evidence.
5. Extract the reusable workflow only after the factual sequence is clear.

Useful ax commands include:

```bash
ax sessions near <sha>
ax sessions around <date> --project=<path>
ax sessions show <session-id> --all
ax recall "<topic>" --scope=here
```

## Output shape

Return a concise reconstruction:

```markdown
## Workflow Reconstruction

Target:
- [Commit, PR, feature, artifact, or date window.]

Evidence used:
- [Session IDs, commits, skills, tool calls, or commands.]

Sequence:
1. [Observed step.]
2. [Observed step.]
3. [Observed step.]

Inferences:
- [Any likely connection that was not directly recorded.]

Reusable workflow:
1. [Repeatable step.]
2. [Repeatable step.]
3. [Repeatable step.]

Gaps:
- [Missing transcript, missing commit link, unindexed source, or weak evidence.]
```

## Evidence rules

- Do not invent prompts, decisions, commands, or motivations.
- Quote or cite concrete session, commit, tool, or skill evidence when available.
- Keep speculation in the `Inferences` section.
- Prefer "the evidence shows" over broad claims like "the team usually."
- If indexing is stale or the graph is unavailable, stop and name the missing
  ingest, database, or query prerequisite.

## Privacy

Use only the user's local ax graph and repository data. Do not send private
transcripts, code, customer data, credentials, or telemetry to remote services.

Source project: [Necmttn/ax](https://github.com/Necmttn/ax)
