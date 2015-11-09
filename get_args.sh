#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. "$DIR"/usage.sh

force=false;
verb=false;

while test $# -ne 0; do
  case "$1" in
    "--source")
      shift; src="$1";
      ;;
    "--dest")
      shift; dest="$1";
      ;;
    "--index")
      shift; index_path="$1";
      ;;
    "--help"|"-h")
      usage;
      exit 0;
      ;;
    "--force"|"-f")
      force=true;
      ;;
    "--verb"|"-v")
      verb=true;
      ;;
    *)
      echo "Unknown argument: $1";
      usage;
      exit 1;
      ;;
  esac
  shift
done

if [ "$src" = "" -o "$dest" = "" ]; then
  echo "Missing arguments";
  usage;
  exit 1;
fi
