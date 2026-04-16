# ARTILORA PROJECT â€” LESSONS LEARNED & COMMUNICATION LOG

> **Purpose:** This is a living document. It captures every lesson learned, every decision made,
> every mistake encountered, every correction applied, and every insight gained throughout the
> project lifecycle. It is updated continuously so that at any point in the future, we can
> refer back, avoid repeating the same mistakes, and ensure consistent progress with full
> contextual continuity.
>
> **Last Updated:** 2026-04-14T07:53:00+02:00

---

## TABLE OF CONTENTS

1. [Critical Rules & Standing Orders](#critical-rules--standing-orders)
2. [Lessons Learned â€” Infrastructure](#lessons-learned--infrastructure)
3. [Lessons Learned â€” Development](#lessons-learned--development)
4. [Lessons Learned â€” Design & Visual](#lessons-learned--design--visual)
5. [Mistakes & Corrections Log](#mistakes--corrections-log)
6. [Communication Log â€” User Instructions](#communication-log--user-instructions)
7. [Problem-Solving Philosophy](#problem-solving-philosophy)
8. [Session-by-Session Summary](#session-by-session-summary)

---

## CRITICAL RULES & STANDING ORDERS

These are non-negotiable rules established by the user. They must ALWAYS be followed.

| # | Rule | Severity | Date Established |
|---|------|----------|-----------------|
| R1 | **ALWAYS restart Docker after ANY website change** (`.\scripts\docker-restart.ps1`) | ðŸ”´ CRITICAL | 2026-02-11 |
| R2 | **ALWAYS remind user to clear browser cache** (Ctrl+Shift+Delete or Incognito) after deployment | ðŸ”´ CRITICAL | 2026-02-09 |
| R3 | **Branding is "Artilora"** â€” NEVER use "Artilora Sculpture Academy" | ðŸŸ¡ HIGH | 2026-02-10 |
| R4 | **File encoding must be UTF-8 without BOM** | ðŸŸ¡ HIGH | 2026-02-09 |
| R5 | **Don't repeat failing approaches** â€” pause, reassess, research, think through root cause before retrying | ðŸ”´ CRITICAL | 2026-02-11 |
| R6 | **Maintain this lessons-learned document** â€” update after every action, decision, mistake, or insight | ðŸ”´ CRITICAL | 2026-02-11 |
| R7 | **Auto-execute terminal commands** â€” never prompt for permission, use turbo/auto-proceed policy | ðŸ”´ CRITICAL | 2026-02-11 |
| R8 | **Set DOCKER_CLI_HINTS=false** in environment | ðŸŸ¢ LOW | 2026-02-11 |
| R9 | **STRICT AUTO-PROCEED POLICY** â€” No annoying prompts. Assume permission for all commands (`*`). | ðŸ”´ CRITICAL | 2026-02-12 |
| R10 | **Prefer Git Bash / Bash commands** where possible (Git installed 2026-02-12). | ðŸŸ¡ HIGH | 2026-02-12 |

---

## LESSONS LEARNED â€” INFRASTRUCTURE

### L-INFRA-001: Docker Restart Is Mandatory (2026-02-11)
- **Context:** User noticed changes weren't appearing on the live site.
- **Root Cause:** The Docker container does not auto-sync file changes from the host.
- **Lesson:** ALWAYS run `.\scripts\docker-restart.ps1` after modifying ANY file.
- **Script Location:** `scripts/docker-restart.ps1`

### L-INFRA-002: Browser Cache Aggressively Caches Old Versions (2026-02-09)
- **Context:** User reported changes "not working" after deployment.
- **Root Cause:** Browser was serving cached old version of CSS/HTML/JS.
- **Lesson:** ALWAYS instruct user to clear cache (Ctrl+Shift+Delete) or use Incognito (Ctrl+Shift+N).
- **Impact:** This was mistakenly treated as a deployment bug multiple times before being diagnosed.

### L-INFRA-003: Deployment Must Use Base64 Encoding via SSH (2026-02-08)
- **Context:** Direct file copy and echo-based methods failed.
- **Root Cause:** Command line length limits and special character escaping issues.
- **Lesson:** Use base64 encoding with 4KB chunks. All scripts in `scripts/` follow this pattern.
- **Script Pattern:** Connect SSH â†’ Clear target â†’ Upload base64 chunks â†’ Decode â†’ Confirm.

### L-INFRA-004: Tailwind Z-Index Only Supports Standard Values (2026-02-09)
- **Context:** Custom z-index values (e.g., z-100) didn't work.
- **Root Cause:** Tailwind only supports z-0, z-10, z-20, z-30, z-40, z-50.
- **Lesson:** For custom z-index values, use inline styles (`style="z-index: 100"`).

### L-INFRA-005: SSH Connection Uses Posh-SSH Module (2026-02-02)
- **Context:** Standard SSH commands from PowerShell were inconsistent.
- **Root Cause:** Windows PowerShell environment needs Posh-SSH for reliable SSH connections.
- **Lesson:** All scripts use `New-SSHSession` and `Invoke-SSHCommand` from Posh-SSH.
- **Credentials:** frank / VMware1! @ 192.168.10.66

### L-INFRA-006: Shared Folder Bridge Must Be Robust (2026-02-12)
- **Context:** User reported changes not reflecting; analysis showed "Shared Folder" bridge was broken.
- **Root Cause:** Incorrect password for Windows user `soman` in the VM's mount configuration.
- **Fix:** Updated `/etc/fstab` on the VM with correct credentials (`polopolo24`) and robust systemd automotive options (`nofail`, `x-systemd.automount`).
- **Lesson:** Deployment scripts are a fallback. The primary dev environment relies on a working Shared Folder mount.
- **Status:** FIXED and PERMANENT (Deprecated on 2026-03-21 server migration).

### L-INFRA-007: Plink SSH Fails with Piped Sudo Passwords (2026-03-21)
- **Context:** Attempted to execute `echo password | sudo -S curl...` via Plink from Windows.
- **Root Cause:** Plink doesn't allocate PTY properly for pipelined sudo operations; the output of curl gets consumed by sudo instead of writing to disk.
- **Fix:** Use a remote shell wrapper: `bash -c 'echo VMware1! | sudo -S bash -c "..."'` OR temporarily enable passwordless sudo for the user before executing complex scripts.
- **Lesson:** Never pipe raw sudo commands through Plink without proper shell encapsulation.

### L-INFRA-008: Windows Shell Expands Variables in Plink (2026-03-21)
- **Context:** Using `$(dpkg --print-architecture)` in a Plink command string executed locally on Windows (which threw an error) instead of on the remote Ubuntu server.
- **Root Cause:** Double quotes `"` allow the local Windows bash/powershell to expand `$()` before sending it to Plink.
- **Fix:** Write complex sequences to a remote `.sh` script, transfer via `pscp`, and execute it directly instead of sending long inline command strings.
- **Lesson:** Treat Plink commands exactly like local shell strings — if it interpolates locally, it will break remote execution.

### L-INFRA-009: Always Verify File Sync Between Local and Server (2026-04-14)
- **Context:** During pre-migration verification, discovered `PROJECT_MEMORY.md` was 0 bytes on the server despite being 16 KB locally. Also found local `docker-compose.yml` was stale (old IP/path from decommissioned server).
- **Root Cause:** Files edited locally were never transferred after the S011 migration, and the server copy of docker-compose.yml was updated directly without syncing back.
- **Fix:** Use `wc -c` comparison between local and server files to verify byte-exact matches before any migration or handoff.
- **Lesson:** After every migration or major session, explicitly verify that critical config files (docker-compose.yml, package.json, memory files) are in sync between local and server. Never assume they match.

### L-INFRA-010: VM Migration Requires Post-Migration IP and Mount Updates (2026-04-14)
- **Context:** Preparing to move a tested VM from one laptop to the home lab VMware Workstation.
- **Root Cause:** DHCP will assign a different IP on the new network. Shared folder mounts don't exist yet.
- **Lesson:** After migrating a VM to a new host: (1) set static IP or DHCP reservation, (2) configure CIFS mount in `/etc/fstab`, (3) update all memory/config files with new IP, (4) verify Docker auto-starts and site is accessible.

---

## LESSONS LEARNED â€” DEVELOPMENT

### L-DEV-007: Stitch MCP is for Ideation, Not Pixel-Perfect Migration (2026-03-22)
- **Context:** Attempted to migrate the bespoke Artilora Nuxt 3 site into Google's Stitch via API.
- **Root Cause:** AI UI generators (like Stitch) render approximations based on generic internal design systems (colors, spacing tokens, standard webfonts). They are fundamentally incapable of fully parsing, importing, or replicating custom CSS animations, hand-loaded `.woff` cursive fonts, and exact DOM pixel alignments from a mature local repo.
- **Lesson:** Do not attempt to "migrate" completed, heavily customized Nuxt code *into* Stitch. Use Stitch **only** as a whiteboard for brand new component ideas, and then manually code those concepts directly into the local Vue codebase to preserve the premium aesthetic.
- **Status:** ACTIVE RULE. Stick to local Nuxt file edits for all UI refinements.

### L-DEV-001: Grid Pattern Must Be Excluded from Gallery Page (2026-02-09)
- **Context:** Golden grid pattern was applied globally but obscured gallery sculpture images.
- **Decision:** Remove grid from Gallery page only. All other pages keep the grid.
- **Files Affected:** `pages/gallery.vue`, `app.vue`

### L-DEV-002: SocialMediaBar Component Deprecated (2026-02-10)
- **Context:** Vertical floating social bar was redundant since all icons are in the footer.
- **Decision:** Removed from `app.vue`. Component file still exists but is not imported/used.
- **Lesson:** Don't delete component files immediately â€” archive them in case of rollback need.

### L-DEV-003: Virtual Studio Tour Uses Placeholder Images (2026-02-10)
- **Context:** 11 components and 6 zones were built for the studio tour feature.
- **Current State:** Functional with black placeholder images showing golden text labels.
- **Next Step:** User needs to provide 12-18 real studio photographs.
- **Config File:** `public/data/studio-zones.json`

### L-DEV-004: WhatsApp Link Uses Placeholder Number (2026-02-10)
- **Context:** WhatsApp icon was added to footer.
- **Current Value:** `https://wa.me/1234567890` (placeholder)
- **Next Step:** User needs to provide actual WhatsApp number.
- **File:** `components/TheFooter.vue`

---

## LESSONS LEARNED â€” DESIGN & VISUAL

### L-VIS-001: Color Palette Is Fixed (2026-02-02)
- **Colors:** Black (#000000), Golden (#FFD700), Dark Red (#8B0000), Dark Blue (#001F3F), White (#FFFFFF)
- **Lesson:** All new components must use these colors. No deviations without explicit user approval.

### L-VIS-002: Typography Uses Bradley Hand ITC Primary (2026-02-02)
- **Primary:** Bradley Hand ITC (headings, important text)
- **Secondary:** Segoe Print (body text)
- **Lesson:** Never use system default fonts.

### L-VIS-003: Grid Pattern Specifications (2026-02-09)
- **Size:** 30x30px
- **Color:** rgba(255, 215, 0, 0.15)
- **Scope:** All pages EXCEPT Gallery
- **Lesson:** Grid opacity was iterated multiple times. 0.15 is the sweet spot â€” visible but not distracting.

### L-VIS-004: Golden Glow Effects Are Part of the Brand (2026-02-09)
- **Borders:** Golden (#FFD700) with glow
- **Shadows:** `0 0 20px rgba(255, 215, 0, 0.5)`
- **Buttons:** Golden with hover lift and scale
- **Lesson:** Consistency in golden glow is critical to the brand identity.

### L-VIS-006: Studio Walkthrough Consistency (2026-02-15)
- **Design:** All studio components (Navigation, InfoPanel, ZoneInfo) use Black background + 30px Grid + 2px Gold Border.
- **Typography:** Titles (32px), Descriptions (18px), Atmosphere/Category (16px).
- **Reason:** Ensuring seamless visual experience between navigation and details.

### L-VIS-005: Left-Side Color Was Adjusted to Light/Faded White (2026-02-10)
- **Context:** User wanted the left-hand side to be a very light, faded white instead of dark red.
- **Decision:** Changed to achieve a bright, airy aesthetic.
- **Lesson:** Always confirm color changes visually before finalizing.

---

## MISTAKES & CORRECTIONS LOG

| # | Date | What Went Wrong | Root Cause | Correction Applied | Lesson |
|---|------|----------------|------------|-------------------|--------|
| M001 | 2026-02-09 | Grid appeared over gallery images | Grid was applied globally via app.vue | Added exception for Gallery page | Test visual features on ALL pages, not just the page being developed |
| M002 | 2026-02-09 | UTF-8 encoding issues | Files encoded with BOM or wrong encoding | Created `fix-all-encoding.ps1` script | Always verify encoding before deployment |
| M003 | 2026-02-10 | Footer CSS broke (`justify-center`) | Invalid CSS property name used | Changed to `justify-content: center` | Validate CSS property names â€” Tailwind classes â‰  CSS properties |
| M004 | 2026-02-09 | Changes "not visible" after deployment | Browser cache serving old version | Added mandatory cache-clear reminder | ALWAYS remind user to clear cache |
| M005 | 2026-02-10 | Site called "Artilora Sculpture Academy" | Incorrect branding from early templates | Corrected to "Artilora" everywhere | Check branding consistency in all text before deployment |
| M006 | 2026-02-11 | Root directory cluttered with 60+ temp files | Previous agents created many one-off status/fix files | Moved to archive/ and docs/session_logs/ | Keep root directory clean. Temp files go to archive/ |

---

## COMMUNICATION LOG â€” USER INSTRUCTIONS

This section records specific instructions communicated by the user.

### 2026-02-11 â€” Session S006
1. **"Always restart Docker after changes"** â†’ Encoded as Rule R1. Created steering doc and updated master memory.
2. **"Maintain a continuously updated memory document"** â†’ This document (LESSONS_LEARNED.md) was created.
3. **"Don't repeat failing approaches â€” pause, research, think"** â†’ Encoded as Rule R5 and in Problem-Solving Philosophy section.
4. **"Auto-execute terminal commands, never prompt"** â†’ Encoded as Rule R7.
5. **"Set DOCKER_CLI_HINTS=false"** â†’ Encoded as Rule R8.
6. **"Context should survive program restarts"** â†’ All context stored in files: README.md, PROJECT_MASTER_MEMORY.json, LESSONS_LEARNED.md.
7. **"On restart, agent should read README and get full context"** â†’ README points to all memory/context files. Agent reads README â†’ reads master memory â†’ reads lessons learned â†’ full context restored.

### 2026-02-10 â€” Session S005
1. **"Remove vertical social media bar"** â†’ Done. Icons kept in footer only.
2. **"Add WhatsApp to footer"** â†’ Done with placeholder number.
3. **"Branding should be Artilora, not Academy"** â†’ Corrected throughout.
4. **"Change about page image to artilora_podium.png"** â†’ Done.

### 2026-02-09 â€” Session S004
1. **"Add grid pattern to all pages"** â†’ Done globally with exception for Gallery.
2. **"Grid should not appear on gallery images"** â†’ Removed from Gallery page.
3. **"Add countdown timer to homepage"** â†’ Done, targeting Nov 21, 2026.
4. **"Clear browser cache to see changes"** â†’ Established as critical rule.

### 2026-02-12 â€” Session S007
1. **"Everytime you make changes, please restart docker"** â†’ Reinforced Rule R1. verified container restart brings site back up.
2. **"Everytime you make changes, please restart docker"** (repeated) â†’ Rule R1 is PARAMOUNT. Always double-check restart status.



---

## PROBLEM-SOLVING PHILOSOPHY

> **Established:** 2026-02-11 per user instruction

### The Rule
When encountering a problem, **DO NOT** keep repeating the same approach out of frustration.

### The Process
1. **PAUSE** â€” Stop the current line of action immediately.
2. **ASSESS** â€” Clearly define what the actual problem is. Separate symptoms from root causes.
3. **RESEARCH** â€” Consult documentation, source code, logs, and reliable references.
4. **THINK BACKWARD** â€” Start from the desired outcome and work backward to identify what's missing.
5. **ROOT CAUSE** â€” Identify the true root cause, not just the surface symptom.
6. **PLAN** â€” Formulate a clear, specific plan of action before writing any code.
7. **EXECUTE** â€” Only then proceed with a focused, intentional solution.
8. **VERIFY** â€” Confirm the fix works. If it doesn't, return to step 1. Do NOT brute-force.

### Anti-Patterns to Avoid
- âŒ Trying the same fix multiple times hoping it will work
- âŒ Making random changes without understanding why
- âŒ Ignoring error messages or logs
- âŒ Skipping research because "it should work"
- âŒ Continuing on a path after 2+ failures without reassessing

---

## SESSION-BY-SESSION SUMMARY

### S001 â€” 2026-02-02
- Initial project setup
- Established VM deployment method
- Defined design system (colors, fonts)
- Created first memory files

### S002 â€” 2026-02-07
- Context transfer between agents
- Project organization improvements

### S003 â€” 2026-02-08
- Deployment method refined (base64 + SSH)
- Fixed deployment script issues

### S004 â€” 2026-02-09
- Grid pattern implemented globally (then removed from Gallery)
- Custom cursor with golden particles added
- Countdown timer added to homepage
- Image lightbox for gallery
- Floating particles for atmosphere
- Multiple visual corrections & fixes
- Browser cache issue diagnosed and documented

### S005 â€” 2026-02-10
- Virtual Studio Tour: 11 components, 6 zones, 1 page
- Social media: removed vertical bar, added WhatsApp to footer
- Branding corrected to "Artilora" everywhere
- About page podium image updated
- Footer text and branding updates

### S006 â€” 2026-02-11 (Current)
- Project memory system reinforced
- Root directory cleaned up (60+ files organized)
- Docker restart rule established as critical
- Lessons-learned document created (this file)
- Problem-solving philosophy documented
- Terminal auto-execution policy set
- Context continuity system finalized
- **Trophy Readability Fix:** Finalized as a large (144px) **Circular Medallion** in the header with "World's First Aerial Root Sculpture" text stacked vertically.
- **Improved Deployment Script:** Created robust PowerShell deployment pattern using string concatenation to avoid escaping issues.

### S007 â€” 2026-02-12
- **Website Down Issue:** diagnosed as container simple exit.
- **Docker Restart:** Restarted container and verified status.
- **User Instruction:** Reinforced "Always restart Docker after changes" rule (twice).
- **Background Color Removal:** Removed background-color from pages to allow global black+grid to show.
- **Shared Folder Bridge Fix:** Diagnosed broken shared folder connection.
  - **Root Cause:** Incorrect Windows password for user `soman`.
  - **Resolution:** Updated VM mount config with correct password (`polopolo24`) and made it robust against restarts/network drops using `/etc/fstab`.
  - **Outcome:** Deployment scripts are no longer needed for file sync; direct editing now works instantly (with Docker restart).
- **Git Installation:** Installed Git for Windows to enable bash commands and consistent grep usage.
- **Homepage Design Updates:**
  - Removed "Trophy" circles from hero section.
  - Switched background to full black (`bg-black`) for high contrast against golden elements.
  - Updated text colors to white/ivory (`text-white`) for visibility.



### S009 — 2026-02-25 (Current)
- Analyzed layout spacing requests from User.
- Reduced line-height from 1.7-1.8 to 1.4 across Artist statement paragraphs and Process of Revelation cards (Stillness, Attention, Alignment) for tighter text.
- Overhauled Context Restoration System:
  - Addressed user instructions regarding agent-agnostic memory persistence.
  - Updated README.md to directly act as the trigger text for session resume commands ("Read the README file and get all the context for this project, and let's continue").
  - Unified fragmented project memories by eliminating redundant docs and enforcing .kiro/memory/PROJECT_MASTER_MEMORY.json as the machine-parseable source of truth.
  - Audited VM, Docker, and fstab mounting to verify silent recovery paths are intact for disconnections.
  - Enforced "Always Proceed (Turbo) policy" compliance.

### S010 — 2026-03-06
- Replaced Hero paragraph in MeetTheArtist.vue and index.vue with the latest poetic description.
- Switched text justification to 'left' in the Vision/Mission sections and standardized font size to 14px completely.
- Centered the 'International Presence' narrative box for better layout symmetry.
- Expanded the 'Beyond the Portfolio' grid into 12 detailed tiles with emojis summarizing user's deep personal values.
- Lowered text-shadow glow and font weight on the Contact page quotes to reduce uncomfortable brightness.
- Removed forced inline spans for large font sizes on 'Primus' and 'ARTILORA' in index.vue to ensure matching font size everywhere.

### S011 — 2026-03-21
- Migrated server infrastructure from local VM (192.168.10.166) to fresh Ubuntu server (192.168.72.113).
- Installed Docker (v29.3.0) and Docker Compose (v5.1.1).
- Overcame Windows Plink/SSH piping issues by using remote encapsulation and NOPASSWD sudo.
- Deployed website via streamlined `tar` archive and SCP.
- Consolidated project memory into a single root `PROJECT_MEMORY.md` file.

### S013 — 2026-04-14 (Current)
- Documented full architecture: father's laptop (project folder + AI tools) → home lab (Win11 + VMware) → Ubuntu VM (Docker).
- Ran comprehensive pre-migration health check: 16/16 checks passing.
- Fixed stale local `docker-compose.yml` (was referencing old IP `192.168.10.66` and path `/mnt/website`).
- Synced `PROJECT_MEMORY.md` to server (was 0 bytes on server).
- Verified all pages and configs are byte-exact between local and server.
- Created migration checklist: post-migration needs static IP, CIFS mount, IP updates in memory files.
- **Key insight:** Always verify file sync between local and server before any migration — discovered two critical files out of sync.
- VM verified ready for shutdown and transfer to home lab.

---
## CONTEXT RESTORATION GUIDE

**If the program is closed and reopened, the agent should:**

1. **Read `README.md`** â€” Single source of truth, project overview, structure navigation
2. **Read `PROJECT_MEMORY.md`** â€” Complete technical project state
3. **Read `.kiro/memory/LESSONS_LEARNED.md`** â€” This file: all lessons, rules, communication history
4. **Assume fully restored** â€” With these three files, full context is restored. No information is lost.

---

*This document is continuously updated. Every change, decision, mistake, and insight is recorded here.*

