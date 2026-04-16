# Artilora Website - Project Documentation

**Single Source of Truth for Project Context and Navigation**

---

## Project Overview

**Name:** Artilora Website  
**Purpose:** Nuxt 3 website for Artilora - aerial root sculpture gallery and creative institution  
**Establishment:** Est. 2026  
**Status:** Active Development  
**Current Version:** Live on Ubuntu server at http://192.168.72.113:3009

### What is Artilora?

Artilora is an emerging creative institution dedicated to aerial root sculpture. The website showcases sculptures, provides information about the artist and creative process, and offers a virtual tour of the studio where these unique artworks are created.

**CRITICAL BRANDING NOTE:** The name is "Artilora" (NOT "Artilora Sculpture Academy"). This has been corrected throughout the site.

---

## Quick Start for New Agents

If you're a new AI agent taking over this project, follow these steps:

### 1. Read This README (You're doing it!)

**When the user says:** *"Read the README file and get all the context for this project, and let's continue."*
**Your Immediate Action:** Read PROJECT_MEMORY.md to perfectly reconstruct the project context, align your understanding, and seamlessly resume work without making assumptions or asking redundant questions.

### 2. Read the Project Memory
**File:** `PROJECT_MEMORY.md`  
**Purpose:** Complete project lifecycle documentation in machine-parseable format  
**Contains:** All decisions, implementations, issues, context, infrastructure details, and operational procedures  
**Last Updated:** 2026-04-14

### 3. You're Ready to Continue
With PROJECT_MEMORY.md processed, your context is fully restored. Acknowledge to the user that you have parsed the memory and are ready to pick up exactly where they left off.

---

## Project Structure

```
artilora-website/
├── README.md                          # THIS FILE - Single source of truth
├── app.vue                            # Root application component
├── app.config.ts                      # Application configuration
├── nuxt.config.ts                     # Nuxt framework configuration
│
├── .kiro/                             # Kiro IDE configuration (legacy)
│   ├── memory/                        # Historical session memories
│   │   ├── PROJECT_MASTER_MEMORY.json # Complete project history (CRITICAL)
│   │   ├── SESSION_2026-02-10_*.json  # Latest session memory
│   │   └── [older session files]      # Historical sessions
│   ├── specs/                         # Feature specifications
│   │   ├── virtual-studio-tour/       # Studio tour spec
│   │   └── artilora-2026-enhancements/# 2026 enhancements spec
│   └── steering/                      # Project guidelines
│
├── components/                        # Vue components
│   ├── TheHeader.vue                  # Navigation header
│   ├── TheFooter.vue                  # Footer with social icons
│   ├── CustomCursor.vue               # Golden particle cursor
│   ├── CountdownTimer.vue             # Launch countdown
│   ├── VirtualStudioTour.vue          # Studio tour main component
│   └── [other components]             # See component inventory below
│
├── pages/                             # Nuxt pages (routes)
│   ├── index.vue                      # Home page
│   ├── gallery.vue                    # Sculpture gallery
│   ├── studio.vue                     # Virtual studio tour
│   ├── about.vue                      # About Artilora
│   ├── awards.vue                     # Awards and recognition
│   └── contact.vue                    # Contact form
│
├── public/                            # Static assets
│   ├── studio/                        # Studio tour images (placeholder)
│   ├── data/                          # JSON data files
│   │   └── studio-zones.json          # Studio tour configuration
│   └── [images]                       # Site images
│
├── scripts/                           # PowerShell deployment scripts
│   ├── deploy-studio-tour.ps1         # Deploy studio tour
│   ├── remove-social-bar-add-whatsapp.ps1
│   ├── update-footer-text.ps1
│   └── [other scripts]                # See deployment section
│
├── docs/                              # Project documentation
│   ├── session_logs/                  # Historical session summaries
│   ├── specs/                         # Detailed feature specifications
│   └── [various .md files]            # Guides and references
│
└── archive/                           # Deprecated files
    └── [old files]                    # Historical content
```

