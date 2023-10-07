# MinecraftBot
Ein Mircbot zum Verwalten eines Minecraft Servers<br>
Dieser läuft Aktuell mit der Spigot/PaperMC version 1.19.4

# Derzeigtige Aufgaben.
Aufgabe die abgeschlossen sind, sind mit einem Haken gekennzeichnet.
- [x] Fehler behoben der bei !region info auftrat
- [x] Fehler behoben bei !lag
- [x] Fehler behoben bei !tps
- [x] Weitere Worldguard Flags hinzugefügt (damage-animals, chestaccess, ride)
- [x] Weitere Worldguard Flags hinzugegifügt (pvp, sleep, respawn-anchors, respawn-anchor-explode, tnt, vehicle-destroy, vehicle-place, lighter)
- [x] Weitere Worldguard Flags hinzugefügt (block-trampling, frosted-ice-form, item-frame-rotation, firework-damage, use-anvil, use-dripleaf, creeper-explosion, enderdragon-block-damage, other-explosion, ghast-fireball)
- [x] Weitere Worldguard Flags hinzugefügt (enderman-grief, snowman-trails, ravager-grief, mob-damage, mob-spawning, deny-spawn, entity-painting-destroy, entity-item-frame-destroy, wither-damager)
- [x] Kleine Optiomierungen am !region select und am !region flag befehl
- [x] LogUpdate für Gelevelte Mobs
- [x] Startparameter (Prüft bei !region flag und !region select ob Server gestartet/offline)
- [ ] Movementflags für Worldguard Hinzufügen
- [ ] Komplettes Styleumstellung Anpassung an das Style vom GTA-Bot (Nicht bei github verfügbar)

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
5. Die Process.bat // Dient zur Ermittlung der PID
6. Die Tps.bat // Zeigt die TPS an
7. Die Vault-info.bat //Zeigt Vaul Infos an. (Wird vom Bot erstellt)


# Kommen wir zum Inhalt der Dateien
Die Start.bat sollte folgenden befehl beinhalten:
> java.exe -Xmx14G -Xms1G -Xms24576M -Xmx24576M -Dterminal.jline=false -Dterminal.ansi=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar -nogui

Die werte bei Xms und Xmx sind Ramangaben bitte an euren anpassen.

## Anmerk sollte euer Server nicht Local gehostet sein muss dort die IP anstelle von Localhost hin!

In der Lag bat ist bitte folgendes einzutragen:
> rcon.exe -a localhost:25575 -p rconpass "lag" > lag.txt

Ersetze bitte rconpass und port mit dem Passwort und port welcher in deiner Server.properties steht. Das rconpass sollte mit dem im Bot angegebenen übereinstimmen.

Der Inhalt der Players.bat sieht so aus:
> rcon.exe -a localhost:25575 -p rconpass "list" > help2.txt

Der Inhalt der Stop.bat:
> rcon.exe -a localhost:25575 -p rconpass "stop"

Der Inhalt der Process.bat
> @echo on </br>
for /f "tokens=2" %%a in ('tasklist^|find /i "java.exe"') do (set pid=%%a) </br>
echo %pid% > server.pid </br>

Der Inhalt der Tps.bat
> rcon.exe -a localhost:25575 -p rconpass "tps" > tps.txt

Alle genannten Batchdatein in den Serverordner packen und mittels !batchpfad <pfad> den Pfad zum Serverordner angeben.

# Wichtige Anmerkung zur SystemPID und Process.bat
Diese Batchdatei ermittelt die PID des Laufenden MinecraftServers.
Hierbei ist zu beachten das keine weiteren Javaanwendungen laufen sollten da sonst eine Andere PID angezeigt wird.

Ich habe diese Möglickeit eingebaut falls man den Bot mal über /taskkill /PID nummer stoppen will.
Ich rate davon aber ab. Ich empfehle den !stop Befehl oder den Server ingame via /stop zu beenden.
  
# Wichtige Anmerkung für Leute die den Respawn Anchor auch in der Oberwelt nutzbar haben wollen.
1. Gehe auf https://gitlab.com/schoentoon/respawn-anchors-worldguard und lade dir das Datapack und das Plugin runter
2. Entpacke das Datapack und kopiere den inhalt in deinen weltenordner die struktur sollte wie folgt sein: world/datapacks/respawn-anchors-worldguard/data/ 
3. Kopiere das Plugin in den Pluginordner 
4. Starte deinen MinecraftServer via Bot oder Manuell
5. Erstelle mit Worldedit und Worldguard eine Region
6. Setze dann folgende flags respawn-anchors auf allow und respawn-anchor-explode auf deny
7. wenn du /rg i regionname eintippst und beide flags sichtbar sind sollte der respawn anker in der Oberwelt funktionieren.
8. Falls nicht erstelle ein issue auf Github.  

# Ein dank geht an Folgende leute:
A Thanks to the following people that helped me to get any features..

1. Quims of (irc.swiftirc.net) he helps me to get & write data to a yml file.
2. SoCId mein Alter Script Kollege und Styler der auch mit am MinecraftBot arbeitet er übernimmt gegebenfalls bugfixes und Grafische Styles der Ausgaben von den Vorhandenen Befehlen.

# Derzeitige Einschränkungen des Bots:
Aufgrung der Funktionsweise des Clienten Mircs ist es mir nicht möglich gewisse Daten aus einer yml Datei zu lesen.
Der Grund daran ist das Mirc generell leerzeichen u.o einrückungen ignoriert und somit das Auslesen von gewissen Sectionen erschwert.
Ich habe hier auf https://forums.mirc.com/ubbthreads.php/topics/272085/feature-to-read-and-edit-yml-files#Post272085 <- Einen Vorschlag einer oder Mehrere funktionen gegeben bis heute keine
reaktion darauf erhalten.

Die Funktionsweise des Bots sollte aber dennoch gestattet sein sofern die yml datei keinen Einrückung oder Tabulatoren beinhalten.
Bitte respektiert die bisher investierte Zeit in die Programmierung des Bots.

# Information für Fragen und Probleme.
Der Bot wird derzeit auf dem Irc Netzwerk **irc.igamerpg.de** im Raum #Aygon-minecraft getestet und Entwickelt.<br>
Für diejenigen denen IRC unbekannt ist können uns auch über den [WebChat](https://igamerpg.de:4444/) erreichen.
Ebenfalls können dort auch Fragen Wünschen und Änderungen Vorgeschlagen werden.<br>
Aber Probleme die beim Betrieb des Bots auftreten sind bitte über Github zu melden.<br>
Erstellt dazu bitte ein Issue auf Github danke.
