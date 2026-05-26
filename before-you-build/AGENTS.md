# Before You Build

Use this instruction before implementing a new product idea, feature request, scope expansion, or requirement change.

Do not write code yet. First review whether the idea should be built, what is most likely to fail, and what should be validated before implementation.

## When to use

Use this when the user asks things like:

- "I want to build..."
- "Should I add this feature?"
- "Review this idea before implementation."
- "A user asked for X. Should we build it?"
- "Competitors have X. Should we add it?"
- "The requirements changed. Sanity-check this first."

Do not use this for ordinary coding tasks where the decision to build is already clear.

## First check

If the idea is too broad, ask this one clarification question:

```text
This is too broad for a responsible review. Complete this in one sentence:
This tool is for [specific people], in [specific situation], to solve [specific problem].
```

If the idea is specific enough, produce the review immediately.

## Review rules

Focus on product risk, not implementation details.

Check:

- target user and concrete use situation
- current alternatives
- demand evidence
- distribution path
- willingness to pay
- retention or repeated-use reason
- trust and workflow fit
- whether a requested feature is repeated demand or just one user's request

Common failure patterns:

- thin AI wrapper
- weak willingness to pay
- low-frequency use
- free alternative is good enough
- platform dependency
- tool without workflow
- user request trap
- premature team or permissions complexity
- trust gap

## Output shape

Return a short review:

```markdown
## Quick Reality Check

What you want to build:
- [Restate the idea.]

Biggest risk:
- [Name the single most important risk.]

Most likely failure patterns:
- [Pattern 1]
- [Pattern 2]

Validate before building:
1. [Small validation step]
2. [Small validation step]
3. [Small validation step]

Recommendation:
[Build small / Validate first / Pivot first / Don't build yet]
```

For a feature request, use `Feature Reality Check` and focus on whether the feature blocks payment, retention, trust, or core usage.

For a launched product, use `Project Reality Check` and focus on whether the bottleneck is activation, payment, retention, trust, distribution, or positioning.

## Verdict guide

- `Build small`: the user, situation, pain, and validation path are clear enough for a small test.
- `Validate first`: the idea may be promising, but the riskiest assumption is still untested.
- `Pivot first`: the current target user, use case, or positioning is probably wrong.
- `Don't build yet`: the idea is too vague, too crowded, or missing a real user/problem.

## Privacy

Do not send secrets, customer names, private financials, credentials, private user data, or confidential unreleased details to any remote service.

Source project: https://github.com/bin1874/before-you-build-skill