---

## Infrastructure & Deployment

### VM Configuration

**Access Details:**
- **IP Address:** 192.168.72.113
- **Username:** frank
- **Password:** VMware1!
- **OS:** Ubuntu 24.04.2 LTS
- **Access Method:** Plink SSH from Windows (`plink -ssh frank@192.168.72.113 -pw "VMware1!" -batch "command"`)
- **File Transfer:** PSCP (`pscp -pw "VMware1!" -batch local_file frank@192.168.72.113:/remote/path`)
- **Sudo:** Passwordless via `/etc/sudoers.d/frank`

### Docker Container

**Container Details:**
- **Name:** artilora-nuxt-1
- **Type:** Docker (v29.3.0) + Docker Compose (v5.1.1)
- **Project Path (server):** `/home/frank/artilora`
- **Working Directory:** `/usr/src/app/`
- **Port:** 0.0.0.0:3009:3000
- **Mode:** Development
- **SSR:** Disabled
- **Hot Reload:** Enabled (Vite polling, 1s interval)
- **Restart Policy:** unless-stopped

### URLs

- **Production:** http://192.168.72.113:3009
- **Home:** http://192.168.72.113:3009/
- **Gallery:** http://192.168.72.113:3009/gallery
- **Studio Tour:** http://192.168.72.113:3009/studio
- **About:** http://192.168.72.113:3009/about
- **Awards:** http://192.168.72.113:3009/awards
- **Contact:** http://192.168.72.113:3009/contact

### Deployment Method

**Current Method (2026-03-21+):** Direct file editing on server via Plink SSH + volume mount

**Standard Flow:**
1. Edit files locally in `d:\Docus\Projct\Arti`
2. Transfer via PSCP: `pscp -pw "VMware1!" -batch local_file frank@192.168.72.113:/home/frank/artilora/path`
3. Container auto-detects changes via volume mount + Vite hot reload
4. For major changes: `docker compose restart` on the server

**Legacy Method:** Base64 encoding via Posh-SSH in 4KB chunks (see `scripts/` directory — may be obsolete)

---

## Checkpoint System

### Overview

The project uses a numbered checkpoint system to track changes and enable easy rollback to any previous state.

### Creating a Checkpoint

```powershell
.\scripts\create-checkpoint.ps1 -Description "Your description here"
```

**Example:**
```powershell
.\scripts\create-checkpoint.ps1 -Description "Homepage redesign complete"
```

This creates a numbered checkpoint (e.g., Checkpoint 1, Checkpoint 2, etc.) with a complete snapshot of:
- All components
- All pages
- All public assets
- Configuration files
- Kiro memory files

### Listing Checkpoints

```powershell
.\scripts\list-checkpoints.ps1
```

Shows all available checkpoints with their numbers, descriptions, and timestamps.

### Restoring a Checkpoint

```powershell
.\scripts\restore-checkpoint.ps1 -Number X
```

**Example:**
```powershell
.\scripts\restore-checkpoint.ps1 -Number 4
```

This will:
1. Create an automatic backup of the current state
2. Restore all files to the state at Checkpoint 4
3. Remind you to restart Docker and clear browser cache

### Checkpoint Storage

**Location:** `.checkpoints/` directory  
**Registry:** `.checkpoints/checkpoint-registry.json`  
**Format:** Each checkpoint is a complete copy of the project state

### Best Practices

1. **Create checkpoints before major changes**
2. **Use descriptive names** (e.g., "Gallery layout finalized", "Voice narration added")
3. **Create checkpoints after completing features**
4. **Create checkpoints before experimental changes**

### Current Checkpoints

See `.checkpoints/checkpoint-registry.json` or run `.\scripts\list-checkpoints.ps1`

---

## CRITICAL OPERATIONAL KNOWLEDGE

### Browser Cache Issue ⚠️

