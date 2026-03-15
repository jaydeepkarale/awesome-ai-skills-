# 🧠Awesome Agent Skills

A collection of reusable coding standards and best practices, compatible with both **Claude Code** and **GitHub Copilot**. Drop these into any project to give your AI assistant consistent, opinionated guidance.

---

## Why this exists

AI assistants are only as good as the context you give them. This repo packages hard-won engineering best practices into files that both Claude Code and GitHub Copilot understand natively — so you get consistent behaviour across tools and teams.

---

## Skills

| Skill | Description | Claude Code | Copilot |
|-------|-------------|:-----------:|:-------:|
| [REST API Design](./rest-api-design/) | 12 production-grade REST API practices | ✅ | ✅ |

> More skills coming soon. [Contributions welcome!](#contributing)

---

## How to use

Each skill ships with two files:

- **`CLAUDE.md`** — picked up automatically by Claude Code when placed at your repo root
- **`.github/copilot-instructions.md`** — picked up automatically by GitHub Copilot for that repo

### Add a skill to your project

1. Copy `CLAUDE.md` to your repo root
2. Copy `.github/copilot-instructions.md` to your repo's `.github/` folder
3. That's it — both tools will follow the instructions automatically

```
your-repo/
├── .github/
│   └── copilot-instructions.md
└── CLAUDE.md
```

### Use multiple skills

Append the contents of multiple skill files together:

```bash
# Combine multiple skills into one CLAUDE.md
cat rest-api-design/CLAUDE.md coding-standards/CLAUDE.md >> your-repo/CLAUDE.md

# Same for Copilot
cat rest-api-design/.github/copilot-instructions.md \
    coding-standards/.github/copilot-instructions.md \
    >> your-repo/.github/copilot-instructions.md
```

### Claude Code only: `.skill` files

If you use Claude.ai, each skill also ships as a `.skill` file that you can install via **Settings → Skills** for a more integrated experience.

---

## Contributing

Got a skill you want to share? PRs are welcome.

### Skill structure

Each skill lives in its own folder:

```
skill-name/
├── CLAUDE.md                        # Claude Code instructions (lean, points to Copilot file)
├── .github/
│   └── copilot-instructions.md      # Full instructions (source of truth)
└── skill-name.skill                 # Packaged Claude.ai skill (optional)
```

### Guidelines for a good skill

- **One concern per skill** — REST API design, not "everything about backends"
- **Concrete and actionable** — include ✅/❌ examples, not just vague principles
- **Tool-agnostic language** — instructions should read naturally to both Claude and Copilot
- **Keep `CLAUDE.md` lean** — it should reference `.github/copilot-instructions.md` as the source of truth to avoid duplication

### Steps to contribute

1. Fork this repo
2. Create a folder for your skill: `mkdir my-skill-name`
3. Add `.github/copilot-instructions.md` with your full instructions
4. Add a `CLAUDE.md` that references it (use the existing ones as a template)
5. Open a PR with a short description of what problem the skill solves

---

## License

MIT — use freely in personal and commercial projects.
