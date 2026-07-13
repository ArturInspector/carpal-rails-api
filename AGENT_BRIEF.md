# Rails Agent Brief

Read `../E2E_COMPETITION.md` first. It is the source of truth.

## Assignment

Build an independent Rails API-mode implementation of the P0 contract with
PostgreSQL. It competes as a black box with Fastify; the Next.js frontend must switch
between them by changing only its API base URL.

1. Scaffold API mode with health and OpenAPI output.
2. Implement six-digit email/phone OTP and Bearer JWT. There are no passwords,
   browser sessions or auth cookies.
3. Keep email and phone identities on one user and allow one user to be both driver
   and host.
4. Implement the catalog query and camelCase response contract exactly.
5. Implement booking requests, guarantee consent, calendar and allocation.
6. Enforce hard-booking exclusion at the PostgreSQL layer and in transactions.
7. Implement fleet-scoped RBAC, idempotent jobs/webhooks, seed data and tests.

Prefer explicit domain/application services for OTP verification, allocation and
state transitions. Controllers should translate HTTP, not own business policy.
Background jobs and locks must work with multiple web replicas. Every migration must
run from an empty database and rollback behavior must be documented where relevant.

## Required verification

- Request/model/service tests for domain invariants.
- Concurrency test proving one hard booking under competing workers.
- The shared black-box API suite.
- GitHub CI that creates PostgreSQL, migrates, seeds and runs all tests.

Do not change the shared contract to make Rails easier. Fake OTP/KYC/payment providers
behind adapters and keep test-only controls unavailable in production.
