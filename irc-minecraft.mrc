;;;; Irc Minecraft coded by Serkons ;;;;;
;;;; Version 1.0 ;;;;

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
      write -l $+ %todolines ircmc-todo.txt 7,1[9▒7] 4→7 $+ $fulldate $+ 4← 7[9▒7,1] 14 ID: 4→9 %todolines 15 4← 14 $3- 7[8ↈ13NEU8ↈ7,1]
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Eintrag ID: %todolines 4HINZUGEFÜGT!
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Text: 14 $3-
    }
  }  
  if ($istok(%befehle,$2,46) == $true) && ($2 == list) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    msg $chan 7,1[9√7]14 = Fertig - 7,1[9▒7] 4→11F14i11X14Ed4← 7[9▒7,1]14 = Optimiert / Fehlerbehoben
    play $chan ircmc-todo.txt
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
      var %neulabel 7[8ↈ13NEU8ↈ7,1]
      var %fertiglabel 7,1[9√7]
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
      var %neulabel 7[8ↈ13NEU8ↈ7,1]
      var %fertiglabel 7,1[9√7]
      var %fixedlabel 7,1[9▒7] 4→11F14i11X14Ed4← 7[9▒7,1]
      var %zeile $3
      write -l $+ %zeile ircmc-todo.txt $replace(%eintrag,%neulabel,%fixedlabel,%fertiglabel,%fixedlabel,%date,$fulldate))
      msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste - 14Der Eintrag wurde mit %fixedlabel gekennzeichnet.
    }
  }
}

;;;;;; Konto erstellung ;;;;;;;;

on 1:text:!neuer Spieler:#: {
  var %botdir $mircdir
  var %Spieler $nick
  var %Spielerdatenordner Spielerdaten\
  if ($nick != $me) && ($exists(%botdir $+ %Spielerdatenordner $+ %Spieler $+ .db) == $true) || ($istok(%ingamespieler,%Spieler,46) == $true) {
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Der Spieler 7 %Spieler  existiert schon. Bitte nutze einen anderen Nicknamen.
    /halt
  }
  if ($nick != $me) && ($exists(%botdir $+ %Spielerdatenordner $+ %Spieler $+ .db) == $false) || ($istok(%ingamespieler,%Spieler,46) == $false) {
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Der Spieler 7 %Spieler  Existierte noch nicht. Und wurde somit eben erstellt.
    set %ingamespieler $addtok(%ingamespieler,%Spieler,46)
    writeini Irc-Minecraft-Ingame-Spieler.ini IngameSpieler Spielerliste %ingamespieler

    ;;; Kopiere die Vorlage ins Verzeichniss Spielerdaten und benenne sie um...
    /copy %botdir $+ %Spielerdatenordner $+ neuer_spieler\ $+ spieler.db %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db


    ;;; Erstelle ein Kennwort für diesen Nutzer und Verschlüssele es...
    var %passwordlength 8
    var %p 0
    while (%p <= %passwordlength) {
      var %chartype $rand(1,4)
      if (%chartype == 1) { var %letter $rand(a,z) | var %pw $addtok(%pw,%letter,32) | inc %p }
      if (%chartype == 2) { var %letter $rand(A,Z) | var %pw $addtok(%pw,%letter,32) | inc %p }
      if (%chartype == 3) { var %letter $rand(0,9) | var %pw $addtok(%pw,%letter,32) | inc %p }
      if (%chartype == 4) { var %special . - ! & ` ´ | var %letter $gettok(%special,$rand(1,$numtok(%special,32)),32) | var %pw $addtok(%pw,%letter,32) | inc %p }
    }
  }
  ;;;; Orginal generiertes Passwort
  var %pw $remove(%pw,$chr(32))
  ;;;; Verschlüsseltes PW
  var %enpw $encode(%pw,a)
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo Passwort %enpw

  ;;; Namen des Spielers Eintragen:
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo Name %Spieler

  ;;; Generierung der Der Ersten Position
  /lastpos

  ;;; Schreiben der Ersten Position
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo LastPos %mcposition

  ;;; Generierung der Inventarslots
  $inventargen(%Spieler)

  msg %Spieler Willkommen %Spieler beim Irc Minecraft.
  msg %Spieler Hier dein Spieleraccountkennwort:  $+ %pw  merke es dir gut.
}
