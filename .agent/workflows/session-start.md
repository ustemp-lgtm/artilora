---
description: How to start every session and maintain the project memory system
---

# Session Start Protocol

// turbo-all

## Starting a Session

1. **Read the Project Memory** at `PROJECT_MEMORY.md` (root directory) to load all context, design standards, and infrastructure state.

2. **Check the Change Log** (Section 4 of `PROJECT_MEMORY.md`) to understand recent work and avoid repeating resolved issues.

3. **Read Lessons Learned** at `.kiro/memory/LESSONS_LEARNED.md` to avoid known pitfalls and understand past mistakes.

4. **Verify Configuration** 
   - Ensure you are targeting the correct server (`192.168.72.113`)
   - Confirm SSH connectivity works via Plink

## After Every Meaningful Change

5. **Update the Change Log** in `PROJECT_MEMORY.md` Section 4 with a dated entry describing the change.

6. **If a mistake or correction occurred**, add it to `.kiro/memory/LESSONS_LEARNED.md` (Mistakes & Corrections Log).

7. **Run the Validation Protocol** before considering the task complete (ensure hot reload worked, or manually restart docker if needed).

## After File Changes

8. Restart Docker if modifying configuration files: `docker compose restart` on the remote server.
9. Remind the user to clear browser cache: `Ctrl+Shift+Delete` or use Incognito.

## Design Standards Quick Reference

- **Body line-height:** `1.4`
- **Heading font:** `'Bradley Hand ITC', cursive`
- **Body font:** `'Segoe Print', cursive`
- **Background:** `#001F3F` (dark navy blue)
- **Accent:** `#FFD700` (gold)
- **Section bg:** `#8B0000` (dark red)
- **Headlines:** Keep small and refined (`text-2xl`/`text-3xl` max)
