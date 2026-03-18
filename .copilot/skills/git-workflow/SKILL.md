---
name: git-workflow
description: Guide for git commits, pushing, and opening pull requests. Use this when making commits, pushing code, or creating PRs.
---

# Git Commit & PR Guidelines

## Commits
- Do **not** include a `Co-authored-by` trailer in commit messages.
- Commit messages should follow conventional commits format (e.g. `feat:`, `fix:`, `chore:`).

## Pushing
- Many repos have pre-push hooks that run a full verify (typecheck → lint → coverage → build). Ensure lint and tests pass **before** pushing.
- If push fails due to pre-push hooks, fix the issues, `git commit --amend --no-edit`, and push again.

## Opening Pull Requests
- Use `gh pr create --draft` to open draft PRs.
- Use the repo's PR template for the body: `--body-file .github/pull_request_template.md`
- Derive the PR title from the first commit on the branch: `--title "$(git log --reverse --format=%s $(git merge-base main HEAD)..HEAD | head -n 1)"`
- Full command: `gh pr create --draft --body-file .github/pull_request_template.md --title "$(git log --reverse --format=%s $(git merge-base main HEAD)..HEAD | head -n 1)"`
- If the repo doesn't have a `.github/pull_request_template.md`, use a concise bullet-point body summarizing the changes instead.