**SEVERITY:** CRITICAL  
**IMPACT:** Changes appear not to work

**Problem:** User's browser heavily caches old versions of the site.

**Solution:** User MUST clear cache (Ctrl+Shift+Delete) OR use Incognito mode (Ctrl+Shift+N) after EVERY deployment.

**Validation:** Container hot reload is working correctly. The issue is browser-side only.

**Always Remind User:** Include cache clearing instructions in every deployment confirmation.

### File Encoding

**Required:** UTF-8 without BOM  
**Why:** Prevents display issues and character corruption  
**Validation:** Check encoding before deployment

### Known Limitations

1. **Tailwind Z-Index:** Only supports z-0, z-10, z-20, z-30, z-40, z-50. Custom values require inline styles.
2. **Image Formats:** WebP preferred with JPEG fallback for compatibility.
3. **Deployment Speed:** Large files take time due to 4KB chunking.

---

## Design System

### Color Palette

```
Primary Black:  #000000
Golden:         #FFD700
Dark Red:       #8B0000
Dark Blue:      #001F3F
White:          #FFFFFF
```

### Typography

**Primary Font:** Bradley Hand ITC  
**Secondary Font:** Segoe Print  
**Usage:** Bradley Hand ITC for all headings and important text

### Visual Elements

**Grid Pattern:**
- Size: 30x30px
- Color: rgba(255, 215, 0, 0.15)
- Global: Yes
- Exception: Gallery page (removed to show sculptures clearly)

**Animations:**
- Page transitions: Fade and slide (0.5s ease-in-out)
- Hover effects: Scale and glow
- Particle effects: Golden particles, slow speed, 30 count

