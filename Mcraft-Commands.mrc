;;;;;;;;;; McraftBot ;;;;;;;; Commands

;;;;;;;;;;;;;;;;;;;;; ServerSettings Auslesen ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
on 100:text:!server settings:%m-channel: {
  msg %m-channel  7,1[9▒7]  4→11M14inecraft4← 9,1▬ 11S14erver 11E14instellungen 7[9▒7,1]
  var %s 2
  while (%s <= 59) {
    inc %s
    set %settings $+ . $+ %s $read -l $+ %s %mProp
  } 
  serverresult
}

;;;;;;;;;;;;;; Youtube ;;;;;;;;;;;;;;;
on *:text:!yt:%m-channel: { msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11Y14outube 11C14hannel4:10 https://www.youtube.com/@igamerpg 7[9▒7,1] }

;;;;;;;;;; Servereinstellungen ändern (!set) ;;;;;;;;;;;;;;

on 100:text:!set*:%m-channel: {
  set %value $2
  set %v $3
  if (%value == $null) { msg %m-channel 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Fehler: Parameter fehlen. Gültige einstellwerte sind: 8 %valid-settings | halt }
  if (%value !isin %valid-settings) { msg $chan  msg $chan 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Fehler: Keine Parameter und Optionen angegeben. Folgende können genutzt werden: %valid-settings }
  if (%value isin %num-settings) && (%v isnum) { 
    msg %m-channel: 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Einstellungen werden vorgenommen. Server muss eventuell Neugestartet werden.
    /write -l1 %mProp [Settings]
    /timer.write1 1 3 /writeini %mProp Settings %value %v
    /timer.write2 1 3 /write -l1 %mProp #Minecraft Servereinstellungen 
    /timer.write3 1 3 /write -il2 %mProp #Minecraft By Serkons
    halt 
  }
  if (%value isin %num-settings) && (%v !isnum) { msg $chan 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Fehler: Bitte gib eine Zahl an aber keine Negative Zahl | halt }
  if (%value isin %true-false-settings) && (%value != level-type) && (%v == true) || (%v == false)  { 
    msg %m-channel 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Einstellungen werden vorgenommen. Server muss eventuell Neugestartet werden.
    /write -l1 %mProp [Settings]
    /timer.write1 1 3 /writeini %mProp Settings %value %v
    /timer.write2 1 3 /write -l1 %mProp #Minecraft Servereinstellungen 
    /timer.write3 1 3 /write -il2 %mProp #Minecraft By Serkons
    halt  
  }
  if (%value isin %true-false-settings) && (%value == level-type) && (%v == normal) || (%v == flat)  { 
    msg %m-channel 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Einstellungen werden vorgenommen. Server muss eventuell Neugestartet werden.
    /write -l1 %mProp [Settings]
    /timer.write1 1 3 /writeini %mProp Settings %value minecraft\: $+ %v
    /timer.write2 1 3 /write -l1 %mProp #Minecraft Servereinstellungen 
    /timer.write3 1 3 /write -il2 %mProp #Minecraft By Serkons
    halt  
  }
  if (%value isin %true-false-settings) && (%value == level-name) && (%v != $null)  { 
    msg %m-channel 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Einstellungen werden vorgenommen. Server muss eventuell Neugestartet werden.
    /write -l1 %mProp [Settings]
    /timer.write1 1 3 /writeini %mProp Settings %value %v
    /timer.write2 1 3 /write -l1 %mProp #Minecraft Servereinstellungen 
    /timer.write3 1 3 /write -il2 %mProp #Minecraft By Serkons
    halt  
  }
  if (%value isin %true-false-settings) && (%v != true) || (%v != false) { msg $chan 7,1[9▒7] 11I14game11RPG 4→11M14inecraft4← 7[9▒7,1]0,1 7,1[9▒7] 4 Fehler: Bitte setze den Wert true oder false. (Achtung bei !set level-type ist bitte Normal oder flat anzugeben.) | halt }

}

;;;;;;;;;;;;;; Welten Löschen ;;;;;;;;;;;;;;;;;;;;;;;;;;

on 100:text:!recreate*:%m-channel: {
  set %dir $2
  /run task.bat
  /timer.weri1 1 2 /write -l1 task.txt Ausgabedatei
  /timer1.1 1 2 /ausgabe
}

;;;;;; Say ;;;;;;;;;;;;;;;;;;

on *:text:!say*:%m-channel: {
  /timersays1 1 3 /msg %m-channel 7,1[9▒7] 11S14erver 11N14achricht4:7 7,1[4Broadcast7]9 $2- 11(3Abgeschickt11)
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[ $+ &3 $+ $nick $+ &2]&1| &7 $2-"
}
on *:text:!bday:%m-channel: {
  /timersays1 1 3 /msg %m-channel 7,1[9▒7] 11S14erver 11N14achricht4:7 7,1[4Broadcast7]9  11(3Abgeschickt11)
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  ♥ Herzlichen   "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 ♣ Glückwunsch ♣  "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  und Alles gute Geburtstag ♥ "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  Serkons aka. Kamerot  ☻"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 alles Liebe sowie Gesundheit und Erfolg  ☻"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 und ein glückliches und gesundes neues Lebensjahr"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 Gruß dein Script Kollege ;)"
}


