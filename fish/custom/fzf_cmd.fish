function ,o
    fzf --query="$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        open (cat /tmp/fzf_fish.last)
    end
end

function ,e
    fzf --query="$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        vim (cat /tmp/fzf_fish.last)
    end
end

function ,d
    find . -path '*/\.*' -prune -o -type d -print | \
    fzf --query="$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (cat /tmp/fzf_fish.last)
    end
end

function ,da
    find . -type d | \
    fzf --query="$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (cat /tmp/fzf_fish.last)
    end
end

function ,df
    fzf --query="$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (dirname (cat /tmp/fzf_fish.last))
    end
end

function ,kill
    ps -ef | sed 1d | fzf --query="$argv" --select-1 --exit-0 +m -x | awk '{print $2}' | xargs kill
end

function j
    cat $HOME/.z | sed "s/|.*//" | fzf --query "$argv" --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (cat /tmp/fzf_fish.last)
    end
end
