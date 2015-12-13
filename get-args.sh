#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

usage=`"$HERE"/usage.sh`
force=false
verb=false
index="index.html"

while test $# -ne 0; do
  case "$1" in
    "--source"|"-s")
      shift; src="$1";
      ;;
    "--dest"|"-d")
      shift; dest="$1";
      ;;
    "--index"|"-i")
      shift; index="$1";
      ;;
    "--help"|"-h")
      echo "$usage";
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
      echo "$usage";
      exit 1;
      ;;
  esac
  shift
done

if [ "$src" = "" -o "$dest" = "" ]; then
  echo "Missing arguments"
  echo "$usage"
  exit 1
fi
