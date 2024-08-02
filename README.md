# Pen Testing Tool

## Introduction
This repository contains a pen testing tool that can be run on Linux or using Docker. Use the appropriate branch for your environment.

## Branches
- `linux`: Contains the Linux-compatible version of the tool.
- `docker`: Contains the Docker version of the tool.

## Using the Docker Version

1. Switch to the Docker branch:
    ```bash
    git checkout docker
    ```

2. **Build the Docker Image**:
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
