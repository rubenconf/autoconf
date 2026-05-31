
link_config() {
    local source_dir="$1"
    local target_dir="$2"
    local user="$3"
    sudo -u "$user" mkdir -p "$target_dir"
    sudo -u "$user" ln -sf "$(pwd)/config/$source_dir"/* "$target_dir" 
    echo "Linked: $source_dir -> $target_dir"
}
