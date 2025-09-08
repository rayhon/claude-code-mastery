## Component Usage Rule
Whenever a ShadCN component is requested, route through the MCP server first.  
This ensures access to context-aware patterns, consistent styling, and prevents broken implementations.

## Planning Rule
When generating or revising UI plans that involve ShadCN:

- Use the MCP server to provide structure and UX flow
- Prioritize component usage where atomic UI pieces are needed
- Prefer entire UI blocks (e.g., login, dashboard, calendar) when they exist
- Treat the MCP output as source-of-truth for layout and flow decisions

## Implementation Rule
When implementing ShadCN components in code:

1. Always begin by calling `getComponentDemo` to pull proper usage examples  
2. Mirror the implementation pattern shown in the demo exactly  
3. Use the demo as a context snapshot – don’t improvise unless required  

**Bonus:**  
- If working with multi-component flows (e.g., forms, modals, auth flows), check if a **Block** exists first before composing manually.