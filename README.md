### devenv
A dockerized development environment with minimal configuration. It takes less than 8 minutes to build from scratch and
it's ideal for either development or trying new configuration before committing it to your host machine.

### Usage
The provided `Makefile` contains targets to build and run the container.
You first need to rename the provided `.env.sampe` i.e. `mv .env.sample .env` and fill in the values.

Run `make build` to build the container. The image itself is an `ubuntu:latest` with some essential packages.
Run `make run` to start the container. The container is bare minimum. Given that you are now inside the container, 
in order to install all the dependencies, `cd dotfiles`
and run `make dotfiles`. On an M1 mac with decent internet speed, it takes less than 8 minutes to build everything.

If you exit the container, you can run it again, and you won't lose anything. However, it's better if you make 
a snapshot of your image. To do this, run `make commit` from your host machine. This will create a new image with everything in the 
container. The committed image will have a datetime tag like: `2023-07-15T214724`. This command also re-tag it as local, so 
the next time you run `make run` this new image will be used.

### Customisation
I kept the configuration minimal. Everything is done via ansible. You can find all the configfiles in the `dotfiles/roles/dotfiles/files`
directory. The `/home/<username>` directory will be mounted to the container. So you can edit the configuration and run ansible
playbook. There is no need to build and rerun the container.

If you load the project in you IDE/editor make sure to mark `home` directory as excluded, otherwise your IDE tries to index
everything, and possibly low memory errors.

### Features
 * Programming Languages:
   * **Python** 3.10 & 3.11 (manged by [pyenv](https://github.com/pyenv/pyenv))
   * **Node** 18 (managed by [n](https://github.com/tj/n))
   * **Java** 17 & 20 (managed by [jenv](https://github.com/jenv/jenv))
   * **go** 1.20.6
   * **Rust** (managed by [rustup](https://github.com/rust-lang/rustup))
* Shell:
  * zsh shell (using [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh))
  * [tmux](https://github.com/tmux/tmux) 
    * build from source
* Editors
  * vim (Minimum configuration)
  * neovim (Minimum configuration + [lazy](https://github.com/folke/lazy.nvim) plugin manager)
    * build from source