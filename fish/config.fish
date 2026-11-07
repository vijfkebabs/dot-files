if status is-interactive
    # command-line colors
    test -f ~/.config/fish/wallust-colors.fish && source ~/.config/fish/wallust-colors.fish

    # Starship custom prompt
    command -v starship &>/dev/null && starship init fish | source

    # Direnv + Zoxide
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # Better ls
    command -v eza &>/dev/null && alias ls='eza --links --header --git --icons --group-directories-first -1'

    # Better cat 
    command -v bat &>/dev/null && alias cat='bat'

    # Better grep 
    command -v rg &>/dev/null && alias grep='rg'

    # Better find 
    command -v fd &>/dev/null && alias find='fd'

    # fastfetch on clear
    command -v clear &>/dev/null && alias clear='clear && exec fish'

    # redthread
    function rt --description 'Run redthread'
        command $HOME/redthread/redthread $argv
    end

    # yazi y shell wrapper
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Abbrs
    abbr lg lazygit
    abbr wb-reload 'killall -SIGUSR2 waybar'
    abbr l ls
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'
    abbr arch-update 'sudo pacman -Syu && yay -Syu'

end

# Created by `pipx` on 2026-10-21 07:21:32
set PATH $PATH /home/bruinhol/.local/bin
