---
name: minimum-sufficient-architecture
description: Assess, design, implement, or simplify software using the minimum architecture justified by current requirements. Use for new projects, feature planning, code generation, architecture reviews, and overengineering concerns; do not use when the user explicitly requires a named architecture without wanting it evaluated.
---

# Minimum Sufficient Architecture

Build the minimum sufficient architecture for the system that exists, not the system someone imagines might exist. Architecture must be pulled by concrete pressure rather than pushed by patterns.

## Establish the project profile

Inspect the existing repository and visible requirements before asking questions. Reuse known answers and ask only for missing facts that could materially change the design. Focus on:

- product stage and expected lifetime
- expected users, traffic, data volume, and growth horizon
- team size and deployment ownership
- business-rule and workflow complexity
- external integrations and failure modes
- reliability, security, privacy, audit, and regulatory needs
- cost of failure and recovery expectations
- expected rate and types of change

User count informs scaling, but does not determine code architecture by itself. A small financial system may need stronger correctness boundaries than a large read-only catalog.

When uncertainty remains, state the assumption and choose the most reversible simple option. Do not make the user complete a lengthy questionnaire when repository evidence or sensible defaults are enough.

## Set an architecture budget

Before proposing structure or making substantial changes, report a concise classification:

```text
Architecture budget: N/10 — Low | Moderate | High
Primary pressures: ...
Keep: ...
Avoid for now: ...
Reassess when: ...
```

Use the score as a reasoning aid, not a formula. Business complexity, failure cost, team coordination, integrations, operational demands, and change pressure should drive it.

- **1–3, low:** framework-native structure, direct ORM/data access, cohesive modules, and simple functions. Add a service only when logic no longer belongs cleanly in the entry point or model.
- **4–6, moderate:** explicit domain modules or focused services, clear integration boundaries, background work where needed, and measured caching or concurrency controls.
- **7–10, high:** stronger boundaries and distributed patterns may be justified by demonstrated scale, reliability, audit, organizational, or domain pressure. Still require each pattern to solve a current problem.

Do not jump between levels. Add the smallest structural response to the pressure observed.

## Govern design decisions

Prefer:

- framework conventions and boring, proven technology
- direct readable control flow and explicit business rules
- fewer layers, files, dependencies, and concepts
- local abstractions near their use
- duplication when the correct shared abstraction is not yet clear
- database constraints, transactions, and idempotency when correctness requires them
- measured optimization based on an identified bottleneck
- existing project patterns unless they are the source of avoidable complexity

Avoid by default:

- interfaces with one implementation
- repository layers that merely wrap an ORM
- generic base classes and internal mini-frameworks
- factories without variable construction behavior
- DTO-to-DTO mapping without a real boundary
- dependency-injection frameworks without substitution or lifecycle needs
- event buses, CQRS, event sourcing, or microservices without matching pressure
- queues, caches, and distributed locks without a concrete asynchronous, performance, or coordination need
- speculative extensibility justified only by “we may need it later”

Before introducing a new layer, pattern, infrastructure component, or dependency, determine:

1. What concrete problem exists now?
2. What is the simplest viable alternative?
3. What complexity and operational cost will this add?
4. What evidence or requirement makes the tradeoff worthwhile?

If these questions do not yield a strong justification, do not add it. Briefly disclose the justification when the choice materially affects the design.

## Implement within the budget

For coding work:

- satisfy the current requirement completely with the smallest coherent change
- follow existing conventions and modify as few components as practical
- keep logic inline while it remains readable; extract only when it improves cohesion, reuse is real, or a boundary needs isolation
- avoid creating extension points for hypothetical variants
- preserve public contracts and existing behavior unless the request changes them
- test important behavior and failure cases at the cheapest effective level
- remove obsolete indirection made unnecessary by the change when it is safe and in scope

Do not confuse simplicity with low quality. Regardless of architecture budget, preserve appropriate validation, authorization, security, type safety, database integrity, transactions, error handling, observability, and tests. Code quality is not architectural complexity.

When reviewing existing code, identify both missing safeguards and unjustified structure. Recommend simplification only when it reduces cognitive or operational cost without weakening a real requirement.

## Reassess incrementally

Raise the budget only when new evidence appears, such as complex cross-module workflows, multiple implementations, sustained performance limits, stricter audit needs, costly failures, independent team ownership, or independently scaled workloads.

When recommending an increase, state:

- the new pressure
- the smallest architectural change that addresses it
- patterns that remain unjustified

Do not redesign unrelated parts of the system merely to make the architecture uniform.

## Communicate the result

Lead with the recommended budget and simplest suitable design. For implementation tasks, keep architecture commentary brief and then perform the work. For reviews or plans, distinguish clearly among:

- required now
- useful later if a named trigger occurs
- unnecessary under current evidence

When the user explicitly chooses a more elaborate architecture, respect the choice while identifying its concrete costs and applying it without adding further ceremony.
