# shellcheck shell=bash

## Backup list of albums in music directory
alias bakmusiclist='dirtree -ds $USER_MUSIC_DIR > $USER_BACKUP_DIR/music.txt'
