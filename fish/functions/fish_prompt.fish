function fish_prompt
    if test (whoami) = root
        set_color red
    else
        set_color yellow
    end
    echo -n ' '(whoami)
    set_color green
    echo -n '@kali '(prompt_pwd)' '
    set_color normal
end
