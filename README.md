# Starship Comm 

A magic environment for a soon-to-be Ruby app.

### Build the environment through the following command

```sh
docker pull deborabe/nix-direnv-image:latest
docker run -it --rm -v $(pwd):/workspace -p 3000:3000 nix-direnv-image:latest
```
✨ Access `http://0.0.0.0:3000` and see for yourself ✨