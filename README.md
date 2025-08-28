# bash-project
Dieses Bash-Projekt automatisiert die Erstellung von 10 Benutzern auf einem Linux-System, speichert die Benutzerliste in einer Textdatei und wandelt diese in eine PDF-Datei um.
Zusätzlich gibt es ein Aufräumskript, das die erstellten Benutzer wieder löscht.

## Projektübersicht

| Datei                | Beschreibung                                                       |
|---------------------|---------------------------------------------------------------------|
| `create_users.sh`   | Erstellt Benutzer und erzeugt eine Benutzerliste als PDF           |
| `cleanup_users.sh`  | Löscht alle erstellten Benutzer von `create_users.sh`              |
| `README.md`         | Diese Dokumentation und Anleitung                                  |


##  Voraussetzungen

- Linux mit Bash-Shell  
- Root-Rechte (`sudo`)  
- Pakete: `enscript`, `ghostscript`  

**Hinweis:** Diese Pakete werden im Skript automatisch installiert, falls sie noch nicht vorhanden sind.


##  Verwendung

### 1. Skripte vorbereiten

```bash
chmod +x create_users.sh
chmod +x cleanup_users.sh
