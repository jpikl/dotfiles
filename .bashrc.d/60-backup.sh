# shellcheck shell=bash

## Backup list of albums in music directory
alias bakmusiclist='dirtree -ds $MUSIC_DIR > $BACKUP_DIR/music.txt'
