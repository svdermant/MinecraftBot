;;;;;; MinecraftBot ;;;;;;;; V1.1b
;;;;;; Author: Serkons
;;;;;; Githubname: Svdermant
;;;;;; GithubRepo: https://github.com/svdermant/MinecraftBot/
;;;;;; Erstellungsdatum: 11. Juni . 2023

;; ==== McraftBot ====
;; Einleitung:
;; Ein Mircbot zum Verwalten und Steuern eines MinecraftServers ab version 1.19.4 
;;
;; Befehle
;; !help 

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

;;;;;;;;;;;;;;;;;;;;; Todo Liste Anzeigen ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
on 1:text:!todo:#: {
  msg %m-channel %head003 4→11M14inecraftBot4←  %head003 0,1 Serkons/tOuly/Socid $+ 's 7[9Derzeitige Aufgaben7] %head003 
  ! msg %m-channel  7,1[9▒7] 4->11M14inecraftBot4<- 7[9Derzeitige Aufgaben7]:9 $2- $+ 4.
  /play %m-channel todo.txt

}

;;;;;;;;;;;;;; Youtube Befehle ;;;;;;;;;;;;;;;
on *:text:!yt:%m-channel: {  msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11Y14outube 11C14hannel4:10 https://www.youtube.com/@igamerpg 7[9▒7,1] }
on *:text:!github:%m-channel: { msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11G14ithub4:10 https://github.com/svdermant/MinecraftBot 77[9▒7,1] }
on *:text:!twitch:%m-channel: {  msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11T14witch 11C14hannel4:10 https://twitch.tv/svdermand/ 7[9▒7,1] }
on *:text:!gh:%m-channel: { msg %m-channel  7,1[9▒7] 11I14game11RPG4.14de 9,1▬ 11G14ithub4:10 https://github.com/svdermant/MinecraftBot 77[9▒7,1] }

;;;;;;;;;;;;;; Stream + Topic Befehl ;;;;;;;;;;;;;;;
on *:text:!stream*:%m-channel: {
  set %orginaltopic 7,1[9▒7]4 11W14illkommen im %m-channel - Syncrone Live Map http://igamerpg.de:8123/ - Asyncrone Live Map http://igamerpg.de:8100/#world Mcraft Bot Aktualisiert demnächst - Open Source : https://github.com/svdermant/MinecraftBot 7,1[9▒7]4
  if ($2 == $null)  { msg %m-channel %offlinemsg %onlinemsg /halt }
  if ($2 != $null) && ($2 == online) {
    if ($3 == $null) { msg %m-channel 4,1STREAM FEHLER:12,1 Kein Twitchthema für den Stream gesetzt. | msg %m-channel 12,1 Setze den Stream wie folgt: 7,1 !stream online <text> | /halt }  
    if ($3 != $null) { 
      msg %m-channel 7,1[9▒7]4 11S14tream 11i14st 11j14etzt 9◄>[ 11ON14line 9]<►11 https://twitch.tv/svdermand/ 7[9▒7,1] 11T14hema: 7 $+ $3- 
      set %onlinemsg 7,1[9▒7]4 11S14tream 11i14st 11j14etzt 9◄>[ 11ON14line 9]<►11 https://twitch.tv/svdermand/ 7[9▒7,1] 11T14hema: 7 $+ $3- 
      unset %offlinemsg
      msg %b-Channel  7,1[9▒7] 4-> 7#11M14inecraft 4<- 7,1[9▒7] 11T14opic 11N14ews:
      msg %b-channel 7,1[9▒7]4 11S14tream 11i14st 11j14etzt 9◄>[ 11ON14line 9]<►11 https://twitch.tv/svdermand/ 7[9▒7,1] 11T14hema: 7 $+ $3- 
      topic %m-channel 7,1[9▒7]4 11S14tream 11i14st 11j14etzt 9◄>[ 11ON14line 9]<►11 https://twitch.tv/svdermand/ 7[9▒7,1] 11T14hema: 7 $+ $3- 
      /halt
    }
  }
  if ($2 != $null) && ($2 == offline)  {
    set %orginaltopic 7,1[9▒7]4 11W14illkommen im %m-channel - Syncrone Live Map http://igamerpg.de:8123/ - Asyncrone Live Map http://igamerpg.de:8100/#world Mcraft Bot Aktualisiert demnächst - Open Source : https://github.com/svdermant/MinecraftBot 7,1[9▒7]4
    msg %m-channel 7,1[9▒7] 4->11T14witch-11S14tream4<- 7[9▒7]11I14st 11OFF14line 7,1[9▒7]4 
    topic %m-channel %orginaltopic
    set %offlinemsg 7,1[9▒7] 4->11T14witch-11S14tream4<- 7[9▒7]11I14st 11OFF14line 7,1[9▒7]4 
    unset %onlinemsg
    msg %b-Channel  7,1[9▒7] 4-> 7#11M14inecraft 4<- 7,1[9▒7] 11T14opic 11N14ews: 7,1[9▒7] 4->11T14witch-11S14tream4<- 7[9▒7]11I14st 11OFF14line 7,1[9▒7]4 
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

;;;;;; Say (Servernachricht Verschicken) ;;;;;;;;;;;;;;;;;;

on *:text:!say*:%m-channel: {
  if (%serverstarted == no) { msg $chan 4Fehler: 12!say4 Funktioniert nicht im Offline Mode! | /halt }
  ;;/set -u15 %say 7[11N14ot 11S14ecure7] 0[11r14Con0] 9◄7[11 I14RC4-11C14HAT7 ]9►......
  /set -u20 %say [Not Secure] [Rcon]
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

alias mwts {
  if (days isin $1-) { return days }
  if (wks isin $1-) { return wks }
  if (hrs isin $1-) { return hrs }
  if (mins isin $1-) { return mins }
  if (secs isin $1-) { return secs }
}

alias mwts1 {
  if (days isin $1-) { return %f1 T %f2 age }
  if (wks isin $1-) { return %f1 W %f2 ochen }
  if (hrs isin $1-) { return %f1 S %f2 tunden }
  if (mins isin $1-) { return %f1 M %f2 inuten }
  if (secs isin $1-) { return %f1 S %f2 Sekunden }
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
    msg %m-channel %head2 %head-2 $+ mctodo add/del/fertig/fixed %head2.2 $+ %head.T $+ odo 11L14iste 11B14earbeiten4. %head2 
    msg %m-channel %head2 %head-2 $+ Server Settings %head2.2 $+ %head.z $+ eigt 11S14ervereinstellungen 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ yt %head2.2 $+ %head.y $+ outube 11C14hannel 11v14on 11I14game11RPG %head2 
    msg %m-channel %head2 %head-2 $+ gh %head2.2 $+ %head.G $+ ithub Repo von 11S14vdermant %head2
    msg %m-channel %head2 %head-2 $+ Stream %head2.2 Online <text> %head.S tream 11T14opic 11s14etzen.
    msg %m-channel %head2 %head-2 $+ Stream %head2.2 Offline %Head.T opic 11z14urücksetzen.
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
    msg %m-channel %head2 %head-2 $+ ungod <player> %head2.2 $+ %head.U $+ nsterblichkeit 11b14ei %head.S $+ pieler 11d14eaktivieren %head2 
    msg %m-channel %head2 %head-2 $+ startlog <zeit> %head2.2 $+  %head.C $+ hatlog 11a14ktivieren 7(11B14ei 11z14eit 11e14ine 11z14eit 11i14n 4sec 11a14ngeben 11b14is 11m14aximal 09607) %head2 
    msg %m-channel %head2 %head-2 $+ stoplog <zeit> %head2.2 $+  %head.C $+ hatlog 11a14bschalten %head2 
    msg %m-channel %head2 %head-2 $+ playerlist %head2.2 $+  %head.Z $+ eigt 11D14ie %head.S $+ pielerliste 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ Zeitsteuerung %head2.2 $+  %head.S $+ yncronisiert %head.S $+ pielzeit 11m14it 11R14ealzeit %head2 
    msg %m-channel %head2 %head-2 $+ TPS %head2.2 $+ %head.Z $+ eigt 11d14ie 11T14icks 11P14er %head.S $+ ekunde 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ lag %head2.2 $+ %head.Z $+ eigt 11d14ie 11A14uslastung 11d14es %head.S $+ ervers 11a14n4. %head2 
    msg %m-channel %head2 %head-2 $+ status %head2.2 $+ %head.Z $+ eigt 11d14en 11S14tatus 11d14es %head.S $+ ervers 11a14n4. %head2
    msg %m-channel %head2 %head-2 $+ clearlogs %head2.2 $+ %head.L $+ öscht 11d14en 11I14nhalt 11d14es %head.L $+ ogverzeichnisses 4. %head2 
    msg %m-channel %head2 %head-2 $+ rconpassgen %head2.2 $+ %head.G $+ eneriert 11e14in 11n14eues 11R14con11P14assword. (11S14erverneustart 11e14rforderlich)
    msg %m-channel %head2 %head-2 $+ mcwhois %head2.2 $+ %head.L $+ istet 11d14ie 11O14nlinewhois 11a14uf. %head2 
    msg %m-channel %head2 %head-2 $+ regexist %head2.2 $+ %head.P $+ 11r14üft 11o14b 11e14ine 11R14egion 11e14xistiert %head2 
    msg %m-channel %head2 %head-2 $+ mapupdate (Plugin Bluemap benötigt) %head2.2 $+ %head.A $+ 14ktualisiert 11d14ie 11K14arte %head2 
    msg %m-channel %head2 %head-2 $+ batchpfad %head2.2 $+ %head.S $+ etzt 11d14en 11B14atchpfad %head2 
    msg %m-channel %head2 %head-2 $+ os %head2.2 $+ %head.B $+ 14etriebsystem 11a14nzeigen %head2
    msg %m-channel %head2 %head-2 $+ version %head2.2 $+ %head.V $+ 14ersion 11a14nzeigen %head2
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
  if ($2 == list) && ($3 == -w) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1)) && (%wg isin $finddir(%pfad $+ plugins\, WorldGuard, 1)) && ($exists(%pfad $+ \plugins\WorldGuard\worlds\ $+ $4 $+ \) == $false)  { msg %m-channel Die Welt $4 Existiert nicht, kann keine Regionen finden. | /halt }
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
    if (%regcheck) && ($4 == -w) && (%world isin $finddir(%pfad, * $+ %world $+ *, 1)) { 
      echo -ag region %region existiert
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
      /msg %m-channel Region wurde Selektiert. Worldguard fürt den Flag Befehl auf die Selectierte Region aus einmalig sofern vorhanden.
      /msg %m-channel Für mehrere Optionen muss die Region erneut selectiert werden.
      ;;;msg %m-channel 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
      set %regionsid $5
      /halt
    }
    else { msg %m-channel 3[7WorldGuard3] 4FEHLER: Die Region $5 existiert nicht in der Welt $4 | halt }
  }
  if ($2 == flag) && ($3- == $null) { 
    msg %m-channel 4FEHLER:12 Damit eine Flag gesetzt werden kann muss zuvor die Region selektiert werden.
    msg %m-channel 12Dies geschieht durch folgenden Befehl: !region select -w weltname regionsname
    msg %m-channel 12Nach erfolgreicher Selektierung kann die Entsprechende Flag aus der Liste hier gesetzt werden:
    msg %m-channel 9,1===3,1[7,1 WorldGuard Flags 3,1]9,1===
    msg %m-channel %flaglist1
    msg %m-channel %flaglist2
    msg %m-channel %flaglist3
    msg %m-channel %flaglist4
    msg %m-channel %flaglist5
    msg %m-channel 9,1===3,1[13,1 Third Party Flags 3,1]9,1===
    msg %m-channel %thirdflags1
    msg %m-channel %thirdflags2
    msg %m-channel %thirdflags3
    msg %m-channel %thirdflags4
    msg %m-channel %thirdflags5 

    msg %m-channel 12Um diese dann zu setzen muss folgende eingabe geschehen: !region flag -w weltname flag <value>
    msg %m-channel 12Wird keine value angegeben so wird die Flag zurückgesetzt.
    /halt
  }  
  if ($2 == flag) && ($3 == -w) && (%regionsid != $null) && ($4 isin $finddir(%pfad, $+ $4 $+ *,1))  { 
    set %flag $5
    set %welt $4
    if ($flagcheck(%flag) == off) { 
      /msg %m-channel Flag %flag existiert nicht. Bitte verwende eine der Folgenden FLags:
      msg %m-channel 9,1===3,1[7,1 WorldGuard Flags 3,1]9,1===
      msg %m-channel %flaglist1
      msg %m-channel %flaglist2
      msg %m-channel %flaglist3
      msg %m-channel %flaglist4
      msg %m-channel %flaglist5
      msg %m-channel 9,1===3,1[13,1 Third Party Flags 3,1]9,1===
      msg %m-channel %thirdflags1
      msg %m-channel %thirdflags2
      msg %m-channel %thirdflags3
      msg %m-channel %thirdflags4
      msg %m-channel %thirdflags5 
      /halt
    }
    if ($flagcheck(%flag) == on) { set %currentflag %flag 
      if (!%regionsid) && (%serverstarted == yes) { /msg %m-channel 4FEHLER:  Bitte selectiere zuerst eine Region mit: 8!region select -w weltname regionname | /halt }
      if (%serverstarted == no) { /msg %m-channel  4FEHLER:  Server ist nicht Online | /halt }
      set -u8 %flagset on
      ;;; Entry Flag
      if (%currentflag == entry) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag existiert
        set -u4 %tps3 3[7 Worldguard 3]12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == entry) && ($6- != $null)  {
        if ($6 == allow) {
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set -u5 %text $6
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set -u5 %text $6
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channl 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder Deny an. | /halt }
      }
      ;;; entry-deny-message Flag
      if (%currentflag == entry-deny-message) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == entry-deny-message) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        if (-w isin $left(%command, 15)) { set %text $6- }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      ;;; Greeting Flag
      if (%currentflag == greeting) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u3 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == greeting) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        ;;if (-w isin $left(%command, 15)) { set %text $6- }
        set %text $6-
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      ;;; nonplayer-protection-flag
      if (%currentflag == nonplayer-protection-flag) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u3 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == nonplayer-protection-flag) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        ;;if (-w isin $left(%command, 15)) { set %text $6- }
        set %text $6-
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      ;;; Passthrough Flag
      if (%currentflag == passthrough) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == passthrough) && ($6- != $null)  {
        var %command $1- 
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Build Flag
      if (%currentflag == Build) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == Build) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Interact Flag
      if (%currentflag == interact) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        /halt
      }
      if (%currentflag == interact) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-break Flag
      if (%currentflag == block-break) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == block-break) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-place Flag
      if (%currentflag == block-place) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag  wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag ==  block-place) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Use Flag
      if (%currentflag == use) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag ==  use) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Damage Animals
      if (%currentflag == damage-animals) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag ==  damage-animals) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; ChestAccess Flag
      if (%currentflag == chest-access) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == chest-access) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;: ride flag
      if (%currentflag == ride) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == ride) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; pvp flag
      if (%currentflag == pvp) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == pvp) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; flag
      if (%currentflag == sleep ) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == sleep) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Respawn-Anchors Flag
      if (%currentflag == respawn-anchors ) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == respawn-anchors) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      } 
      ;;; Respawn-Anchors Explode Flag
      if (%currentflag == respawn-anchor-explode) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == respawn-anchor-explode) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; tnt flag
      if (%currentflag == tnt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == tnt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; vehicle-place flag
      if (%currentflag == vehicle-place) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == vehicle-place) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; vehicle-destroy flag
      if (%currentflag == vehicle-destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag ==  vehicle-destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; lighter flag
      if (%currentflag == lighter) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == lighter) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"#
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; block-trampling
      if (%currentflag == block-trampling) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == block-trampling) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set %text $6 
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; frosted-ice-form
      if (%currentflag == frosted-ice-form) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == frosted-ice-form) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; item-frame-rotation
      if (%currentflag == item-frame-rotation) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == item-frame-rotation) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; firework-damage
      if (%currentflag == firework-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == firework-damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; use-anvil
      if (%currentflag == use-anvil) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == use-anvil) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; use-dripleaf
      if (%currentflag == use-dripleaf) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == use-dripleaf) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!          
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Creeper Explosion Flag
      if (%currentflag == creeper-explosion) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == creeper-explosion) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Enderdragopn-Block-damage flag
      if (%currentflag == enderdragon-block-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == enderdragon-block-damag) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ghast-FireBall
      if (%currentflag == ghast-fireball) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == ghast-fireball) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Other-Explosion flag
      if (%currentflag == other-explosion) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == other-explosion) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }      
      ;;; Neue Flags ;;;;      
      ;;; enderman-grief Flag
      if (%currentflag == enderman-grief) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == enderman-grief) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; snowman-trails flag
      if (%currentflag == snowman-trails) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == snowman-trails) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; ravager-grief Flag
      if (%currentflag == ravager-grief) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == ravager-grief) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Mob-Damage Flag
      if (%currentflag == mob-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == mob-damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Mob-Spawning FLag
      if (%currentflag == mob-sawning) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == mob-spawning) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Deny-Spawn flag
      if (%currentflag == deny-spawn) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == deny-spawn) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %moblists piglinbrute.snowman.panda.bee.axolotl.zoglin.cow.furnaceminecart.pig.spawnerminecart.allay.skeleton.llama.mule.bat.husk.frog.hoglin.zombiehorse.rabbit.silverfish.zombievillager.giant.drowned.enderdragon.dolphin.elderguardian.stray.shulker.turtle.chestminecart.vex.salmon.goat.ocelot.endercrystal.horse.vindicator.glowsquid.phantom.minecart.experienceorb.evoker.warden.squid.parrot.creeper.cavespider.enderman.zombifiedpiglin.magmacube.tadpole.chicken.ravager.hopperminecart.donkey.witherskeleton.strayskeleton.fox.slime.pillager.blaze.piglin.chestboat.endermite.tropicalfish.cat.pigzombie.zombie.mushroomcow.irongolem.guardian.polarbear.traderllama.ghast.sheep.tntminecart.skeletonhorse.illusioner.pufferfish.wanderingtrader.amorstand.wolf.villager.boat.strider.witch.cod.spider.wither
        set %mobtype $6
        if ($chr(44) !isin $6) && ($7- != $null) { msg %m-channel Bitte Trenne mehrer Mobtypen mit einem Komma. (z.B: Creeper,cat,Spider) | /halt }
        if ($chr(44) !isin $6) { 
          if (%mobtype isin %moblists) {
            set %wgmoblist %mobtype
            set %com rg f %regionsid %currentflag -w %welt %wgmoblist
            //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
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
            /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
            set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
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
      if (%currentflag == entity-painting-destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == entity-painting-destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Entity-Item-Frame-Destroy Flag
      if (%currentflag == entity-item-frame-destroy) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == entity-item-frame-destroy) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; WIther-Damage flag
      if (%currentflag == wither-damage) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == wither-damage) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;;;;;;;;;;;;;; Neue Flags ;;;;;;;;;;;;;;;;;;;;;;;
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;;; Lava-Fire Flag
      if (%currentflag == lava-fire) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == lava-fire) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Lightning Flag
      if (%currentflag == lightning) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == lightning) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Water Flow Flag
      if (%currentflag == water-flow) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == water-flow) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; lava Flow Flag
      if (%currentflag == lava-flow) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == lava-flow) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Snow Fall Flag
      if (%currentflag == snow-fall) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == snow-fall) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Snow Melt Flag
      if (%currentflag == snow-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == snow-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ice Form Flag
      if (%currentflag == ice-form) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == ice-form) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Ice Melt Flag
      if (%currentflag == ice-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == ice-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Frosted Ice Melt Flag
      if (%currentflag == frosted-ice-melt) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == frosted-ice-melt) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; MushRoom Growth Flag
      if (%currentflag == mushroom-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == mushroom-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; leaf Decay Flag
      if (%currentflag == leaf-decay) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == leaf-decay) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; grass Growth Flag
      if (%currentflag == grass-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == grass-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u2 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; MyCelium Spread Flag
      if (%currentflag == mycelium-spread) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == mycelium-spread) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; fire-spread flag
      if (%currentflag == fire-spread) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == fire-spread) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Copper-Fade
      if (%currentflag == copper-fade) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == copper-fade) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Vine-Growth Flag
      if (%currentflag == vine-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == vine-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Rock-Growth Flag
      if (%currentflag == rock-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == rock-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Sculk-Growth Flag
      if (%currentflag == sculk-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == sculk-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Crop Growth Flag
      if (%currentflag == crop-growth) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == crop-growth) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Soil Dry Flag
      if (%currentflag == soil-dry) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == soil-dry) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }
      ;;; Coral-Fade Flag
      if (%currentflag == coral-fade) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == coral-fade) && ($6- != $null)  {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) { 
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
          set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
          set %text $6 
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /msg %m-channel 3[7Worldguard3] Flag 7 $+ %currentflag   wurde auf ( $+ %text $+ ) gesetzt.
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != deny) || ($6 != allow) { msg %m-channel 3[7WorldGuard3]: 4FEHLER12 Falscher wert. Bitte gib ein Allow oder deny an.  | /halt }
      }

      ;;; movement flags
      ;;; exit flag
      if (%currentflag == exit) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == exit) && ($6- != $null) {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text allow
          set %com rg f %regionsid -w %welt %currentflag %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text deny
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != allow) || ($6 != deny) { /msg %m-channel Falschen Eingabe. Gib bitte ein Allow oder Deny wert an. }
      }
      ;;; exit-via-teleport flag      
      if (%currentflag == exit-via-teleport) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == exit-via-teleport) && ($6- != $null) {
        if ($6 == allow) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text allow
          set %com rg f %regionsid -w %welt %currentflag %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == deny) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text deny
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != allow) || ($6 != deny) { /msg %m-channel Falschen Eingabe. Gib bitte ein Allow oder Deny wert an. }
      }
      ;;; exit-override      
      if (%currentflag == exit-override) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == exit-override) && ($6- != $null) {
        if ($6 == true) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text true
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == false) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text false
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != true) || ($6 != false) { /msg %m-channel Falschen Eingabe. Gib bitte ein true oder false wert an. }
      }
      ;;; exit-deny-message flag
      if (%currentflag == exit-deny-message) && ($6- == $null) {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde zurückgesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == exit-deny-message) && ($6- != $null)  {
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag  existiert.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe Durchgeführt!
        var %command $1- 
        if (-w isin $left(%command, 15)) { set %text $6- }
        set %com rg f %regionsid %currentflag -w %welt %text
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag   wurde auf ( $+ %text $+ ) gesetzt.
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      ;;; notify-enter flag
      if (%currentflag == notify-enter) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == notify-enter) && ($6- != $null) {
        if ($6 == true) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text true
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == false) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text false
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != true) || ($6 != false) { /msg %m-channel Falschen Eingabe. Gib bitte ein true oder false wert an. }
      }
      ;;; notify-leave flag
      if (%currentflag == notify-leave) && ($6- == $null) {
        /msg %m-channel 3[7WorlGuard3] Flag 7 $+ %flag 3 Wird zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3]12 Aufgabe wird durchgeführt
        set %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == notify-leave) && ($6- != $null) {
        if ($6 == true) { 
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text true
          set %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 == false) {
          /msg %m-channel 3[7Worlguard3] Flag 7 $+ %flag 3 Wurde auf 4 $6 3 gestelt.
          set -u4 %tps3 3[7Worldguard3]12 Aufgabe wird durchgeführt
          set -u5 %text false
          set -u5 %com rg f %regionsid %currentflag -w %welt %text
          //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
          /unset %regionsid
          /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
          set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
          /halt
        }
        if ($6 != true) || ($6 != false) { /msg %m-channel Falschen Eingabe. Gib bitte ein true oder false wert an. }
      }

      ;;; Greeting title Flag
      if (%currentflag == greeting-title) && ($6 == $null) {
        ;;; Command etc
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag 3 wurde zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set -u5 %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsif
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      If (%currentflag == greeting-title) && ($6- != $null)  {
        var %titelmsg $6-
        /msg %m-channel 3[7Worlguard3] 7 $+ %flag  $+ für die Welt (4 $+ %welt $+  $+ ) wurde auf ( 7 $+ %titelmsg  ) gesetz.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set %com rg f %regionsid %currentflag -w %welt %titelmsg
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen 3]
        /halt
      }
      ;;; Farewell flag    
      if (%currentflag == farewell) && ($6- == $null) {
        ;;; Command hin
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag 3 wurde zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set -u5 %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsif
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == farewell) && ($6- != $null) {
        var %farwellmsg $6-
        /msg %m-channel 3[7Worlguard3] 7 $+ %flag  $+ für die Welt (4 $+ %welt $+  $+ ) wurde auf ( 7 $+ %farwellmsg  ) gesetz.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set %com rg f %regionsid %currentflag -w %welt %farwellmsg
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen 3]
        /halt
      }
      ;;; Farewell-title flag    
      if (%currentflag == farewell-title) && ($6- == $null) {
        ;;; Command hin
        /msg %m-channel 3[7Worldguard3] Flag 7 $+ %flag 3 wurde zurückgesetzt
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set -u5 %com rg f %regionsid %currentflag -w %welt
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsif
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7WorldGuardconfigurationen wurden neu geladen3]
        /halt
      }
      if (%currentflag == farewell-title) && ($6- != $null) {
        var %farwelltmsg $6-
        /msg %m-channel 3[7Worlguard3] 7 $+ %flag  $+ für die Welt (4 $+ %welt $+  $+ ) wurde auf ( 7 $+ %farwelltmsg  ) gesetz.
        set -u4 %tps3 3[7WorldGuard3] 12 Aufgabe durchgeführt
        set %com rg f %regionsid -w %welt %currentflag %farwelltmsg
        //run -ap rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run -ap rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen 3]
        /halt
      }
    }
    ;;; Enderpearl Flag
    if (%currentflag == enderpearl) && ($6- == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == enderpearl) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte Allow oder  deny an.
        /halt
      }
    }
    ;;; Chroruis-fruit-Teleport
    if (%currentflag == chorus-fruit-teleport) && ($6 == $null) {
      ;; Command ausführen
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == chorus-fruit-teleport) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt

      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel Falscher Wert für %currentflag. Gib bitte Allow oder  deny an.
        /halt
      }
    }
    ;;; Teleport message Flag
    if (%currentflag == teleport-message) && ($6 == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == teleport-message) && ($6 != $null) {
      ;;; Message Setzen
      var %message $6-
      set -u3 %com rg f %regionsid -w %welt %currentflag %message
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %message $+ 3] gesetzt.
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    ;; Map Making Flags
    ;; Item Pickup Flag
    if (%currentflag == item-pickup) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == item-pickup) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }
    ;;; Item-Drop flag
    if (%currentflag == item-drop) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == item-drop) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; Exp-Drops flag

    if (%currentflag == exp-drops) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == exp-drops) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; String Flag -> deny-message
    if (%currentflag == deny-message) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == deny-message) && ($6 != $null) {
      var %text $6-
      set -u3 %com rg f %regionsid -w %welt %currentflag %text
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf die Nachricht 3[7 $+ %text $+ 3] gesetzt.
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }

    ;;; Invincible Flag
    if (%currentflag == invincible) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == invincible) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; Flag fall-damage
    if (%currentflag == fall-damage) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == fall-damage) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; flag game-mode
    if (%currentflag == game-mode) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == game-mode) && ($6 != $null) {
      var %values survival creative adventure spectator
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein Spielmodus an:  7survival12, 7creative 12, 7adventure12, 7spectator12.!
        /halt
      }
    }

    ;;; String flag time-lock
    if (%currentflag == time-lock) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == time-lock) && ($6 != $null) {
      var %values $6-
      if (%values isnum) && (%values >= 1) && (%values <= 24000) {
        set -u3 %com rg f %regionsid -w %welt %currentflag %values
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%values isnum) && (- isin $left(%values,1)) {
        msg %m-channel 4FEHLER: 12 Gib bitte keine Negativen werte an. Sondern nutze eine Zahl von 7 1-24000 
        /halt
      }
      if (%values !isnum) {
        msg %m-channel 4FEHLER:12 Gib bitte eine Zahl an im Bereich 7 1-24000 .
        /halt
      }
    }

    ;;; Weather Lock Flag
    if (%currentflag == weather-lock) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == weather-lock) && ($6 != $null) {
      var %values rain clear
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte 7rain12 oder 7clear 12 an!
        /halt
      }
    }

    ;;; natural-health-regen flag
    if (%currentflag == natural-health-regen) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == natural-health-regen) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; Natural-hunger-drain flag
    if (%currentflag == natural-hunger-drain) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == natural-hunger-drain) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6,32) == $true) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if ($istok(%values,$6,32) == $false) {
        msg %m-channel 4FEHLER:12 Gibt bitte ein 7allow12 oder 7deny 12 Wert an!
        /halt
      }
    }

    ;;; heal-delay flag
    if (%currentflag == heal-delay) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == heal-delay) && ($6 != $null) {
      var %values $6-
      if (%values isnum) {
        set -u3 %com rg f %regionsid -w %welt %currentflag %values
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%values !isnum) {
        msg %m-channel 4FEHLER: 12 Gib hier bitte eine Zahl in secunden an die die Zeitspannen zwischen der Lebensregeneration definiert. 
        msg %m-channel 12 (z.B: 25s = Nach 25s wird das Leben anfangen sich zu regenerieren) 
      }
    }

    ;;; heal-amount
    if (%currentflag == heal-amount) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == heal-amount) && ($6 != $null) {
      var %values $6
      if (%values isnum) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%values !isnum) {
        msg %m-channel 4FEHLER:12 Gib hier bitte den Wert der Herzen an die nach dem Heal-delay wiederhergestellt werden sollen.
        msg %m-channel 12 Die Anzahl der Herzen definiert das Leben 10 Volle Herzen sind 20 Leben. (Standard Werte) 
        msg %m-channel 12 Beispiel: Ein halbes Herz wären dann 1 Lebenspunkt. Will man nun immer nach 5 sec 2 Volle Herzen regeneriert haben so muss der 7heal-amount12 wert 4 4 betragen.
        /halt
      }
    }

    ;;; heal-min-health
    if (%currentflag == heal-min-health) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == heal-min-health) && ($6 != $null) {
      var %value $6
      if (%value isnum) {
        set %v1 %value
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%value !isnum) {
        msg %m-channel 4FEHLER:12 Gibt bitte eine 7Zahl an12 (Zb 1 Entspricht 1 Halbes Herz 2 = 1 Volles Herz) 
        /halt
      }
    }

    ;; heal-max-health flag
    if (%currentflag == heal-max-health) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == heal-max-health) && ($6 != $null) {
      var %value $6
      if (%value isnum) {
        set %v1 %value
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%value !isnum) {
        msg %m-channel 4FEHLER:12 Gibt bitte eine 7Zahl an12 (Zb 1 Entspricht 1 Halbes Herz 2 = 1 Volles Herz) 
        /halt
      }
    }

    ;;; feed-delay
    if (%currentflag == feed-delay) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == feed-delay) && ($6 != $null) {
      var %values $6-
      if (%values isnum) {
        set -u3 %com rg f %regionsid -w %welt %currentflag %values
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%values !isnum) {
        msg %m-channel 4FEHLER: 12 Gib hier bitte eine Zahl in secunden an die die Zeitspannen zwischen der Stättigungsregeneration definiert. 
        msg %m-channel 12 (z.B: 25s = Nach 25s wird die Hungerleiste anfangen sich zu regenerieren) 
      }
    }

    ;;; Feed-Amount flag
    if (%currentflag == feed-amount) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == feed-amount) && ($6 != $null) {
      var %values $6
      if (%values isnum) {
        set %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%values !isnum) {
        msg %m-channel 4FEHLER:12 Gib hier bitte den Wert der Keulen an die nach dem feed-delay wiederhergestellt werden sollen.
        msg %m-channel 12 Die Anzahl der Keulen definiert den Hunger 10 Volle Keulen sind 20 Hunger. (Standard Werte) 
        msg %m-channel 12 Beispiel: Eine halbe Keule wären dann 1 Hungerpunkt. Will man nun immer nach 5 sec 2 Volle Keulen regeneriert haben so muss der 7feed-amount12 wert 4 4 betragen.
        /halt
      }
    }

    ;;feed max hunger
    if (%currentflag == feed-max-hunger) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == feed-max-hunger) && ($6 != $null) {
      var %value $6
      if (%value isnum) {
        set %v1 %value
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%value !isnum) {
        msg %m-channel 4FEHLER:12 Gibt bitte eine 7Zahl an12 (Zb 1 Entspricht 1 Halbe Keule 2 = 1 Volles Keule) 
        /halt
      }
    }

    ;;feed min hunger
    if (%currentflag == feed-min-hunger) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == feed-min-hunger) && ($6 != $null) {
      var %value $6
      if (%value isnum) {
        set %v1 %value
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf 3[7 $+ %v1 $+ 3] gesetzt.
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
        /halt
      }
      if (%value !isnum) {
        msg %m-channel 4FEHLER:12 Gibt bitte eine 7Zahl an12 (Zb 1 Entspricht 1 Halbe Keule 2 = 1 Volles Keule) 
        /halt
      }
    }

    ;; Blocked-cmds flag
    if (%currentflag == blocked-cmds) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == blocked-cmds) && ($6- != $null) {
      var %commandslash /
      var %commands $6-
      var %comtokens $replace(%commands,$chr(44),$chr(32))
      var %numcomtokens $numtok(%comtokens, 32)
      var %x 1
      while (%x <= %numcomtokens) {
        if ($left($gettok(%comtokens,%x,32),1) != %commandslash) { msg %m-channel Befehl $gettok(%comtokens,%x,32) beinhaltet kein %commandslash konnte also nicht gesetzt werden }
        if ($left($gettok(%comtokens,%x,32),1) == %commandslash) { set -u6 %blocked-cmds $addtok(%blocked-cmds,$gettok(%comtokens,%x,32),32) }
        inc %x
      }
      set -u3 %com rg f %regionsid -w %welt %currentflag $replace(%blocked-cmds,$chr(32),$chr(44))
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 4 $+ %blocked-cmds  ) gestellt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }

    ;;; Allowed-cmds flag
    if (%currentflag == allowed-cmds) && ($6 == $null) {
      ;; FLag Reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == allowed-cmds) && ($6- != $null) {
      var %commandslash /
      var %commands $6-
      var %comtokens $replace(%commands,$chr(44),$chr(32))
      var %numcomtokens $numtok(%comtokens, 32)
      var %x 1
      while (%x <= %numcomtokens) {
        if ($left($gettok(%comtokens,%x,32),1) != %commandslash) { msg %m-channel Befehl $gettok(%comtokens,%x,32) beinhaltet kein %commandslash konnte also nicht gesetzt werden }
        if ($left($gettok(%comtokens,%x,32),1) == %commandslash) { set -u6 %allowed-cmds $addtok(%allowed-cmds,$gettok(%comtokens,%x,32),32) }
        inc %x
      }
      set -u3 %com rg f %regionsid -w %welt %currentflag $replace(%allowed-cmds,$chr(32),$chr(44))
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 4 $+ %allowed-cmds  ) gestellt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u7 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }

    ;; Misc Flags
    ;;; Pistons Flag
    if (%currentflag == pistons) && ($6- == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == pistons) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte Allow oder  deny an.
        /halt
      }
    }

    ;;; send-chat flag
    if (%currentflag == send-chat) && ($6- == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == send-chat) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte Allow oder  deny an.
        /halt
      }
    }
    ;;; receive-chat
    if (%currentflag == receive-chat) && ($6- == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == receive-chat) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte Allow oder  deny an.
        /halt
      }
    }
    ;;;; potion-splash flag
    if (%currentflag == potion-splash) && ($6- == $null) {
      ;;; Flag Zurücksetzen
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == potion-splash) && ($6 != $null) {
      var %values allow deny
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte allow oder  deny an.
        /halt
      }
    }

    ;;; Drittanbieter Flags 
    ;;; ability-pvp
    if (%currentflag == ability-pvp) && ($6 == $null) {
      ;;; Flag reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == ability-pvp) && ($6 != $null) {
      var %values allow deny
      ;;; werte Setzen:
      if ($istok(%values,$6-,32) == $true)  {
        ;;; Werte Setzen
        var %v1 $6
        set -u3 %com rg f %regionsid -w %welt %currentflag %v1
        set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
        //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
        /msg %m-channel 3[7Worldguard3]  Die Flag 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 7 $+ %v1  ) gesetzt
        /unset %regionsid
        /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
        set -u7 %tps4 3[7Worldguardconfiguration wurden geladen3]
        /halt
      }
      if ($istok(%values,$6-,32) == $false)  { 
        msg %m-channel Falscher Wert für %currentflag. Gib bitte allow oder  deny an.
        /halt
      }
    }

    ;;; Allow-block-place    
    if (%currentflag == allow-block-place) && ($6 == $null) {
      ;;; Flag reset
      set -u3 %com rg f %regionsid -w %welt %currentflag
      /msg %m-channel 3[7Worldguard3] 7 $+ %flag für die Welt ( 4 $+ %welt $+  ) wurde zurückgesetzt
      set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
      //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
      /unset %regionsid
      /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
      /set -u6 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
      /halt
    }
    if (%currentflag == allow-block-place) && ($6- != $null) {
      if ($chr(32) isin $6-) || ($chr(44) !isin $6) { msg %m-channel Bitte verwende keine Leerzeichen in den Materialien und Trenne mehrere mit einem , | /halt }
      var %matids $replace($6-,$chr(44),$chr(32))
      var %materialtokens $numtok(%matids,32)
      var %y 1
      while (%y <= %materialtokens) {
        var -s %item $gettok(%matids,%y,32)
        if ($read(material-id.txt,tnw,%item)) %materiallist = $replace($addtok(%materiallist,$replace(%item,$chr(32),$chr(44)),32),$chr(32),$chr(44))
        else %invalidmats = $addtok(%invalidmats,$replace(%item,.,$chr(44)),32)
        inc %y
      }
      if (%materiallist != $null) { msg $chan Die Werte für die Flag allowed-placed-blocks sind wie Folgt: 4 $+ %materiallist  und werden gesetzt. }
      /timer.allowed-block-place1 1 3 /allowed-placed-blocks
    }

    if ($2 == flag) && ($3 != -w) && (%regionsid == $null) && ($4 !isin $finddir(%pfad, $+ $4 $+ *,1)) {
      msg %m-channel Die Welt $5 Existiert nicht. Indemfalle gibt es auch keine Region namens $3
      /halt
    }
    if ($2 == flag) && (%regionsid == $null) { msg %m-channel Falsche Eingabe folgende Parameter müssen angebeben werden. Beispiel: !region flag -w weltname flag werte.  Bitte Selectiere die region zuvor | /halt }
  }
}

