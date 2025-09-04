# bash-project

Dieses Bash-Projekt automatisiert die Erstellung von Benutzern auf einem Linux-System.  
Beim Start können die gewünschten Benutzernamen im Terminal eingegeben werden. Diese werden wenn nicht vorhanden anschliessend auf dem System erstellt.
Weiter wird für alle neu erstellten Benutzer das Standardpasswort **TEKO2025!** gesetzt.  
Beim **ersten Login** müssen die Benutzer ihr Passwort **zwangsläufig ändern**.  

Zusätzlich speichert das Skript eine Liste der erstellten Benutzer sowohl als Textdatei (`newusers.txt`)  
als auch als PDF (`newusers.pdf`).  


## Projektübersicht

| Datei                | Beschreibung                                                       |
|---------------------|---------------------------------------------------------------------|
| `create_users.sh`   | Erstellt Benutzer und erzeugt eine Benutzerliste als PDF           |
| `README.md`         | Diese Dokumentation und Anleitung                                  |


##  Voraussetzungen

- Linux mit Bash-Shell
- Root-Rechte (`sudo`)  
- Pakete: `enscript`, `ghostscript`  

**Hinweis:** Die Pakete `enscript`, `ghostscript` werden im Skript automatisch installiert, falls sie noch nicht vorhanden sind.


##  Verwendung

### 1. Github installieren (wenn noch nicht vorhanden)


    sudo apt update
    sudo apt install git -y


### 2. Github Repository klonen
in gewünschtes Verzeichnis wechseln und folgende Befehle ausführen:

    git clone https://github.com/jomabo1/bash-project.git
    cd bash-project


### 3. Skripte vorbereiten

  
    chmod +x create_users.sh


### 4. Benutzer erstellen, .txt- und .PDF File generieren


    ./create_users.sh



   #### 4.1 Du wirst aufgefordert, einen Speicherort einzugeben.  
Drückst du einfach **Enter**, wird `/tmp/bash-project` als Standard verwendet.

   #### 4.2 Danach wirst du nach den gewünschten Benutzernamen gefragt
Trage die gewünschten Benutzernamen mit Leerzeichen getrennt ein

   **Hinweis:**  Alle Benutzer erhalten das Standardpasswort `TEKO2025!`.  
    Beim **ersten Login** müssen sie ihr Passwort **zwangsläufig ändern**.
    
