# MinecraftBot
Ein Mircbot zum Verwalten eines Minecraft Servers<br>
Dieser läuft Aktuell mit der Spigot/PaperMC version 1.19.4

# Installation
1. Lade dir Zuerst die Software von www.mirc.com herunter und installiere es.
2. Downloade dann den Bot als Zip herunter oder Verwende git clone dazu...
3. Kopiere die Mirc.exe in das Entpackte Verzeichnisses des Bots.
4. Starte die Mirc.exe. Sollte alles Richtig verlaufen hilft dir der Bot bei der Ersteinrichtung.

# Weitere Setups für die Verwaltung des Minecraft Servers:

Damit der Bot auch richtig funktioniert sollten im Serverordner noch folgende Batchdateien erstellt werden.
und der Pfad zu diese sollte mittels !batchpfad befehl gesetzt werden.

1. Die Start.bat // Startet den Spigot/PaperMC Server
2. Die Lag.bat // Liest die Auslastung des Server und Postet sie. (Benötigt EssentialsX)
3. Die Players.bat // Die Players.bat Zeigt die Spielerliste an
4. Die Stop.bat // Stoppt den Server
5. Die Task.bat // Uberprüft ob der Server Läuft
6. Die Tps.bat // Zeigt die TPS an
7. Die Vault-info.bat //Zeigt Vaul Infos an. (Wird vom Bot erstellt)

# Kommen wir zum Inhalt der Dateien
Die Start.bat sollte folgenden befehl beinhalten:
> java.exe -Xmx14G -Xms1G -jar paper.jar -nogui
Die werte bei Xms und Xmx sind Ramangaben bitte an euren anpassen.

## Anmerk sollte euer Server nicht Local gehostet sein muss dort die IP anstelle von Localhost hin!

In der Lag bat ist bitte folgendes einzutragen:
> rcon.exe -a localhost:25575 -p rconpass "lag" > lag.txt

Ersetze bitte rconpass mit dem Passwort was in deiner Server.properties steht. Dies sollte mit dem rconpass im Bot übereinstimmen.

Der Inhalt der Players.bat sieht so aus:
> rcon.exe -a localhost:25575 -p rconpass "list" > help2.txt

Der Inhalt der Stop.bat:
> rcon.exe -a localhost:25575 -p rconpass "stop"

Der Inhalt der Task.bat
> tasklist > task.txt

Der Inhalt der Tps.bat
> rcon.exe -a localhost:25575 -p rconpass "tps" > tps.txt

Alle genannten Batchdatein in den Serverordner packen und mittels !batchpfad <pfad> den Pfad zum Serverordner angeben.
  
Der Bot hat die Version 1.0

Ein dank geht an Folgende leute:
A Thanks to the following people that helped me to get any features..

1. Quims of (irc.swiftirc.net) he helps me to get & write data to a yml file.
2. SoCid mein Alter Script Kollege und Styler der auch mit am MinecraftBot arbeitet er übernimmt gegebenfalls bugfixes und Grafische Styles der Ausgaben von den Vorhandenen Befehlen.

