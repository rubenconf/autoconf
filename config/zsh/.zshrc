THEME_PATH="$HOME/.config/zsh/themes/spaceship.omp.json"
if [ -f "$THEME_PATH" ]; then
    oh-my-posh init zsh --config "$THEME_PATH" | source
fi
