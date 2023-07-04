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
  var %value $2
  var %v $3
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
  //run -ap %pfad $+ task.bat
  /timer.weri1 1 2 /write -l1 %pfad $+ task.txt Ausgabedatei
  /timer1.1 1 2 /ausgabe
}

;;;;;; Say ;;;;;;;;;;;;;;;;;;

on *:text:!say*:%m-channel: {
  /timersays1 1 3 /msg %m-channel 7,1[9▒7] 11S14erver 11N14achricht4:7 7,1[4Broadcast7]9 $2- 11(3Abgeschickt11)
  /run rcon.exe -a localhost:25575 -p %rcon_password "say &8[&9IRC-CHAT&8] &1|&2[ $+ &3 $+ $nick $+ &2]&1| &7 $2-"
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
    msg %m-channel 8!Stop-3Server Stoppen
    msg %m-channel 8!start-3Server Starten
    msg %m-channel 8!slay <player>-3Einen Spieler Schlagen
    msg %m-channel 8!heal <player>-3Einen spieler Heilen
    msg %m-channel 8!god <player>-3Unsterblichkeit bei spieler Aktivieren
    msg %m-channel 8!ungod <player>-3Unsterblichkeit bei Spieler deaktivieren
    msg %m-channel 8!startlog <zeit>-3Chatlog aktivieren (Bei zeit eine zeit in sec angeben bis maximal 60)
    msg %m-channel 8!stoplog <zeit>-3Chatlog abschalten
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
    run rcon.exe -a localhost:25575 -p %rcon_password "broadcast @4ACHTUNG!!@r Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server Eingefroren!."
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
    run rcon.exe -a localhost:25575 -p %rcon_password "broadcast @4ACHTUNG!!@r Jegliches Lebewesen und jegliche Bewegung etc wird auf den Gesamten Server wieder Zugelassen!."
    run rcon.exe -a localhost:25575 -p %rcon_password "stoplag -c"
  }
}

