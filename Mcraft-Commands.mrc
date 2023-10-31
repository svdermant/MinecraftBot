;;;;;;;;;; McraftBot ;;;;;;;; Commands

;;;;;;;;;;;;;;;;;;;;; ServerSettings Auslesen ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
on 100:text:!server settings:%m-channel: {
  msg %m-channel  7,1[9▒7]  4→ $+ %f1 $+ M $+ %f2 $+ inecraft4← 9,1▬ %f1 $+ S $+ %f2 $+ erver %f1  $+ E $+ %f2 $+ instellungen 7[9▒7,1]
  var %s $lines(%mProp)
  var %x 2
  while (%x <= %s) {
    set % $+ $replace($read(%mProp, %x), =, $chr(32))
    inc %x
  } 
  serverresult
}
!
on 1:text:!todo:#: {
  msg %m-channel %head003 4→11M14inecraftBot4←  %head003 0,1 Serkons/tOuly/Socid $+ 's 7[9Derzeitige Aufgaben7] %head003 
  ! msg %m-channel  7,1[9▒7] 4->11M14inecraftBot4<- 7[9Derzeitige Aufgaben7]:9 $2- $+ 4.
  /play %m-channel todo.txt

}

;;;;;;;;;;;;;; Youtube ;;;;;;;;;;;;;;;
on *:text:!yt:%m-channel: {  msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11Y14outube 11C14hannel4:10 https://www.youtube.com/@igamerpg 7[9▒7,1] }
on *:text:!github:%m-channel: { msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11G14ithub4:10 https://github.com/svdermant/MinecraftBot 77[9▒7,1] }
on *:text:!twitch:%m-channel: {  msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11T14witch 11C14hannel4:10 https://twitch.tv/svdermand/ 7[9▒7,1] }
on *:text:!gh:%m-channel: { msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11G14ithub4:10 https://github.com/svdermant/MinecraftBot 77[9▒7,1] }

;;;;;;;;;;;;;; Stream + Topic ;;;;;;;;;;;;;;;
on *:text:!stream*:%m-channel: {
  if ($2 == $null)  { msg %m-channel 7,1[9▒7]4 11S14tream 11i14st 11j14etzt 9◄>[ 11ON14line 9]<►11 https://www.youtube.com/@igamerpg 7[9▒7,1] |  /halt }
  if ($2 != $null) {
    set %topic-m-channel  7,1[9▒7] 4->11M14inecraft4<- 7[9▒7]9 $2- $+ 4.0 Syncrone Live Map http://igamerpg.de:8123/ - Asyncrone Live Map http://igamerpg.de:8100/#world Mcraft Bot Actualisiert demnächst - Open Source : https://github.com/svdermant/MinecraftBot
    topic %m-channel %topic-m-channel
    /halt
  }
}

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

alias fm {
  set %text $addtok(%text,$1-,32)
  say %text
  set %n1 $numtok(%text,32)
  say Anzahl Tokens: %n1
  set %begin 0
  while (%begin <= %n1) {
    set %fletter $left($gettok(%text,%begin,32),1)
    set %letter 9 $+ %fletter $+ 
    say Anfangsbuchstabe %letter
    set %neutext $replace(%text,$left($gettok(%text,%begin,32),1),%letter)
    inc %begin
  }
  say %neutext
}

alias ct {
  return $regsubex($1-,/(?<= |^)(\S)/g,%c1\1 $+ %c2)
}

;;;;;; Say ;;;;;;;;;;;;;;;;;;

on *:text:!say*:%m-channel: {
  if (%serverstarted == no) { msg $chan 4Fehler: 12!say4 Funktioniert nicht im Offline Mode! | /halt }
  ;;/set -u15 %say 7[11N14ot 11S14ecure7] 0[11r14Con0] 9◄7[11 I14RC4-11C14HAT7 ]9►......
  /set -u15 %say [Not Secure] [Rcon]
  /timersays1 1 3 /msg %m-channel 7,1[9▒7] 11S14erver 11N14achricht4:7 7,1[4Broadcast7]9 $2- 7(3Abgeschickt7)
  ;;;/run rcon.exe -a localhost:25575 -p %rcon_password "say &8[&9IRC-CHAT&8] &1|&2[ $+ &3 $+ $nick $+ &2]&1| &7 $2-"
  /timersays2 1 3 /run rcon.exe -a localhost:25575 -p %rcon_password "say ◄►[ IRC-CHAT ]◄►  $nick  ◄► $2- "
  /timersays3 1 3 /msg $chan 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 0,1 14[11S10erver 11E10vent14] ◄►[ IRC-CHAT ]◄►  $nick  ◄► $2-
}
on *:text:!bday:%m-channel: {
  /timersays1 1 3 /msg %m-channel 7,1[9▒7] 11S14erver 11N14achricht4:7 7,1[4Broadcast7]9  11(3Abgeschickt11)
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  ♥ Herzlichen   "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 ♣ Glückwunsch ♣  "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  und Alles gute zum Geburtstag ♥ "
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7  Serkons aka. Kamerot  ☻"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 alles Liebe sowie Gesundheit und Erfolg  ☻"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 und ein glückliches und gesundes neues Lebensjahr"
  /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast &8[&9IRC-CHAT&8] &1|&2[  &2]&1| &7 Gruß dein Script Kollege ;)"
}


on 1:text:!lines:#: {
  /scriptlines
  msg $chan Aktuell besteht $me aus %scriptlines Scriptzeilen!
}

;;;; Hilfe für den Bot ;;;;;;;

on *:text:!help*:%m-channel: {
  if ($left($1,5) == !help) && ($2 == $null) { 
    msg %m-channel %head2 8----- 11H14elp 8------ 11S14eite 091 4/ 0944 8-------- %head2
    msg %m-channel %head2 04Vault7: 11V14ault 11B14efehle7:  %Head-2 $+ help vault %head2
    msg %m-channel %head2 04WorldGuard7: 11W14orldGuard 11B14efehle7:  %Head-2 $+ help WorldGuard %head2
    msg %m-channel %head2 04Protocollib7: 11P14rotocollib 11B14efehle7:  %Head-2 $+ help ProtocollIb %head2
    msg %m-channel %head2 04MythicLib7: 11M14ythicLibe 11B14efehle7:  %Head-2 $+ help MythicLib %head2
    msg %m-channel %head2 04Citizens7: 11C14itizens 11B14efehle7:  %Head-2 $+ help Citizens %head2
    msg %m-channel %head2 04MMoCore7: 11M14MOCore 11B14efehle7:  %Head-2 $+ help mmocore %head2
    msg %m-channel %head2 04Multiverse-Core7: 11M14ultiverse4-11C14ore 11B14efehle7:  %Head-2 $+ help Multiverse-Core %head2
    msg %m-channel %head2 04Essentials7: 11E14ssentials 11B14efehle7:  %Head-2 $+ help Essentials %head2
    msg %m-channel %head2 11A14chtung %head2 11D14ie 11O14benstehenden 11B14efehle 11d14ienen 11z14um 11S14teuern 11u14nd 11v14erwalten 11d14es 11M14inecraft 11S14ervers %head2
    msg %m-channel %head2 11U14m 11d14ie 0024. 11H14ilfseite 11e14inzublenden 11s14chreibe %Head-2 $+ help 2 %head2
    msg %m-channel %head2 11D14er 11B14ot 11h14at 11a14nsich 11n14och 11a14ndere 11B14efehle 11d14ie 11u14nter7:  %Head-2 $+ help bot 11z14u 11f14inden 11s14ind4. %head2
    halt
  }
  if ($left($1,5) == !help) && ($2 == vault) {
    msg %m-channel %head2 8----- 11H14elp 8------ 11S14eite 091 4/ 091 8--------  %head2 
    msg %m-channel %head2 %head-2 $+ vault info7: 11Z14eige 11I14nformationen 11ü14ber 11V14aul %head2 
    msg %m-channel %head2 %head-2 $+ vault-convert7: 11C14onvertiert 11a14lle 11D14aten 11v14on 11E14conomy1 11u14nd 11S14peichert 11s14ie 11i14n 11E14conomy2 %head2 
    halt
  }
  if ($left($1,5) == !help) && ($2 == Bot) {
    msg %m-channel %head2 11B14ot11B14efehle4:  %head2 
    msg %m-channel %head2 %head-2 $+ help bot %head2.2 $+ %head.Z $+ eigt 11d14iese 11H14ilfe 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ help %head2.2 $+ %head.Z $+ eigt 11d14ie 11A14llgemeine 11H14ilfe an4. %head2 
    msg %m-channel %head2 %head-2 $+ Todo %head2.2 $+ %head.T $+ odo 11L14iste 11A14ngzeigen4. %head2 
    msg %m-channel %head2 %head-2 $+ Server Settings %head2.2 $+ %head.z $+ eigt 11S14ervereinstellungen 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ yt %head2.2 $+ %head.y $+ outube 11C14hannel 11v14on 11I14game11RPG %head2 
    msg %m-channel %head2 %head-2 $+ playerlist %head2.2 $+ %head.Z $+ eigt 11S14pielerliste 11i14m 11C14hannel 11a14n %head2 
    msg %m-channel %head2 %head-2 $+ set <params> %head2.2 $+ %head.s $+ ervereinstellungen 11ä14ndern4. %head2 
    msg %m-channel %head2 %head-2 $+ recreate <name> %head2.2 $+ %head.L $+ öscht 11d14ie 11A14ngegeben 11M14inecraft 11W14elt %head2 
    msg %m-channel %head2 %head-2 $+ say <text> %head2.2 $+ %head.E $+ ine 11N14achricht 11a14n 11d14en 11M14inecraftServer 11S14enden4. %head2 
    msg %m-channel %head2 %head-2 $+ give %head2.2 $+ %head.G $+ egenstand 11G14eben4. %head2 
    msg %m-channel %head2 %head-2 $+ Spawnentity %head2.2 $+ %head.M $+ 11M14onster %head.E $+ rzeugen %head2 
    msg %m-channel %head2 %head-2 $+ Stop %head2.2 $+ %head.S $+ erver %head.S $+ toppen %head2 
    msg %m-channel %head2 %head-2 $+ start %head2.2 $+ %head.S $+ erver %head.S $+ tarten %head2 
    msg %m-channel %head2 %head-2 $+ slay <player> %head2.2 $+ %head.E $+ inen %head.S $+ pieler %head.S $+ chlagen %head2 
    msg %m-channel %head2 %head-2 $+ heal <player> %head2.2 $+ %head.E $+ inen 11s14pieler 11H14eilen %head2 
    msg %m-channel %head2 %head-2 $+ god <player> %head2.2 $+ %head.U $+ nsterblichkeit 11b14ei 11s14pieler 11A14ktivieren %head2 
    msg %m-channel %head2 %head-2 $+ ungod <player> %head2.2 $+ %head.E $+ nsterblichkeit 11b14ei %head.S $+ pieler 11d14eaktivieren %head2 
    msg %m-channel %head2 %head-2 $+ startlog <zeit> %head2.2 $+  %head.C $+ hatlog 11a14ktivieren 7(11B14ei 11z14eit 11e14ine 11z14eit 11i14n 4sec 11a14ngeben 11b14is 11m14aximal 09607) %head2 
    msg %m-channel %head2 %head-2 $+ stoplog <zeit> %head2.2 $+  %head.C $+ hatlog 11a14bschalten %head2 
    msg %m-channel %head2 %head-2 $+ playerlist %head2.2 $+  %head.Z $+ eigt 11D14ie %head.S $+ pielerliste 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ Zeitsteuerung %head2.2 $+  %head.S $+ yncronisiert %head.S $+ pielzeit 11m14it 11R14ealzeit %head2 
    msg %m-channel %head2 %head-2 $+ TPS %head2.2 $+ %head.Z $+ eigt 11d14ie 11T14icks 11P14er %head.S $+ ekunde 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ lag %head2.2 $+ %head.Z $+ eigt 11d14ie 11A14uslastung 11d14es %head.S $+ ervers 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ status %head2.2 $+ %head.Z $+ eigt 11d14en 11S14tatus 11d14es %head.S $+ ervers 11a14n4. %head2
    msg %m-channel %head2 %head-2 $+ clearlogs %head2.2 $+ %head.L $+ öscht 11d14en 11I14nhalt 11d14es %head.L $+ ogverzeichnisses 4. %head2 

  }
  if ($left($1,5) == !help) && ($2 == WorldGuard) && ($3 == $null) {
    msg %m-channel 8-----7 WorldGuard Help 8------ 7Seite 021 7/ 0228--------
    msg %m-channel 8Unterhalb sind die Worldguard Befehle:
    msg %m-channel 7 !allowfire [<world>] - Erlaubt die Feuerausbreitung Temporär
    msg %m-channel 7 !god <player> - Gottmode für Spieler ein/Auschalten.
    msg %m-channel 7 !halt-activity - Stoppt jegliche Bewegung auf den Server und Friert sie ein.
    msg %m-channel 7 !stopfire [<world>] - Feuerausbreitung deaktivieren
    msg %m-channel 7 !slay <player> - Einen Spieler Schlagen
    msg %m-channel 7 !heal <player> - Einen Spieler Heilen
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
    msg %m-channel 0Welt 7[0 $+  %world $+ 7]0 Existiert nicht. Feuerausbreitung kann nicht aktiviert werden.
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
  if ($2 != $null) { set %god on | set %p $2 | msg %m-channel Spieler $2 wird in den Godmode gesetz. | run rcon.exe -a localhost:25575 -p %rcon_password " god $2 " }
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
  if ($2 == list) && ($3 == -w) && ($4 !isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg  isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) { msg %m-channel Die Welt $4 Existiert nicht, kann keine Regionen finden. | /halt }
  if ($2 == list) && ($3 == -w) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg  isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) { 
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
  if ($2 == info) && ($3 != $null) && ($4 == -w) && (%wg isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($5 isin $finddir(%pfad, $+ $5 $+ *,1)) && (%serverstarted != $null) {
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
    if (%serverstarted == no) { /msg %m-channel  4FEHLER: Server ist nicht Online | /halt }
    var %world $4
    var %region $5

    if ($regcheck(%world,%region)) {
      set -u5 %regselect on
      set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
      /run rcon.exe -a localhost:25575 -p %rcon_password "region select -w $4 $5"
      /msg %m-channel Region wurde Selectiert. Worldguard fürt den Flag Befehl auf die Selectierte Region aus einmalig sofern vorhanden.
      /msg %m-channel Für mehrere Optionen muss die Region erneut selectiert werden.
      set %regionsid $5
      /halt
    }
    else { msg %m-channel 3[7WorldGuard3] 4FEHLER: Die Region $5 existiert nicht in der Welt $4 | halt }
  }
  if ($2 == flag) && ($3 == -w) && [%regionsid != $null) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1))  { 
    set %flag $5
    set %welt $4
    if ($flagcheck(%flag) == off) { 
      /msg %m-channel Flag %flag existiert nicht. Bitte verwende eine der Folgenden FLags:
      msg %m-channel %flaglist1
      msg %m-channel %flaglist2
      msg %m-channel %flaglist3
      msg %m-channel %flaglist4
      msg %m-channel %flaglist5
      /halt
    }
    if ($flagcheck(%flag) == on) { set %currentflag %flag 
      if (!%regionsid) && (%serverstarted == yes) { /msg %m-channel 4FEHLER:  Bitte selectiere zuerst eine Region mit: 8!region select -w weltname regionname | /halt }
      if (%serverstarted == no) { /msg %m-channel  4FEHLER:  Server ist nicht Online | /halt }
      set -u5 %flagset on
      ;;; Entry Flag
      if (%currentflag == entry) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag existiert
        set -u5 %tps3 3[7 Worldguard 3]12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  wurde zurückgesetzt.
        /unset %regionsid
        //run -ao rcon.exe -a localhost:25575 -p %rcon_password " wg reload "
        /halt
      }
      if (%currentflag == entry) && ($6- != $null)  {
        if ($6 == allow) {
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set -u5 %text $6
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set -u5 %text $6
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channl 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder Deny an. | /halt }
      }
      ;;; entry-deny-message Flag
      if (%currentflag == entry-deny-message) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == entry-deny-message) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        if (-w isin $left(%command, 15)) { set %text $6- }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      ;;; Greeting Flag
      if (%currentflag == greeting) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == greeting) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        ;;if (-w isin $left(%command, 15)) { set %text $6- }
        set %text $6-
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      ;;; Passthrough Flag
      if (%currentflag == passthrough) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == passthrough) && ($6- != $null)  {
        var %command $1- 
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Build Flag
      if (%currentflag == Build) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Build) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Inteact Flag
      if (%currentflag == Interact) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == Interact) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-break Flag
      if (%currentflag == block-break) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == block-break) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-place Flag
      if (%currentflag == block-place) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag ==  block-place) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Use Flag
      if (%currentflag == use) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag ==  use) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Damage Animals
      if (%currentflag == damage-animals) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag ==  damage-animals) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; ChestAccess Flag
      if (%currentflag == chest-access) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == chest-access) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;: ride flag
      if (%currentflag == ride ) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == ride) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; pvp flag
      if (%currentflag == pvp) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == pvp) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; flag
      if (%currentflag == sleep ) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == sleep) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Respawn-Anchors Flag
      if (%currentflag == respawn-anchors ) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == respawn-anchors) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      } 
      ;;; Respawn-Anchors Explode Flag
      if (%currentflag == respawn-anchor-explode) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == respawn-anchor-explode) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; tnt flag
      if (%currentflag == tnt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == tnt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; vehicle-place flag
      if (%currentflag == vehicle-place) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == vehicle-place) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; vehicle-destroy flag
      if (%currentflag == vehicle-destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag ==  vehicle-destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; lighter flag
      if (%currentflag == lighter) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == lighter) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-trampling
      if (%currentflag == block-trampling) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == block-trampling) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set %text $6 
          set -u3 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; frosted-ice-form
      if (%currentflag == frosted-ice-form) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == frosted-ice-form) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; item-frame-rotation
      if (%currentflag == item-frame-rotation) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == item-frame-rotation) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; firework-damage
      if (%currentflag == firework-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == firework-damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; use-anvil
      if (%currentflag == use-anvil) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == use-anvil) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; use-dripleaf
      if (%currentflag == use-dripleaf) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == use-dripleaf) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!          
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Creeper Explosion Flag
      if (%currentflag == creeper-explosion) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == creeper-explosion) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Enderdragopn-Block-damage flag
      if (%currentflag == enderdragon-block-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == enderdragon-block-damag) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ghast-FireBall
      if (%currentflag == ghast-fireball) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == ghast-fireball) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Other-Explosion flag
      if (%currentflag == other-explosion) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == other-explosion) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }      
      ;;; Neue Flags ;;;;      
      ;;; enderman-grief Flag
      if (%currentflag == enderman-grief) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == enderman-grief) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; snowman-trails flag
      if (%currentflag == snowman-trails) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == snowman-trails) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; ravager-grief Flag
      if (%currentflag == ravager-grief) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == ravager-grief) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Mob-Damage Flag
      if (%currentflag == Mob-Damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Mob-Damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Mob-Spawning FLag
      if (%currentflag == Mob-Spawning) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Mob-Spawning) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Deny-Spawn flag
      if (%currentflag == deny-spawn) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == deny-spawn) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %moblists piglinbrute.snowman.panda.bee.axolotl.zoglin.cow.furnaceminecart.pig.spawnerminecart.allay.skeleton.llama.mule.bat.husk.frog.hoglin.zombiehorse.rabbit.silverfish.zombievillager.giant.drowned.enderdragon.dolphin.elderguardian.stray.shulker.turtle.chestminecart.vex.salmon.goat.ocelot.endercrystal.horse.vindicator.glowsquid.phantom.minecart.experienceorb.evoker.warden.squid.parrot.creeper.cavespider.enderman.zombifiedpiglin.magmacube.tadpole.chicken.ravager.hopperminecart.donkey.witherskeleton.strayskeleton.fox.slime.pillager.blaze.piglin.chestboat.endermite.tropicalfish.cat.pigzombie.zombie.mushroomcow.irongolem.guardian.polarbear.traderllama.ghast.sheep.tntminecart.skeletonhorse.illusioner.pufferfish.wanderingtrader.amorstand.wolf.villager.boat.strider.witch.cod.spider.wither
        set %mobtype $6
        if ($chr(44) !isin $6) && ($7- != $null) { msg %m-channel Bitte Trenne mehrer Mobtypen mit einem Komma. (z.B: Creeper,cat,Spider) | /halt }
        if ($chr(44) !isin $6) { 
          if (%mobtype isin %moblists) {
            set %wgmoblist %mobtype
            set %com rg f %regionsid %currentflag -w %welt %wgmoblist
            //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
            msg %m-channel Hallo welt 
          }
        }
        if ($chr(44) !isin $6-) { msg %m-channel Bitte Trenne mehrer Mobtypen mit einem Komma. (z.B: Creeper,cat,Spider) | /halt }
        if ($chr(44) isin $6-) { 
          set %mobtokens $replace(%mobtype,$chr(44),.)
          set %mobnums $numtok(%mobtokens,46)
          while (%mobnums >= 0) {
            if ($istok(%moblists,$gettok(%mobtokens,%mobnums,46),46) == $true) { set %wgmoblisttrue $addtok(%wgmoblisttrue,$gettok(%mobtokens,%mobnums,46), 46) }
            if ($istok(%moblists,$gettok(%mobtokens,%mobnums,46),46) == $false) { set %wgmoblistfalse $addtok(%wgmoblistfalse,$gettok(%mobtokens,%mobnums,46), 46) }
            dec %mobnums
          }
          if (%wgmoblisttrue != $null) { set %wg-moblist $replace(%wgmoblisttrue,.,$chr(44)) 
            set %com rg f %regionsid %currentflag -w %welt %wg-moblist
            //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
            /unset %wg-moblist
            /unset %wgmoblisttrue
            //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
            /unset %regionsid
            /halt 
          }
          if (%wgmoblistfalse != $null) && (%wgmoblistfalse !isnum) { msg %m-channel Sorry in der liste %mobtokens gibt es Mobs die nicht im Spiel existieren. 
            msg %m-channel Vorhandene Mobs sind: %moblist 
            msg %m-channel  %moblist2 
            msg %m-channel  %moblist3 
            msg %m-channel  %moblist4 
            msg %m-channel  %moblist5 
            msg %m-channel %moblist6
            /unset %wgmoblistfalse
            /halt
          }
        }
        ;;; Muss Bleiben
      }
      ;;; Entity-painting-destroy Flag
      if (%currentflag == Entity-painting-destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Entity-painting-destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Entity-Item-Frame-Destroy Flag
      if (%currentflag == Entity-Item-Frame-Destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Entity-Item-Frame-Destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; WIther-Damage flag
      if (%currentflag == WIther-Damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == WIther-Damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;;;;;;;;;;;;;; Neue Flags ;;;;;;;;;;;;;;;;;;;;;;;
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;;; Lava-Fire Flag
      if (%currentflag == Lava-Fire) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Lava-Fire) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Lightning Flag
      if (%currentflag == Lightning) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Lightning) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Water Flow Flag
      if (%currentflag == water-flow) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == water-flow) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; lava Flow Flag
      if (%currentflag == lava-flow) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == lava-flow) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Snow Fall Flag
      if (%currentflag == snow-fall) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == snow-fall) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Snow Melt Flag
      if (%currentflag == snow-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == snow-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ice Form Flag
      if (%currentflag == ice-form) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == ice-form) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ice Melt Flag
      if (%currentflag == ice-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == ice-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Frosted Ice Melt Flag
      if (%currentflag == frosted-ice-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == frosted-ice-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; MushRoom Growth Flag
      if (%currentflag == mushroom-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == mushroom-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; leaf Decay Flag
      if (%currentflag == leaf-decay) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == leaf-decay) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; grass Growth Flag
      if (%currentflag == grass-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == grass-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; MyCelium Spread Flag
      if (%currentflag == mycelium-spread) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == mycelium-spread) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Vine-Growth Flag
      if (%currentflag == vine-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == vine-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Rock-Growth Flag
      if (%currentflag == rock-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == rock-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Sculk-Growth Flag
      if (%currentflag == sculk-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == sculk-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Crop Growth Flag
      if (%currentflag == crop-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == crop-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Soil Dry Flag
      if (%currentflag == soil-dry) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == soil-dry) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Coral-Fade Flag
      if (%currentflag == Coral-Fade) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == Coral-Fade) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u5 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }

      ;;; movement flags

      if (%currentflag == exit) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u5 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "com"
        /unset %regionsid
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /halt
      }
      if (%currentflag == exit) && ($6-!= $null) {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u5 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text allow
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "%com"
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 == deny) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u5 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text deny
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "%com"
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          /halt
        }
        if ($6 != allow) || ($6 != deny) { /msg %m-channel Falschen Eingabe. Gib bitte ein Allow oder Deny wert an. }
      }
    }
    if ($2 == flag) && ($3 != -w) && (%regionsid == $null) && ($4 !isin $finddir(%pfad, $+ $4 $+ *,1)) {
      msg %m-channel Die Welt $5 Existiert nicht. Indemfalle gibt es auch keine Region namens $3
      /halt
    }
    if ($2 == flag) && (%regionsid == $null) { msg %m-channel Falsche Eingabe folgende Parameter müssen angebeben werden. Beispiel: !region flag -w weltname flag werte.  Bitte Selectiere die region zuvor | /halt }
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
  if ($2 isnum) && ($2 >= 1) && ($2 <= 60) && ($findfile(%pfad $+ logs\, *.*, 0) == 0) { msg %m-channel Das Verzeichnis %pfad $+ logs\ enthält keine latest.log 4LOGGING ABGEBROCHEN! | /msg %m-channel Prüfe ob die Latest.log im Verezeichnis existiert. | msg %m-channel Falls nicht Starte den Server über !start und führe !startlog <zeit>  erneut aus! | /halt } 
  if ($2 isnum) && ($2 >= 1) && ($2 <= 60) && ($findfile(%pfad $+ logs\, *.*, 0) > 0) { 
    /timer.checklog1 0 $2 /checklog
    /set %warn 0
    /set %err 0
    /msg %m-channel Chatlog wird gestartet.
    /halt
  }
  else { msg %m-channel Die Sekunden dürfen nicht größer als 60s betragen } 
}

