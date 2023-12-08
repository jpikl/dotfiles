# shellcheck shell=sh

# Text encoding to UTF-8
alias win1250-utf8='iconv -f WINDOWS-1250 -t UTF-8'
alias latin2-utf8='iconv -f ISO-8859-2 -t UTF-8'

# Text encoding from UTF-8
alias utf8-win1250='iconv -f UTF-8 -t WINDOWS-1250'
alias utf8-win1250-i='iconv -f UTF-8 -t WINDOWS-1250//IGNORE'   # Ignore uknown chars
alias utf8-win1250-t='iconv -f UTF-8 -t WINDOWS-1250//TRANSLIT' # With transliteration
alias utf8-latin2='iconv -f UTF-8 -t ISO-8859-2'