on 100:text:!region*:%m-channel: {
  var %wg WorldGuard
  if ($2 == $null) { msg %m-channel Bitte nutze für diesen Befehl noch einen der Unterbefehle: select|flag|migrateuuid|migrateheights|setpriority|teleport|save|flags|addowner|removeowner|remove|addmember|redefine|removemember|load|define|claim|toggle-bypass|setparent|info|migratedb }
  if ($2 == list) && ($3 == $null) { msg %m-channel Bitte gib eine Welt mittels -w Parameter an | halt }
  if ($2 == list) && ($3 == -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == list) && ($3 != -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == list) && ($3 == -w) && ($4 isin $finddir($mircdir, $+ $4 $+ *,1)) && (%wg  isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) { 
    var %regionlist1 $getallYml(%pfad $+ \plugins\WorldGuard\worlds\ $+ $4 $+ \regions.yml,regions)
    if (%regionlist1 == $null) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 Die Welt $4 hat derzeit Keine Regionen 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 | /halt }
    if (%regionlist1 != $null) {
      var %maxregions $numtok(%regionlist1,32)
      var %x = 1
      msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 Die Welt $4 hat folgende Regionen:
      while (%maxregions >= %x) { 
        msg %m-channel 7,1[8►7] $gettok(%regionlist1,%x,32)
        inc %x
      }
    }
  }
  ;;;; Region Info;;;;;;;;
  if ($2 == info) && ($3 == $null) { msg %m-channel Bitte gib eine Region an. | halt }
  if ($2 == info) && ($3 != $null) && ($4 == -w) && (%wg isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($5 !isin $finddir(%pfad, $+ $5 $+ *,1)) { msg %m-channel Welt $5 existiert nicht und somit konnte $3 nicht gefunden werden. | /halt }
  if ($2 == info) && ($3 != $null) && ($4 == -w) && (%wg isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($5 isin $finddir(%pfad, $+ $5 $+ *,1)) {
    set %world $5
    set %region $3
    set %regcheck $regcheck(%world,%region) 
    if (%regcheck) && ($4 == -w) && (%world isin $finddir(%pfad, $+ %world $+ *,1)) { 
      ;;;msg $chan region %region existiert
      set %params $getAllYml(%pfad $+ \plugins\WorldGuard\worlds\ $+ %world $+ \regions.yml,regions,%region)
      msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 Information über Region %region 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]
      set %maxparams $numtok(%params,32)
      var %i = 1
      var %h $chr(3) $+ 0,1
      while (%maxparams >= %i) { 
        msg $chan 7,1[8►7]0,1 $gettok(%params,%i,32) $+ :  $replace($getAllYml(%pfad $+ \plugins\WorldGuard\worlds\ $+ %world $+ \regions.yml,regions,%region). [ $+ [ $gettok(%params,%i,32) ] ], istder,ist der,allow,4allow $+ %h,global, 13global $+ %h) 
        inc %i
      }
    }
    if (!%regcheck) && ($4 == -w) && (%world isin $finddir(%pfad, $+ %world $+ *,1)) { msg %m-channel region %region existiert nicht | /halt }
  }
  ;;; Region select

  if ($2 == select) && ($3 == $null) { /msg %m-channel Region bitte selectieren mit 8!region select -w weltname id | / halt }
  if ($2 == select) && ($3 == -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == select) && ($3 != -w) && ($4 == $null) { msg %m-channel Es wurde kein Wert für den -w Parameter angegeben | halt }
  if ($2 == select) && ($3 == -w) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg !isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) { /msg %m-channel Die Welt existiert, aber das Plugin Worldguard fehlt, installiere es nach. | /halt } 
  if ($2 == select) && ($3 == -w) && ($4 !isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) { /msg %m-channel Die Welt fehlt konnte keine regionen finden. | /halt }
  if ($2 == select) && ($3 == -w) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg  isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($5 == $null) { /msg %m-channel Es wurde keine Region angegeben | / halt }
  if ($2 == select) && ($3 == -w) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg  isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($5 != $null) { 
    var %world $4
    var %region $5

    if ($regcheck(%world,%region)) {
      /run rcon.exe -a localhost:25575 -p %rcon_password "region select -w $4 $5"
      /msg %m-channel Region wurde Selectiert. Worldguard fürt den Flag Befehl auf die Selectierte Region aus einmalig sofern vorhanden.
      /msg %m-channel Für mehrere Optionen muss die Region erneut selectiert werden.
      set %regionsid $5
      /halt
    }
    else { msg %m-channel Die Region $5 existiert nicht in der Welt $4 | halt }
  }
  if ($2 == flag) && ($3 == -w) && [%regionsid != $null) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1))  { 
    set %flag $5
    set %welt $4
    if ($istok(%flaglist1,%flag,46) == $true) || ($istok(%flaglist2,%flag,46) == $true) || ($istok(%flaglist3,%flag,46) == $true)  || ($istok(%flaglist4,%flag,46) == $true) || ($istok(%flaglist5,%flag,46) ==  $true) {
      /msg %m-channel Flag %flag existiert.  
      var %currentflag %flag
      ;;; Greeting Flag
      if (%currentflag == greeting) && ($6- == $null) {
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Greeting wurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == greeting) && ($6- != $null)  {
        var %command $1- 
        if (-w isin $left(%command, 15)) { set %text $6- }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Greeting wurde auf ( $+ %text $+ ) gesetzt.
        ;;;/unset %regionsid
        /halt
      }
      ;;; Passthrough Flag
      if (%currentflag == passthrough) && ($6- == $null) {
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel passthrough wurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == passthrough) && ($6- != $null)  {
        var %command $1- 
        if ($6 == allow) { set %text $6 }
        if ($6 == deny) { set %text $6 }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel passthrough wurde auf ( $+ %text $+ ) gesetzt.
        ;;;/unset %regionsid
        /halt
      }
      ;;; Build Flag
      if (%currentflag == Build) && ($6- == $null) {
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Build wurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == Build) && ($6- != $null)  {
        if ($6 == allow) { set %text $6 }
        if ($6 == deny) { set %text $6 }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Build wurde auf ( $+ %text $+ ) gesetzt.
        ;;;/unset %regionsid
        /halt
      }
      ;;; Inteact Flag
      if (%currentflag == Interact) && ($6- == $null) {
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Interactwurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == Interact) && ($6- != $null)  {
        if ($6 == allow) { set %text $6 }
        if ($6 == deny) { set %text $6 }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel Interact wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        /halt
      }

    }
    if ($istok(%flaglist1,%flag,46) == $false) || ($istok(%flaglist2,%flag,46) ==  $false) || ($istok(%flaglist3,%flag,46) ==  $false)  || ($istok(%flaglist4,%flag,46) ==  $false) || ($istok(%flaglist5,%flag,46) ==  $false) {
      /msg %m-channel Flag %flag existiert nicht. Bitte verwende eine der Folgenden FLags:
      msg %m-channel %flaglist1
      msg %m-channel %flaglist2
      msg %m-channel %flaglist3
      msg %m-channel %flaglist4
      msg %m-channel %flaglist5
    }
  }
  if ($2 == flag) && ($3 != -w) && (%regionsid == $null) && ($4 !isin $finddir(%pfad, $+ $4 $+ *,1)) {
    msg %m-channel Die Welt $5 Existiert nicht. Indemfalle gibt es auch keine Region namens $3
    /halt
  }
  if ($2 == flag) && (%regionsid == $null) { msg %m-channel Falsche Eingabe folgende Parameter müssen angebeben werden. Beispiel: !region flag -w weltname flag werte.  Bitte Selectiere die region zuvor| /halt }
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

