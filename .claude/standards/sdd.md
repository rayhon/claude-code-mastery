# Best Practice for Spec Driven Development
* You MUST FOLLOW the best practice stated here.

## 1. Documentation Directory Structure
* pattern for feature task list: `./docs/specs/[epic]/[feature]/tasks.md`

### Example: SEO Ranker Webapp
```markdown
.claude/
├── product/
│   ├── prd.md                      # master PRD for the product requirements
│   └── design.md                   # high-level design doc for the whole product
│
└── specs/
    ├── crawler/                    # Epic (module)
    │   ├── prd.md                  # optional epic PRD file if module is complex
    │   ├── design.md               # optional epic design file if module is complex
    │   ├── tasks.md                # index of features for the crawler module
    │   ├── url-queue/tasks.md      # feature task list
    │   └── api-import/tasks.md     # feature task list
    │
    ├── ranking-algo/               # Epic (module)
    │   ├── tasks.md
    │   ├── keyword-score/tasks.md
    │   └── link-analysis/tasks.md
    │
    ├── dashboard-ui/               # Epic (module)
    │   ├── tasks.md
    │   ├── admin-panel/tasks.md
    │   └── client-dashboard/tasks.md
    │
    └── reporting/                  # Epic (module)
        ├── tasks.md
        ├── pdf-export/tasks.md
        └── email-summaries/tasks.md
...

```

* You do not have to have design or PRD for every module automatically.
* You can add them at module-level if it’s complex.
* You always have the master PRD, design, and feature tasks.md as your backbone.


## 2. Github feature branch naming convention
* pattern: `feature/[epic]-[feature]

```markdown
# examples of feature branches for "crawler" module in the seo ranker webapp"
feature/crawler-url-queue
feature/crawler-http-fetch
feature/crawler-robots-parser
feature/crawler-html-extractor
feature/crawler-sitemap-import
feature/crawler-scheduler
...

```

## 3. Templates
* **PRD documentation template** - you can reference this file `@.claude/templates/prd-template.md`
* **Design documentation template** - you can reference this file `@.claude/templates/design-template.md`
* **Task documentation template** - you can reference this file `@.claude/templates/tasks-template.md`