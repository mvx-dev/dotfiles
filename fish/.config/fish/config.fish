if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
alias ls "eza -alo --git --group-directories-first"
zoxide init --cmd cd fish | source
