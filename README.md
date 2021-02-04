# tmux_builder
Allows you to use tmux in an environment where you do not have administrator privileges and cannot "apt install tmux".  
I confirmed that it works on my university server.  
# Requirement
- gcc
- make
- python  
  
Since the software that is available varies depending on the environment, please prepare the necessary software as appropriate.  
# Installation
After cloning this repository ...  
```
cd tmux_builder
bash build.sh
```
Next, add the following command to your $HOME/.xxxrc.  
- bash
```
export PATH="$PATH:$HOME/local/bin"
export LD_LIBRARY_PATH="$HOME/local/lib"
```
- csh
```
setenv PATH ${PATH}:${HOME}/local/bin
setenv LD_LIBRARY_PATH ${HOME}/local/lib
```
- zsh  
```
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH=$HOME/local/lib
```
Finally, Reflect changes.
```
source $HOME/.xxxrc
```
