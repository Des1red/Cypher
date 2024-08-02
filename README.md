# Pen Testing Tool

## Introduction
This repository contains a pen testing tool that can be run on Linux or using Docker. Use the appropriate branch for your environment.

## Branches
- `linux`: Contains the Linux-compatible version of the tool.
- `docker`: Contains the Docker version of the tool.
- To switch between branches use the command:
  ```bash
  git checkout "branch name"
  ```
## Using the Docker Version

1. Switch to the Docker branch:
    ```bash
    git checkout docker
    ```
## Prerequisites
Ensure Docker is installed on your system. Follow the instructions for your operating system below.

### Installing Docker

#### Windows

1. **Download Docker Desktop**:
   - Visit the [Docker Desktop for Windows download page](https://www.docker.com/products/docker-desktop).
   - Click "Download for Windows" to get the installer.

2. **Run the Installer**:
   - Locate the downloaded Docker Desktop Installer (`Docker Desktop Installer.exe`).
   - Double-click the installer to start the installation process.

3. **Follow the Installation Wizard**:
   - Complete the installation by following the wizard's prompts. Ensure that you enable WSL 2 (Windows Subsystem for Linux) if prompted.

4. **Enable Hyper-V and Containers** (if not automatically enabled):
   - Open PowerShell as an Administrator and run:
     ```powershell
     dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
     dism.exe /Online /Enable-Feature:Containers /All
     ```
   - Restart your computer if prompted.

5. **Start Docker Desktop**:
   - Open Docker Desktop from the Start menu or desktop shortcut.
   - Docker Desktop will initialize and start the Docker service.

6. **Verify Docker Installation**:
   - Open Git Bash and run the following command to verify that Docker is installed and running:
     ```bash
     docker --version
     ```
   - You should see the Docker version information displayed.

   - Run a test container to verify Docker functionality:
     ```bash
     docker run hello-world
     ```
   - This command downloads and runs a test image, printing a "Hello from Docker!" message if successful.

### Linux

1. **Install Docker**:
   - Follow the official Docker installation guide for your Linux distribution: [Get Docker](https://docs.docker.com/get-docker/).

2. **Verify Docker Installation**:
   - Open a terminal and run the following command to verify that Docker is installed and running:
     ```bash
     docker --version
     ```
   - You should see the Docker version information displayed.

### MacOS

1. **Install Docker Desktop**:
   - Visit the [Docker Desktop for Mac download page](https://www.docker.com/products/docker-desktop).
   - Download and install Docker Desktop following the provided instructions.

2. **Verify Docker Installation**:
   - Open a terminal and run the following command to verify that Docker is installed and running:
     ```bash
     docker --version
     ```
   - You should see the Docker version information displayed.

### Setup Instructions

#### Build the Docker Image

After ensuring Docker is installed, follow these steps to build the Docker image:

1. **Build the Docker Image**:
    ```bash
    cd docker
    cd scripts
    ./setup-YourOs.sh
    ```

   - Replace `YourOs` with `linux`, `macos`, or `windows` based on your operating system.
   - For Windows, run the following command in Git Bash:
     ```bash
     powershell.exe -ExecutionPolicy Bypass -File setup-windows.ps1
     ```

### After Running the Setup Script

- For Linux and macOS, run `source ~/.bashrc` or `source ~/.zshrc` as needed to apply the changes.
- For Windows, restart your PowerShell or Git Bash session to apply the changes.

## Running the Docker Container

- After setting up the alias, you can run the container using the `cypher` command.
- Ensure that your terminal session is restarted or the configuration file is sourced to apply the alias.

3. Run the Docker container:
    ```bash
    cypher
    ```


## Contributing
Please submit issues and pull requests to improve this tool.
