# Tech Stack

## Context
Our tech stack is documented below. Follow it closely over your development tasks.


### Frontend Tech Stack 
- App framework: Remix v2 (Vite) targeting Cloudflare Workers (not Pages).
- Language: Typescript
- Build Tool: Vite
- Package Manager: npm
- Node Version: 22 LTS
- CSS Framework: TailwindCSS 4.0+
- UI Components: shadcn/ui components latest
- Font Provider: Google Fonts
- Font Loading: Self-hosted for performance
- Icons: Lucide React components
- Validation: Zod


### Backend Tech Stack
- REST API: Cloudflare Worker
- Application Hosting: Cloudflare
- Database: Cloudflare D1
- Database Access/ ORM: Drizzle ORM
- Vector Store: Cloudflare Vectorize
- Asset Storage: Cloudflare R2
- Key/ Value Cache: Cloudflare KV
- Static Asset CDN: Cloudflare CDN (html, javascript, css and font)
- Payment: Stripe
- Auth: Clerk


### MCP - remote and scale on cloudflare edge
- At the core it is Cloudflare worker routing to service in Typescript
- All services are exposed as remote MCP that supports both /sse and /mcp transport protocol.
- All services are exposed over regular REST API call as well.


### Testing
- Unit tests: vitest
- Integration test: playwright/ api tests
- Methodology: Test Driven Development - code the tests first before actual code and pass the tests for any fixes or features.
