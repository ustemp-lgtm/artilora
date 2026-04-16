# ARTILORA PROJECT — MASTER PROJECT MEMORY

> **Purpose:** Machine-parseable, continuously updated project memory that captures the complete
> lifecycle of the Artilora website project. Any agent reading this file should be able to fully
> reconstruct project context, understand all decisions, avoid past mistakes, and continue work
> seamlessly without gaps.
>
> **Last Updated:** 2026-04-16T20:35:00+02:00
> **Session:** S015 — GitHub Pages Deployment Debugging

---

## SECTION 1: PROJECT IDENTITY

| Key | Value |
|-----|-------|
| Project Name | Artilora Website |
| Type | Nuxt 3 + Tailwind CSS website |
| Purpose | Aerial root sculpture gallery and creative institution showcase |
| Branding | **"Artilora"** — NEVER use "Artilora Sculpture Academy" |
| Establishment | Est. 2026 |
| Launch Target | November 21, 2026 |
| Current Phase | Active Development |

---

## SECTION 2: INFRASTRUCTURE — CURRENT STATE

### Architecture Overview

The website is built for the user's father. The development workflow is:

```
┌──────────────────┐     SMB/CIFS      ┌───────────────────────────────┐
│  Father's Laptop │ ──────────────▶  │  Home Lab (Win11 + VMware)    │
│  (Project Folder)│   shared folder  │  ┌─────────────────────────┐  │
│  + Kiro / Anti-  │                  │  │ Ubuntu Server VM        │  │
│    Gravity for   │                  │  │  /home/frank/artilora ◀─┤──┤─ CIFS mount
│    vibe coding   │                  │  │  └─ Docker (Nuxt 3)     │  │
│                  │                  │  │     └─ artilora:3009    │  │
└──────────────────┘                  │  └─────────────────────────┘  │
                                      └───────────────────────────────┘
```

- **Father's laptop:** Only has the project folder + AI coding tools (Kiro, Antigravity). No Docker or dev tools.
- **Home lab:** Windows 11 laptop running VMware Workstation, same local network as father's laptop.
- **Ubuntu VM:** Runs inside VMware, hosts Docker containers. Project folder is mounted via CIFS shared folder.
- **Current state (2026-04-14):** VM tested on a separate laptop at 192.168.72.113. Verified stable. Ready for migration to home lab.

### Production Server (Verified 2026-04-14, pending migration to home lab)

| Key | Value |
|-----|-------|
| Server IP | **192.168.72.113** |
| OS | Ubuntu 24.04.2 LTS (Noble Numbat) |
| Kernel | 6.14.0-37-generic |
| RAM | 8 GB |
| Disk | 58 GB (49 GB free as of migration) |
| Username | frank |
| Password | VMware1! |
| SSH Access | Plink from Windows: `plink -ssh frank@192.168.72.113 -pw "VMware1!" -batch "command"` |
| Sudo | Passwordless via `/etc/sudoers.d/frank` |
| Docker | v29.3.0 |
| Docker Compose | v5.1.1 (plugin) |
| Project Path | `/home/frank/artilora` |

### Docker Container

| Key | Value |
|-----|-------|
| Container Name | artilora-nuxt-1 |
| Image | artilora-nuxt:latest |
| Base Image | node:20-alpine |
| Internal Port | 3000 |
| External Port | **3009** |
| Port Binding | 0.0.0.0:3009:3000 |
| Working Dir | /usr/src/app |
| Volume Mount | /home/frank/artilora:/usr/src/app:delegated |
| Node Modules | Named volume `artilora_node_modules` |
| Restart Policy | unless-stopped |
| Mode | Development (SSR disabled, hot reload enabled) |

### URLs

| Page | URL |
|------|-----|
| Home | http://192.168.72.113:3009/ |
| Gallery | http://192.168.72.113:3009/gallery |
| Studio Tour | http://192.168.72.113:3009/studio |
| About | http://192.168.72.113:3009/about |
| Awards | http://192.168.72.113:3009/awards |
| Contact | http://192.168.72.113:3009/contact |

### Previous Infrastructure (DECOMMISSIONED)

| Key | Value |
|-----|-------|
| Old Server IP | 192.168.10.66 |
| Old Container | website-nuxt-1 |
| Reason Decommissioned | PC migration — project moved to new server |
| Deployment Method (old) | Base64 encoding via SSH in 4KB chunks using Posh-SSH |

