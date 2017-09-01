local PROMPT_CHAR="➜"
#local PROMPT_CHAR="$"
local ret_status="%(?:%{$fg_bold[green]%}${PROMPT_CHAR} :%{$fg_bold[red]%}${PROMPT_CHAR} )"

PROMPT='
%{$fg[cyan]%}${PWD/#$HOME/~}  $(git_prompt_info)
%{$reset_color%}gp ${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}%{$reset_color%}"
