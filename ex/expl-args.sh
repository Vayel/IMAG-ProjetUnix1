#! /bin/sh

usage () {
    cat << EOF
Utilisation: $(basename "$0") [options]
Options: --help          Ce message d'aide
         --file1 FILE    Choisir le premier fichier
         --file2 FILE    Choisir le deuxième fichier
EOF
}

while test $# -ne 0; do
    case "$1" in
        "--help"|"-h")
            usage
            exit 0
            ;;
        "--file1")
            shift; file1="$1"
            ;;
        "--file2")
            shift; file2="$1"
            ;;
        *)
            echo "Argument non reconnu : $1"
            usage
            exit 1
            ;;
    esac
    shift
done

if [ "$file1" = "" -o "$file2" = "" ]; then
    echo "Il manque un argument"
    usage; exit 1
fi

echo "file1=$file1"
echo "file2=$file2"