on 100:text:!clearlogs:%m-channel: {
  set %logfiles $findfile(%pfad $+ logs\, *.*, 0)
  set -u5 %clearlog on
  set -u5 %clearchan $chan
  if (%logfiles == 0) { msg %m-channel Keine Serverlogs gefunden die ich Löschen kann! | /halt }
  msg %m-channel %logfiles Serverlogs wirklich löschen? [ja) / [nein) (5 Sekunden Eingabezeit)
  timerclearlogs1 1 5 /clearedlogs
}

on 100:text:*:%clearchan: {
  if (%clearlog == on) && ($1 == ja) { /run cmd.exe /c DEL %pfad $+ logs\*.* /Q | /msg %m-channel Es wurden soeben %logfiles Logdateien Gelöscht! | /timerclearlogs1 off }
  if (%clearlog == on) && ($1 == nein) { /msg %m-channel Löschvorgang Abbgebrochen | /timerclearlogs1 off }
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
  set %serverstarted no
  set -u15 %stop on
  set %warn 0
  set %err 0
}

;;;;;;;;; Server Starten  ;;;;;;;;;;;;;
on 100:text:!start:%m-channel:{
  set %pid $rand(10000,99999) 
  set -u15 %start on
  set %serverstarted yes
  /set %warn 0
  /set %err 0
  //run -ap %pfad $+ start.bat
  /msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 wird 9Gestartet <►  7[9!7] 7,1[9BotPID: 08 $+ %pid $+ 07] 7[9!7] 7,1[9SystemPID: 08 $+ $spid $+ 07] 
  /timer.checkstarted1 0 3 /checkstarted
}

