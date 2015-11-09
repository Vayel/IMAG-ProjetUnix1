#! /bin/sh

file1=toto.txt
file2=tutu.txt

# Ouverture des deux fichiers, sur les descripteurs de fichiers 3 et 4
exec 3> "$file1"
exec 4> "$file2"

# Écriture sur la stortie standard
echo "Écriture dans $file1 et $file2 ..."

# Écriture sur les descripteurs de fichiers 3 et 4 (i.e. dans $file1 et $file2)
echo "Introduction pour le premier fichier" >&3
echo "Introduction pour le deuxieme fichier" >&4

echo "Conclusion pour le premier fichier" >&3
echo "Conclusion pour le deuxieme fichier" >&4

echo 'Fini !'