on *:text:!lines:%m-channel: {
  /scriptlines
  msg %m-channel Aktuell besteht $me aus %scriptlines Scriptzeilen!
}

;;;; Hilfe für den Bot ;;;;;;;

on *:text:!help*:%m-channel: {
  if ($left($1,5) == !help) && ($2 == $null) { 
    msg %m-channel 8-----7 Help 8------ 7Seite 021 7/ 02448--------
    msg %m-channel 04Vault: Vault Befehle: !help vault
    msg %m-channel 04WorldGuard: WorldGuard Befehle: !help WorldGuard
    msg %m-channel 04Protocollib: Protocollib Befehle: !help ProtocollIb
    msg %m-channel 04MythicLib: MythicLibe Befehle: !help MythicLib
    msg %m-channel 04Citizens: Citizens Befehle: !help Citizens
    msg %m-channel 04MMoCore: MMOCore Befehle: !help mmocore
    msg %m-channel 04Multiverse-Core: Multiverse-Core Befehle: !help Multiverse-Core
    msg %m-channel 04Essentials: Essentials Befehle: !help Essentials
    msg %m-channel 08Achtung: 7Die Obenstehenden Befehle dienen zum Steuern und verwalten des Minecraft Servers
    msg %m-channel 8 Um die 2. Hilfseite einzublenden schreibe 7!help 2
    msg %m-channel 7Der Bot hat ansich noch andere Befehle die unter:!help bot7 zu finden sind.
    halt
  }
  if ($left($1,5) == !help) && ($2 == vault) {
    msg %m-channel 8-----7 Help 8------ 7Seite 021 7/ 0218--------
    msg %m-channel 7!vault info: Zeige Informationen über Vaul
    msg %m-channel 7!vault convert: Convertiert alle Daten von Economy1 und Speichert sie in Economy2
    halt
  }
  if ($left($1,5) == !help) && ($2 == Bot) {
    msg %m-channel BotBefehle: 
    msg %m-channel 8!help bot-3Zeigt diese Hilfe an.
    msg %m-channel 8!help-3Zeigt die Allgemeine Hilfe an.
    msg %m-channel 8!Server Settings-3Zeigt Servereinstellungen an.
    msg %m-channel 8!yt-3Youtube Channel von IgameRPG
    msg %m-channel 8!set <params>-3Servereinstellungen ändern.
    msg %m-channel 8!recreate <name>-3Löscht die Angegeben Minecraft Welt
    msg %m-channel 8!say <text>-3Eine Nachricht an den MinecraftServer Senden.
    msg %m-channel 8!give-3Gegenstand Geben.
    msg %m-channel 8!Spawnentity-3Monster Erzeugen
    msg %m-channel 8!help bot-3Zeigt diese Hilfe an.
    msg %m-channel 8!Stop-3Server Stoppen
    msg %m-channel 8!start-3Server Starten
    msg %m-channel 8!playerlist-3Zeigt Die Spielerliste an.
    msg %m-channel 8!Zeitsteuerung-3Syncronisiert Spielzeit mit Realzeit
    msg %m-channel 8!TPS-3Zeigt die Ticks Per Sekunde an.
    msg %m-channel 8!lag-3Zeigt die Auslastung des Servers an.
  }
  if ($left($1,5) == !help) && ($2 == WorldGuard) && ($3 == $null) {
    msg %m-channel 8-----7 WorldGuard Help 8------ 7Seite 021 7/ 0228--------
    msg %m-channel 8Unterhalb sind die Worldguard Befehle:
    msg %m-channel 7 !allowfire [<world>] - Erlaubt die Feuerausbreitung Temporär
    msg %m-channel 7 !halt-activity - Stoppt jegliche Bewegung auf den Server und Friert sie ein.
    msg %m-channel 7 !stopfire [<world>] - Feuerausbreitung deaktivieren
    msg %m-channel 7 !slay <player> - Einen Spieler Schlagen
    msg %m-channel 7 !heal <player> - Einen Spieler Heilen
    msg %m-channel 7 !god <player> - Gottmode für Spieler ein/Auschalten.
    msg %m-channel 8 Um die 2. Hilfseite einzublenden schreibe 7!help Worldguard 2
    haltdef
  }
  if ($left($1,5) == !help) && ($2 == WorldGuard) && ($3 == 2) {
    msg %m-channel 8-----7 WorldGuard Help 8------ 7Seite 022 7/ 0228--------
    msg %m-channel 7 !region - Verwaltung und einstellungsparameter für eine Region.
    msg %m-channel 7 !locate - Lokaliesiert BIome/POi/Strukturen
    msg %m-channel 7 !Worldguard - Weitere Befehle zu Worldguard
  }
}


