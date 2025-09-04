#!/bin/bash

# Benutzerdefinierter Speicherpfad eintragen

read -p "Speicherpfad für Dateiausgabe eingeben [Standard: /tmp/bash-project]: " USER_INPUT
OUTPUT_DIR="${USER_INPUT:-/tmp/bash-project}"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$OUTPUT_DIR"
echo "Speicherort definiert: $OUTPUT_DIR"

# Benötigte Anwendungen installieren
echo "Benötigte Anwendungen werden installiert..."
sudo apt update
sudo apt install -y enscript ghostscript


# Gewünschte Benutzer Leerzeichen getrennt eingeben
echo "Bitte gib die gewünschten Benutzernamen mit Leerzeichen getrennt ein:"
read -a USERLIST

# Textdatei neu anlegen
> "$OUTPUT_DIR/newusers.txt"

# Benutzer erstellen
for USER in "${USERLIST[@]}"; do
    PASSWORD="TEKO2025!"

    if id "$USER" &>/dev/null; then
        echo "Benutzer $USER existiert bereits – wird übersprungen."
    else
        sudo useradd -m -s /bin/bash "$USER"
        echo "${USER}:${PASSWORD}" | sudo chpasswd
        sudo chage -d 0 "$USER"
        echo "$USER" >> "$OUTPUT_DIR/newusers.txt"
        echo "Benutzer $USER erstellt."
    fi
done

echo "Benutzerliste als Textdatei gespeichert in: $OUTPUT_DIR/newusers.txt"

# Textdatei in PDF umwandeln
echo "Wandle Textdatei in PDF um..."
enscript "$OUTPUT_DIR/newusers.txt" -B -q -p - | ps2pdf - "$OUTPUT_DIR/newusers.pdf"

echo "PDF Datei gespeichert unter: $OUTPUT_DIR/newusers.pdf"
