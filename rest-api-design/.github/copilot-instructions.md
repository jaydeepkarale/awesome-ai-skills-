# REST API Design Instructions

Follow these 12 practices for all REST API code in this repository.

## 1. Resource Naming
- Use plural nouns in kebab-case. No verbs in URLs.
- URLs are nouns; HTTP methods are the verbs.
- ✅ `GET /user-profiles` ❌ `GET /getUser`

## 2. Versioning
- Always include `/v1/` in the base path.
- ✅ `https://api.example.com/v1/orders`

## 3. HTTP Status Codes
- Use the correct code for every response. Not everything is `200`, not every error is `500`.
- `201` for created, `204` for no content, `400` for bad input, `401` for unauthenticated, `403` for unauthorized, `404` for not found, `409` for conflict, `422` for validation errors, `429` for rate limited.

## 4. Pagination
- Every list endpoint must support `?page=1&limit=20` or cursor-based pagination.
- Support filtering and sorting via query params: `?sort=createdAt&order=desc`
- Never return unbounded lists.

## 5. DTOs — Don't Leak DB Schema
- Never return raw database models. Use DTOs to explicitly shape responses.
- Strip internal IDs, sensitive fields, and timestamps you don't want exposed.

## 6. Rate Limiting
- All public endpoints must have rate limiting.
- Respond with `429 Too Many Requests` and a `Retry-After` header when exceeded.

## 7. Idempotency
- `GET`, `PUT`, `DELETE` must be idempotent.
- For `POST`, support an `Idempotency-Key` header to prevent duplicate operations on retry.

## 8. Error Response Shape
- All errors must use this consistent shape:
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": [],
    "requestId": "abc-123"
  }
}
```
- Use a global error handler to enforce this — never return ad-hoc error shapes.

## 9. Authentication & Authorization
- Always send tokens in the `Authorization: Bearer <token>` header. Never in query params.
- Separate authentication (who are you?) from authorization (what can you do?).

## 10. API Documentation
- All endpoints must have OpenAPI/Swagger annotations.
- Docs should be generated from code, not written separately.

## 11. Health Check Endpoint
- Every service must expose `GET /health`.
- Optionally: `GET /health/live` (process alive?) and `GET /health/ready` (can serve traffic?).

## 12. Observability
- Every request must emit a structured JSON log containing `requestId`, `userId`, and `duration`.
- Propagate a `X-Correlation-ID` header across all service boundaries.
