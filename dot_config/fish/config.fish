if status is-interactive
    # Commands to run in interactive sessions can go here
end

if not contains "$HOME/.local/bin" $PATH
    # Prepending path in case a system-installed binary needs to be overridden
    set -x PATH "$HOME/.local/bin" $PATH
end

zoxide init fish --cmd cd | source
