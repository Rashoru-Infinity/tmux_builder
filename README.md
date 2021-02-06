# tmux_builder
Allows you to use tmux in an environment where you do not have administrator privileges and cannot "apt install tmux".  
I confirmed that it works on my university server and Guacamole in 42tokyo(Only available to students enrolled in 42tokyo).  
- 42  
<https://www.42.fr/>  
<https://42tokyo.jp/>  
# Requirement
- gcc
- make
- pkg-config  
<https://pkg-config.freedesktop.org/releases/>
  
Since the software that is available varies depending on the environment, please prepare the necessary software as appropriate.  
# Installation(tmux)
Check if pkg-config is available.  
See [Installation(pkg-config)](#installationpkg-config) if it is not available.  
After cloning this repository ...  
```
cd tmux_builder
bash build.sh
```
Next, add the following command to your $HOME/.xxxrc.  
- bash or zsh
```
export PATH="$PATH:$HOME/local/bin"
export LD_LIBRARY_PATH="$HOME/local/lib"
```
- csh
```
setenv PATH ${PATH}:${HOME}/local/bin
setenv LD_LIBRARY_PATH ${HOME}/local/lib
```
Finally, Reflect changes.
```
source $HOME/.xxxrc
```
# Installation(pkg-config)
If pkg-config is not installed, you need to install pkg-config.  
If you have permission to install pkg-config, you can use "apt install", but if not, you need to install it locally.  
Below are the steps to install pkg-config locally.  
[Download pkg-config](https://pkg-config.freedesktop.org/releases/)  
After downloading pkg-config-x.x.x.tar.gz file ...  
```
tar xzf pkg-config-x.x.x.tar.gz
cd pkg-config-x.x.x
./configure --prefix=$HOME/local --with-internal-glib
make
make install
```
Next, add the following command to your $HOME/.xxxrc.  
- bash or zsh
```
export LD_LIBRARY_PATH="$HOME/local/lib"
```
- csh
```
setenv LD_LIBRARY ${HOME}/local/lib
```
Finally, Reflect changes.
```
source $HOME/.xxxrc
```
# Version
- tmux 3.1c  
<https://github.com/tmux/tmux/releases/tag/3.1c>
- ncurses 6.2  
<https://invisible-mirror.net/archives/ncurses/>  
<https://invisible-mirror.net/archives/ncurses/ncurses-6.2.tar.gz>
- libevent 2.1.12-stable  
<https://github.com/libevent/libevent/releases/tag/release-2.1.12-stable>
