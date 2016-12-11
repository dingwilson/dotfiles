# Homebrew PATH config
export PATH=/usr/local/bin:$PATH

# Add aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
