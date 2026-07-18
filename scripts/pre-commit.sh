#!/bin/sh
# GUI git clients (GitKraken, etc.) don't source ~/.zshrc, so nvm-managed
# node and the standalone pnpm install may be missing from PATH here even
# though they work from a terminal. Make them explicit.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
nvm use default >/dev/null 2>&1 || true
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PNPM_HOME/bin:$PATH"

pnpm lint-staged && pnpm typecheck
