#!/bin/bash
set -u

usage() {
  echo "Usage : $0 [-w] [title_name]" 1>&2
}

main () {
  cd $(cd $(dirname $0) && pwd)
  OPEN_EDITOR=0
  for ARG; do
    case "$ARG" in
      -*)
      while getopts w OPT "$ARG"; do
        case "$OPT" in
          w) OPEN_EDITOR=1;;
          *) usage; exit 1;;
        esac
      done
      ;;
    esac
  done

  shift $(expr $OPTIND - 1)
  [ $# -ne 1 ] && usage && exit 1

  slug="$1"
  date_string="$(date +"%Y-%m-%d")"
  file_name="posts/$(date +"%Y-%m-%d-%H-%M-%S")-${slug}.md"
  file_path="content/$file_name"
  if [ ! -e "$file_path" ]; then
    hugo new "$file_name"
#    sed -i '' "s/title: \".*\"/title: \"${date_string} ${slug}\"/g" "$file_path"
    sed -i '' "s/title: \".*\"/title: \"${slug}\"/g" "$file_path"
    sed -i '' "s/slug: \".*\"/slug: \"${slug}\"/g" "$file_path"
  else
    echo "$file_name already exists."
  fi

  [ $OPEN_EDITOR -eq 1 ] && atom "$file_path"

}
main "$@"
