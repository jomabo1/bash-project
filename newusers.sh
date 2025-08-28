#!/bin/bash

# =====================================
# Benutzerdefinierter Speicherpfad
# =====================================

read -p "Speicherpfad für Dateiausgabe eingeben [Standard: /tmp/bash-project]: " USER_INPUT
OUTPUT_DIR="${USER_INPUT:-/tmp/bash-project}"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$OUTPUT_DIR"
echo "Speicherort definiert: $OUTPUT_DIR"

# =====================================
# Abhängigkeiten prüfen
# =====================================
echo "Installiere benötigte Anwendungen"
sudo apt update
sudo apt install -y enscript ghostscript

# =====================================
# Textdatei vorbereiten
# =====================================
> "$OUTPUT_DIR/newusers.txt"

# =====================================
# Benutzer erstellen
# =====================================
echo "Erstelle Benutzer..."
for i in $(seq -w 1 10); do
    USER="user${i}"
    PASSWORD="TEKO2025!"

    # Nur erstellen, wenn Benutzer nicht existiert
    if id "$USER" &>/dev/null; then
        echo "Benutzer $USER existiert bereits – wird übersprungen."
    else
        sudo useradd -m -s /bin/bash "$USER"
        echo "${USER}:${PASSWORD}" | sudo chpasswd
        sudo chage -d 0 "$USER"
        echo "$USER" >> "$OUTPUT_DIR/newusers.txt"
    fi
done

echo "Benutzerliste gespeichert in: $OUTPUT_DIR/newusers.txt"

# =====================================
# Textdatei in PDF umwandeln
# =====================================
echo "Wandle Textdatei in PDF um..."
enscript "$OUTPUT_DIR/newusers.txt" -B -q -p - | ps2pdf - "$OUTPUT_DIR/newusers.pdf"

echo "PDF gespeichert unter: $OUTPUT_DIR/newusers.pdf"

Add Bash script to create 10 users and export to PDF
