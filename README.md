# bash-project

Dieses Bash-Projekt automatisiert die Erstellung von 10 Benutzern auf einem Linux-System.  
Dabei wird für alle Benutzer (`user01` bis `user10`) ein Standardpasswort gesetzt (`TEKO2025!`).  
Beim **ersten Login** müssen die Benutzer ihr Passwort **zwangsläufig ändern**.  

Zusätzlich speichert das Skript eine Liste der erstellten Benutzer sowohl als Textdatei (`newusers.txt`)  
als auch als PDF (`newusers.pdf`).  
Ein zweites Skript dient dazu, alle erstellten Benutzer wieder zu löschen, sodass das System nach einem Test  
sauber bereinigt werden kann.

## Projektübersicht

| Datei                | Beschreibung                                                       |
|---------------------|---------------------------------------------------------------------|
| `create_users.sh`   | Erstellt Benutzer und erzeugt eine Benutzerliste als PDF           |
| `remove_users.sh`  | Löscht alle erstellten Benutzer von `create_users.sh`              |
| `README.md`         | Diese Dokumentation und Anleitung                                  |


##  Voraussetzungen

- Linux mit Bash-Shell  
- Root-Rechte (`sudo`)  
- Pakete: `enscript`, `ghostscript`  

**Hinweis:** Diese Pakete werden im Skript automatisch installiert, falls sie noch nicht vorhanden sind.


##  Verwendung

### 1. Skripte vorbereiten

  
    chmod +x create_users.sh
    chmod +x remove_users.sh.sh


### 2. Benutzer erstellen + PDF generieren


    sudo ./create_users.sh

 Du wirst aufgefordert, einen Speicherort einzugeben.  
    Drückst du einfach **Enter**, wird `/tmp/bash-project` als Standard verwendet.

   **Hinweis:**  Alle Benutzer `user01` bis `user10` erhalten das Standardpasswort `TEKO2025!`.  
    Beim **ersten Login** müssen sie ihr Passwort **zwangsläufig ändern**.
    
### 3. Benutzer löschen (zur Bereinigung nach Ende des Projekts)

    sudo ./remove_users.sh

     Dieses Skript löscht alle Benutzer `user01` bis `user10`  
    und zeigt danach die noch vorhandenen Benutzer