;;;; Whois Command ;;;;

on *:text:!mcwhois*:#: {
  set -u4 %mcwhois on
  //run -ap %pfad $+ players.bat
  /timercheck.plist1 1 2 /plist
  set %whoisnick $2
  /timercheck.mcwhois1 1 4 /mcwhois %whoisnick
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
  write -l1 %pfad $+ vault-info.bat rcon.exe -a localhost:25575 -p %rcon_password "vault-info" > vault-info.txt
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

;;; Rcon Password Generator

on 100:text:!rconpassgen*:#: {
  if ($2 == $null) {
    var %passlen $rand(8,16)
  }
  if ($2 != $null) && ($2 >= 4) && ($2 <= 32) && ($2 isnum) {
    var %passlen $2
  }
  if ($2 != $null) && ($2 <= 3) || ($2 > 32) && ($2 isnum) {
    msg $chan 4Fehler: 7Passwortlänge darf nicht weniger als 4 und nicht größer als 32 sein!
    /halt
  }
  var %passcharsHigh A.B.C.D.E.F.G.H.I.J.K.L.M.N.O.P.Q.R.S.T.U.V.W.X.Y.Z
  var %passcharsLow a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z
  var %specialchars !.§.$.&.-.=.?.'.`./.(.).^.<.>._.,.+.#
  var %numSpec $numtok(%specialchars,46)
  var %numLowLetters $numtok(%passcharsLow,46)
  var %numHighLetters $numtok(%passcharsHigh,46)
  echo -ag the passwordlen is %passlen
  var %minlen = 1
  while (%minlen <= %passlen) {
    var %randnumletterHigh $rand(1,%numHighletters)
    var %number $rand(1,9)
    var %passletterHigh $gettok(%passcharsHigh,%randnumletterHigh,46)
    var %randnumletterLow $rand(1,%numLowLetters)
    var %passletterLow $gettok(%passcharsLow,%randnumletterLow,46)
    var %randnumSpec $rand(1,%numSpec)
    var %passSpec $gettok(%specialchars,%randnumSpec,46)
    set %rcongen_password $instok(%rcongen_password, %passletterHigh $+ %passletterLow $+ %number $+ $rand(1,9) $+ %passletterHigh $+ %passletterHigh $+ $rand(1,9), $calc(%minlen + 1),32)
    ;; Orginal set %rcongen_password $instok(%rcongen_password, %passletterHigh $+ %passletterLow $+ %number $+ %passSpec $+ %number $+ %passletterHigh,$calc(%minlen + 1),32)
    ;;set %rcongen_password $instok(%rcongen_password,%number,$calc(%minlen + 1),32)
    ;;set %rcongen_password %rcongen_password %passletterHigh %number %passSpec %passletterLow
    var %rpassword $remove(%rcongen_password,$chr(32))
    echo -ag --> Letters %minlen - %rcongen_password - the letter was %passletterHigh num: %number
    inc %minlen
  }
  msg $chan Generiere Neues RconPasswort aus folgender Länge: 4 %passlen
  if ($len(%rpassword) <= %passlen) || ($len(%rpassword) >= %passlen) {
    var %rpassword $mid(%rpassword,$rand(1,$len(%rpassword)),%passlen)
    echo -ag ---> generate word %rpassword
    var %oldrconpass $read(%mProp, w, *rcon.password*) Zeile $readn
    set %oldrconpass $remove(%oldrconpass,rcon.password=)
    var %passline $remove($remtok(%oldrconpass,$gettok(%oldrconpass,1,32),32),Zeile)
    var %newrconpass rcon.password= $+ %rpassword
    write -l $+ %passline %mProp %newrconpass
    set %rcon_password %rpassword
    writeini system.dat MineCraftServer rconpass %rpassword
    set %restarttime 30
    /timer.saymes1 1 5 /msg $chan 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 RconPassword neu gesetzt!.  4Server14 wird in %restarttime $+ sec gestoppt. Bitte alle Disconnecten.
    /timer.saykonsole1 1 20 //run rcon.exe -a localhost:25575 -p %oldrconpass "say RconPassword neu gesetzt!. Server wird in 10 $+ sec gestoppt. Bitte alle Disconnecten."
    /timer.restart1 1 %restarttime //run rcon.exe -a localhost:25575 -p %oldrconpass "stop"
    /unset %rcongen_password
    /unset %oldrconpass
    /unset %playerlist1
    /unset %playerlist
    /write -l1 %pfad $+ players.bat rcon.exe -a localhost:25575 -p %rpassword "list" > help2.txt
    /write -l1 %pfad $+ TPS.bat rcon.exe -a localhost:25575 -p %rpassword "tps" > tps.txt
    /write -l1 %pfad $+ lag.bat rcon.exe -a localhost:25575 -p %rpassword "lag" > lag.txt
    /write -l1 %pfad $+ vault-info.bat rcon.exe -a localhost:25575 -p %rpassword "vault-info" > vault-info.txt
    /halt
  }
  if ($len(%rpassword) == %passlen) {
    var %rpassword $mid(%rpassword,$rand(1,$len(%rpassword)),%passlen)
    ;;;/timer.pasmsg1 1 5 /msg $chan Das Passwort lautet: 7 %rpassword
    var %oldrconpass $read(%mProp, w, *rcon.password*) Zeile $readn
    set %oldrconpass $remove(%oldrconpass,rcon.password=)
    var %passline $remove($remtok(%oldrconpass,$gettok(%oldrconpass,1,32),32),Zeile)
    var %newrconpass rcon.password= $+ %rpassword
    write -l $+ %passline %mProp %newrconpass
    set %rcon_password %rpassword
    writeini system.dat MineCraftServer rconpass %rpassword
    /timer.saymes1 1 5 /msg $chan 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 RconPassword neu gesetzt!.  4Server14 wird in %restarttime $+ sec gestoppt. Bitte alle Disconnecten.
    /timer.saykonsole1 1 20 //run rcon.exe -a localhost:25575 -p %oldrconpass "say RconPassword neu gesetzt!. Server wird in 10 $+ sec gestoppt. Bitte alle Disconnecten."
    /timer.restart1 1 %restarttime //run rcon.exe -a localhost:25575 -p %oldrconpass "stop"
    /unset %rcongen_password
    /unset %oldrconpass
    /unset %playerlist1
    /unset %playerlist
    /write -l $+ 1 %pfad $+ players.bat rcon.exe -a localhost:25575 -p %rpassword "list" > help2.txt
    /write -l1 %pfad $+ TPS.bat rcon.exe -a localhost:25575 -p %rpassword "tps" > tps.txt
    /write -l1 %pfad $+ lag.bat rcon.exe -a localhost:25575 -p %rpassword "lag" > lag.txt
    /write -l1 %pfad $+ vault-info.bat rcon.exe -a localhost:25575 -p %rpassword "vault-info" > vault-info.txt
    /halt
  }
}


