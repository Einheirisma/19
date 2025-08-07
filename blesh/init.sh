# ----------------------------------------------------------
#  Exact-colour Z-sh style prompt in ble.sh
# ----------------------------------------------------------

ble-import contrib/prompt-git

function ble/prompt/backslash:zgit {
  local branch ret dirty_mark
  if ble/contrib/prompt-git/initialize; then
    branch=${_ble_contrib_prompt_git_data[branch]}
    [[ $branch ]] || return 0
    ble/contrib/prompt-git/get-dirty-mark
    [[ $ret ]] && dirty_mark=$'\e[38;2;255;192;203m*'   # #ffc0cb
    ble/prompt/print $'\e[38;2;128;128;128m'"${branch}"$'\e[m'"${dirty_mark}"
  fi
}

# PS1 with exact colours
PS1=$'\e[38;2;0;0;255m\w\e[m $(ble/prompt/backslash:zgit) $ '
# Prompt ####################################################
bleopt prompt_ps1_final=                                    #
bleopt prompt_rps1=                                         #
bleopt prompt_ruler=                                        #
bleopt prompt_eol_mark=                                     #
#############################################################

ble-import contrib/integration/bash-completion
eval "$(fzf --bash)"
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
