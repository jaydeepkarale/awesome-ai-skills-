# Project Guidelines

## REST API Design

Follow the 12 practices in `.github/copilot-instructions.md` for all API work.

When writing or reviewing API code, check every endpoint against that list and flag any violations with a suggested fix.

### Quick red flags to always catch:
- Verbs in URLs (`/getUsers`, `/createOrder`)
- Missing `/v1/` prefix
- Raw DB models returned as API responses
- List endpoints with no pagination
- Inconsistent error response shapes
- Auth tokens in query params instead of `Authorization` header
- No `/health` endpoint
- Missing `requestId` in logs
