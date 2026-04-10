# 🧠 Awesome Agent Skills

A collection of reusable coding standards and best practices for AI coding agents. Compatible with **Claude Code**, **GitHub Copilot**, **Cursor**, and **Windsurf**. Drop these into any project to give your AI assistant consistent, opinionated guidance.

---

## Why this exists

AI coding agents are only as good as the context you give them. This repo packages hard-won engineering best practices into instruction files that all major AI tools understand natively — so you get consistent behaviour across tools and teams.

---

## Skills

| Skill | Description | Claude Code | Copilot | Cursor | Windsurf |
|-------|-------------|:-----------:|:-------:|:------:|:--------:|
| [REST API Design](./rest-api-design/) | 12 production-grade REST API practices | ✅ | ✅ | ✅ | ✅ |
| [K8S Resource Limits](./k8s-resource-limits/) | Helps review, audit, or generate Kubernetes resource requests and limits | ✅ | ✅ | ✅ | ✅ |

> More skills coming soon. [Contributions welcome!](#contributing)

---

## How to use

Each skill ships with four files — same content, different filenames for each tool:

| File | Tool |
|------|------|
| `CLAUDE.md` | Claude Code |
| `.github/copilot-instructions.md` | GitHub Copilot |
| `.cursorrules` | Cursor |
| `.windsurfrules` | Windsurf |
| `AGENTS.md` | OpenAI Codex |

`.github/copilot-instructions.md` is the **source of truth**. The other files are synced copies.

### Add a skill to your project

1. Copy the files for the tools you use into your repo root
2. That's it — your AI agent will follow the instructions automatically

```
your-repo/
├── .github/
│   └── copilot-instructions.md   ← Copilot
├── CLAUDE.md                     ← Claude Code
├── .cursorrules                  ← Cursor
└── .windsurfrules                ← Windsurf
```

### Keep files in sync

When you update instructions, run the included sync script to propagate changes to all tool files:

```bash
cp .github/copilot-instructions.md CLAUDE.md
cp .github/copilot-instructions.md .cursorrules
cp .github/copilot-instructions.md .windsurfrules
```

Or use the provided `sync.sh`:

```bash
./sync.sh
```

### Use multiple skills

Append the contents of multiple skills together:

```bash
# Combine multiple skills
cat rest-api-design/.github/copilot-instructions.md \
    coding-standards/.github/copilot-instructions.md \
    >> your-repo/.github/copilot-instructions.md

# Then sync to all tools
cd your-repo && ./sync.sh
```

---

## Contributing

Got a skill you want to share? PRs are welcome.

### Skill structure

Each skill lives in its own folder:

```
skill-name/
├── .github/
│   └── copilot-instructions.md   # Full instructions — source of truth
├── CLAUDE.md                     # Claude Code (synced copy)
├── .cursorrules                  # Cursor (synced copy)
├── .windsurfrules                # Windsurf (synced copy)
└── sync.sh                       # Sync script
```

### Guidelines for a good skill

- **One concern per skill** — REST API design, not "everything about backends"
- **Concrete and actionable** — include ✅/❌ examples, not just vague principles
- **Tool-agnostic language** — instructions should read naturally to all agents
- **Source of truth in one place** — edit `.github/copilot-instructions.md`, then run `sync.sh`

### Steps to contribute

1. Fork this repo
2. Create a folder for your skill: `mkdir my-skill-name`
3. Add `.github/copilot-instructions.md` with your full instructions
4. Run `sync.sh` to generate the other tool files
5. Open a PR with a short description of what problem the skill solves

---

## License

MIT — use freely in personal and commercial projects.