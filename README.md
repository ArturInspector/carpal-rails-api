# Carpal Rails API

Rails API-mode implementation of the shared Carpal P0 contract. It uses
passwordless OTP and Bearer JWT authentication; passwords, browser sessions and
auth cookies are intentionally absent.

## One-command boot

Requirements: Docker with Compose.

```sh
docker compose up --build
```

This starts PostgreSQL 16, prepares an empty `carpal_rails_e2e` database, seeds
it and serves the API at `http://localhost:8001`. The frontend origin defaults to
`http://localhost:3000`.

```sh
curl http://localhost:8001/health
curl http://localhost:8001/openapi.json
```

To discard all local database state:

```sh
docker compose down --volumes
```

## Native development

Use Ruby 3.3 and PostgreSQL 16. Copy `.env.example` values into your shell, then:

```sh
bundle install
bin/setup --skip-server
bin/rails server -p 8001
```

Run verification with:

```sh
bin/rails test
bin/rubocop
bin/brakeman --no-pager
```

`../E2E_COMPETITION.md` is the black-box contract and source of truth.
