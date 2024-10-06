# >>> reference: https://carlosneto.dev/blog/2024/2024-02-08-starship-zsh/

# list files with details
alias ll="ls -larht"

# show confirm prompt
alias rm="rm -i"

# documents shortcut
alias cdd='cd "$HOME/Documents"'

# show all history lines
alias history="history 1"

# alias for kubectl plugins
alias kubectx="kubectl-ctx"
alias kubens="kubectl-ns"

# set the locale of the shell
export LANG="en_US.UTF-8"

# define VSCode as the default text editor
export EDITOR="code -w"

# include user-specific binaries and scripts
export PATH="$HOME/.local/bin:$PATH"

# add Rust binaries to the PATH
export PATH="$PATH:$HOME/.cargo/bin"

# add Go binaries to the PATH
export PATH="$PATH:$HOME/go/bin"

# system wide cli
export PATH="$PATH:/usr/local/bin"

# include Krew binaries for managing kubectl plugins
export PATH="$PATH:$HOME/.krew/bin"

# add bundle cli binaries of the rancher desktop
export PATH="$PATH:$HOME/.rd/bin"

# python cli
export PATH="$PATH:$HOME/.venv/bin"

# colorize "kubectl diff" command outputs
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

# specify characters considered as word boundaries for command line navigation
export WORDCHARS=""

# set the location and filename of the history file
export HISTFILE="$HOME/.zsh_history"

# set the maximum number of lines to be saved in the history file
export HISTSIZE="100000"
export SAVEHIST="$HISTSIZE"

# fzf parameters used in all widgets - configure layout and wrapped the preview results (useful in large command rendering)
export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap"

# CTRL + R: put the selected history command in the preview window - "{}" will be replaced by item selected in fzf execution runtime
export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# ALT + C: set "fd-find" as directory search engine instead of "find" and exclude venv of the results during searching
export FZF_ALT_C_COMMAND="fd --type directory --ignore-file $HOME/.my-custom-zsh/.fd-fzf-ignore"

# ALT + C: put the tree command output based on item selected
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# CTRL + T: set "fd-find" as search engine instead of "find" and exclude .git for the results
export FZF_CTRL_T_COMMAND="fd --exclude .git --ignore-file $HOME/.my-custom-zsh/.fd-fzf-ignore"

# CTRL + T: put the file content if item select is a file, or put tree command output if item selected is directory
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -C {} || bat --color=always --style=numbers {}'"

# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# >>> bindkey tip: to discovery the code of your keys, execute "$ cat -v" and press the key, the code will be printed in your shell.

# use the ZLE (zsh line editor) in emacs mode. Useful to move the cursor in large commands
bindkey -e

# navigate words using Ctrl + arrow keys
# >>> CRTL + right arrow | CRTL + left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# search history using Up and Down keys
# >>> up arrow | down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# jump to the start and end of the command line
# >>> CTRL + A | CTRL + E
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# >>> Home | End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# navigate menu for command output
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# delete characters using the "delete" key
bindkey "^[[3~" delete-char

# fzf alias: CTRL + SPACE -> (ALT + C)
bindkey "^@" fzf-cd-widget

# fzf alias: CTRL + F -> (CTRL + T)
bindkey "^F" fzf-file-widget

# >>> load ZSH plugin

# enable kubectl plugin autocompletion
autoload -Uz compinit
compinit
source "$HOME/.my-custom-zsh/kubectl.plugin.zsh"
source <(kubectl completion zsh)

# load zsh-autosuggestions
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load fzf keybindings and completions
eval "$(fzf --zsh)"

# start Starship prompt
eval "$(starship init zsh)"
