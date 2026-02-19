# -----------------------------------------------
# 🚀 Helmor's Custom Bashrc Dotfile
# -----------------------------------------------

# -----------------------------------------------
# 🎨 Custom Terminal Prompt
# -----------------------------------------------
# Colors
RESET="\[\e[0m\]"
BOLD="\[\e[1m\]"
GREEN="\[\e[32m\]"
CYAN="\[\e[36m\]"
YELLOW="\[\e[33m\]"
MAGENTA="\[\e[35m\]"
BLUE="\[\e[34m\]"

# Git branch in prompt
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

git_prompt() {
    local branch=$(parse_git_branch)
    if [ -n "$branch" ]; then
        echo " ($branch)"
    fi
}

# Prompt format: [helmor] ~/project (main) $
export PS1="${BOLD}${GREEN}[helmor]${RESET} ${CYAN}\w${RESET}${YELLOW}\$(git_prompt)${RESET} ${MAGENTA}\$${RESET} "

# -----------------------------------------------
# 📦 PATH Setup (pnpm + Composer)
# -----------------------------------------------
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Composer global binaries (Laravel installer, etc.)
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# -----------------------------------------------
# 🔧 Laravel & PHP Aliases
# -----------------------------------------------
# PHP Artisan
alias pa="php artisan"
alias pas="php artisan serve --host=0.0.0.0 --port=8000"
alias pam="php artisan migrate"
alias pamf="php artisan migrate:fresh"
alias pams="php artisan migrate:fresh --seed"
alias par="php artisan route:list"
alias pac="php artisan cache:clear && php artisan config:clear && php artisan view:clear"
alias paq="php artisan queue:work"
alias pat="php artisan tinker"

# Composer
alias ci="composer install"
alias cu="composer update"
alias cr="composer require"
alias cda="composer dump-autoload"

# Laravel new project
alias lnew="laravel new"

# -----------------------------------------------
# 📦 pnpm Aliases
# -----------------------------------------------
alias pi="pnpm install"
alias pa="pnpm add"
alias pd="pnpm run dev"
alias pb="pnpm run build"
alias pp="pnpm run preview"
alias px="pnpm dlx"

# -----------------------------------------------
# 🐙 Git Aliases
# -----------------------------------------------
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias glog="git log --oneline --graph --decorate"
alias gundo="git reset --soft HEAD~1"
alias gnuke="git reset --hard HEAD"

# Quick commit and push
gacp() {
    git add .
    git commit -m "$1"
    git push
}

# -----------------------------------------------
# 📁 Navigation Aliases
# -----------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -la"
alias la="ls -A"
alias cls="clear"
alias home="cd ~"

# -----------------------------------------------
# 🛠️ Utility Aliases
# -----------------------------------------------
alias reload="source ~/.bashrc && echo '✅ Bashrc reloaded!'"
alias myip="curl ifconfig.me"
alias ports="ss -tulnp"

# -----------------------------------------------
# 🎉 Welcome Message
# -----------------------------------------------
echo ""
echo "  👋 Welcome back, Helmor!"
echo "  🚀 Ready to build something awesome?"
echo ""
echo "  Quick commands:"
echo "  pas    → php artisan serve"
echo "  pams   → migrate:fresh --seed"
echo "  pd     → pnpm run dev"
echo "  gacp   → git add, commit & push (usage: gacp 'message')"
echo "  pac    → clear all Laravel caches"
echo ""
