# This `.zshrc` configuration, use thirdy parties frameworks and plugins
#
# TODO: cleanup
#
# - oh-my-zsh                         | zsh plugins package manager
#   $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# - zsh theme: `spaceship-prompt`     | zsh theme with many plug and play plugins and extensible and easily customization
#   $ git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/themes/spaceship-prompt" --depth=1'
#   $ ln -s "$HOME/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"'
#
# - zsh plugin: `zsh-autosuggestions` | it suggests commands as you type based on history and completions
#   $ git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#
# - zsh plugin: `kubetail`            | Bash  that enables you to aggregate (tail/follow) logs from multiple pods into one stream. This is the same as running "kubectl logs -f " but for multiple pods.
#   $ git clone https://github.com/johanhaleby/kubetail.git $HOME/.oh-my-zsh/custom/plugins/kubetail
#
# Emoji considerations: emojis override by unicode emojis (not requires powerline patched font)
#
# Prompt Preview:
#
# ☸ production
# 📁 ~
# ➜ aws-vault exec aws-account-prod --
#
# ☸ production | ☁️ aws-account-prod
# 📁 ~
# ➜ cd ~/Documents/ansible-configure-fedora
#
# ☸ production | ☁️ aws-account-prod
# 📁 ~/Documents/ansible-configure-fedora | 🔀 main
# ➜

export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='code -w'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-13.jdk/Contents/Home"
export LS_COLORS=$LS_COLORS:'ow=01;34:'

# util alias
alias ls="ls -la"
alias rm="rm -i"
alias cp="cp -i"
alias watch='watch '      # enable watch in alias commands, for example: `watch kgp`

# `ohmyzsh` plugins
plugins=(  
  # poetry                # install (only first time) autocomplete to Poetry (alternative pip) | reference: https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
  kubectl                 # kubectl alias and autocomple. example: `kgp`
  docker                  # docker autocomple
  zsh-autosuggestions     # It suggests commands as you type based on history and completions. | documentation: https://github.com/zsh-users/zsh-autosuggestions
  kubetail                # Bash  that enables you to aggregate (tail/follow) logs from multiple pods into one stream. This is the same as running "kubectl logs -f " but for multiple pods. | documentation: https://github.com/johanhaleby/kubetail
)

# spaceship-prompt customization | documentation: https://spaceship-prompt.sh/
ZSH_THEME="spaceship"

## order of the spaceship sections
SPACESHIP_PROMPT_ORDER=(
  kubectl_context       # k8s context and namespace
  aws                   # aws active context (`$AWS_VAULT` variable)
  venv                  # python venv
  line_sep              # break line `\n`
  dir                   # absolute directory
  git                   # active git branch (if in git repository)
  line_sep              # break line `\n`
  char                  # prompt command
)

## section configurations
## documentation      | https://spaceship-prompt.sh/options/
## colors code        | https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

## `prompt` general settings | https://spaceship-prompt.sh/sections/char/#create-a-config-file
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true" # necessary to show k8s emoji
SPACESHIP_PROMPT_ADD_NEWLINE="false"      # adds a newline character before each prompt line. the value is `false` because `true` have delay
SPACESHIP_PROMPT_ASYNC="true"             # Render prompt asynchronously or not

## `kubectl_context`  | https://spaceship-prompt.sh/sections/kubectl/
SPACESHIP_KUBECTL_ASYNC="true"	                # Render section asynchronously
SPACESHIP_KUBECTL_CONTEXT_PREFIX="\U0002388  "  # Prefix before Kubectl context section
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  red    'pro'                                        # -> red
  green  'dev|rancher-desktop|enterprise-dev|ent-dev' # -> green
  207    'ent|enterprise'                             # -> purple
  yellow '\.*$'                                       # -> yellow
)

## `venv` | https://spaceship-prompt.sh/sections/venv/
SPACESHIP_VENV_SHOW="true"    # Show section 	
SPACESHIP_VENV_ASYNC="true"   # Render section asynchronously
SPACESHIP_VENV_PREFIX=" | "   # Section's prefix
SPACESHIP_VENV_SUFFIX=""      # Section's suffix
SPACESHIP_VENV_SYMBOL="venv:" # Symbol displayed before the section
SPACESHIP_VENV_COLOR="yellow" # Section's color

## `dir` | https://spaceship-prompt.sh/sections/dir/
SPACESHIP_DIR_PREFIX="\U1F4C1 "         # Prefix before current directory. Default: `in`
SPACESHIP_DIR_TRUNC="0"                 # Number of folders of cwd to show in prompt, 0 to show all
SPACESHIP_DIR_TRUNC_REPO="false"        # While in git repo, show only root directory and folders inside it
SPACESHIP_DIR_COLOR="247"               # Color of directory section
SPACESHIP_DIR_LOCK_SYMBOL="  \U1F512"   # The symbol displayed if directory is write-protected

## `aws` | https://spaceship-prompt.sh/sections/aws/
SPACESHIP_AWS_PREFIX="| "               # Prefix before the AWS section
SPACESHIP_AWS_COLOR="cyan"              # Color of AWS section

## `git` | https://spaceship-prompt.sh/sections/git/
SPACESHIP_GIT_ASYNC="true"	        # Render section asynchronously
SPACESHIP_GIT_PREFIX=""             # Prefix before Git section
SPACESHIP_GIT_SYMBOL="\U1F500 "     # Character to be shown before Git section. Overrided by unicode emoji

export PATH="$HOME/.rd/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Poetry binary Path
export PATH="$HOME/.poetry/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# pip3 install ffmpeg
alias v2g='function video_to_gif(){ ffmpeg -i $1 $2 && gifsicle -O3 $2 -o $2 };video_to_gif'
