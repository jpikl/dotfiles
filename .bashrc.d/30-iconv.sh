# shellcheck shell=bash

## Convert Windows-1250 to UTF-8
alias win1250-utf8='iconv --from-code=WINDOWS-1250 --to-code=UTF-8'

## Convert UTF-8 to Windows-1250
alias utf8-win1250='iconv --from-code=UTF-8 --to-code=WINDOWS-1250'
## Convert UTF-8 to Windows-1250 (ignore unknown characters)
alias utf8-win1250-i='iconv --from-code=UTF-8 --to-code=WINDOWS-1250//IGNORE'
## Convert UTF-8 to Windows-1250 (with transliteration)
alias utf8-win1250-t='iconv --from-code=UTF-8 --to-code=WINDOWS-1250//TRANSLIT'

## Convert ISO-88592 to UTF-8
alias iso88592-utf8='iconv --from-code=ISO-8859-2 --to-code=UTF-8'
## Convert UTF-8 to ISO-88592
alias utf8-iso88592='iconv --from-code=UTF-8 --to-code=ISO-8859-2'
