# Design Document

## Overview

This design document provides the technical architecture and implementation details for setting up a collaborative development infrastructure between Person B's Windows workstation (Amazon Kiro IDE) and Person A's Ubuntu Server VM (Docker host). The system enables seamless code editing on Windows with automatic synchronization to Ubuntu for containerized deployment and testing.

**Key Components:**
- SMB/CIFS file sharing from Windows to Ubuntu
- Docker containerization on Ubuntu Server
- SSH-based remote deployment automation
- Network configuration for LAN-based access

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           Local Area Network (LAN)                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────┐      ┌─────────────────────────────────┐  │
│  │  Person B's Workstation     │      │  Person A's Ubuntu VM           │  │
│  │  192.168.10.34              │      │  192.168.10.66                  │  │
│  │                             │      │                                 │  │
│  │  ┌───────────────────────┐  │      │  ┌───────────────────────────┐  │  │
│  │  │   Amazon Kiro IDE     │  │      │  │      Docker Engine        │  │  │
│  │  │   (Code Editor)       │  │      │  │                           │  │  │
│  │  └───────────┬───────────┘  │      │  │  ┌─────────────────────┐  │  │  │
│  │              │              │      │  │  │  Nuxt Container     │  │  │  │
│  │              ▼              │      │  │  │  Port 3000 → 3009   │  │  │  │
│  │  ┌───────────────────────┐  │      │  │  └─────────────────────┘  │  │  │
│  │  │  C:\ShareDrive\Website│  │ SMB  │  │                           │  │  │
│  │  │  (Project Files)      │──┼──────┼──│  /mnt/website             │  │  │
│  │  └───────────────────────┘  │      │  │  (Mount Point)            │  │  │
│  │              │              │      │  └───────────────────────────┘  │  │
│  │              │              │      │              ▲                  │  │
│  │  ┌───────────────────────┐  │ SSH  │              │                  │  │
│  │  │  Deployment Scripts   │──┼──────┼──────────────┘                  │  │
│  │  │  (PowerShell)         │  │      │                                 │  │
│  │  └───────────────────────┘  │      │  Web Access: http://192.168.   │  │
│  │                             │      │              10.66:3009         │  │
│  └─────────────────────────────┘      └─────────────────────────────────┘  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Components and Interfaces

### Component 1: Ubuntu Server VM Configuration

**Purpose:** Host Docker containers and mount Windows network share

**Software Stack:**
- Ubuntu Server (fresh installation)
- Docker Engine (latest stable)
- Docker Compose v2
- CIFS utilities for SMB mounting
- OpenSSH Server

**Network Configuration:**
- IP Address: 192.168.10.66 (bridged mode)
- SSH Port: 22
- Web Application Port: 3009
- Nuxt Dev Server Port: 3000

### Component 2: Windows File Share

**Purpose:** Expose project files to Ubuntu VM via SMB protocol

**Share Configuration:**
- Share Path: `\\192.168.10.34\ShareDrive\Website`
- Local Path: `C:\ShareDrive\Website`
- Share User: soman
- Share Password: polopolo24
- Permissions: Full read/write access

### Component 3: Docker Container Configuration

**Purpose:** Run Nuxt application in isolated container environment

**Container Specifications:**
- Base Image: node:20-alpine
- Working Directory: /usr/src/app
- Exposed Port: 3000 (internal)
- Published Port: 3009 (external on 192.168.10.66)
- Volume Mount: /mnt/website → /usr/src/app

### Component 4: Deployment Automation

**Purpose:** Enable one-click deployment from Person B's workstation

**Implementation:**
- PowerShell script on Windows
- SSH connection to Ubuntu VM
- Docker Compose commands for rebuild/restart

## Data Models

### Mount Configuration (fstab entry)

```
//192.168.10.34/ShareDrive/Website /mnt/website cifs credentials=/etc/samba/credentials,uid=1000,gid=1000,file_mode=0775,dir_mode=0775,_netdev,nofail 0 0
```

### Credentials File (/etc/samba/credentials)

```
username=soman
password=polopolo24
```

### Docker Compose Configuration (docker-compose.yml)