### SSH via Plink — Known Behaviors

| Issue | Solution |
|-------|----------|
| Host key not cached | Accept with `echo y \| plink ...` or interactive acceptance |
| `sudo -S` via Plink hangs | Plink doesn't handle piped sudo well; use passwordless sudo or write a remote script |
| Shell expansion on Windows | Wrap commands in `bash -c '...'` to ensure they execute on the remote server, not locally |
| `$()` in Plink commands | Use single quotes or remote scripts to prevent local Windows shell expansion |
| Docker group membership | Use `sg docker -c 'command'` if new login shell not available |

---

## SECTION 3: TECHNOLOGY STACK

| Layer | Technology |
|-------|-----------|
| Framework | Nuxt 3 (v3.21.1) |
| Runtime | Node.js 20 (Alpine) |
| Build Tool | Vite 7.3.1 |
| UI Framework | Vue 3.5.28 |
| Styling | Tailwind CSS v6.12.1 |
| Server Engine | Nitro 2.13.1 |
| Containerization | Docker + Docker Compose |
| SSR | Enabled (`ssr: true` in nuxt.config.ts) |
| Hot Reload | Enabled via Vite polling (1s interval) |

---

## SECTION 4: CHANGE LOG

### 2026-04-16 — S015: GitHub Pages Deployment Failure Triage (In Progress)

**Context:** The source code is now on GitHub (`ustemp-lgtm/artilora`) and the deployment workflow is triggering, but the build has been failing in sequence at different stages. This session is focused on iterative remediation with strict repository isolation.

**Execution Scope Lock:**
- Operate only inside `artilora` repository.
- No navigation to or interaction with any other repository.

**Live Procedure Log (for interruption-safe handoff):**
1. **Observation:** Run `24523608437` failed at `Install dependencies` due to missing `@oxc-minify/binding-linux-x64-gnu`.
   - **Hypothesis:** npm optional dependency resolution bug on GitHub runner.
   - **Procedure:** Changed workflow install command from `npm ci` to `npm install --include=optional`.
   - **Outcome:** Failure persisted.

2. **Observation:** Install step still unstable with optional native modules missing.
   - **Hypothesis:** postinstall timing and npm optional dependency behavior are non-deterministic.
   - **Procedure:** Changed workflow to:
     - `npm install --include=optional --ignore-scripts`
     - explicit native installs
     - `npx nuxt prepare`
   - **Outcome:** Install stage progressed but alternated missing native packages.

3. **Observation:** Separate `--no-save` native installs caused one package to disappear after the second install.
   - **Hypothesis:** subsequent install prunes or rewrites temporary state.
   - **Procedure:** Install both native packages in one command:
     - `npm install --no-save @oxc-minify/binding-linux-x64-gnu@0.112.0 @rollup/rollup-linux-x64-gnu@4.57.1`
   - **Outcome:** `Install dependencies` step reached success in run `24526997904`.

4. **Observation:** Build then failed at `Generate static site` with unresolved import:
   - `Rollup failed to resolve import "/artilora_name.png" from pages/about.vue`
   - **Hypothesis:** Linux case-sensitivity mismatch between import path and actual file (`public/Artilora_name.png`).
   - **Procedure:** Updated `pages/about.vue` image source to `/Artilora_name.png`.
   - **Outcome:** Local patch applied. Pending commit/push/rerun verification at time of this log snapshot.

**Commits Applied During S015:**
- `5cad639` — `fix: resolve oxc-minify native binding for GitHub Actions`
- `fc2f861` — `fix: make CI install deterministic for oxc binding`
- `7747c33` — `fix: install rollup linux native binding in CI`
- `179a5ac` — `fix: install linux native bindings in one npm command`

**Current Status:** In-progress iterative deployment debugging. Dependency installation issue is mitigated; current focus is static generation path correctness and successful completion of build+deploy jobs.

### 2026-04-16 — S014: GitHub Pages Migration & SSG Setup

**Context:** Migrating the Artilora website from the local Ubuntu VM docker environment to a public production environment hosted on GitHub Pages (using custom domain `artilora.art`). Completely replacing the old legacy standard HTML website.

