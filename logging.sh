# Utility functions
info() { echo "$(basename $0): $1" && echo "$(date +"%F %T") :: $1" >> $LOG; }
warn() { info "error: $1" 2>&1; }
die() { local st=$?; warn "$1"; [[ $2 ]] && exit $2 || exit $st; }
