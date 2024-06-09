#!/bin/bash

# Load Nix environment
source /etc/profile

# Run direnv allow
if [ -f /workspace/.envrc ]; then
    direnv allow /workspace/.envrc
fi

# Keep the container running
exec "$@"