on 100:text:!status:%m-channel: { 
  if (%serverstarted == yes) && (%pid isnum) { msg %m-channel 9→11M14inecraft9← 11S14erver 9◄> 14ist 9ONLINE }
  if (%serverstarted == no) && (!%pid) { msg %m-channel 9→11M14inecraft9← 11S14erver 9◄>14 ist 4OFFLINE }
}

;;;;;;;;;;;;;; Spielerliste ;;;;;;;;;;;;;;;;;

on *:text:!playerlist:%m-channel: { 
  set -u10 %plisten on
  set -u5 %tps3 7,1[4-7] 11S14pieler 11L14iste 7[4-7]
  //run -ap %pfad $+ players.bat
  ;;;/timersenda1 1 2 /msg %m-channel 7,1[4-7] 11S14pieler 11L14iste 7[4-7]
  /timer.list1 1 1 /plist
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
  msg %m-channel Der Batchpfad wurde zu %pfad gesetzt.
}


;;; TPS Befehl ;;;;;

on *:text:!tps:%m-channel: { 
  set -u15 %tps on
  //run -ap %pfad $+ TPS.bat
  set -u5 %tps3 7,1[4-7] 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  timersay1 1 8 /tpsausgabe
}

;;;; Auslastungsabfrage ;;;;;

on *:text:!lag:%m-channel: {
  set %laglag on
  //run -ap %pfad $+ lag.bat
  set %lag $read(%pfad $+ lag.txt,l,2)
  set %lag1 $remove(%lag,§r)
  set %newlag $replace(%tps1,§6,$chr(3) $+ 7,§a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  set -u5 %tps3 7,1[4-7] 11S14peicher 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  /timer.lagausgabe1 1 2 /lagausgabe
}

on 100:text:!version:%m-channel: {
  /msg %m-channel  7,1[9▒7] 4→11M14inecraft4 11B14ot4 11V14ersion14,110 $ver 11,1C14odet 11b14y 11S14erkons4← 7[9▒7,1]
}

on 1:text:!ver:#Bot-Lounge: {
  /msg $chan  7,1[9▒7] 4→11M14inecraft4 11B14ot4 11V14ersion14,110 $ver 11,1C14odet 11b14y 11S14erkons4← 7[9▒7,1]
}
