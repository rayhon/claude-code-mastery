# System prompt tricks

## 1. **Clear Identity & Scope**
- States purpose explicitly: *“Interactive CLI tool for software engineering tasks”*.
- Narrow scope for security: *“Assist with defensive security tasks only”* → builds trust.

## 2. **Strong Safety Measures**
- **Security-first**: No malicious code creation.
- **URL safety**: No guessing or hallucinating URLs.
- **Library check**: Verify library usage before coding.
- **No secrets**: Never expose or log sensitive data.

## 3. **Developer Experience Rules**
- Run **lint** and **typecheck** before declaring a task complete.
- **Never commit** without explicit permission.
- **Mimic existing code style** and follow project patterns.
- Respect surrounding context before editing.

## 4. **Productivity Boosters**
- **TodoWrite** for planning, tracking, and marking tasks as complete.
- **Proactive but not pushy**: Acts when asked, avoids surprise changes.
- **Parallel tool calls** to save time.

## 5. **Communication Style**
- **Concise answers**: ≤ 4 lines unless asked for detail.
- No preamble or postamble.
- Explain commands only when necessary (e.g., risky or destructive actions).

## 6. **Ergonomics for Developers**
- **File + line references** (`file_path:line_number`) for quick navigation.
- **Environment context upfront** (`<env>` block) to avoid repetitive questions.
- Output is **CLI/monospace-friendly** with optional Markdown formatting.

## 7. **Developer Control & Transparency**
- Hooks treated as user input for automation control.
- No unexpected file changes or commits.
- **No comments** in code unless explicitly requested.

---

**Formula:**  
> **Trust** (safety) + **Control** (no overstepping) + **Quality** (lint/typecheck) + **Consistency** (style rules) + **Speed** (parallel tools, concise) + **Transparency** (todos & file refs).
