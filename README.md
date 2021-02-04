# tmux_builder
Allows you to use tmux in an environment where you do not have administrator privileges and cannot "apt install tmux".  
It doesn't work depending on the environment, but it worked fine on my university server.  

# Requirement
- gcc
- make
- python

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
- zshrc 
```
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH $HOME/local/lib
```
Finally, Reflect changes.
```
source $HOME/.xxxrc
```