;;; My Stuff
on 100:text:!regexist*:%m-channel: {
  var %world $2
  var %region $3
  ;do you understand how it's working? with the else? yes
  if ($regcheck(%world,%region)) { msg %m-channel region %region existiert }
  else { msg %m-channel region %region existiert nicht! }
}

;;;;; Some Stuff from Quims

on 100:text:!regcheck*:#: {
  var %world $2
  var %region $3
  var -s %file %pfad $+ plugins\WorldGuard\worlds\ $+ %world $+ \regions.yml
  set -s %regionlist $getallyml(%file,regions)
  if ($istok(%regionlist,%region,32)) { msg #support region %region exists }
  else { msg $chan region %region does'nt exist }
}

on *:text:!regset*:#: {
  var %world $2
  var %region $3
  var %member $4
  var %value $5
  var  %file %pfad $+ plugins\WorldGuard\worlds\ $+ %world $+ \regions.yml
  var %regionlist $getallyml(%file,regions)
  if (!$istok(%regionlist,%region,32)) { 
    write $qt(%file) $str(@,4) $+ $3: $+ $crlf $+ $str(@,8) $+ $4: $5
    convert@tospace %file
  }
  else noop $setallyml(%file,regions, %region,$5). [ $+ [ $4 ] ]
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
  write %pfad $+ vault-info.bat rcon.exe -a localhost:25575 -p %rcon_password "vault-info" > vault-info.txt
  /timer.run1 1 5 //run -ap %pfad $+ vault-info.bat
  /timer.run2 1 7 /play %m-channel %pfad $+ vault-info.txt
  /timer.delete1 1 10 /remove %pfad $+ vault-info.txt
  /timer.delete2 1 10 /remove %pfad $+ vault-info.bat
}

on 100:text:!vault-convert*:%m-channel:  {
  if ($2 == $null) { msg %m-channel Du must ein Economy Plugin Angeben von dessen du die Währung in ein Anderes Konvertieren möchtest }
  if ($1 == !vault-convert) && ($3 != $null) { 
    var %econ1 $2
    var %econ2 $3
    write %pfad $+ vault-info.bat rcon.exe -a localhost:25575 -p %rcon_password "vault-info" > vault-info.txt
    /timer.run1 1 3 //run -ap %pfad $+ vault-info.bat
    /timer.run2 1 5 /vault-ausgabe
    /timer.delete1 1 10 /remove %pfad $+ vault-info.txt
    /timer.delete2 1 10 /remove %pfad $+ vault-info.bat
    /halt
  }
  if ($2 isletter) { msg $chan Du must ein Economy Plugin Angeben von dessen du die Währung in ein Anderes Konvertieren möchtest }
}

