# configuration reference: https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh/

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # fix accents (mxkeys keyboard)
    setxkbmap -model pc104 -layout us_intl
fi

# list files with details
alias ll="ls -larht"

# show confirm prompt
alias rm="rm -i"

# Documents shortcut
alias cdd="cd $HOME/Documents"

# show all history lines
alias history="history 1"

# alias for kubectl plugins
alias kubectx="kubectl-ctx"
alias kubens="kubectl-ns"

# Set the locale of the shell
export LANG="en_US.UTF-8"

# Define VSCode as the default text editor
export EDITOR="code -w"

# Include user-specific binaries and scripts
export PATH="$HOME/.local/bin:$PATH"

# Add Rust binaries to the PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Add Go binaries to the PATH
export PATH="$PATH:$HOME/go/bin"

# system wide cli
export PATH="$PATH:/usr/local/bin"

# Include Krew binaries for managing kubectl plugins
export PATH="$PATH:$HOME/.krew/bin"

# add bundle cli binaries of the rancher desktop
export PATH="$PATH:$HOME/.rd/bin"

# Colorize "kubectl diff" command outputs
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

# Specify characters considered as word boundaries for command line navigation
export WORDCHARS=""

# fzf settings - configure the display options in the reverse search (CTRL + R)
export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap --walker-skip .git,node_modules,venv,.venv,virtualenv,.terraform"

# Preview full command
export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Set the location and filename of the history file
export HISTFILE="$HOME/.zsh_history"

# Set the maximum number of lines to be saved in the history file
export HISTSIZE="100000"
export SAVEHIST="$HISTSIZE"

# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# Append new history entries to the history file
setopt APPEND_HISTORY

# Save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# Ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# Ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# >>> bindkey tip: to discovery the code of your keys, execute "$ cat -v" and press the key, the code will be printed in your shell.

# use the ZLE (zsh line editor) in emacs mode. Useful to move the cursor in large commands
bindkey -e

# Navigate words using Ctrl + arrow keys
# >>> CRTL + right arrow | CRTL + left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Search history using Up and Down keys
# >>> up arrow | down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Jump to the start and end of the command line
# >>> CTRL + A | CTRL + E
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# >>> Home | End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Navigate menu for command output
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# Delete characters using the "delete" key
bindkey "^[[3~" delete-char

# alias to CTRL + T
bindkey "^@" fzf-cd-widget

# >>> load ZSH plugin

# Enable kubectl plugin autocompletion
autoload -Uz compinit
compinit
source "$HOME/.my-custom-zsh/kubectl.plugin.zsh"
source <(kubectl completion zsh)

# Load zsh-autosuggestions
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Load zsh-syntax-highlighting
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Load fzf keybindings and completions
eval "$(fzf --zsh)"

# Start Starship prompt
eval "$(starship init zsh)"
