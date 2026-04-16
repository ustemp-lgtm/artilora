# Requirements Document

## Introduction

This specification defines the requirements for setting up a collaborative development infrastructure that enables two developers (Person A and Person B) to work together on a Nuxt-based website project. Person B develops code locally using Amazon Kiro IDE on Windows 11, while Person A's Ubuntu Server VM (running on VMware) handles Docker containerization and serves the website for testing. Both systems communicate over the same local network via SMB file sharing and SSH remote execution.

## Glossary

- **Person_A_VM**: Ubuntu Server virtual machine (IP: 192.168.10.66) running on VMware Workstation on Person A's Windows 11 laptop, responsible for Docker containerization and serving the website
- **Person_B_Workstation**: Windows 11 laptop (IP: 192.168.10.34) where Amazon Kiro IDE is installed and code development occurs
- **SMB_Share**: Windows network file share at `\\192.168.10.34\ShareDrive\Website` providing access to project files
- **Docker_Container**: Containerized Nuxt application running on Person_A_VM serving the website on port 3009
- **Mount_Point**: Directory on Person_A_VM where SMB_Share is mounted for Docker access
- **SSH_Connection**: Secure shell connection from Person_B_Workstation to Person_A_VM for remote command execution
- **Deployment_Script**: Automation script that triggers Docker rebuild/restart operations via SSH

## Requirements

### Requirement 1: Ubuntu Server Software Installation

**User Story:** As Person A, I want Docker and required utilities installed on the Ubuntu Server VM, so that I can run containerized applications and mount network shares.

#### Acceptance Criteria

1. WHEN Person_A_VM boots, THE Docker_Engine SHALL be available and running as a system service
2. WHEN Person_A_VM boots, THE Docker_Compose SHALL be available for multi-container orchestration
3. WHEN Person_A_VM requires SMB mounting, THE CIFS_Utilities SHALL be installed and functional
4. WHEN Person_B_Workstation initiates remote connection, THE SSH_Server SHALL accept connections on port 22

### Requirement 2: Windows File Share Configuration

**User Story:** As Person B, I want my project folder shared on the network with proper permissions, so that Person A's VM can access and serve the files.

#### Acceptance Criteria

1. WHEN SMB_Share is configured, THE Share SHALL be accessible at path `\\192.168.10.34\ShareDrive\Website`
2. WHEN Person_A_VM connects to SMB_Share, THE Share SHALL authenticate user "soman" with appropriate credentials
3. WHEN files are modified on Person_B_Workstation, THE Changes SHALL be immediately visible on any connected system
4. WHEN Docker_Container reads project files, THE Share SHALL provide full read access to all project files

### Requirement 3: Network Share Mounting on Ubuntu

**User Story:** As Person A, I want the Windows share automatically mounted on the Ubuntu VM, so that Docker can access the project files without manual intervention.

#### Acceptance Criteria

1. WHEN Person_A_VM boots, THE Mount_Point SHALL automatically mount SMB_Share at a designated directory
2. WHEN Mount_Point is active, THE Docker_Container SHALL have read/write access to all mounted files
3. IF SMB_Share becomes unavailable, THEN THE Mount_Point SHALL attempt reconnection automatically
4. WHEN mounting is configured, THE Credentials SHALL be stored securely (not in plain text in fstab)

### Requirement 4: Docker Configuration Updates

**User Story:** As a developer, I want the Docker configuration updated with correct IP addresses and paths, so that containers work correctly in the new infrastructure.

#### Acceptance Criteria

1. WHEN docker-compose.yml is configured, THE Port_Binding SHALL expose the application on Person_A_VM's IP (192.168.10.66)
2. WHEN docker-compose.yml is configured, THE Volume_Mount SHALL reference the correct mount point path on Person_A_VM
3. WHEN Docker_Container starts, THE Application SHALL be accessible at `http://192.168.10.66:3009`
4. WHEN nuxt.config.ts is configured, THE BaseURL SHALL be set appropriately for the deployment environment

### Requirement 5: SSH Remote Access Configuration

**User Story:** As Person B, I want secure SSH access to the Ubuntu VM, so that I can execute deployment commands remotely from my workstation.

#### Acceptance Criteria

1. WHEN Person_B_Workstation initiates SSH, THE SSH_Connection SHALL authenticate using username "frank" and password "VMware1!"
2. WHEN SSH_Connection is established, THE User SHALL have sudo privileges for Docker operations
3. WHEN SSH commands are executed, THE Commands SHALL run in the context of the mounted project directory
4. IF SSH_Connection fails, THEN THE System SHALL provide clear error messages for troubleshooting

### Requirement 6: Deployment Automation

**User Story:** As Person B, I want one-click deployment capability from my workstation, so that I can quickly test code changes without manual SSH commands.

#### Acceptance Criteria

1. WHEN Deployment_Script is executed, THE Script SHALL connect to Person_A_VM via SSH
2. WHEN Deployment_Script runs, THE Script SHALL navigate to the mounted project directory
3. WHEN Deployment_Script runs, THE Script SHALL execute Docker Compose commands to rebuild and restart containers
4. WHEN deployment completes, THE Script SHALL report success or failure status to Person_B_Workstation
5. WHERE deployment fails, THE Script SHALL display relevant error logs for debugging

### Requirement 7: Firewall and Network Security

**User Story:** As Person A, I want appropriate firewall rules configured, so that the VM is accessible for development while maintaining security.

#### Acceptance Criteria

1. WHEN Person_A_VM firewall is configured, THE Firewall SHALL allow incoming connections on port 22 (SSH)
2. WHEN Person_A_VM firewall is configured, THE Firewall SHALL allow incoming connections on port 3009 (web application)
3. WHEN Person_A_VM firewall is configured, THE Firewall SHALL allow incoming connections on port 3000 (Nuxt dev server)
4. WHILE firewall is active, THE Firewall SHALL block all other incoming connections by default

### Requirement 8: Development Workflow Validation

**User Story:** As a developer, I want to verify the complete workflow functions correctly, so that I can confidently use this setup for daily development.

#### Acceptance Criteria

1. WHEN Person_B edits a file in Kiro, THE Change SHALL appear on Person_A_VM within 5 seconds
2. WHEN Person_B triggers deployment, THE Docker_Container SHALL rebuild and restart within 2 minutes
3. WHEN deployment completes, THE Website SHALL be accessible at `http://192.168.10.66:3009`
4. WHEN website loads, THE Content SHALL reflect the latest code changes from Person_B_Workstation
