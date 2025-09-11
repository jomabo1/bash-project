#!/bin/bash

# =====================================
# Eingabe: Textdatei mit Benutzernamen
# =====================================
read -p "Bitte gib den Pfad zur Textdatei mit den Benutzernamen an: " USERFILE

if [ ! -f "$USERFILE" ]; then
    echo "Datei nicht gefunden: $USERFILE"
    exit 1
fi

# Zielverzeichnis für PDFs und Sammelliste
read -p "Bitte gib den Speicherpfad für die Ausgabe an [Standard: /tmp/bash-project]: " OUTPUT_DIR
OUTPUT_DIR="${OUTPUT_DIR:-/tmp/bash-project}"

mkdir -p "$OUTPUT_DIR"
echo "Speicherort gesetzt: $OUTPUT_DIR"

# =====================================
# Abhängigkeiten prüfen
# =====================================
echo "Prüfe Abhängigkeiten..."
sudo apt update
sudo apt install -y enscript ghostscript

# Standardpasswort
PASSWORD="TEKO2025!"

# Sammelliste für Benutzer & E-Mail (ohne Passwort)
LISTFILE="$OUTPUT_DIR/newusers.txt"
> "$LISTFILE"

# =====================================
# Benutzer erstellen und PDF generieren
# =====================================
while read -r USER; do
    # Leerzeilen überspringen
    [ -z "$USER" ] && continue

    EMAIL="${USER}@bashproject.ch"

    if id "$USER" &>/dev/null; then
        echo "Benutzer $USER existiert bereits – wird übersprungen."
    else
        # Benutzer erstellen
        sudo useradd -m -s /bin/bash "$USER"
        echo "${USER}:${PASSWORD}" | sudo chpasswd
        sudo chage -d 0 "$USER"
        echo "Benutzer $USER erstellt."
    fi

    # Zugangsdaten in eine temporäre Datei für Einzel-PDF schreiben
    TMPFILE=$(mktemp)
    cat <<EOT > "$TMPFILE"
Benutzername: $USER
Passwort: $PASSWORD
E-Mail: $EMAIL
EOT

    # PDF erstellen
    PDF_FILE="$OUTPUT_DIR/${USER}.pdf"
    enscript "$TMPFILE" -B -q -p - | ps2pdf - "$PDF_FILE"
    echo "PDF erstellt: $PDF_FILE"

    rm "$TMPFILE"

    # Benutzer & Mail in Sammelliste schreiben
    echo "Benutzername: $USER | E-Mail: $EMAIL" >> "$LISTFILE"

done < "$USERFILE"

echo "✅ Alle Benutzer verarbeitet."
echo "📄 Gesamtliste gespeichert unter: $LISTFILE"
