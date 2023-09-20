if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source 
starship init fish | source

alias vim nvim
set -x EDITOR nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

