;;;; Irc Minecraft coded by Serkons ;;;;;
;;;; Version 1.0 ;;;;

;;;;;; Konto erstellung ;;;;;;;;

on 1:text:!neuer Spieler:#: {
  var %botdir $mircdir
  var %Spieler $nick
  var %Spielerdatenordner Spielerdaten\
  if ($nick != $me) && ($exists(%botdir $+ %Spielerdatenordner $+ %Spieler $+ .db) == $true) || ($istok(%ingamespieler,%Spieler,46) == $true) {
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Der Spieler 7 %Spieler  existiert schon. Bitte nutze einen anderen Nicknamen.
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
  msg %Spieler Willkommen %Spieler beim Irc Minecraft.
  msg %Spieler Hier dein Spieleraccountkennwort:  $+ %pw  merke es dir gut.
}
