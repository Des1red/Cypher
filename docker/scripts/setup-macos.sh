#!/bin/bash

# Ensure Docker is installed
if ! command -v docker &> /dev/null; then
  echo "Docker could not be found. Please install Docker first."
  exit 1
fi

# Check the parent process name to identify the current shell
parent_process=$(ps -p $PPID -o comm=)

if [[ "$parent_process" == "bash" ]]; then
  CONFIG_FILE=~/.bashrc
elif [[ "$parent_process" == "zsh" ]]; then
  CONFIG_FILE=~/.zshrc
else
  echo "Unsupported shell. Only bash and zsh are supported."
  exit 1
fi

echo "Configuration file set to $CONFIG_FILE"

# Move to the root directory of the project before building the Docker image
cd "$(dirname "$0")/.."

# Build the Docker image
docker build -t cypher .

# Alias command to be added
alias_command="alias cypher='docker run -it --rm --network host --cap-add NET_ADMIN --cap-add NET_RAW cypher'"

# Check if the alias already exists in the configuration file to avoid duplication
if ! grep -q "$alias_command" "$CONFIG_FILE"; then
    echo "$alias_command" >> "$CONFIG_FILE"
    source "$CONFIG_FILE"
    echo "Alias added to $CONFIG_FILE:"
    tail -n 1 "$CONFIG_FILE"
else 
    echo "Alias cypher already exists in $CONFIG_FILE"
fi

echo "Docker image built and alias 'cypher' set up. You can now run the container using the 'cypher' command."
echo "Please run 'source $CONFIG_FILE' to apply the changes in the current session."
