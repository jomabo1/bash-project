#!/bin/bash
# Löscht die Benutzer user01 bis user10, falls vorhanden
for i in $(seq -w 1 10); do
    USER="user${i}"
    
    # Nur löschen, wenn Benutzer existiert
    if id "$USER" &>/dev/null; then
        echo "Lösche Benutzer $USER ..."
        sudo userdel -r "$USER"
    else
        echo "Benutzer $USER existiert nicht – überspringe."
    fi
done

echo "Alle Benutzer aus den bash-project wurden gelöscht"
echo "Noch vorhandene Benutzer:"

awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd

