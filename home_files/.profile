DIRS=(
    "$HOME/scripts"
    "$HOME/.cargo/bin"
    "/usr/local/go/bin"
)

for dir in ${DIRS[@]}; do
    # add dir to path if not already in and dir exists
    if [[ $dir != *":$PATH:"* ]] && [ -d $dir ]; then
        PATH="$dir:$PATH"
    fi
done

