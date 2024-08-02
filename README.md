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
## Using the Linux Version

1. Switch to the Linux branch:
    ```bash
    git checkout linux
    ```

2. Navigate to the linux directory:
    ```bash
    cd linux
    ```

3. Install dependencies (if any):
    ```bash
    ./installer.sh
    ```

4. Run the tool:
    ```bash
    sudo ./cypher
    ```

## Contributing
Please submit issues and pull requests to improve this tool.
