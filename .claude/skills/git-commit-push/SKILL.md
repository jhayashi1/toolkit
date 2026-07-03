---
name: git-commit-push
description: 'Guidelines for creating Git commits with conventional format'
---

# Git Commit and Push Guidelines

This skill defines the standards for creating Git commits.

## Commit Message Format

Commits **MUST** follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Structure

```
<type>(<scope>): <summary>

<blank line>
<detailed body explaining the changes>
```

### Components

#### 1. Header Line: `<type>(<scope>): <summary>`

- **type**: The kind of change (see Types section below)
- **scope**: The module/component affected
- **summary**: Brief description in imperative mood (50 chars max)

**Example**:
```
feat(auth): add OAuth2 login flow
```

#### 2. Detailed Body

After a blank line, provide a concise explanation of what changed and why. Use bullet points for multiple changes:

```
Changes:
- Add OAuth2 provider config and callback handler
- Store refresh token in httpOnly cookie (not localStorage)
- Remove legacy session-based auth middleware
```

## Commit Types

| Type | When to Use |
|------|-------------|
| `feat` | New functionality |
| `fix` | Bug fix |
| `refactor` | Restructuring without behavior change |
| `perf` | Performance improvement |
| `test` | Adding/updating tests |
| `docs` | Documentation only |
| `style` | Formatting, no logic changes |
| `chore` | Build scripts, dependencies, tooling |
| `ci` | CI/CD changes |
| `revert` | Undoing a previous change |

## Complete Example

```bash
git commit -m "$(cat <<'EOF'
feat(scraper): add Capital One TalentBrew scraper

Changes:
- Parse a[data-job-id] cards from SSR HTML
- Deduplicate by data-job-id (each posting renders twice)
- Paginate via ?k=software+engineer&p=N, stop on empty page
- Register CapitalOneScraper in createScrapers()
EOF
)"
```

## Git Commands Workflow

### 1. Stage Files

```bash
# Stage specific files
git add path/to/file.ts

# Stage all modified tracked files
git add -u
```

### 2. Create Commit

Use a heredoc to avoid quoting issues with multi-line messages:

```bash
git commit -m "$(cat <<'EOF'
type(scope): summary

Body explaining what and why.
EOF
)"
```

### 3. Push

```bash
git push
```

## Best Practices

### DO:
- ✅ Provide clear change descriptions
- ✅ Use imperative mood in summary ("add", not "added")
- ✅ Keep summary line under 50 characters
- ✅ Wrap body text at 72 characters

### DON'T:
- ❌ Mix unrelated changes in a single commit
- ❌ Use vague descriptions like "fix stuff" or "update code"
- ❌ Force push to protected branches (main)

## Verification

```bash
git log -1 --pretty=format:"%B"
git show --stat
```
