# Use the base image of Alpine Linux
FROM alpine:latest

# Install Git, Curl, Bash, XZ, Sudo, and other basic packages
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

# Run the container's shell
CMD ["bash"]
