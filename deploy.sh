#!/bin/bash
# ZenBots deployment script
# Pushes website files to web hosting via SFTP

REMOTE_USER="futurepr"
REMOTE_HOST="hosting05.layerip.com"
REMOTE_PATH="/home/futurepr/zentrading.ai"
LOCAL_PATH="$HOME/Desktop/zen-trading/ZenBots"
SSH_KEY="$HOME/.ssh/zenbots_github"

echo "Deploying ZenBots website..."

rsync -avz --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude 'deploy.sh' \
  -e "ssh -i $SSH_KEY" \
  "$LOCAL_PATH/" \
  "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/"

echo "Deployment complete!"
