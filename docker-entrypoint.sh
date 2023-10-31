#!/bin/sh

isCommand() {
  case "$1" in
    build|gh-deploy|new|serve) return 0 ;;
    *) return 1 ;;
  esac
}

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
  set -- mkdocs "$@"
# check if the first argument passed in is composer
elif [ "$1" = 'mkdocs' ]; then
  set -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- mkdocs "$@"
fi

exec "$@"
