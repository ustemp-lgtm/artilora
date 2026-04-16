# CRITICAL OPERATIONAL RULE: ALWAYS RESTART DOCKER

**IMMEDIATE ACTION REQUIRED AFTER ANY CHANGE**

Whenever ANY change is made to the website files (code, images, config, etc.), the Docker container MUST be restarted immediately for the changes to take effect.

## Required Procedure

1. Make the change to the file(s).
2. IMMEDIATELY run the restart script:
   ```powershell
   .\scripts\docker-restart.ps1
   ```
3. Wait for the container to fully restart.
4. Verify the change in the browser.
5. **REMINDER:** Clear browser cache (Ctrl+Shift+Delete) or use Incognito mode to see the changes.

## Why?
The application is running in a Docker container. Changes to the source files on the host machine are NOT automatically reflected in the running container without a restart in this specific environment configuration.

## Consequences of Failure
- Changes will NOT be visible.
- User will be confused and think the fix didn't work.
- Time will be wasted debugging non-existent issues.

**DO NOT SKIP THIS STEP.**