;;;;;;;;; Server Stoppen ;;;;;;;;;;;;;
on 100:text:!stop:%m-channel:{
  msg %m-channel 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 wird 4Gestopt <►  7[4!7]
  //run -ap rcon.exe -a localhost:25575 -p %rcon_password "stop"
  set %serverstarted no
  set -u15 %stop on
  set %warn 0
  set %err 0
  unset %syspid
  remove %pfad $+ server.pid
}

;;;;;;;;; Server Starten  ;;;;;;;;;;;;;
on 100:text:!start:%m-channel:{
  set %pid $rand(10000,99999) 
  set -u15 %start on
  set %serverstarted yes
  /set %warn 0
  /set %err 0
  //run -ap %pfad $+ start.bat
  //run -ap %pfad $+ process.bat
  //set %syspid $read(%pfad $+ server.pid, 1)
  /msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 wird 9Gestartet <► 
  /timersyspid1 1 3 /systempid
  /timer.checkstarted1 0 3 /checkstarted
}

on 100:text:!status:%m-channel: { 
  if (%serverstarted == yes) && (%pid isnum) { msg %m-channel 9→11M14inecraft9← 11S14erver 9◄> 14ist 9ONLINE }
  if (%serverstarted == no) || (!%pid) { msg %m-channel 9→11M14inecraft9← 11S14erver 9◄>14 ist 4OFFLINE }
}

