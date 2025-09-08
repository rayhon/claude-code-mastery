# UI Implementation Plan (Shadcn MCP)

## Pages / Routes
- /login → Block: login-01 | Fallback: Card, Form, FormField, Input, Label, Button, Separator
- /dashboard → Block: dashboard-01
- /mcp/[name] → Fallback: Image, Badge, Table, Accordion, Button, CopyButton, Skeleton

## Global Layout & Providers
- ThemeProvider, Toaster

## Components Map
- Auth: Form, FormField, Input, Label, Button, Separator
- Cards: Card, CardHeader, CardContent, CardFooter
- Status: Badge
- Disclosure: Accordion (for Install Steps)
- Data: Table, Skeleton
- Utilities: CopyButton, Avatar, Breadcrumb

## Interaction & Hooks
- On Card click → push(`/mcp/[name]`)
- Detail page: Accordion for steps; CopyButton for install snippets

## Assets & Data
- Header image per MCP server
- Metadata: name, status, region, version

## Notes
- Apply TweakCN theme after baseline parity