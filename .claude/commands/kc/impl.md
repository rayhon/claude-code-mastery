---
allowed-tools: all
description: "Implement epic specifications with automated review and testing"
---

# /kc:impl - Implement task specifications with automated review and testing

## Purpose

Implement task specifications with automated review and testing.

## Usage

```
/kc:impl [task-number]
```

## Arguments

- `task-number` - task number (e.g., 0001, 0002, etc.).

## Execution

Based on the task file, find out what agents are needed to implement the task. If Python backend / FastAPI, use @agent-python-backend-expert. If web frontend, use @agent-frontend-expert. Otherwise, use @general-purpose agent.

Code reviewer shall use @agent-code-reviewer.

1. find the right task file under ./docs/specs/{feature-name}/tasks/. Read it carefully.
2. Think hard to form a plan for the implementation.
3. Create a new git branch for the implementation. Implement based on the plan using the right coding agents. Write sufficient unit/integration tests accordingly.
4. Review the code with @agent-code-reviewer. If the code is not working as expected, fix the code and repeat the process.
5. Once the code is working as expected (e.g. for Python: activate UV environment `cd backend && source .venv/bin/activate`, run `pytest tests/`, `uv sync` passes without any warnings/issues), commit the code to the repo.
6. (optional) If the code has a github repo, push the code to github. Create a PR for the code using `gh` command.
7. Update the task file to reflect the changes.