#!/bin/sh
#
# Deploy script to production
#

OPTIONS=--dry-run

if [ -n "$1" ] ; then
    echo "Going to do a destructive sync, press RETURN to continue..."
    OPTIONS=""
    read
fi

echo "Syncing files..."
rsync $OPTIONS -avz \
    --delete \
    --exclude 'deploy.sh' \
    --exclude '.git' \
    . mazira@spooky.mazira.io:/var/www/lurch-home-page/
