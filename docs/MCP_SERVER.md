## Serena

```bash
## install uv (python)
brew install uv

# Install Serena for semantic code analysis and editing
claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant --project $(pwd)


# add context7 (remote)
claude mcp add --transport http context7 https://mcp.context7.com/mcp

# add shadcn UI v4 MCP Server
claude mcp add shadcn -- bunx -y @jpisnice/shadcn-ui-mcp-server --github-api-key YOUR_API_KEY


```
The command will add the entry below to .mcp.json

### Configuration

```json
{ 
   "mcpServers": {
    "serena": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/oraios/serena",
        "serena",
        "start-mcp-server",
        "--context",
        "ide-assistant",
        "--project",
        "/Users/raymond/projects/opensources/serena"
      ],
      "env": {}
    }
  }
}

```

# Shadcn
## Registry MCP
```json
{
  "mcpServers": {
    "shadcn": {
      "description": "",
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "shadcn@canary",
        "registry:mcp"
      ],
      "env": {
        "REGISTRY_URL": "https://alpine-registry.vercel.app//r/registry.json"
      }
    }
}
```

