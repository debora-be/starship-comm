# Starship Comm 

## Running Nix inside Docker

Have you ever dreamt of running Nix like magic? Well, we can make it happen!

### Run the container and let the magic begin
```sh
docker pull deborabe/nix-direnv-image:latest
docker run -it -p 3001:3000 deborabe/nix-direnv-image:latest
```

### Overview

This commands will set up a Ruby on Rails environment inside a Docker container using Nix. It ensures that all dependencies are managed and isolated, providing a consistent development and production environment.

### Features

- **Nix Package Manager**: manages all dependencies using Nix for a reproducible environment
- **Ruby on Rails**: runs a Rails application inside the container
- **direnv**: automatically loads environment variables for your project