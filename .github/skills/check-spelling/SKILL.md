---
name: check-spelling
description: >
  Scan workshop content for spelling errors, typos, and inconsistent
  terminology. Use this skill when a user says "check spelling", "spellcheck",
  "find typos", "spelling errors", or when reviewing content before publishing.
---

# Check Spelling

This skill scans all workshop content for spelling errors, typos, and
terminology inconsistencies. It understands that the content is a technical
workshop about Microsoft Fabric and treats product names, technical terms,
and acronyms appropriately.

## Scope

All Markdown files under `fabricoverview/` and `README.md`.

## What to Check

### 1. Standard Spelling Errors

Scan all visible text (not URLs, not HTML attributes, not code blocks) for
misspelled English words. Flag each with the source file, line number, the
misspelled word, and a suggested correction.

### 2. Technical Terminology (Do NOT Flag)

The following are **correct** and must not be flagged as errors:

**Microsoft Fabric terms**: OneLake, Lakehouse, Eventhouse, Dataflow,
Datamart, DirectLake, KQL, KQLDB, PySpark, T-SQL, DAX, Synapse, Copilot,
AutoML, PowerShell, IntelliSense, SSMS, Kusto, OneLake, Microsoft Entra ID

**Azure terms**: Azure SQL, Cosmos DB, Databricks, PostgreSQL, RBAC, VNET,
SKU, TPID, AAD, SPN, ACR

**Data terms**: ETL, OLTP, OLAP, CDC, HTAP, Delta Lake, Parquet, JSON, API,
REST, SDK, npm, npx, CLI

**Acronyms**: PPU, CU, DWH, KPI, SLA, SaaS, PaaS, IaaS, MVP, GA, RTI

### 3. Common Workshop-Specific Typos

Pay special attention to these patterns found in technical content:
- "Mirroing" → "Mirroring"
- "PostgrSQL" → "PostgreSQL"
- "Troubleshoot" vs "Trouble shoot" (should be one word)
- "CoPilot" vs "Copilot" (Microsoft uses "Copilot" — one capital C)
- "Data Agents" vs "Data Agent" (check for consistency)
- Double words ("the the", "is is")
- Missing spaces after periods
- Repeated punctuation

### 4. Inconsistent Product Names

Flag inconsistent capitalisation or spacing of product names within and
across modules:

| Correct | Common mistakes |
|---------|----------------|
| Microsoft Fabric | microsoft fabric, MS Fabric |
| OneLake | One Lake, Onelake, onelake |
| Lakehouse | Lake House, lakehouse (when referring to the Fabric service) |
| Data Warehouse | data warehouse (when referring to the Fabric service) |
| Copilot | CoPilot, Co-Pilot, co-pilot |
| Real-Time Intelligence | Real-time intelligence, Realtime Intelligence |
| Power BI | PowerBI, Power Bi |
| Azure Data Explorer | Azure data explorer |

### 5. HTML Entity and Encoding Issues

- Unescaped special characters that render incorrectly
- Broken HTML entities (`&amp;` showing as literal text, etc.)
- Smart quotes or non-ASCII characters that should be standard ASCII

## Process

### Step 1: Extract Text

For each file, extract only the human-readable text:
- Strip HTML tags (but keep their text content)
- Skip URLs, `href`/`src` attribute values
- Skip code blocks (fenced with ``` or indented)
- Skip image alt text that is just a filename
- Keep: headings, paragraphs, list items, table cells, link text

### Step 2: Check

Run spelling checks on extracted text. For each error found, record:
- File path and line number
- The misspelled word in context (a few surrounding words)
- Suggested correction(s)
- Category: typo / product name inconsistency / encoding issue

### Step 3: Report

Present findings organised by module:
```
Module 05 - Mirroring in Fabric:
  Line 42: "Mirroing" → "Mirroring" (typo)
  Line 70: "PostgrSQL" → "PostgreSQL" (typo)

Module 07 - Copilots & AI Skills:
  Line 15: "CoPilot" → "Copilot" (product name inconsistency)
```

Summary:
- Total words scanned
- Total errors found by category
- Modules with no issues

### Step 4: Fix (if requested)

Apply corrections to the source files. For product name inconsistencies,
confirm the canonical form with the user before bulk-replacing.

## Custom Dictionary

If the user wants to add workshop-specific terms that should never be flagged,
note them in the report so they can be added to a future custom dictionary or
to this skill's exemption list.
