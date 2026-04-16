# Implementation Plan: Collaborative Development Infrastructure

## Overview

This implementation plan provides step-by-step tasks to set up the collaborative development infrastructure between Person B's Windows workstation (Amazon Kiro) and Person A's Ubuntu Server VM (Docker host). Tasks are organized chronologically following the infrastructure setup phases.

## Tasks

- [x] 1. Install required software on Ubuntu Server VM (Person A)
  - [x] 1.1 Install Docker Engine and Docker Compose
    - SSH into Ubuntu VM and install Docker using official repository
    - Add user 'frank' to docker group for non-sudo access
    - Verify installation with `docker --version` and `docker compose version`
    - _Requirements: 1.1, 1.2_

  - [x] 1.2 Install CIFS utilities for SMB mounting
    - Install cifs-utils package for mounting Windows shares
    - Verify installation with `mount.cifs --version`
    - _Requirements: 1.3_

  - [x] 1.3 Configure SSH server for remote access
    - Ensure OpenSSH server is installed and running
    - Verify SSH access from Person B's workstation
    - _Requirements: 1.4, 5.1_

  - [x] 1.4 Configure firewall rules
    - Enable UFW firewall
    - Allow ports 22 (SSH), 3000 (Nuxt dev), and 3009 (web app)
    - Set default deny for incoming connections
    - _Requirements: 7.1, 7.2, 7.3, 7.4_

- [x] 2. Configure Windows file share (Person B)
  - [x] 2.1 Verify Windows share is accessible
    - Confirm share at `\\192.168.10.34\ShareDrive\Website` is accessible
    - Test authentication with user 'soman'
    - _Requirements: 2.1, 2.2_

- [x] 3. Mount Windows share on Ubuntu VM
  - [x] 3.1 Create mount point and credentials file
    - Create /mnt/website directory
    - Create /etc/samba/credentials file with secure permissions (600)
    - Store SMB credentials securely
    - _Requirements: 3.4_

  - [x] 3.2 Configure automatic mounting in fstab
    - Add CIFS mount entry to /etc/fstab
    - Use credentials file reference (not plain text password)
    - Configure with nofail option for boot resilience
    - _Requirements: 3.1, 3.3_

  - [x] 3.3 Test mount and verify file access
    - Mount the share manually first
    - Verify all project files are visible
    - Test read/write access
    - _Requirements: 2.3, 2.4, 3.2_

- [x] 4. Checkpoint - Verify infrastructure foundation
  - Ensure SSH works from Person B to Ubuntu VM
  - Ensure mount is working and files are accessible
  - Ask the user if questions arise

- [x] 5. Update Docker configuration files
  - [x] 5.1 Update docker-compose.yml with correct settings
    - Change port binding to 192.168.10.66:3009:3000
    - Update volume mount to /mnt/website:/usr/src/app
    - Add HOST=0.0.0.0 environment variable
    - Add restart policy
    - _Requirements: 4.1, 4.2_

  - [x] 5.2 Update nuxt.config.ts for deployment
    - Review and adjust baseURL if needed for local development
    - Ensure devtools and SSR settings are appropriate
    - _Requirements: 4.4_

  - [x] 5.3 Create production-ready docker-compose.prod.yml (optional)
    - Create separate compose file for production-like deployment
    - Configure for static file serving if needed
    - _Requirements: 4.3_

- [x] 6. Create deployment automation scripts
  - [x] 6.1 Create PowerShell deployment script for Person B
    - Create deploy.ps1 script in project root
    - Implement SSH connection to Ubuntu VM
    - Execute docker compose down and up commands
    - Add status reporting and error handling
    - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5_

  - [x] 6.2 Create helper scripts for common operations
    - Create scripts for: logs, status, restart, stop
    - Add to project for easy access from Kiro
    - _Requirements: 6.4_

- [x] 7. Checkpoint - Test Docker deployment
  - Build and start Docker container on Ubuntu VM
  - Verify website is accessible at http://192.168.10.66:3009
  - Test deployment script from Person B's workstation
  - Ask the user if questions arise

- [ ] 8. End-to-end workflow validation
  - [x] 8.1 Test complete development workflow
    - Edit a file in Kiro on Person B's workstation
    - Verify change appears on Ubuntu VM mount
    - Run deployment script
    - Verify website reflects changes
    - _Requirements: 8.1, 8.2, 8.3, 8.4_

  - [x] 8.2 Create documentation for daily workflow
    - Document common commands and URLs
    - Create quick reference guide
    - _Requirements: 8.3, 8.4_

- [x] 9. Final checkpoint - Complete system verification
  - Verify all requirements are met
  - Test reboot persistence of mount
  - Confirm deployment workflow is smooth
  - Ask the user if questions arise

## Notes

- Tasks are designed to be executed sequentially with checkpoints for validation
- SSH commands will be executed remotely from Person B's workstation where possible
- Some tasks require direct access to Ubuntu VM via PuTTY initially
- All IP addresses and credentials are based on provided configuration:
  - Ubuntu VM: 192.168.10.66, user: frank, password: VMware1!
  - Windows Share: \\192.168.10.34\ShareDrive\Website, user: soman, password: polopolo24