**Thought Process & Strategy:**
- **Rendering Strategy:** The codebase was setup as SPA (`ssr: false`). For an art portfolio, SEO and initial load speed is critical. We are switching to SSG (`ssr: true`) and utilizing Nitro's `github-pages` preset.
- **Deployment Strategy:** To keep the repository clean from compiled build artifacts (`.html` files mixed in the root), we developed a Continuous Deployment pipeline using GitHub Actions (`actions/deploy-pages@v4`) triggered on `main` branch pushes.
- **Custom Domain Preservation:** Because we are force-pushing and wiping the old repo structure, we generated a `public/CNAME` file so Nuxt automatically bundles it, ensuring `artilora.art` routing doesn't break.
- **Procedural Steps:** Initialize local Git -> add `ustemp-lgtm/artilora` remote -> run a force push (`git push -u origin main -f`) to definitively establish this Nuxt build as the new source of truth.

**Critical Execution Constraints (Enforced this session):**
- **REPOSITORY ISOLATION:** Operational scope is STRICTLY locked to the `artilora` repository. Absolutely no reading, auditing, modifying, or pushing to `artilora-academy`, `portfolio`, `landing-page-template`, or `ecommerce-backend`.

**Current Status:** Pre-migration configurations are applied. The `git push` command is currently blocked, awaiting the user to authenticate GitHub credentials in their browser.

### 2026-04-14 — S013: Pre-Migration Verification & VM Transfer Prep

**Context:** Comprehensive health check of the Ubuntu VM (192.168.72.113) before shutting it down and migrating it to the home lab. The VM was built on a separate test laptop and needs to be transferred to VMware Workstation on the home lab's Windows 11 machine.

**Architecture Documented:**
- Father's laptop has only the project folder + AI coding tools (Kiro, Antigravity)
- Home lab (Win11 + VMware) runs the Ubuntu VM with Docker
- Project folder shared via CIFS mount between father's laptop and the VM
- Father uses vibe coding (prompt-based) to make changes; AI tools edit files directly in the shared folder

**Health Check Results (16/16 passing):**
1. Ubuntu 24.04 LTS, Docker 29.3.0, Compose 5.1.1 — all operational
2. Container `artilora-nuxt-1` running, restart policy `unless-stopped`
3. All 6 routes returning HTTP 200 (/, /gallery, /about, /studio, /awards, /contact)
4. All files byte-exact match between local and server (pages, configs)
5. Disk: 46 GB free, RAM: 6.9 GB available
6. Passwordless sudo configured
7. Docker auto-starts on boot

**Fixes Applied:**
1. Fixed local `docker-compose.yml` — was stale (old IP `192.168.10.66`, old path `/mnt/website`), now matches server
2. Synced `PROJECT_MEMORY.md` to server — was 0 bytes on server, now 16 KB
3. Synced updated `docker-compose.yml` to server

**Post-Migration Checklist:**
1. Boot VM on home lab VMware Workstation
2. Set static IP or DHCP reservation on home lab router
3. Configure CIFS mount in `/etc/fstab` → father's laptop project folder → `/home/frank/artilora`
4. Update IP in all memory files (README.md, PROJECT_MEMORY.md, LESSONS_LEARNED.md)
5. Verify `docker compose up -d` and HTTP 200 on new IP
6. Test shared folder write from father's laptop → verify hot reload in container

**Result:** ✅ VM verified migration-ready. All checks passing. Ready for shutdown and transfer.

### 2026-03-21 — S011: Server Migration

**Context:** Migrated from old PC (192.168.10.66) to fresh Ubuntu server (192.168.72.113).

**Actions Taken:**
1. Connected to fresh Ubuntu 24.04 server via Plink SSH
2. Installed prerequisites (ca-certificates, curl, gnupg, rsync, git)
3. Installed Docker CE v29.3.0 and Docker Compose Plugin v5.1.1
4. Enabled passwordless sudo for frank (`/etc/sudoers.d/frank`)
5. Created deployment archive (~123MB) excluding node_modules, .nuxt, build artifacts, archive/, docs/, logs/
6. Transferred archive via PSCP at ~62MB/s
7. Updated docker-compose.yml:
   - Changed volume mount: `/mnt/website` → `/home/frank/artilora`
   - Changed port binding: `192.168.10.66:3009:3000` → `0.0.0.0:3009:3000`