**Component Patterns:**
- Borders: Golden (#FFD700) with glow effects
- Backgrounds: Black or dark red gradients
- Shadows: Golden glow (0 0 20px rgba(255, 215, 0, 0.5))
- Buttons: Golden with hover lift and scale

---

## Feature Inventory

### Active Features

1. **Grid Pattern Background** (F001)
   - 30x30px golden grid across all pages except Gallery
   - Files: `app.vue`

2. **Custom Cursor with Particles** (F002)
   - Golden particle trail effect (desktop only)
   - Files: `components/CustomCursor.vue`, `app.vue`

3. **Countdown Timer** (F003)
   - Live countdown to November 21, 2026 launch
   - Files: `components/CountdownTimer.vue`, `pages/index.vue`

4. **Social Media Integration** (F004)
   - Footer icons: Facebook, Instagram, Twitter, LinkedIn, YouTube, WhatsApp
   - Files: `components/TheFooter.vue`
   - Note: WhatsApp link needs user's actual number

5. **Virtual Studio Tour** (F005) ⭐ MAJOR FEATURE
   - Interactive photo gallery of 6 studio zones with hotspots
   - 11 components, 1 page, JSON configuration
   - URL: `/studio`
   - Status: Functional with placeholder images
   - Files: See component list below

6. **Image Lightbox** (F006)
   - Full-screen image viewer for gallery
   - Files: `components/ImageLightbox.vue`

7. **Floating Particles** (F007)
   - Ambient golden particles for atmosphere
   - Files: `components/FloatingParticles.vue`, `app.vue`

8. **Page Transitions** (F008)
   - Smooth fade and slide between pages
   - Files: `app.vue`, `components/PageTransition.vue`

9. **Preloader** (F009)
   - Loading screen with Artilora branding
   - Files: `components/ThePreloader.vue`

10. **Responsive Navigation** (F010)
    - Desktop and mobile navigation
    - Files: `components/TheHeader.vue`

### Deprecated Features

1. **Vertical Social Media Bar** (F_DEP001)
   - Status: REMOVED (2026-02-10)
   - Reason: Redundant - all icons in footer
   - Component still exists but not used

---

## Component Inventory

### Layout Components
- `TheHeader.vue` - Navigation header
- `TheFooter.vue` - Footer with social icons
- `ThePreloader.vue` - Loading screen

### Interactive Components
- `CustomCursor.vue` - Golden particle cursor
- `CountdownTimer.vue` - Launch countdown
- `ImageLightbox.vue` - Full-screen image viewer
- `FloatingParticles.vue` - Ambient particles

### Studio Tour Components (11 total)
- `VirtualStudioTour.vue` - Main tour component
- `StudioZoneViewer.vue` - Zone display
- `StudioImage.vue` - Image with hotspots
- `StudioHotspot.vue` - Interactive markers
- `StudioZoneInfo.vue` - Zone description
- `StudioNavigation.vue` - Navigation wrapper
- `StudioZoneSelector.vue` - Thumbnail navigation
- `StudioProgress.vue` - Progress indicator
- `StudioInfoPanel.vue` - Hotspot modal
- `StudioHero.vue` - Entry banner
- `StudioCTA.vue` - Call-to-action

### Utility Components
- `PageTransition.vue` - Page transitions
- `ScrollReveal.vue` - Scroll animations
- `SectionReveal.vue` - Section animations
- `LoadingBar.vue` - Loading indicator
- `SocialMediaBar.vue` - DEPRECATED (not used)

---

## Content Structure

### Pages

1. **Home** (`pages/index.vue`)
   - Sections: Hero, Brand Essence, Countdown Timer, Featured Preview, CTA
   - Status: COMPLETE

2. **Gallery** (`pages/gallery.vue`)
   - Content: Sculptures and photographs
   - Grid Pattern: NO (removed for clarity)
   - Status: COMPLETE

3. **Studio Tour** (`pages/studio.vue`)
   - Zones: 6 (Workshop, Inspiration, Materials, Gallery, Desk, Sacred)
   - Content: Placeholder images
   - Status: FUNCTIONAL - NEEDS REAL CONTENT

4. **About** (`pages/about.vue`)
   - Branding: "Artilora" (updated)
   - Image: artilora_podium.png
   - Status: COMPLETE

5. **Awards** (`pages/awards.vue`)
   - Status: COMPLETE

6. **Contact** (`pages/contact.vue`)
   - Status: COMPLETE

### Studio Tour Zones

**Configuration:** `public/data/studio-zones.json`

**Zones:**
1. **The Workshop** - Where sculptures are physically created
2. **The Inspiration Corner** - Sketches, mood boards, reference materials
3. **The Material Storage** - Aerial roots, tools, supplies
4. **The Display Gallery** - Finished and in-progress works
5. **The Artist's Desk** - Design space, planning area
6. **The Sacred Space** - Meditation/reflection area

**Hotspots:** 8-12 interactive golden markers across all zones

**Images:** Currently using placeholder images (black backgrounds with golden text)

---

## Deployment Scripts

### Active Scripts

All scripts are PowerShell using Posh-SSH module.

1. **deploy-studio-tour.ps1**
   - Purpose: Deploy Virtual Studio Tour components and configuration
   - Uploads: 11 components, 1 page, JSON config, placeholder images

2. **remove-social-bar-add-whatsapp.ps1**
   - Purpose: Remove vertical social bar, add WhatsApp to footer
   - Uploads: app.vue, TheFooter.vue

3. **update-footer-text.ps1**
   - Purpose: Update footer branding text
   - Uploads: TheFooter.vue

4. **upload-new-podium-image.ps1**
   - Purpose: Upload updated podium image for About page
   - Uploads: artilora_podium.png

5. **update-about-page-name.ps1**
   - Purpose: Update About page branding
   - Uploads: about.vue

### Script Pattern

All scripts follow this structure:
```powershell
# 1. VM connection setup
# 2. Upload-FileViaBase64 function definition
# 3. File uploads
# 4. Success confirmation
# 5. Cache clear reminder
```

---

## Session History

### S001 - 2026-02-02
- Initial project setup and memory structure
- Established VM deployment method
- Defined design system

### S002 - 2026-02-07
- Context transfer and project organization

### S003 - 2026-02-08
- Deployment method refinement and fixes

### S004 - 2026-02-09
- Grid pattern implementation
- Grid removed from Gallery page
- Custom cursor implemented
- Countdown timer added
- Multiple visual corrections

### S005 - 2026-02-10 (LATEST)
- Virtual Studio Tour (11 components, 6 zones)
- Social media updates (removed bar, added WhatsApp)
- Branding corrections (Artilora not Academy)
- About page image update

### S009 - 2026-02-25
- Anti-Hallucination Framework, Memory Standardization & Line Spacing adjustment
- Unified fragmented project logs into single .kiro memory state
- Verified continuous deployment automount recovery mechanisms

### S010 - 2026-03-06
- Replaced Hero paragraph in MeetTheArtist.vue and index.vue with the latest poetic description
- Switched text justification to left in the Vision/Mission sections and standardized font size to 14px
- Expanded the "Beyond the Portfolio" grid into 12 detailed tiles with emojis
- Lowered text-shadow glow and font weight on the Contact page quotes
- Removed forced large font sizes on 'Primus' and 'ARTILORA' in index.vue

### S011 - 2026-03-21 — Server Migration
- Migrated from old PC (192.168.10.66) to fresh Ubuntu 24.04 server (192.168.72.113)
- Installed Docker v29.3.0 + Docker Compose v5.1.1
- Configured passwordless sudo for frank
- Updated docker-compose.yml (volume mount, port binding)
- Built Docker image, started container, verified site at http://192.168.72.113:3009
- Created comprehensive PROJECT_MEMORY.md
- Updated all memory/documentation files for new infrastructure

### S013 - 2026-04-14 (LATEST) — Pre-Migration Verification & VM Transfer Prep
- Comprehensive server health check (16/16 passing)
- Documented full architecture: father's laptop → home lab VM → Docker → shared folder
- Fixed stale local docker-compose.yml (old IP/path from decommissioned server)
- Synced PROJECT_MEMORY.md to server (was 0 bytes)
- Verified all files byte-exact match between local and server
- Created migration checklist for transfer to home lab
- VM verified ready for shutdown and migration

**Latest Session File:** `PROJECT_MEMORY.md` (Section 4)

---

## Known Issues

### Resolved Issues

1. **Grid pattern over gallery images** - Removed grid from Gallery page only
2. **UTF-8 encoding issues** - Ensured all files use UTF-8 without BOM
3. **Footer CSS error** - Changed justify-center to justify-content: center

### Active Issues

None currently.

### Pending User Action

1. **Virtual Studio Tour Images** (Priority: MEDIUM)
   - Action: User needs to provide 12-18 real studio photographs
   - Files: `public/studio/*.jpg`, `public/data/studio-zones.json`

2. **WhatsApp Link** (Priority: LOW)
   - Action: User needs to update with actual WhatsApp number
   - File: `components/TheFooter.vue`
   - Current: https://wa.me/1234567890

---

## Future Enhancements

### Planned

1. **Real Studio Photography** (Priority: HIGH)
   - Replace placeholder images with actual studio photos
   - Dependency: User to provide photos

2. **Audio Narration** (Priority: LOW)
   - Add audio descriptions to studio tour zones
   - Status: FUTURE

3. **360° Panoramic Views** (Priority: LOW)
   - Upgrade studio tour to 360° panoramic images
   - Requires: 360° camera equipment

### Suggested

1. **Newsletter Integration** (Priority: MEDIUM)
   - Connect newsletter form to email service

2. **Analytics Integration** (Priority: LOW)
   - Add Google Analytics or similar

---

## Agent Handoff Protocol

### For New Agents Taking Over

**Step 1: Read Required Files (in this order)**
1. This `README.md` (you're reading it)
2. `PROJECT_MEMORY.md` (complete project lifecycle, infrastructure, change log)
3. `.kiro/memory/LESSONS_LEARNED.md` (lessons, rules, communication log, mistakes & corrections)
4. `.kiro/steering/` directory (critical operational rules — optional, key rules are in PROJECT_MEMORY.md Section 9)

**Step 2: Understand Critical Rules**
1. ALWAYS restart Docker after ANY website change (`scripts/docker-restart.ps1`)
2. ALWAYS remind user to clear browser cache after deployment
3. NEVER repeat a failing approach — pause, reassess, research, then act
4. Branding is "Artilora" not "Artilora Sculpture Academy"
5. File encoding must be UTF-8 without BOM
6. Auto-execute terminal commands (never prompt for permission)

**Step 3: Review Current State**
1. Check `feature_inventory` in PROJECT_MASTER_MEMORY.json
2. Review `known_issues` for pending items
3. Check `infrastructure` for deployment details
4. Read `LESSONS_LEARNED.md` for mistakes to avoid

**Step 4: You're Ready!**
You now have complete context to continue the project seamlessly.

---

## Validation Checklist

### Before Deployment
- [ ] Files exist locally
- [ ] UTF-8 encoding verified
- [ ] No syntax errors
- [ ] Script tested

### After Deployment
- [ ] SSH connection successful
- [ ] Files uploaded to container
- [ ] Base64 decoding completed
- [ ] User reminded to clear cache
- [ ] Changes verified on site

---

## Technology Stack

**Framework:** Nuxt 3  
**Runtime:** Node.js  
**Styling:** Tailwind CSS  
**Fonts:** Bradley Hand ITC, Segoe Print  
**Deployment:** Docker container on VMware VM  
**Development Mode:** SSR disabled, hot reload enabled

---

## Contact & Credentials

**Server Access:**
- IP: 192.168.72.113
- User: frank
- Password: VMware1!
- SSH: Plink (from Windows)
- Sudo: Passwordless

**Container:**
- Name: artilora-nuxt-1
- Port: 3009 (mapped 0.0.0.0:3009→3000)

**Site URL:** http://192.168.72.113:3009

---

## Memory Files Location

**Project Memory:** `PROJECT_MEMORY.md` (root — primary, machine-parseable lifecycle record)  
**Lessons Learned:** `.kiro/memory/LESSONS_LEARNED.md` (detailed mistakes, corrections, user instructions)  
**Steering Rules:** `.kiro/steering/` (critical operational rules)  
**Session Memories:** `.kiro/memory/SESSION_*.json` (historical sessions)  
**Legacy Master Memory:** `.kiro/memory/PROJECT_MASTER_MEMORY.json` (pre-migration snapshot)

---

## Project Status

**Current Phase:** Active Development — Pending VM Migration  
**Last Updated:** 2026-04-14  
**Latest Work:** Pre-migration verification, health check (16/16 passing), file sync, architecture documentation  
**Server Status:** ONLINE at 192.168.72.113 (test VM — will change IP after migration to home lab)  
**Website:** http://192.168.72.113:3009 (ACCESSIBLE — IP will change post-migration)  
**Next Steps:** Shut down VM, transfer to home lab, configure shared folder, assign static IP  

---

## Notes for Continuity

1. **Always update PROJECT_MEMORY.md** after significant changes (Section 4: Change Log)
2. **Always update LESSONS_LEARNED.md** after every action, mistake, or insight
3. **Update this README** when project structure or infrastructure changes
4. **ALWAYS restart Docker** after any website file change
5. **Remind user about cache clearing** after every deployment
6. **Never repeat failing approaches** — pause, research, think, then act
7. **Document all decisions** in memory files for future reference

---

**This README is the single source of truth for the Artilora Website project.**

**Last Updated:** 2026-04-14  
**Version:** 2.1.0 (Pre-migration verified)  
**Maintained By:** System AI Agents
