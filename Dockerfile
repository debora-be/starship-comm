# Use the Alpine Linux base image
FROM alpine:latest

# Install Git, Curl, Bash, XZ, Sudo, Shadow, and other basic packages
RUN apk update && \
    apk add --no-cache git curl bash xz sudo shadow && \
    curl -L https://nixos.org/nix/install | sh -s -- --daemon && \
    mkdir -p /etc/nix && \
    echo "build-users-group = nixbld" > /etc/nix/nix.conf

# Configure Nix and enable Flakes
RUN mkdir -p /root/.config/nix && \
    echo "experimental-features = nix-command flakes" >> /root/.config/nix/nix.conf

# Install direnv
RUN apk add --no-cache direnv

# Add Nix to PATH
ENV PATH=/root/.nix-profile/bin:/root/.nix-profile/sbin:/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:$PATH

# Install nix-direnv
RUN nix-env -iA nixpkgs.nix-direnv

# Configure direnv to use Nix flakes
RUN echo 'eval "$(direnv hook bash)"' >> /root/.bashrc

# Set the working directory
WORKDIR /workspace

# Copy project files to the working directory
COPY . /workspace

# Create the .envrc file
RUN echo 'use flake . --impure' > /workspace/.envrc

# Adjust permissions for the non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /workspace /nix /root/.config /root/.nix-profile

# Configure sudo without password for the appuser
RUN echo "appuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create an initialization file for Rails to listen on all interfaces
RUN echo 'web: bundle exec rails server -b 0.0.0.0' > /workspace/Procfile

# Switch to the non-root user
USER appuser

# Execute the container shell and run direnv allow
CMD ["bash", "-c", "sudo chown -R appuser:appgroup /workspace && direnv allow && nix develop --extra-experimental-features nix-command --extra-experimental-features flakes --command foreman start"]
