# Claude LLM request structure

```json
{
  "model": "claude-sonnet-4-20250514",
  "temperature": 1,
  "max_tokens": 32000,
  "stream": true,

  // --- Conversation turns (history lives here) ---
  "messages": [
    // Turn 0 — User's first command (/init)
    {
      "role": "user",
      "content": [
        { "type": "text", "text": "<hidden system-reminder #1>" },         // injected by CLI
        { "type": "text", "text": "<command-message + <command-name>>" },   // injected by CLI (/init)
        { "type": "text", "text": "<your visible /init instructions>" },    // your prompt
        { "type": "text", "text": "<hidden system-reminder #2>",            // injected by CLI
          "cache_control": { "type": "ephemeral" } }                        // ephemeral hint
      ]
    },

    // Turn 1 — Assistant reply (decides to call a tool)
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "Sure, I’ll start by inspecting your repo files." },
        { "type": "tool_use", "id": "tool_call_1", "name": "LS", "input": { "path": "/" } }
      ]
    },

    // Turn 2 — Tool result from client back to assistant
    {
      "role": "user",
      "content": [
        { "type": "tool_result", "tool_use_id": "tool_call_1", "content": "README.md\nsrc/\npackage.json" }
      ]
    },

    // Turn 3 — Assistant continues after tool result
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "I found your source files. Now I’ll proceed to create the CLAUDE.md file..." }
      ]
    },

    // Turn 4 — User sends next command
    {
      "role": "user",
      "content": [
        { "type": "text", "text": "Now please run the tests." }
      ]
    },

    // Turn 5 — Assistant replies to Turn 4
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "Okay, running your test suite..." },
        { "type": "tool_use", "id": "tool_call_2", "name": "Bash", "input": { "command": "npm test" } }
      ]
    }
  ],

  // --- Global rules/persona (not part of turn history) ---
  "system": [
    { "type": "text", "text": "<identity string>", "cache_control": { "type": "ephemeral" } },
    { "type": "text", "text": "<long policy/behavior/config block>", "cache_control": { "type": "ephemeral" } }
  ],

  // --- Tool capability declarations (names + schemas) ---
  "tools": [
    { "name": "Task", "description": "...", "input_schema": { ... } },
    { "name": "Bash", "description": "...", "input_schema": { ... } },
    { "name": "Glob", "description": "...", "input_schema": { ... } },
    { "name": "Grep", "description": "...", "input_schema": { ... } },
    { "name": "LS", "description": "...", "input_schema": { ... } },
    { "name": "ExitPlanMode", "description": "...", "input_schema": { ... } },
    { "name": "Read", "description": "...", "input_schema": { ... } },
    { "name": "Edit", "description": "...", "input_schema": { ... } },
    { "name": "MultiEdit", "description": "...", "input_schema": { ... } },
    { "name": "Write", "description": "...", "input_schema": { ... } },
    { "name": "NotebookEdit", "description": "...", "input_schema": { ... } },
    { "name": "WebFetch", "description": "...", "input_schema": { ... } },
    { "name": "TodoWrite", "description": "...", "input_schema": { ... } },
    { "name": "WebSearch", "description": "...", "input_schema": { ... } },
    { "name": "BashOutput", "description": "...", "input_schema": { ... } },
    { "name": "KillBash", "description": "...", "input_schema": { ... } },
    { "name": "mcp__ide__getDiagnostics", "description": "...", "input_schema": { ... } },
    { "name": "mcp__ide__executeCode", "description": "...", "input_schema": { ... } },
    { "name": "mcp__cf-docs__search_cloudflare_documentation", "description": "...", "input_schema": { ... } },
    { "name": "mcp__cf-docs__migrate_pages_to_workers_guide", "description": "...", "input_schema": { ... } }
  ],

  // --- Misc metadata ---
  "metadata": {
    "user_id": "<session id>"
  }
}

```

# Same request over OpenAI format
```json
{
  "model": "gpt-4o",
  "temperature": 1,
  "stream": true,

  "messages": [
    // Turn 0 — User's first command (/init)
    {
      "role": "system",
      "content": [
        { "type": "text", "text": "<identity string>" },
        { "type": "text", "text": "<long policy/behavior/config block>" }
      ]
    },
    {
      "role": "user",
      "content": [
        { "type": "text", "text": "<hidden system-reminder #1>" },
        { "type": "text", "text": "<command-message + <command-name>>" },
        { "type": "text", "text": "<your visible /init instructions>" },
        { "type": "text", "text": "<hidden system-reminder #2>" }
      ]
    },

    // Turn 1 — Assistant reply (decides to call a tool)
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "Sure, I’ll start by inspecting your repo files." }
      ],
      "tool_calls": [
        {
          "id": "tool_call_1",
          "type": "function",
          "function": { "name": "LS", "arguments": "{ \"path\": \"/\" }" }
        }
      ]
    },

    // Turn 2 — Tool result from client back to assistant
    {
      "role": "tool",
      "tool_call_id": "tool_call_1",
      "content": [
        { "type": "text", "text": "README.md\nsrc/\npackage.json" }
      ]
    },

    // Turn 3 — Assistant continues after tool result
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "I found your source files. Now I’ll proceed to create the CLAUDE.md file..." }
      ]
    },

    // Turn 4 — User sends next command
    {
      "role": "user",
      "content": [
        { "type": "text", "text": "Now please run the tests." }
      ]
    },

    // Turn 5 — Assistant replies to Turn 4
    {
      "role": "assistant",
      "content": [
        { "type": "text", "text": "Okay, running your test suite..." }
      ],
      "tool_calls": [
        {
          "id": "tool_call_2",
          "type": "function",
          "function": { "name": "Bash", "arguments": "{ \"command\": \"npm test\" }" }
        }
      ]
    }
  ],

  "tools": [
    {
      "type": "function",
      "function": {
        "name": "Task",
        "description": "...",
        "parameters": { "type": "object", "properties": {}, "additionalProperties": true }
      }
    },
    {
      "type": "function",
      "function": {
        "name": "Bash",
        "description": "...",
        "parameters": {
          "type": "object",
          "properties": { "command": { "type": "string" } },
          "required": ["command"]
        }
      }
    },
    {
      "type": "function",
      "function": {
        "name": "Glob",
        "description": "...",
        "parameters": { "type": "object", "properties": {}, "additionalProperties": true }
      }
    },
    {
      "type": "function",
      "function": {
        "name": "Grep",
        "description": "...",
        "parameters": { "type": "object", "properties": {}, "additionalProperties": true }
      }
    },
    {
      "type": "function",
      "function": {
        "name": "LS",
        "description": "...",
        "parameters": {
          "type": "object",
          "properties": { "path": { "type": "string" } },
          "required": ["path"]
        }
      }
    }
    // ...continue for all other tools from the Anthropic list
  ]
}
```

| Anthropic                   | OpenAI equivalent                                                                  |
| --------------------------- | ---------------------------------------------------------------------------------- |
| `system` array with blocks  | One `system` message (multi-block `content[]`)                                     |
| `messages[].content[]`      | Still `messages[].content[]` (OpenAI supports multi-block)                         |
| `cache_control.ephemeral`   | Dropped — OpenAI has no built-in ephemeral flag (you must handle this client-side) |
| `tool_use`                  | `tool_calls` array inside the assistant message                                    |
| `tool_result`               | `role: "tool"` message with `tool_call_id`                                         |
| `input_schema`              | `parameters` inside tool definition                                                |
| Multiple injected CLI hints | Just extra `content[]` blocks in the same user turn                                |




