source /bin/custom/pipewire.sh
source /bin/custom/commands.sh
#source $HOME/computer-0.1/installer.sh
#source $HOME/computer-0.1/migratedotfiles.sh
#source $HOME/computer-0.1/uploaddotfiles.sh

export VISUAL=nvim
#export XDG_CURRENT_DESKTOP=sway

source ~/.zshplug/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshplug/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zshplug/zsh-history-substring-search/zsh-history-substring-search.zsh
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down


autoload -Uz compinit promptinit
compinit
promptinit
# This will set the default prompt to the walters theme
prompt walters #promp -p and prompt -l for themes
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
autoload -Uz compiit
compinit #sshhashknownhosts todo
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
#historysearch
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

#meta modifiers
#key[Control-Left]="${terminfo[kLFT5]}"
#key[Control-Right]="${terminfo[kRIT5]}"

#[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
#[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
#
#