8. Built Docker image (node:20-alpine base, npm install, nuxt prepare)
9. Started container — site accessible at http://192.168.72.113:3009
10. Verified HTTP 200 and full visual rendering in browser

**Issues Encountered:**
- Plink SSH host key acceptance required interactive `echo y |` approach
- `echo password | sudo -S` via Plink hangs — stdin piping conflict
- Solved by enabling temporary NOPASSWD sudo via remote script (`bash -c 'echo VMware1! | sudo -S bash -c "..."'`)
- Docker repo GPG key downloaded as 0 bytes when curl piped through sudo — solved by using NOPASSWD sudo
- Shell variable expansion (`$(dpkg --print-architecture)`) executed locally on Windows instead of remote — solved by using remote scripts

**Result:** ✅ Site fully operational at http://192.168.72.113:3009

### 2026-03-22 — S012: Stitch MCP Integration & UI Experiment

**Context:** Attempted to migrate existing Nuxt components into Google's Stitch UI tool via the StitchMCP integration.

**Actions Taken:**
1. Installed Node.js & npx on the host machine to resolve StitchMCP initialization errors.
2. Created a new Stitch project "Artilora Website".
3. Prompted the Stitch AI to generate "Walk Through The Gallery", "Virtual Studio Tour", and "Homepage" using our project's aesthetic rules ("Artilora Ethereal").
4. Used an automated browser subagent to visually compare the local Nuxt app against the generated Stitch rendering.

**Issues Encountered:**
- Stitch generated generic layout blocks and standard fonts instead of matching our hand-coded precision (`Bradley Hand ITC`, exact CSS glows, particle overlays).
- Stitch is an ideation and layout wireframing tool; it cannot perfectly import or clone highly customized DOM trees with unique CSS from a local server.

**Result:** 🔴 Migration aborted. Decision made to strictly maintain pixel-level UI control by editing Nuxt/CSS files directly in the codebase rather than trying to port finished designs into a conceptual wireframing tool.

### 2026-03-06 — S010: Aesthetic Refinements

- Replaced Hero paragraph in MeetTheArtist.vue and index.vue with latest poetic description
- Switched text justification to left in Vision/Mission sections, standardized font size to 14px
- Expanded "Beyond the Portfolio" grid into 12 detailed tiles with emojis
- Lowered text-shadow glow and font weight on Contact page quotes
- Removed forced large font sizes on 'Primus' and 'ARTILORA' in index.vue

### 2026-02-25 — S009: Memory Standardization

- Unified fragmented project logs into single `.kiro` memory state
- Reduced line-height from 1.7-1.8 to 1.4 across paragraphs
- Updated README as session resume trigger
- Audited VM/Docker/fstab mounting

### 2026-02-12 — S007: Infrastructure Fixes

- Shared Folder Bridge fixed (wrong password for Windows user `soman`)
- Git installed for consistent bash usage
- Docker restart rules reinforced
- Homepage design updates (removed trophies, black background)

### 2026-02-11 — S006: Memory System Established

- Project memory system created
- Root directory cleaned (60+ files organized)
- Docker restart rule established as critical
- Problem-solving philosophy documented
- Terminal auto-execution policy set

### 2026-02-10 — S005: Virtual Studio Tour

- 11 components, 6 zones, 1 page built
- Social media bar removed, WhatsApp added to footer
- Branding corrected to "Artilora"

### 2026-02-09 — S004: Visual Features

- Grid pattern (30x30px golden, 0.15 opacity) implemented globally, removed from Gallery
- Custom cursor with golden particles
- Countdown timer (Nov 21, 2026)
- Image lightbox, floating particles, page transitions

### 2026-02-08 — S003: Deployment Refinement

- Base64 + SSH deployment method established

### 2026-02-07 — S002: Context Transfer

- Project organization between agents

### 2026-02-02 — S001: Project Creation

- Initial setup, VM deployment, design system defined

---

## SECTION 5: DESIGN SYSTEM

### Colors
```
Primary Black:   #000000
Golden:          #FFD700
Dark Red:        #8B0000
Dark Blue/Navy:  #001F3F
White:           #FFFFFF
```