;;;; Worldguard Befehle ;;;;;;

on 100:text:!allowfire*:%m-channel: {
  var %world $2
  if ($2 == $null) { msg %m-channel Fehler: Bitte gebe einen Weltnamen an | halt }
  if (%world isin $finddir($mircdir, $+ %world  $+ *,1)) { 
    msg %m-channel Welt existiert. Feuerausbreitung wird Aktiviert.
    run rcon.exe -a localhost:25575 -p %rcon_password " allowfire %world "
    halt 
  }
  else {
    msg %m-channel Welt %world Existiert nicht. Feuerausbreitung kann nicht aktiviert werden.
    halt
  }
}

on 100:text:!stopfire*:%m-channel: {
  var %world $2
  if ($2 == $null) { msg %m-channel Fehler: Bitte gebe einen Weltnamen an | halt }
  if (%world isin $finddir($mircdir, $+ %world  $+ *,1)) { 
    msg %m-channel Welt existiert. Feuerausbreitung wird Deaktiviert.
    run rcon.exe -a localhost:25575 -p %rcon_password " stopfire %world "
    halt 
  }
  else {
    msg %m-channel Welt %world Existiert nicht. Feuerausbreitung kann nicht deaktiviert werden.
    halt
  }
}

on 100:text:!slay*:%m-channel: {
  if ($2 == $null) { msg %m-channel Gib bitte einen Spielernamen an | halt }
  if ($2 != $null) { msg %m-channel Spieler $2 wird geschlagen. | run rcon.exe -a localhost:25575 -p %rcon_password " slay $2 " }
}

on 100:text:!heal*:%m-channel: {
  if ($2 == $null) { msg %m-channel Gib bitte einen Spielernamen an | halt }
  if ($2 != $null) { msg %m-channel Spieler $2 wird geheilt. | run rcon.exe -a localhost:25575 -p %rcon_password " heal $2 " }
}

on 100:text:!god*:%m-channel: {
  if ($2 == $null) { msg %m-channel Gib bitte einen Spielernamen an | halt }
  if ($2 != $null) { msg %m-channel Spieler $2 wird in den Godmode gesetz. | run rcon.exe -a localhost:25575 -p %rcon_password " god $2 " }
}

on 100:text:!ungod*:%m-channel: {
  if ($2 == $null) { msg %m-channel Gib bitte einen Spielernamen an | halt }
  if ($2 != $null) { msg %m-channel Spieler $2 wird der Godmode entfernt | run rcon.exe -a localhost:25575 -p %rcon_password " god $2 " }
}

on 100:text:!halt-activity*:%m-channel: {
  if ($2 == $null) { msg %m-channel Dadurch wird Jedes Tier auf den Server und Jeder Mob entfernt und es können auch keine neuen erscheinen.
    msg %m-channel Dieser Befehl ist bitte nur dann zu verwenden sollte die Auslastung (TPS) des Servers sich unter 17 befinden.
    msg %m-channel Damit jegliche Aktivität gestoppt wird schreibe bitte 8!halt-activity confirm.
    halt
  }
  if ($2 == confirm) { 

    msg %m-channel 04ACHTUNG!! Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server Eingefroren!.
    run rcon.exe -a localhost:25575 -p %rcon_password "broadcast §4ACHTUNG!!§r Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server Eingefroren!."
    run rcon.exe -a localhost:25575 -p %rcon_password "halt-activity confirm"
  }
}

