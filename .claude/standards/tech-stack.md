# Tech Stack

## Context
Our tech stack is documented below. Follow it closely over your development tasks.


### Frontend Tech Stack 

- **UI framework**: NextJS 15 runs on Cloudflare Edge Infrastructure as Worker.
- **Language**: Typescript for type safety
- **Build Tool**: Vite
- **Package Manager**: npm
- **Node Version**: 22 LTS
- **Styling**: TailwindCSS 4.0+
- **UI Components**: Shadcn UI latest and Prompt-kit
- **Icons**: Phosphor Icons and Lucide React components
- **Validataion**: Zod
- **LLM SDK**: Vercel AI SDK v5
- **Toast Notification**: Sonner
- **Web Security**: Clerk


### Backend Tech Stack
- **REST API**: Cloudflare Worker
- **Application Hosting**: Cloudflare
- **Database**: Cloudflare D1
- **Database Access/ ORM**: Drizzle ORM
- **Vector Store**: Cloudflare Vectorize
- **Asset Storage**: Cloudflare R2
- **Key/ Value Cache**: Cloudflare KV
- **Static Asset CDN**: Cloudflare CDN (html, javascript, css and font)
- **Payment**: Stripe


### API Rules
- At the core it is Cloudflare worker routing to service written in Typescript
- All services are exposed as both REST and remote MCP endpoints: /sse and /mcp transport protocol.



### Testing
- **Unit test framework**: vitest
- **Integration test frameworks**: playwright/ api tests
- **Methodology**: Test Driven Development - code the tests first before actual code and pass the tests for any fixes or features.

- Run `bun run format` and `bun run lint` before committing to ensure code quality
- All TypeScript errors must be resolved (`bun run typecheck`)
- Test responsive design on mobile and desktop
- Verify real-time features work across multiple clients



### Coding Standard
- Use TypeScript with strict mode enabled. Avoid `any` and `unknown` types. Prefer explicit types and interfaces. Do not use `@ts-ignore` or disable type checks.
- Use functional React components. Always use hooks at the top level. Do not use default exports for components or functions.
- Follow Next.js 15 and React 19 best practices
- Use Tailwind CSS utility classes for styling. Avoid inline styles.
- Use Bun for all package management and scripts (`bun install`).
- Follow Convex guidelines in `agent_rules/convex_rules.md`.
- Use Shadcn UI and Prompt-kit components as documented. Do not modify library code directly. Prefer composition over modification. Follow guidelines in `agent_rules/ui.md` when creating or editing UI components.
- Use Biome for all linting and formatting. Run Biome (`bun run lint`) before committing. Follow all rules specified in `biome.jsonc`. Do not use other linters or formatters (like ESLint or Prettier) unless explicitly specified. Check `biome.jsonc` for custom or overridden rules. Biome extends the `ultracite` ruleset for this project.
- Ensure accessibility: use semantic HTML, provide alt text for images, use ARIA attributes appropriately, and follow accessibility rules in `agent_rules/ultracite.md`.
- Update this section whenever the stack or tooling changes.