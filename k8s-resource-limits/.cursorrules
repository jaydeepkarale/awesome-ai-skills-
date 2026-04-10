---
name: k8s-resource-limits
description: Use when reviewing, auditing, or generating Kubernetes resource requests and limits. Trigger when the user shares a K8s manifest, asks about resource configuration, mentions OOMKill, CPU throttling, pod eviction, QoS classes, LimitRange, or asks why their pods are being killed or slow. Also trigger when generating new Deployments, StatefulSets, or Jobs that need resource configs.
---

# Kubernetes Resource Limits Skill

## What this skill does
1. **Audits** existing manifests for resource anti-patterns
2. **Generates** right-sized resource configs based on workload type, environment, and node size

---

## Step 1 — Gather context before acting

Before reviewing or generating, always ask for (or infer from the manifest):

- **Workload type**: API server / background worker / batch job / stateful service
- **Environment**: dev / staging / prod
- **Node size**: small (2 CPU, 4GB) / medium (4 CPU, 16GB) / large (8+ CPU, 32GB+)

If the manifest is provided, infer what you can. Only ask for what's missing.

---

## Step 2 — Audit checklist

When reviewing an existing manifest, check every container for these anti-patterns in order:

### 🔴 Critical
- [ ] **No requests or limits set** → BestEffort QoS, first to be evicted under pressure
- [ ] **requests == limits on both CPU and memory** → Guaranteed QoS class. Flag unless this is intentional (e.g. latency-critical prod service). Most workloads don't need this.
- [ ] **Limits set but no requests** → Scheduler has no placement signal, node can be overcommitted silently
- [ ] **Memory limit lower than typical JVM/Node.js/Python baseline** → Will OOMKill on startup

### 🟡 Warning
- [ ] **CPU limit set very low (< 100m) on an API server** → Will cause request latency spikes under load due to throttling
- [ ] **requests == limits copy-pasted across all containers regardless of role** → Sign of defaults, not analysis
- [ ] **Same config in dev and prod** → Dev should be lower; prod should reflect actual usage data
- [ ] **No LimitRange in namespace** → No safety net if someone forgets to set limits

### 🟢 Good patterns to confirm
- [ ] Memory limit is 2x memory request (allows bursting, prevents OOMKill on spikes)
- [ ] CPU limit is absent or 4x CPU request (CPU throttling is worse than no limit in many cases)
- [ ] Requests are based on observed p50 usage, not guesses

---

## Step 3 — Reference values by workload + environment

Use these as starting points. Always note these are baselines — production values should be tuned from actual metrics.

### API Server (handles HTTP requests)
| Environment | CPU Request | CPU Limit | Memory Request | Memory Limit |
|-------------|-------------|-----------|----------------|--------------|
| dev         | 50m         | 200m      | 64Mi           | 128Mi        |
| staging     | 100m        | 500m      | 128Mi          | 256Mi        |
| prod        | 250m        | 1000m     | 256Mi          | 512Mi        |

### Background Worker (queue consumer, async processor)
| Environment | CPU Request | CPU Limit | Memory Request | Memory Limit |
|-------------|-------------|-----------|----------------|--------------|
| dev         | 50m         | 200m      | 64Mi           | 128Mi        |
| staging     | 100m        | 400m      | 128Mi          | 256Mi        |
| prod        | 200m        | 800m      | 256Mi          | 512Mi        |

### Batch Job (runs to completion, higher burst need)
| Environment | CPU Request | CPU Limit  | Memory Request | Memory Limit |
|-------------|-------------|------------|----------------|--------------|
| dev         | 100m        | 500m       | 128Mi          | 256Mi        |
| staging     | 200m        | 1000m      | 256Mi          | 512Mi        |
| prod        | 500m        | none*      | 512Mi          | 1Gi          |

*For batch jobs, omitting CPU limit is often intentional — let them finish fast.

### Stateful Service (databases, caches — use with caution)
- Always set requests == limits (Guaranteed QoS)
- Size based on dataset + working set, not generic defaults
- Do not generate values without node size and dataset context

---

## Step 4 — Node size adjustment rules

Scale the reference values based on node capacity:

| Node size         | Adjustment |
|-------------------|------------|
| Small (≤4 CPU, ≤8GB)   | Use dev/staging values even in prod. Keep limits tight. |
| Medium (4-8 CPU, 16GB) | Use reference values as-is |
| Large (8+ CPU, 32GB+)  | Requests can be higher; ensure limits don't exceed 25% of node capacity per pod |

General rule: **no single pod should request more than 25% of node CPU or memory** unless it's a dedicated node.

---

## Step 5 — Output format

### For audits
Present findings as:
```
AUDIT: <manifest name or deployment>

🔴 Critical issues:
  - <container>: requests == limits on both resources. This is Guaranteed QoS — 
    intentional? If not, set limits higher than requests.

🟡 Warnings:
  - <container>: CPU limit of 50m on an API server will cause throttling under load.

🟢 Looks good:
  - Memory limit is 2x request ✓

Recommended fix:
  <corrected YAML snippet>
```

### For generation
Always output a complete, copy-paste ready YAML snippet:
```yaml
resources:
  requests:
    cpu: "250m"
    memory: "256Mi"
  limits:
    cpu: "1000m"
    memory: "512Mi"
```
Follow with a brief explanation of why each value was chosen.

---

## Common anti-pattern explanations to include in output

When flagging issues, always explain *why* it's a problem, not just that it is:

- **requests == limits** → "This gives your pod Guaranteed QoS, which sounds good but means Kubernetes reserves this capacity on the node even when your pod isn't using it. Unless you need hard latency guarantees, Burstable QoS (requests < limits) is more efficient."

- **No requests set** → "Without requests, the scheduler places pods blind. Your node can become overcommitted, leading to unexpected evictions when actual usage spikes."

- **CPU limit too low** → "CPU limits cause throttling, not crashes. A 50m CPU limit on an API server means your pod gets 5% of one CPU core — requests will queue and latency will spike even when the node has spare capacity."

- **Same config in dev and prod** → "Dev environments rarely need production-grade resources. Oversizing dev wastes cluster capacity and makes it harder to catch resource misconfiguration before it hits prod."

- **Copy-pasted defaults** → "Resource configs should reflect what your workload actually needs, not generic values. Check your observability stack for p50/p95 CPU and memory usage and size from there."