on 100:text:!stoplag*:%m-channel: {
  if ($2 == $null) { msg %m-channel Dadurch wird jegliche Bewegungsart wieder Reaktiviert.
    msg %m-channel Dieser Befehl ist bitte nur dann zu verwenden sollte die Auslastung (TPS) des Servers sich wieder bei 20 TPS befinden.
    msg %m-channel Damit jegliche Aktivität reaktiviert wird schreibe bitte 8!stoplag -c.
    halt
  }
  if ($2 == -c) { 

    msg %m-channel 04ACHTUNG!! Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server wieder Zugelassen!.
    run rcon.exe -a localhost:25575 -p %rcon_password "broadcast §4ACHTUNG!!§r Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server wieder Zugelassen!."
    run rcon.exe -a localhost:25575 -p %rcon_password "stoplag -c"
  }
}

on 100:text:!region*:%m-channel: {
  if ($2 == $null) { msg %m-channel Bitte nutze für diesen Befehl noch einen der Unterbefehle: select|flag|migrateuuid|migrateheights|setpriority|teleport|save|flags|addowner|list|removeowner|remove|addmember|redefine|removemember|load|define|claim|toggle-bypass|setparent|info|migratedb }
  if ($2 == list) && ($3 == $null) { msg %m-channel Bitte gib eine Welt mittels -w Parameter an | halt }
  if ($2 == list) && ($3 == -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == list) && ($3 != -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == list) && ($3 == -w) && ($4 isin $finddir($mircdir, $+ $4 $+ *,1)) { 

    write regionlist.bat rcon.exe -a localhost:25575 -p %rcon_password "rg list -w $4" > regionlist.txt
    /timer.regionlist1 1 2 /run regionlist.bat
    /timer.regionlist2 1 4 /play %m-channel regionlist.txt
    ;;/timer.regionlist3 1 10 /remove regionlist.txt
    ;;/timer.regionlist4 1 10 /remove regionlist.bat
    halt


  }
}



;;;;;;;;; !give Command ;;;;;;;;;;;;;;;

on 100:text:!give*:%m-channel: {
  if ($left($1,5) == !give) && ($2 == $null) {
    msg %m-channel 14(give) - Einen Spieler einen Gegenstand geben:
    msg %m-channel 8!give <player> <item> 14[amount] 7Gibt dem Gewünschten Spieler 64 oder die (Angegebene Megen) des angegebenen Gegenstandes.
    msg %m-channel 8!give <player> <item> <amount> <meta> 7 Spieler 64 oder die (Angegebene Megen) des angegebenen Gegenstandes 
    msg %m-channel 7mit den angegebenen Metadaten
  }
  else {
    if ($2- != $null) {
      var %com $remove($1-,!)
      set -u5 %command 7,1[4-7] 11S14erver 11B14efehl4:7 %com 11(3Abgeschickt11)
      /run rcon.exe -a localhost:25575 -p %rcon_password " %com "
    }
  }
}

;;;;;;;; !spawnentity command ;;;;;;;;;;;;;;;

on 100:text:!spawnentity*:%m-channel: {
  if ($left($1,12) == !spawnentity) && ($2 == $null) || ($3 == $null) {
    msg %m-channel 14(spawnentity) - Erschaffe einen Mob
    msg %m-channel !spawnentity 8<mob>[:data]14 [amount] [player]7 - Spawnt einen (oder die angegebene Menge) des angegebenen Mobs an Ihrem Standort (oder einem anderen Spieler, falls angegeben).
    msg %m-channel !spawnentity 8<mob>[:data],14<mount>[:data] [amount] [player]7 - Spawnt einen (oder die angegebene Anzahl) des angegebenen Mobs, der auf dem angegebenen Mob an Ihrem Standort (oder einem anderen Spieler, falls angegeben) reitet.
    msg %m-channel Mobliste: 8 %moblist
    msg %m-channel 8 %moblist2
    msg %m-channel 8 %moblist3
    msg %m-channel 8 %moblist4
    msg %m-channel 8 %moblist5
    msg %m-channel 8 %moblist6
  }
  else {
    if ($2- != $null) {
      var %com $remove($1-,!)
      set -u5 %command 7,1[4-7] 11S14erver 11B14efehl4:7 %com 11(3Abgeschickt11)
      /run rcon.exe -a localhost:25575 -p %rcon_password " %com "
    }
  }
}

on *:text:!vault info:%m-channel: {
  write vault-info.bat rcon.exe -a localhost:25575 -p %rcon_password "vault-info" > vault-info.txt
  /timer.run1 1 5 /run vault-info.bat
  /timer.run2 1 7 /play %m-channel vault-info.txt
  /timer.delete1 1 10 /remove vault-info.txt
  /timer.delete2 1 10 /remove vault-info.bat
}