;;; Exit Event
;;; Zurücksetzen einiger Variablen
;; =============

on 1:EXIT: {
  /unset %serverstarted
  /unset %pid
  /unset %spid
}

;;;;;;;;;;;;;; Spielerliste ;;;;;;;;;;;;;;;;;

on *:text:!playerlist:%m-channel: { 
  set -u10 %plisten on
  set -u5 %tps3 7,1[4-7] 11S14pieler 11L14iste 7[4-7]
  /write -l1 %pfad $+ players.bat rcon.exe -a localhost:25575 -p %rcon_password "list" > help2.txt
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
;; Setzt den Batchdateienpfad diese sollten im Serververzeichnis sein
;; =================

on 100:text:!batchpfad*:%m-channel: {
  if ($2 == $null) { msg %m-channel Bitte gebe den Pfad zu allen Batchdateien an diese sollten sich im MinecraftSerververzeichniss befinden }
  set %pfad $2-
  msg %m-channel Der Batchpfad wurde zu %pfad gesetzt.
}


;;; TPS Befehl ;;;;;

on *:text:!tps:%m-channel: { 
  set -u15 %tps on
  /write -l1 %pfad $+ TPS.bat rcon.exe -a localhost:25575 -p %rcon_password "tps" > tps.txt
  //run -ap %pfad $+ TPS.bat
  set -u5 %tps3 7,1[4-7] 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  timersay1 1 8 /tpsausgabe
}

;;;; Auslastungsabfrage ;;;;;

on *:text:!lag:%m-channel: {
  set %laglag on
  /write -l1 %pfad $+ lag.bat rcon.exe -a localhost:25575 -p %rcon_password "lag" > lag.txt
  //run -ap %pfad $+ lag.bat
  set %lag $read(%pfad $+ lag.txt,l,2)
  set %lag1 $remove(%lag,§r)
  set %newlag $replace(%tps1,§6,$chr(3) $+ 7,§a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  set -u5 %tps3 7,1[4-7] 11S14peicher 11A14uslastung 11d14es4 11S14ervers 7[4-7]
  /timer.lagausgabe1 1 2 /lagausgabe
}

;;;; Aufgabenliste ;;;;

on 100:text:!mctodo*:#: {
  var %befehle add.del.fertig.fixed.list
  if ($2 == $null) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Listen Ersteller v1.0 by Serkons - Die Befehle sind:
    var %befehle add.del.fertig.fixed.list
    var %maxbefehle $numtok(%befehle,46)
    var %x 1
    while (%x <= %maxbefehle) {
      msg $chan 7,1[9▒7] 4→ $+ 7!mctodo $gettok(%befehle,%x,46) $iif($gettok(%befehle,%x,46) != list, <eintrag>, $chr(32)) 14 $iif($gettok(%befehle,%x,46) != list, $remove($read(todo-befehle.txt,w,$gettok(%befehle,%x,46) $+ *),$gettok(%befehle,%x,46),=), $replace($remove($read(todo-befehle.txt,w,$gettok(%befehle,%x,46) $+ *),=,list),Todoe,TodoListe))
      inc %x
    }
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == add) { 
    set %todolines $lines(ircmc-todo.txt)
    if (%todolines == $null) || (%todolines >= 0) { 
      inc %todolines
      ;;;msg $chan Zeile %todolines
      write -l $+ %todolines ircmc-todo.txt 7,1[9▒7] 4→7 $+ $fulldate $+ 4← 7[9▒7,1] 14 ID: 4→9 %todolines 15 4← 14 $3- 7[8ↈ13NEU8ↈ7,1]
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Eintrag ID: %todolines 4HINZUGEFÜGT!
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Text: 14 $3-
    }
  }  
  if ($istok(%befehle,$2,46) == $true) && ($2 == list) && ($3 == $null) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    msg $chan 7,1[9√7]14 = Fertig - 7,1[9▒7] 4→11F14i11X14Ed4← 7[9▒7,1]14 = Optimiert / Fehlerbehoben
    play $chan ircmc-todo.txt
    /halt
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == list) && ($3 == fixed) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste Fixed Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    set -u5 %chan $chan
    $todo-fix
    /halt
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == list) && ($3 == fertig) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste Fertige Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    set -u5 %chan $chan
    $todo-fertig
    /halt
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == list) && ($3 == neu) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste Neue Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    set -u5 %chan $chan
    $todo-neu
    /halt
  }

  if ($istok(%befehle,$2,46) == $true) && ($2 == del) { 
    var %eintragid $3
    set %eintragstext $read(ircmc-todo.txt,%eintragid)
    if (%eintragstext == $null) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4FEHLER:14 Sorry einen Eintrag mit ID: 7 %eintragid $+  existiert nicht! | /halt }
    ;;;msg $chan Eintragstoken: %eintragstokens
    if (%eintragstext != $null) && (%tododel == $null) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste  Soll der Eintrag: 7 $remove($gettok(%eintragstext,15-,32), 7[8ↈ13NEU8ↈ7,1],$chr(44))  wirklich Gelöscht werden?. Zur Bestätigung Befehl inerhalb von 5sec Erneut schreiben! | /set -u5 %tododel on | /halt }
    if (%eintragstext != $null) && (%tododel == on) {
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Listeneintrag 7,1[9▒7] 4→11 $+ $remove($gettok(%eintragstext,15-,32), 7[8ↈ13NEU8ↈ7,1],$chr(44)) $+ 4← 7[9▒7,1] 7[4GELÖSCHT!7,1] 
      /write -dl $+ %eintragid ircmc-todo.txt
      /sortlist
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste wurde Sortiert. Siehe !mctodo list
      /halt
    }
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == fertig) {
    var %eintrag $read(ircmc-todo.txt,$3)
    var %date $remove($gettok(%eintrag,2-6,32),←,→,47,4)
    if (%eintrag == $null) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4FEHLER:14 Sorry ein Eintrag mit id 4 $3 14 existiert nicht | /halt }  
    if (%eintrag != $null) {
      var %neulabel 7[8ↈ13NEU8ↈ7,1]
      var %fertiglabel 7,1[9√7]
      var %zeile $3
      write -l $+ %zeile ircmc-todo.txt $replace(%eintrag,%neulabel,%fertiglabel,%date,$fulldate)
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste - 14Der Eintrag wurde mit %fertiglabel gekennzeichnet.
    }
  }
  if ($istok(%befehle,$2,46) == $true) && ($2 == fixed) {
    var %eintrag $read(ircmc-todo.txt,$3)
    var %date $remove($gettok(%eintrag,2-6,32),←,→,47,4)
    if (%eintrag == $null) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4FEHLER:14 Sorry ein Eintrag mit id 4 $3 14 existiert nicht | /halt }  
    if (%eintrag != $null) {
      var %neulabel 7[8ↈ13NEU8ↈ7,1]
      var %fertiglabel 7,1[9√7]
      var %fixedlabel 7,1[9▒7] 4→11F14i11X14Ed4← 7[9▒7,1]
      var %zeile $3
      write -l $+ %zeile ircmc-todo.txt $replace(%eintrag,%neulabel,%fixedlabel,%fertiglabel,%fixedlabel,%date,$fulldate))
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste - 14Der Eintrag wurde mit %fixedlabel gekennzeichnet.
    }
  }
}

on 1:text:!os:#: { msg $chan Ich laufe auf einem 4 $+ $osVersion $+   Buildnummer:  $+ $osBuild }

on 100:text:!version:%m-channel: {
  /msg %m-channel  7,1[9▒7] 4→11M14inecraft4 11B14ot4 11V14ersion14,110 $ver 11,1C14odet 11b14y 11S14erkons4← 7[9▒7,1]
}

on 1:text:!ver:#Bot-Lounge: {
  /msg $chan  7,1[9▒7] 4→11M14inecraft4 11B14ot4 11V14ersion14,110 $ver 11,1C14odet 11b14y 11S14erkons4← 7[9▒7,1]
}
