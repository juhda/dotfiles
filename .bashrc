if [ ! -f "$HOME/.vscode-extensions-installed" ]; then
    bash $HOME/.vscode/install.sh && touch "$HOME/.vscode-extensions-installed"
fi
