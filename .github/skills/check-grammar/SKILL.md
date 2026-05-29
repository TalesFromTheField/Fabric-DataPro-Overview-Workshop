---
name: check-grammar
description: >
  Scan workshop content for grammar issues, awkward phrasing, and style
  inconsistencies. Use this skill when a user says "check grammar",
  "grammar check", "proofread", "review writing", "improve readability",
  or when polishing content before publishing.
---

# Check Grammar

This skill reviews all workshop content for grammar errors, unclear phrasing,
style inconsistencies, and readability issues. It understands the content is
a technical workshop for data professionals and applies appropriate standards.

## Scope

All Markdown files under `fabricoverview/` and `README.md`.

## What to Check

### 1. Grammar Errors

- Subject-verb agreement ("The data warehouse provide…" → "provides")
- Incorrect tense (mixing past/present within the same section)
- Run-on sentences and comma splices
- Sentence fragments (unless intentionally used in lists)
- Incorrect articles ("a" vs "an" before acronyms — use the sound:
  "an SQL" but "a KQL")
- Dangling modifiers
- Incorrect prepositions ("different than" → "different from")
- Plural/singular mismatches with collective nouns

### 2. Punctuation

- Missing periods at the end of full sentences
- Inconsistent use of Oxford commas (pick one style per module)
- Incorrect semicolon or colon usage
- Mismatched or missing closing parentheses/brackets
- Incorrect apostrophe usage (its vs it's, possessives)

### 3. Clarity and Readability

- Overly long sentences (flag any sentence over 40 words)
- Passive voice where active voice would be clearer
  (e.g., "The data is loaded by the pipeline" → "The pipeline loads the data")
- Ambiguous pronoun references ("it", "this", "they" without clear antecedent)
- Jargon without explanation on first use in a module
- Unnecessarily complex phrasing

### 4. Style Consistency

These rules align with the workshop's established tone (see
`.github/copilot-instructions.md`):

- **Instructional tone**: Sections should address the reader directly
  ("You will learn…" not "One will learn…" or "The student will learn…")
- **Active voice preferred**: Use passive voice only when the actor is
  unknown or irrelevant
- **Consistent list formatting**: If one bullet starts with a verb, all
  bullets in that list should start with a verb
- **Step instructions**: Should use imperative mood
  ("Click the button" not "You should click the button")
- **Heading capitalisation**: Section headings should use title case
  consistently

### 5. Technical Writing Patterns

- Numbers: Spell out one through nine, use digits for 10 and above
  (except in technical contexts like "2 GB" or "3 nodes")
- Avoid "please" in instructions (it's a workshop, not a request)
- Avoid "simply", "just", "easy" — these can frustrate learners who
  find the task difficult
- Define acronyms on first use in each module
  (e.g., "Kusto Query Language (KQL)" before using "KQL" alone)
- Avoid starting sentences with "And", "But", or "So" in formal sections
  (OK in casual/conversational activity descriptions)

### 6. Consistency Across Modules

- Terminology should be consistent (don't call it "Data Agent" in one
  module and "AI Agent" in another unless both terms are defined)
- Activity instruction style should be consistent
  (same verb tense, same level of detail in steps)
- "For Further Study" link descriptions should follow a consistent
  pattern (either all are descriptive sentences or all are just titles)

## Process

### Step 1: Extract

For each file, extract the human-readable text:
- Keep headings, paragraphs, list items, table cells, link text
- Preserve sentence boundaries for grammar analysis
- Skip URLs, code blocks, HTML attributes
- Note the file and line number for each text block

### Step 2: Analyse

Review each text block for the grammar, punctuation, clarity, style, and
consistency checks listed above. For each issue found, record:
- File path and line number
- The problematic text (in context)
- The issue category (grammar / punctuation / clarity / style / consistency)
- Severity: **Error** (clearly wrong) or **Suggestion** (could be improved)
- Recommended fix

### Step 3: Report

Present findings organised by module, then by severity:

```
Module 03 - Data Warehouse and Data Integration:
  ERROR   Line 45: Subject-verb disagreement: "The data warehouse
          provide multiple options" → "provides"
  ERROR   Line 112: Missing article: "Create Warehouse" → "Create a Warehouse"
  SUGGEST Line 78: Passive voice: "Data is ingested by the pipeline"
          → "The pipeline ingests the data"
  SUGGEST Line 156: Sentence is 52 words — consider splitting

Module 07 - Copilots & AI Skills:
  ERROR   Line 38: "What is Data Agents?" → "What are Data Agents?"
  SUGGEST Line 45: Undefined acronym "KQL" — define on first use in this module
```

Summary:
- Total text blocks analysed
- Errors vs suggestions count
- Modules with no issues
- Most common issue type

### Step 4: Fix (if requested)

Apply corrections to the source files:
- **Errors**: Fix directly (grammar mistakes, punctuation errors)
- **Suggestions**: Present to the user for approval before applying,
  since style changes may affect the author's intended voice

## Interaction with Other Skills

- Run **`/check-spelling`** first to fix typos, then run this skill —
  spelling errors can mask grammar issues.
- Run **`/check-flow`** separately — that skill checks structural elements
  (headings, numbering, icons), while this skill checks the prose quality.
