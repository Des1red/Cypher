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

2. Build the Docker image:
    ```bash
    cd docker
    cd scripts
    ./setup-YourOs.sh
    ```

3. Run the Docker container:
    ```bash
    cypher
    ```


## Contributing
Please submit issues and pull requests to improve this tool.