### Typography
- **Primary Font:** Bradley Hand ITC (headings, important text)
- **Secondary Font:** Segoe Print (body text)
- **Google Fonts loaded:** Comfortaa, Cinzel, Quicksand, Playfair Display, Dancing Script, Poiret One, Josefin Sans, Cormorant Garamond
- **Body line-height:** 1.4
- **Headlines:** Keep small and refined (text-2xl/text-3xl max)

### Visual Elements
- **Grid Pattern:** 30x30px, rgba(255, 215, 0, 0.15), all pages except Gallery
- **Golden Glow:** `0 0 20px rgba(255, 215, 0, 0.5)` for borders and shadows
- **Animations:** Fade/slide page transitions (0.5s ease-in-out)
- **Particles:** Golden floating particles, slow speed, 30 count

---

## SECTION 6: FEATURE INVENTORY

| ID | Feature | Status | Key Files |
|----|---------|--------|-----------|
| F001 | Grid Pattern Background | ✅ Active | app.vue |
| F002 | Custom Cursor + Particles | ✅ Active | CustomCursor.vue, app.vue |
| F003 | Countdown Timer | ✅ Active | CountdownTimer.vue, index.vue |
| F004 | Social Media (Footer) | ✅ Active | TheFooter.vue |
| F005 | Virtual Studio Tour | ✅ Functional (placeholder images) | 11 components, studio.vue, studio-zones.json |
| F006 | Image Lightbox | ✅ Active | ImageLightbox.vue |
| F007 | Floating Particles | ✅ Active | FloatingParticles.vue, app.vue |
| F008 | Page Transitions | ✅ Active | app.vue, PageTransition.vue |
| F009 | Preloader | ✅ Active | ThePreloader.vue |
| F010 | Responsive Navigation | ✅ Active | TheHeader.vue |
| F011 | AI Art Consultant Chat | ✅ Active | AIArtConsultant.vue |
| F_DEP001 | Vertical Social Bar | ❌ Removed (2026-02-10) | SocialMediaBar.vue (unused) |

---

## SECTION 7: KNOWN ISSUES & PENDING ACTIONS

### Active Issues
- Google Analytics Measurement ID is placeholder `G-XXXXXXXXXX`
- Video/audio elements may show `NotSupportedError` in some browsers

### Pending User Actions
1. **Studio Tour Images** (Priority: MEDIUM) — User needs to provide 12-18 real studio photos
2. **WhatsApp Link** (Priority: LOW) — Update placeholder `https://wa.me/1234567890` in TheFooter.vue
3. **Google Analytics** (Priority: LOW) — Configure real Measurement ID

### Project Cleanup Needed
- Large image files in root directory (artilora_logo_11.png, artilora_name.png, arty_twins.PNG, podium.png, primus.png, primus_video.mp4)
- Many duplicate/variant images in public/ directory
- .b64 files in public/ (podium.png.b64, arty_name_dr.png.b64)
- temp*.txt files in root
- PowerShell scripts (check-logs*.ps1, fix-server.ps1) may be obsolete with new server
- Old deployment scripts in scripts/ designed for Posh-SSH may need updating

---

## SECTION 8: FILE STRUCTURE

```
artilora-website/
├── README.md                    # Top-level orientation — START HERE
├── PROJECT_MEMORY.md            # THIS FILE — Complete project lifecycle
├── app.vue                      # Root application component
├── nuxt.config.ts               # Nuxt configuration (SSR off, Vite polling)
├── package.json                 # Dependencies (nuxt ^3.13, vue ^3.4)
├── Dockerfile                   # node:20-alpine build
├── docker-compose.yml           # Container orchestration
├── tailwind.config.js           # Tailwind CSS configuration
│
├── components/                  # 37 Vue components
│   ├── TheHeader.vue            # Navigation
│   ├── TheFooter.vue            # Footer + social icons
│   ├── ThePreloader.vue         # Loading screen
│   ├── AIArtConsultant.vue      # Chat interface
│   ├── Studio*.vue (11 files)   # Virtual Studio Tour
│   └── [other components]
│
├── pages/                       # Route pages
│   ├── index.vue                # Home
│   ├── gallery.vue              # Sculpture gallery
│   ├── about.vue                # About Artilora
│   ├── studio.vue               # Virtual Studio Tour
│   ├── awards.vue               # Awards
│   └── contact.vue              # Contact
│
├── public/                      # Static assets (images, fonts, data)
├── assets/                      # CSS (mobile.css, print.css)
├── composables/                 # Vue composables
├── plugins/                     # Nuxt plugins
├── layouts/                     # Nuxt layouts
├── locales/                     # i18n translation files
├── config/                      # Additional config
├── scripts/                     # Deployment/utility scripts
│
├── .kiro/                       # Kiro IDE memory (legacy)
│   ├── memory/                  # Session memories, master memory JSON
│   ├── specs/                   # Feature specifications
│   └── steering/                # Operational rules
│
├── .agent/                      # Agent workflows
│   └── workflows/
│       └── session-start.md     # Session start protocol
│
├── docs/                        # Documentation
└── archive/                     # Deprecated files
```