on 100:text:!startlog*:%m-channel: {
  if ($2 !isnum) { msg %m-channel Eingabefehler um das Logging zu aktivieren Schreibe bitte: !startlog <zeit> hierbei | /msg %m-channel Hierbei darf <zeit> eine Zahl von 1s bis 60s betragen und nicht darüber | /halt }
  if ($2 isnum) && ($2 >= 1) && ($2 <= 60) { 
    /timer.checklog1 0 $2 /checklog
    /msg %m-channel Chatlog wird gestartet.
    /halt
  }
  else { msg %m-channel Die Sekunden dürfen nicht größer als 60s betragen } 
}

on 100:text:!stoplog:%m-channel: {
  set %ti 0
  set %maxtimer $timer(0)
  while (%maxtimer  >= %ti) {
    if ($timer(%maxtimer).type == online) && ($timer(%maxtimer)name == .checklog1) && ($timer(%maxtimer).com == /checklog) {
      msg %m-channel Timer aktiv
      msg %m-channel Logging wird gestoppt 
      /timer $+ $timer(%maxtimer)name off
    }
    dec %maxtimer
  }
}

;;;;;;;;; Server Stoppen ;;;;;;;;;;;;;
on 100:text:!stop:%m-channel:{
  msg %m-channel 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 wird 4Gestopt <►  7[4!7]
  //run -ap %pfad $+ stop.bat
}
;;;;;;;;; Server Starten  ;;;;;;;;;;;;;
on 100:text:!start:%m-channel:{
  msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 wird 9Gestartet <►  7[9!7]
  //run -ap %pfad $+ start.bat
}

;;;;;;;;;;;;;; Spielerliste ;;;;;;;;;;;;;;;;;

on *:text:!playerlist:%m-channel: { 
  //run -ap %pfad $+ players.bat
  /timersenda1 1 2 /msg %m-channel 7,1[4-7] 11S14pieler 11L14iste 7[4-7]
  var %plist $read(%pfad $+ help2.txt,l,1)
  var %players $read(%pfad $+ help2.txt,l,2)
  var %c1 $chr(3)
  var %plist2 $replace(%plist, There are, Es sind 4, of a max of, von, players online, Spieler im Spiel)
  var %plist3 $replace(%plist, @6, %c1 $+ 7, @4, %c1 $+ 5, @c, %c1 $+ 41, @f, %c1 $+ 0, @r, $chr(3))
  var %players1 $replace(%players, @6default@r:, 4(7Standard4), @6@7[@6Owner@7]@r@r:, 14[7Owner14])
  var %playerlist1 3Gruppe: $replace(%players1, @6, %c1 $+ 7, @4, %c1 $+ 5, @c, %c1 $+ 41, @f, %c1 $+ 0, @r, $chr(3))
  timersend1 1 4 /msg %m-channel %plist3
  if (%players1 != $null) { /timersend2 1 5 /msg %m-channel %playerlist1 }
  timerwait2 1 8 /remove %pfad $+ help2.txt
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

;;; Batchbefehl ;;;;;

on 100:text:!batchpfad*:%m-channel: {
  if ($2 == $null) { msg %m-channel Bitte gebe den Pfad zu allen Batchdateien an diese sollten sich im MinecraftSerververzeichniss befinden }
  set %pfad $2-
}

;;; TPS Befehl ;;;;;

on *:text:!tps:%m-channel: { 
  //run -ap %pfad $+ TPS.bat
  set -u5 %tps3 7,1[4-7] 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  set %tps $read(%pfad $+ tps.txt,l,1)
  set %tps1 $remove(%tps,@r)
  set %newtag $replace(%tps1,@6,$chr(3) $+ 7,@a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  timersay1 1 5 /msg %m-channel 0,1 %newtag  %tagresult
  timerdeletetps1 1 8 /remove %pfad $+ tps.txt
}

;;;; Auslastungsabfrage ;;;;;

on *:text:!lag:%m-channel: {
  //run -a %pfad $+ lag.bat
  set -u5 %tps3 7,1[4-7] 11S14peicher 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  /timer.lagausgabe1 1 5 /lagausgabe
}
