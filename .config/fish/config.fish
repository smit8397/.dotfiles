function fish_prompt
    set -l namecol  white
    set -l dircol green
    set -l branchcol purple
    set -l proxycol red
    set -l timecol blue
    # Print username:
    set_color $namecol -b normal
    echo -n (whoami)":"

    # Print time
    set_color $timecol -b normal
    echo -n "["(date +%H:%M:%S)"]"
    set_color $namecol -b normal
    echo -n ":"

    # Print git_branch_name
    set_color $branchcol -b normal
    echo -n (git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Print a ":"
    set_color $namecol -b normal
    echo -n ":"

    # Print current directory
    set_color $dircol -b normal
    set working_dir (echo $PWD | sed -e "s|^$HOME|~|")
    echo -n "$working_dir"

    # Print a ">"
    set_color $namecol
    echo -n ">"
end

# Alias definitions.
alias back 'prevd'
alias forth 'nextd'
alias k 'kubectl'
alias vim 'nvim'
alias view 'nview'


set PATH /home/jeff/.local/bin $PATH
set PATH /home/jeff/gems/bin $PATH
set PATH /home/jeff/go/bin $PATH
set PATH /home/jeff/.pulumi/bin $PATH
set -gx GEM_HOME /home/jeff/gems
set -gx PIPENV_MAX_DEPTH 10
set -gx AWS_PROFILE vuemgmt-cdpipeline
set -gx NVM_DIR /home/jeff/.nvm
set -gx EDITOR vim

# Add rust stuff to path
source "$HOME/.cargo/env.fish"

# Fundle plugins
#fundle plugin 'sentriz/fish-pipenv'
fundle plugin 'evanlucas/fish-kubectl-completions'

fundle init



if status is-interactive
  atuin init fish --disable-up-arrow | source
end

# Start X
if status is-login
    if test -z "$DISPLAY"
        startx
        feh --bg-scale ~/background.jpeg
    end
end
