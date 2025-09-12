# Claude Code Template

- **Intelligent Task Management**: Break down complex features into manageable, trackable tasks
- **Automated Quality Assurance**: Built-in code formatting, security checks, and review processes
- **Domain Expertise**: Specialized agents for Next.js frontend, Python backend, and full-stack development
- **Streamlined Workflows**: From requirements to implementation with automated testing and PR creation

---

## Installation

To install the Claude Code Template, copy the agents and commands to your Claude configuration directory:

```bash
# Clone or download this template repository
cd claudecode-template

# Install agents
cp -rf agents/ ~/.claude/agents/

# Install KC commands  
cp -rf commands/kc/ ~/.claude/commands/

# Install hooks (optional)
cp -rf hooks/ ~/.claude/hooks/

```

---

## Core Features

The template provides three main categories of enhancements to accelerate full-stack development:

### 🚀 Commands
Custom slash commands that automate common development workflows:
- **KC Commands** (Kai Commands): Task-specific workflows for implementation and project management


### 🤖 Agents
Specialized AI agents with deep domain expertise:
- **Platform Experts**: Next.js frontend, Python backend, and full-stack development
- **Quality Specialists**: Code review, documentation, and technical writing
- **Methodology Experts**: Kiro-based development process specialists

### ⚙️ Hooks
Automated development workflow enhancements:
- **Security Protection**: Prevents dangerous command execution
- **Quality Assurance**: Automated code formatting and commit validation
- **Development Acceleration**: Sound notifications and status updates

---

## Commands

### KC Commands (Kai Commands)

Task-specific development workflows designed for full-stack projects.

| Command | Description |
| :--- | :--- |
| `/kc:split-task` | Break down feature tasks into subtasks. Reads feature specifications and creates numbered task files under `./docs/specs/{feature}/tasks/` for systematic implementation. |
| `/kc:impl` | Implement task specifications with automated review and testing. Reads task files from `./docs/specs/{feature}/tasks/`, creates git branches, implements with appropriate agents, runs tests, and creates PRs. |
| `/kc:bug-fix` | Automated bug fixing workflow. Fetches GitHub issues, analyzes problems, searches codebase, implements fixes, validates solutions, and creates fix branches with proper commit messages. |
| `/kc:pr-list` | Display prioritized list of open PRs. Shows high/medium/low priority PRs with summaries, author info, and direct GitHub links for efficient project management. |


#### Usage Examples

```bash
# Split a feature into manageable tasks
/kc:split-task youtube-learning
# Implement a specific task
/kc:impl 0001

# Fix a reported bug
/kc:bug-fix 123 --with-tests

# View current PRs by priority
/kc:pr-list
```


## Agents

Specialized AI agents that provide deep domain expertise and can be launched as independent sub-agents for parallel processing. Each agent can run with `--agent` flag for isolation from the main conversation context.

### Platform Development Experts

| Agent | Specialization | Key Features |
| :--- | :--- | :--- |
| `nextjs-expert` | Next.js & Modern React | App Router, Server Components, TypeScript, performance optimization, responsive design, accessibility, SEO |
| `frontend-expert` | Modern Frontend Stack | React + TypeScript + Tailwind CSS + shadcn/ui + TanStack Query, component architecture, responsive design |
| `python-backend-expert` | Python Backend Systems | FastAPI, Django, Flask, SQLAlchemy, uv package management, async patterns, database optimization, authentication |

### Quality & Documentation Specialists

| Agent | Specialization | Key Features |
| :--- | :--- | :--- |
| `code-reviewer` | Full-Stack Code Review | Architecture analysis, security review, performance optimization, best practices for Python, TypeScript, and IaC |
| `technical-documentation-writer` | Technical Documentation | API documentation, user guides, system architecture docs, technical content creation |

### Kiro SDD Experts

Specialized agents for kiro sdd - a spec-driven development approach.

| Agent | Purpose | Focus Area |
| :--- | :--- | :--- |
| `kiro-requirement` | Requirements Engineering | Transform ideas into structured requirements and feature specifications |
| `kiro-design` | Technical Design | Create comprehensive design documents from approved requirements |
| `kiro-plan` | Implementation Planning | Generate actionable task lists from approved feature designs |
| `kiro-executor` | Focused Implementation | Execute specific tasks from design specifications with strict adherence |


## Hooks

Automated development workflow enhancements configured in `settings.json`. These scripts run at specific events to improve security, code quality, and developer experience.

### Security & Safety Hooks

| Hook | Event | Description |
| :--- | :--- | :--- |
| `deny_check.sh` | `PreToolUse` | **Security Guard**: Prevents execution of dangerous commands like `rm -rf /` and `shutdown now`. Analyzes bash commands before execution to protect the system. |
| `check_ai_commit.sh` | `PreToolUse` | **Commit Quality Control**: Prevents commits with AI-generated signatures. Ensures clean commit messages without automated generation markers. |

### Code Quality Hooks

| Hook | Event | Description |
| :--- | :--- | :--- |
| `formatter.sh` | `PostToolUse` | **Auto-Formatter**: Automatically formats code after file edits. Uses `ruff` for Python files (check + format) and `prettier` for TypeScript/JavaScript files. Logs all formatting actions. |

### Developer Experience Hooks

| Hook | Event | Description |
| :--- | :--- | :--- |
| Sound Notifications | `Notification` & `Stop` | **Audio Feedback**: Plays system sounds (Funk.aiff) when Claude requires input or completes tasks, helping developers stay aware of status changes. |

### Hook Configuration

Hooks are configured in `settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": "~/.claude/hooks/deny_check.sh" },
          { "type": "command", "command": "~/.claude/hooks/check_ai_commit.sh" }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          { "type": "command", "command": "~/.claude/hooks/formatter.sh" }
        ]
      }
    ]
  }
}
```