on 100:text:!vault-convert*:%m-channel:  {
  if ($2 == $null) { msg %m-channel Du must ein Economy Plugin Angeben von dessen du die Währung in ein Anderes Konvertieren möchtest }
  if ($1 == .vault-convert) && ($3 != $null) { 
    set %econ1 $2
    set %econ2 $3
    write vault-info.bat rcon.exe -a localhost:25575 -p %rcon_password "vault-info" > vault-info.txt
    /timer.run1 1 3 /run vault-info.bat
    /timer.run2 1 5 /vault-ausgabe
    /timer.delete1 1 10 /remove vault-info.txt
    /timer.delete2 1 10 /remove vault-info.bat
    /halt
  }
  if ($2 isletter) { msg $chan Du must ein Economy Plugin Angeben von dessen du die Währung in ein Anderes Konvertieren möchtest }
}

;;;;;;;;; Server Stoppen ;;;;;;;;;;;;;
on 100:text:!stop:%m-channel:{
  msg %m-channel 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 wird 4Gestopt <►  7[4!7]
  run -a stop.bat 
}
;;;;;;;;; Server Starten  ;;;;;;;;;;;;;
on 100:text:!start:%m-channel:{
  msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 wird 9Gestartet <►  7[9!7]
  run start.bat
}

;;;;;;;;;;;;;; Spielerliste ;;;;;;;;;;;;;;;;;

on *:text:!playerlist:%m-channel: { 
  run -a players.bat
  /timersenda1 1 2 /msg %m-channel 7,1[4-7] 11S14pieler 11L14iste 7[4-7]
  set %plist $read -l1 help2.txt
  set %players $read -l2 help2.txt
  set %c1 $chr(3)
  set %plist2 $replace(%plist, There are, Es sind 4, of a max of, von, players online, Spieler im Spiel)
  set %plist3 $replace(%plist, §6, %c1 $+ 7, §4, %c1 $+ 5, §c, %c1 $+ 41, §f, %c1 $+ 0, §r, $chr(3))
  set %players1 $replace(%players, §6default§r:, 4(7Standard4))
  set %playerlist1 3Gruppe: $replace(%players1, §6, %c1 $+ 7, §4, %c1 $+ 5, §c, %c1 $+ 41, §f, %c1 $+ 0, §r, $chr(3))
  timersend1 1 4 /msg %m-channel %plist3
  timersenda2 1 5 /msg %m-channel %playerlist1
  timerwait2 1 8 /remove help2.txt
}

;;;;;;;;;;;;;;; Zeitsteuerung ;;;;;;;;;;;;;;;;;;;;;;;;;
on 100:text:!Zeitsteuerung:%m-channel: {
  set %zeit tag
  /timer.nacht1 1 11 /zeitsteuerung-tag
  /msg %m-channel In 10 Sec wird die Zeit zurückgesetzt.
  /timer.nacht2 1 10 /run rcon.exe -a localhost:25575 -p %rcon_password "day"
}

;; Für Ingame Einstellung ;;;;;
[18:32:06] <&McraftBot> ct day 780s worldname
[18:32:30] <&McraftBot> ct night 420s worldname
;;

;;; Plugin Bluemap benötigt ;;;;;

on 100:text:!mapupdate:%m-channel: {

  msg %m-channel 4Achtung in ca. 10-15 Sekunden folgt ein Update der Karten. 
  msg %m-channel Zu finden auf auf: http://igamerpg.de:8100
  msg %m-channel 4Achtung Alle Veränderungen die Währen dieser Zeit gemacht werden sind nicht ersichtlich.
  msg %m-channel Die Dauer des Updates ist nicht vorhersehbar es hängt davon ab wieviele chunks neu berechnet werden müssen.
  msg %m-channel Sofern dies Abgeschlossen ist sind alle änderungen Sichtbar.
  /timer.mapupdate1 1 $rand(10,15) run rcon.exe -a localhost:25575 -p %rcon_password "save-all flush"


}

;;; TPS Befehl ;;;;;

on *:text:!tps:%m-channel: { 
  run -a TPS.bat
  set -u5 %tps3 7,1[4-7] 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  set %tps $read -l1 tps.txt
  set %tps1 $remove(%tps,§r)
  set %newtag $replace(%tps1,§6,$chr(3) $+ 7,§a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  timersay1 1 5 /msg %m-channel 0,1 %newtag  %tagresult
  timerdeletetps1 1 8 /remove tps.txt
}

;;;; Auslastungsabfrage ;;;;;

on *:text:!lag:%m-channel: {
  run -a lag.bat
  set -u5 %tps3 7,1[4-7] 11S14peicher 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  ;;msg %m-channel %tps3
  /timer.lagausgabe1 1 5 /lagausgabe
}