```yaml
services:
  nuxt:
    build: .
    image: artilora-nuxt:latest
    working_dir: /usr/src/app
    volumes:
      - '/mnt/website:/usr/src/app:delegated'
      - node_modules:/usr/src/app/node_modules
    environment:
      NODE_ENV: development
      HOST: 0.0.0.0
    ports:
      - '192.168.10.66:3009:3000'
    stdin_open: true
    tty: true
    restart: unless-stopped

volumes:
  node_modules:
    driver: local
```

### Deployment Script (deploy.ps1)

```powershell
# SSH connection parameters
$VM_IP = "192.168.10.66"
$VM_USER = "frank"
$PROJECT_PATH = "/mnt/website"

# Execute deployment commands via SSH
ssh ${VM_USER}@${VM_IP} "cd ${PROJECT_PATH} && docker compose down && docker compose up -d --build"
```

## Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system—essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*

### Property 1: File Synchronization Consistency

*For any* file modification made on Person_B_Workstation, the same file content SHALL be readable from the Mount_Point on Person_A_VM within the network latency window (typically < 1 second on LAN).

**Validates: Requirements 2.3, 3.2**

### Property 2: Docker Volume Mount Integrity

*For any* file in the mounted project directory, Docker_Container SHALL have identical read access to the file as the host system mount point, preserving file permissions and content.

**Validates: Requirements 3.2, 4.2**

### Property 3: Network Port Accessibility

*For any* HTTP request to `http://192.168.10.66:3009` from any device on the LAN, the request SHALL reach the Docker_Container's internal port 3000 when the container is running.

**Validates: Requirements 4.3, 7.2**

### Property 4: SSH Command Execution Idempotence

*For any* deployment script execution, running the script multiple times in succession SHALL result in the same final state (container running with latest code), regardless of the initial container state.

**Validates: Requirements 6.2, 6.3**

### Property 5: Mount Persistence Across Reboots

*For any* system reboot of Person_A_VM, the SMB_Share SHALL be automatically remounted at the designated Mount_Point without manual intervention, provided the network share is available.

**Validates: Requirements 3.1, 3.3**

## Error Handling

### Network Share Unavailable

**Scenario:** Person B's workstation is offline or share is inaccessible

**Handling:**
- Mount configured with `nofail` option to prevent boot failures
- Docker container will fail to start if mount is empty
- Deployment script checks mount status before proceeding
- Clear error message displayed to user

### Docker Build Failure

**Scenario:** npm install fails or build errors occur

**Handling:**
- Deployment script captures and displays build output
- Container logs accessible via `docker logs` command
- Previous working container preserved until new build succeeds (with proper orchestration)

### SSH Connection Failure

**Scenario:** Network issues or authentication problems

**Handling:**
- PowerShell script includes connection timeout
- Clear error messages for authentication failures
- Retry logic with exponential backoff (optional enhancement)

### Port Conflict

**Scenario:** Port 3009 already in use on Ubuntu VM

**Handling:**
- Docker Compose will report port binding error
- Script checks for existing containers before deployment
- Alternative port configuration documented

## Testing Strategy

### Manual Verification Tests

1. **File Sync Test**
   - Create a test file on Person B's workstation
   - Verify file appears on Ubuntu VM mount point
   - Modify file and verify changes propagate

2. **Docker Container Test**
   - Start container with `docker compose up`
   - Access website at `http://192.168.10.66:3009`
   - Verify Nuxt application loads correctly

3. **Deployment Script Test**
   - Execute deployment script from Person B's workstation
   - Verify container rebuilds successfully
   - Confirm website reflects code changes

4. **Reboot Persistence Test**
   - Reboot Ubuntu VM
   - Verify mount is automatically restored
   - Verify Docker container can be started

### Connectivity Tests

1. **SSH Connectivity**
   ```powershell
   ssh frank@192.168.10.66 "echo 'SSH connection successful'"
   ```

2. **SMB Share Access**
   ```bash
   # From Ubuntu VM
   ls -la /mnt/website
   ```

3. **Web Application Access**
   ```powershell
   Invoke-WebRequest -Uri "http://192.168.10.66:3009" -UseBasicParsing
   ```

### Unit Tests (Configuration Validation)

- Validate docker-compose.yml syntax
- Validate fstab entry format
- Validate credentials file permissions (should be 600)
