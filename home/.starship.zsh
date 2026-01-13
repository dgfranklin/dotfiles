# Starship prompt setup - cross-platform with auto-install fallback
# Installs to ~/.local/bin if not found and curl is available

_setup_starship() {
  local starship_bin=""

  # Check if starship is already in PATH
  if (( $+commands[starship] )); then
    starship_bin="starship"
  # Check common local install locations
  elif [[ -x "$HOME/.local/bin/starship" ]]; then
    starship_bin="$HOME/.local/bin/starship"
  elif [[ -x "$HOME/.cargo/bin/starship" ]]; then
    starship_bin="$HOME/.cargo/bin/starship"
  fi

  # If not found, attempt to install to ~/.local/bin
  if [[ -z "$starship_bin" ]] && (( $+commands[curl] )); then
    echo "Installing starship to ~/.local/bin..."
    mkdir -p "$HOME/.local/bin"
    if curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$HOME/.local/bin" --yes >/dev/null 2>&1; then
      starship_bin="$HOME/.local/bin/starship"
    fi
  fi

  # Initialize starship if available
  if [[ -n "$starship_bin" && -x "$starship_bin" ]]; then
    # Ensure ~/.local/bin is in PATH if that's where starship is
    [[ "$starship_bin" == "$HOME/.local/bin/starship" ]] && path=("$HOME/.local/bin" $path)
    eval "$($starship_bin init zsh)"
    return 0
  fi
  return 1
}

_setup_starship
