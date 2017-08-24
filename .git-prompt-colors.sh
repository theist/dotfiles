##############################################################################
# Changes the prompt to a Debian-style one that truncates pwd to a max length
# depending on the terminal column width. Also uses the prompt_callback
# function of bash-git-prompt to set the window title to almost the same
# Debian-style. This version has been tweaked for Ubuntu standard terminal 
# fonts.
#
# The prompt will use a Debian-style on the form
#
# relative-path-from-git-toplevel-dir bash-git-prompt-info <exit status>
# HH:MM:SS ▶
#
# The window title will have the form
# relative-path-from-git-toplevel-dir
#
# Example usage:
# if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
#   GIT_PROMPT_THEME=Minimal
#   source ~/.bash-git-prompt/gitprompt.sh
# fi
#
# Imbibinebe <imbibinebe@gmail.com> [https://github.com/imbibinebe]
##############################################################################
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Minimal"

  if command -v rbenv > /dev/null; then
    RUBY_PROMPT='{$(rbenv version-name)}'
  fi


  #Overrides the prompt_callback function used by bash-git-prompt
  function prompt_callback {
    GIT_CONTAINER_FOLDER_FULLPATH=$(git rev-parse --show-toplevel 2> /dev/null)
    GIT_CONTAINER_FOLDER=$(basename $GIT_CONTAINER_FOLDER_FULLPATH 2> /dev/null)
    CURRENT_FULLPATH=$(pwd)
    local PS1=$GIT_CONTAINER_FOLDER${CURRENT_FULLPATH#$GIT_CONTAINER_FOLDER_FULLPATH}
    gp_set_window_title "$PS1"
    echo -n "${BoldYellow}${PS1}${ResetColor}"
  }
  
  Time12a="\$(date +%H:%M:%S)"
  GIT_PROMPT_BRANCH="${BoldMagenta}"        # the git branch that is active in the current directory
  GIT_PROMPT_PREFIX=""                 # start of the git info string
  GIT_PROMPT_SUFFIX=""                 # the end of the git info string
  GIT_PROMPT_SEPARATOR=""              # separates each item
  GIT_PROMPT_STAGED=" ${Green}●"           # the number of staged files/directories
  GIT_PROMPT_CONFLICTS=" ${BoldRed}✖"       # the number of files in conflict
  GIT_PROMPT_CHANGED=" ${BoldBlue}✚"        # the number of changed files

  # GIT_PROMPT_REMOTE=" "                 # the remote branch name (if any) and the symbols for ahead and behind
  GIT_PROMPT_UNTRACKED=" ${Cyan}…"       # the number of untracked files/dirs
  GIT_PROMPT_STASHED=" ${BoldCyan}⚑ "    # the number of stashed files/dir
  GIT_PROMPT_CLEAN=" ${BoldGreen}✔"      # a colored flag indicating a "clean" repo

  local gp_end="\n${Red}${RUBY_PROMPT} _LAST_COMMAND_INDICATOR_${White}${Time12a}${ResetColor}"

  GIT_PROMPT_START_USER=""
  GIT_PROMPT_END_USER="${gp_end} $ "
  GIT_PROMPT_END_ROOT="${gp_end} /!!!\ "

  GIT_PROMPT_COMMAND_OK="${Green}✔ "    # indicator if the last command returned with an exit code of 0
  GIT_PROMPT_COMMAND_FAIL="${BoldRed}✘ "    # indicator if the last command returned with an exit code of other than 0
}

reload_git_prompt_colors "Custom"
