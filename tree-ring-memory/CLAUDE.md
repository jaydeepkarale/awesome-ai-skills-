---
name: tree-ring-memory
description: Use when an AI agent needs durable project memory, recall before risky work, evidence-linked learning, privacy-safe memory capture, forgetting, redaction, or audit habits.
---

# Tree Ring Memory Instructions

Use [Tree Ring Memory](https://github.com/TerminallyLazy/Tree-Ring-Memory) as a lifecycle-aware memory layer for AI agents. It is not a transcript dump, vector database pitch, or replacement for source files.

Tree Ring Memory helps agents preserve useful decisions, warnings, preferences, and lessons:

- fresh context stays detailed in outer rings
- older learning compresses into stable summaries
- important failures stay visible as scars
- durable truths become heartwood
- future ideas remain seeds
- sensitive data is blocked, redacted, deleted, or left unstored

## When to recall

Recall memory before:

- starting or resuming a project
- changing architecture, storage, security, privacy, release, or data behavior
- repeating a workflow where prior failures may matter
- responding to a user correction
- making a decision that depends on previous preferences or constraints
- editing a repo with Tree Ring Memory, AGENTS.md, DOX, or other project guidance
- closing out meaningful work and deciding what should survive the current session

Use narrow queries with project scope when possible. Treat source files, tests, PRs, issues, and docs as authoritative; memory should point you back to them, not replace them.

## When to remember

Store a memory only when it is likely to help future work:

- the user states a durable preference
- the user corrects the agent
- a project decision is made
- a lesson is validated by tests, review, production behavior, or other evidence
- a failed approach should not be repeated
- a security, privacy, release, or data-loss warning appears
- a useful project convention is discovered
- a future idea should be revisited later

Keep memories concise. Store the lesson, decision, warning, or seed, not the whole conversation.

## Use evidence for evaluated learning

Use an evidence-linked memory when the lesson comes from a test run, evaluation, checkpoint, experiment, incident, branch, issue, PR, or reviewed artifact.

Outcome mapping:

- `promoted`: durable high-confidence learning
- `rejected`: failed or rolled-back approach to avoid repeating
- `deferred`: promising unresolved option
- `observed`: evaluation result that should remain visible

Do not promote weak claims to durable truth. Prefer a recent or seed memory until the evidence is strong.

## Ring choices

Use rings deliberately:

- `cambium`: active or very recent task context
- `outer`: recent decisions and task lessons
- `inner`: older compressed project knowledge
- `heartwood`: durable high-confidence truths and user preferences
- `scar`: failures, regressions, rejected approaches, and warnings
- `seed`: unresolved ideas, hypotheses, follow-ups, and future work

## Privacy and safety

Do not store:

- secrets, tokens, credentials, private keys, or session cookies
- raw chain-of-thought or scratchpad notes
- temporary debugging noise
- unverified claims as durable truth
- private health, financial, legal, or personal identifier details unless the user explicitly asks for durable storage
- copyrighted source text beyond short allowed snippets

If the durable lesson is useful but details are sensitive, store a redacted summary with enough context to act on later.

## Forgetting and correction

If memory is wrong, private, stale, or superseded:

- redact it when the durable shape is useful but details are unsafe
- delete it when it should not be retained
- supersede it when a newer decision replaces it
- record a clear reason for the change

Never keep known-wrong memory merely because it was previously recalled.

## CLI habits

Use the locally installed command surface rather than guessing:

```bash
tree-ring --help
tree-ring init
tree-ring remember "Use project-scoped recall before changing release behavior." --event-type decision --scope project
tree-ring recall "release behavior" --project example-service
tree-ring evidence "Snapshot invalidation fixed stale unread chat state." --outcome promoted --evidence-ref evals/chat-state/run-042 --score 0.91
tree-ring forget mem_example --mode delete --reason "example cleanup"
tree-ring audit --audit-type sensitive
tree-ring consolidate --period-type manual --dry-run
tree-ring maintain
```

Run destructive or broad operations with care. Use dry-run modes before imports, source syncs, and consolidation whenever available:

```bash
tree-ring import memories.jsonl --dry-run
tree-ring consolidate --period-type manual --dry-run
tree-ring dox sync --source-root . --dry-run
tree-ring revolve sync --source-root revolve --dry-run
tree-ring integrations scan --source-root .
```

If the project has a local `.tree-ring/CLI.md` or `.tree-ring/SKILL.md`, read those files before issuing commands. A project-local install may require `--root .tree-ring`.

## Closeout habit

At the end of meaningful work, ask:

- What did we decide?
- What did we learn?
- What should future agents avoid repeating?
- Did the user state a durable preference?
- Is there a future seed worth revisiting?
- Is any memory sensitive and better left unstored?

Only remember answers that will materially improve future work.
