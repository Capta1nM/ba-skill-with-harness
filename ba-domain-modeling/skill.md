---
name: ba-domain-modeling
description: Phase 3 skill. Build project glossary, context map, module catalog, in/out-of-scope list. Reconcile language collisions before propagating. Modules from business capability, NOT system architecture.
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ba-domain-modeling — Phase 3 Skill

## Mục đích

Establish shared language + defensible scope boundary trước khi viết
BRD.

## Workflow

```text
1. Read all RAW + analyzed REQ
        |
        v
2. Build glossary (docs/domain/glossary.md)
        - List term xuất hiện ≥2 lần hoặc dùng với nghĩa không rõ.
        - Reconcile collision (term cùng tên khác nghĩa).
        |
        v (user confirm glossary)
3. Build context map (docs/domain/context-map.md)
        - Actors (human + system)
        - Bounded contexts / modules
        - Key flows
        - Integration points
        - Language boundaries
        |
        v
4. For each module, write module card
        docs/domain/modules/MOD-<name>.md
        - Purpose (business-language)
        - Primary actors
        - Headline capabilities
        - Upstream/downstream deps
        - Linked REQs
        |
        v
5. Build scope (docs/domain/scope.md)
        - In-scope: module + REQ IDs
        - Out-of-scope: item + LÝ DO + owner (nếu defer to other team)
        |
        v (sponsor walkthrough)
6. Capture walkthrough evidence
        docs/validation/<date>-walkthrough-scope.md
        |
        v
7. Update TRACEABILITY_MATRIX (cột Module)
```

## Cardinal rules

- **Glossary owns names.** 1 từ → 1 nghĩa. Reconcile trước khi propagate.
- **Modules from business capability.** KHÔNG từ system architecture
  (microservice).
- **No orphan REQ.** Mọi REQ phải map vào ≥1 module hoặc explicit
  parked.
- **No silent exclusion.** Out-of-scope item phải có lý do.

## Glossary reconciliation patterns

### Pattern 1: 2 stakeholder, cùng từ, khác nghĩa

```text
"Campaign":
  STK-001 (Mktg Lead) = "1 chiến dịch marketing 4-6 tuần"
  STK-003 (IT) = "1 batch email gửi đi 1 lần"
```

→ Split term: `Campaign (marketing)` vs `Email Batch`. Update mọi RAW
+ REQ dùng đúng từ.

### Pattern 2: 1 stakeholder, cùng nghĩa, nhiều từ

```text
STK-002 đôi khi dùng "task", đôi khi "todo", đôi khi "item".
```

→ Chọn 1 canonical: "task". List "todo", "item" là synonyms trong
glossary.

### Pattern 3: Term mới phát sinh từ RAW

```text
RAW có từ "publish" — chưa định nghĩa.
```

→ Add glossary entry, source RAW + STK. Trình user confirm definition.

## Module decomposition rule

Modules từ business capability:

✅ `MOD-TaskCapture`, `MOD-Visibility`, `MOD-Notification`, `MOD-Reporting`
❌ `MOD-Backend`, `MOD-Database`, `MOD-API`, `MOD-Frontend`

Mỗi module có owner role (business, không tech).

## Scope rule

3 lý do hợp lệ cho out-of-scope:

1. **deferred** — sẽ làm Phase 2 hoặc release sau. Phải có timeline ước
   lượng.
2. **replaced** — đã có hệ thống khác cover (vd: dùng Jira cho ticket).
3. **owned-by-other** — team khác làm (vd: Auth team build SSO).

KHÔNG hợp lệ:
- "Tốn quá" — không phải lý do scope, là tradeoff sponsor quyết.
- "Khó quá" — technical opinion, không phải scope.

## Anti-patterns

- ❌ Module từ tech (microservice/DB).
- ❌ Glossary entry tuần hoàn.
- ❌ 2 module overlap capability.
- ❌ Out-of-scope không lý do.
- ❌ Silent merge 2 nghĩa khác nhau.
- ❌ Skip sponsor walkthrough → scope chỉ trên giấy.
