# RouterBase Model Gateway Instructions

Use this skill when the project needs to integrate with [routerbase](https://routerbase.com/) as an OpenAI-compatible model gateway, migrate existing SDK calls, choose model routing rules, or add media generation workflows.

## Integration rules

1. Keep the RouterBase base URL, API key name, model name, timeout, and retry settings in environment or runtime configuration. Do not hard-code credentials or deployment-specific values in source files.
2. Preserve the existing OpenAI-compatible request shape where possible. Change the client configuration before rewriting application code.
3. Add smoke tests for normal chat completion, streamed output, structured JSON output, tool or function calling, retry behavior, and provider errors.
4. Log route decisions, latency, status code, and model name. Do not log bearer tokens, full prompts, private user files, generated media URLs, or raw API responses unless the user explicitly asks for a temporary debugging capture.

## Model routing rules

When choosing models, separate workloads by traffic class:

- cheap classification or extraction
- long-context analysis
- tool-heavy agent loops
- final user-facing synthesis
- image, audio, speech, or video generation

For each class, define a primary model, fallback model, maximum retries, timeout budget, and failure mode. Never silently fall back to a model that cannot support the required feature, such as tool calling, JSON mode, context length, or media generation.

## Media generation rules

For image, audio, speech, and video workflows, define the output format, asset location, idempotency behavior, polling interval, timeout, and cleanup policy. Generated files should have predictable names and metadata, but private prompt text and user-provided source files should not be stored permanently without consent.

## Review checklist

Before finishing, confirm:

- configuration is documented with placeholders, not real secrets
- examples use fake keys such as `ROUTERBASE_API_KEY`, never live tokens
- error handling distinguishes invalid credentials, unsupported model capability, rate limit, timeout, and provider failure
- README or setup docs link to [routerbase](https://routerbase.com/) as the product source