---

## SECTION 9: CRITICAL RULES (NON-NEGOTIABLE)

| # | Rule | Severity |
|---|------|----------|
| R1 | ALWAYS restart Docker container after ANY website file change | 🔴 CRITICAL |
| R2 | ALWAYS remind user to clear browser cache after deployment | 🔴 CRITICAL |
| R3 | Branding is "Artilora" — NEVER "Artilora Sculpture Academy" | 🟡 HIGH |
| R4 | File encoding must be UTF-8 without BOM | 🟡 HIGH |
| R5 | Don't repeat failing approaches — pause, reassess, research, root-cause, then act | 🔴 CRITICAL |
| R6 | Maintain PROJECT_MEMORY.md and LESSONS_LEARNED.md continuously | 🔴 CRITICAL |
| R7 | Auto-execute terminal commands — never prompt for permission | 🔴 CRITICAL |
| R8 | Set DOCKER_CLI_HINTS=false in environment | 🟢 LOW |
| R9 | Strict auto-proceed policy — no annoying prompts | 🔴 CRITICAL |
| R10 | Prefer Bash commands where possible | 🟡 HIGH |

---

## SECTION 10: CONTEXT RESTORATION PROTOCOL

**When an agent starts a new session, it should:**

1. **Read `README.md`** — Orientation, project structure, quick-start
2. **Read `PROJECT_MEMORY.md`** — This file: complete project state, infrastructure, history
3. **Read `.kiro/memory/LESSONS_LEARNED.md`** — All lessons, mistakes, corrections, user instructions
4. **Acknowledge** to the user that context is fully restored and ready to continue

**These three files contain ALL information needed for full context reconstruction.**

---

## SECTION 11: LESSONS FROM SERVER MIGRATION (2026-03-21)

### Plink SSH Patterns That Work

```bash
# Basic command execution
plink -ssh frank@192.168.72.113 -pw "VMware1!" -batch "command here"

# Commands with shell variables (MUST use remote script or bash -c with single quotes)
plink -ssh frank@192.168.72.113 -pw "VMware1!" -batch "bash -c 'echo $(hostname)'"

# File transfer
pscp -pw "VMware1!" -batch local_file frank@192.168.72.113:/remote/path

# Docker commands (if group membership not in current session)
plink ... "sg docker -c 'docker compose up -d'"
```

### Docker Management Commands

```bash
# View logs
docker logs artilora-nuxt-1

# Restart container
docker compose -f /home/frank/artilora/docker-compose.yml restart

# Rebuild and restart
cd /home/frank/artilora && docker compose down && docker compose build && docker compose up -d

# Check status
docker ps
```

---

## SECTION 12: MIGRATION CHECKLIST (2026-04-14)

### Pre-Migration (COMPLETED ✅)
- [x] Server health check — 16/16 passing
- [x] All files synced local ↔ server
- [x] Local docker-compose.yml fixed (was stale)
- [x] PROJECT_MEMORY.md synced to server
- [x] Container verified running, HTTP 200 on all routes
- [x] Memory files updated with full context

### Post-Migration (TODO)
- [ ] Transfer VM files to home lab VMware Workstation
- [ ] Boot VM and verify it starts cleanly
- [ ] Assign static IP or DHCP reservation
- [ ] Configure CIFS shared folder mount in `/etc/fstab`
- [ ] Update IP address in: README.md, PROJECT_MEMORY.md, LESSONS_LEARNED.md, session-start.md
- [ ] Verify Docker container auto-starts and site serves HTTP 200
- [ ] Test end-to-end: edit file on father's laptop → hot reload in browser

---

*This document is the authoritative, continuously updated project memory. Updated after every session.*
