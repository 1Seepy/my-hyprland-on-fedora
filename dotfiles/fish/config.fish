if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias fetch="fastfetch --logo-type kitty"
function gimme

    # Check for empty input
    if test -z "$argv"
        echo "Please specify a package to install or 'updates' to update packages."
        return
    end

    # Did the user ask for help
    if test "$argv" = "--help"
	echo "gimme <arg>	# If '<arg>' = 'updates', update dnf and flatpaks, otherwise attempt to install package '<arg>' first through dnf then through Flatpak."
	return
    end

    # Did the user use flags
    if test -z (echo $argv | awk -F'-' '{print $1}')
	echo "Gimme does not currently support flags other than '--help'."
    	return 1
    end

    # Did the user request updates
    if string match -q "$argv" "updates"
        sudo dnf update --refresh
        flatpak update
        return
    end

    # Is there an RPM package
    if dnf info $argv > /dev/null 2>&1
        if dnf list installed $argv > /dev/null 2>&1
            echo "RPM '$argv' is already installed."
            return
        end
        echo "RPM found, installing…"
        sudo dnf install $argv -yq
        return
    end

    # Find Flatpak ref
    set search_output ( flatpak search $argv | head -n 1 )

    # Is there a Flatpak
    if string match -q "$search_output" "No matches found"
        echo "Cannot find package '$argv'."
        return 1
    end

    # Install Flatpak
    set flat_refid (echo $search_output | awk '{print $(NF-3), $(NF)}')
    set flatid (echo $flat_refid | cut -d ' ' -f 1)
    if flatpak info $flatid > /dev/null 2>&1
        echo "Flatpak '$argv' is already installed."
        return
    end
    set flatref (echo $flat_refid | cut -d ' ' -f 2)
    echo "Flatpak found, installing…"
    flatpak install $flatref $flatid -y
end

