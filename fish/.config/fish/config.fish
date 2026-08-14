if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting

alias ls "eza -lo --git --group-directories-first"
alias nv nvim
alias open "handlr open"
alias mpm matlab-mpm
pyenv init - fish | source
zoxide init --cmd cd fish | source

set GPG_TTY $(tty)
set WALLPAPER_DIR "$HOME/.assets/wallpapers"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/cheshire/.opam/opam-init/init.fish' && source '/home/cheshire/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration
