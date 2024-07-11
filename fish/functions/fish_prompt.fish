function fish_prompt
    # Set color for username based on whether the user is root or not
    if test (whoami) = root
        set_color red
    else
        set_color yellow
    end
    echo -ne '\n '(whoami)

    # Set color for the @ symbol to white
    set_color white
    echo -n '@'

    # Set color for the hostname to green
    set_color green
    echo -n 'kali '

    # Set color for the current working directory to purple
    set_color magenta
    echo -n (prompt_pwd)
    set_color white
    echo -n ' > '

    #if test (whoami) = root
    #    set_color FFA500
    #    echo -n "# "
    #else
    #    set_color yellow
    #    echo -n "\$ "
    #end


    # Reset color to normal
    set_color normal
end
