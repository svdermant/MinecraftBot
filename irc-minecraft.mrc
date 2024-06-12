;;;;;; MinecraftBot ;;;;;;;; V1.1b
;;;;;; Author: Serkons
;;;;;; Githubname: Svdermant
;;;;;; GithubRepo: https://github.com/svdermant/MinecraftBot/
;;;;;; Erstellungsdatum: 11. Juni . 2023

;;;; Irc Minecraft - Addon coded by Serkons ;;;;;
;;;; Version 1.0 ;;;;

;;; Beschreibung:
;; Es dient zum Zeitvertreib und soll am ende Minecraft in Textform darstellen.
;; =====================

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
  var %enpw $sha1(%pw)
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo Passwort %enpw

  ;;; Namen des Spielers Eintragen:
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo Name %Spieler

  ;;; Generierung der Der Ersten Position
  /lastpos

  ;;; Schreiben der Ersten Position
  writeini %botdir $+ %Spielerdatenordner $+ %Spieler $+ .db AccountInfo LastPos %mcposition

  ;;; Generierung der Inventarslots
  $inventargen(%Spieler)

  ;;; Erzeugung der Standard Items für den Start
  $firstItems(%Spieler)

  msg %Spieler Willkommen %Spieler beim Irc Minecraft.
  msg %Spieler Hier dein Spieleraccountkennwort:  $+ %pw  merke es dir gut.
}

;;; !chop Tree (Baum Fällen)

on 1:text:!chop tree:#: {
  var %mctrees oaktree darkoaktree sprucetree acaciatree birchtree cherrytree jungletree mangrovetree
  var %maxtrees $numtok(%mctrees,32)
  var %treename $gettok(%mctrees,$rand(1,%maxtrees),32)
  var %blocksize $rand(5,$readini($GameData(%treename),TreeImage,MaxSize))
  msg $chan  $+ $nick $+  ist dabei einen 7 $+ %treename  $+ mit einer Größe von12 %blocksize  $+ Blöcken zu fällen.
  set -u5 %displaychan $chan
  $displaytree(%treename,%displaychan)

  ;;; Auslesen der Drops vom Jeweiligen Baum
  var %drops $readini($GameData(%treename),Drops,Items)

  /timerdropdisplay1 1 %blocksize /msg $chan Mögliche Drops nach fällen des %treename : 7 %drops
  /halt
}

;; MCBook Nachschlagewerk für Blöcke und Items
;; =====================

on *:Text:!mcbook*:*: {
  var %item $3
  var %t $target
  echo -ag Ziel %t
  var %com $2
  var %commands item.itemlist
  set %isitem $replace(%item,_,$chr(32))
  if ($istok(%commands,$2,46) == $true) && (%t == $chan) && (%com == itemlist) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Es gibt insgesamt 4 $ini($GameData(items),0)  Gegenstände/Blöcke.
    /halt
  }
  if ($istok(%commands,$2,46) == $true) && (%t == $me) && (%com == itemlist) { msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Es gibt insgesamt 4 $ini($GameData(items),0)  Gegenstände/Blöcke.
    /halt 
  }
  if ($readini($GameData(Items), %item, Name) == %isitem) && (%t == $me) && ($istok(%commands,$2,46) == $true) && (%com == item) { 
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Das Item 4 $+ %item  Existiert!.
    var %type $readini($gameData(Items), %item, Type)
    var %Name $readini($gameData(Items), %item, Name)
    var %Desc $readini($gameData(Items), %item, Desc)
    var %Dura $readini($gameData(Items), %item, Durability)
    var %Hunger $readini($gameData(Items), %item, Hunger)

    ;;; Setze die Durability auf 0 wenn nicht vorhanden.
    if (%dura == $null) { var %dura 0 }
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7,1MC-Book14,1 Item 3,1[15,1 $+ %item $+ 3,1] 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 6Type: 3,1[11,1 $+ %type $+ 3,1] 
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7Name: 3,1[12,1 $+ %Name $+ 3,1] 
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 14Beschreibung: 3,1[15,1 $+ %Desc $+ 3,1] 
    if (%type == FOOD) { msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 15Sättigung: 3,1[15,1 %Hunger 3,1]  }
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 10Haltbarkeit: 3,1[12,1 %Dura 3,1] 
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7,1MC-Book14,1 Item 3,1[15,1 $+ %item $+ 3,1] 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    /halt
  }
  if ($readini($GameData(Items), %item, Name) == %isitem) && (%t == $chan) && (%isitem != $null) && ($istok(%commands,$2,46) == $true) && (%com == item) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Das Item 4 $+ %item  Existiert!.
    var %type $readini($gameData(Items), %item, Type)
    var %Name $readini($gameData(Items), %item, Name)
    var %Desc $readini($gameData(Items), %item, Desc)
    var %Dura $readini($gameData(Items), %item, Durability)
    var %Hunger $readini($gameData(Items), %item, Hunger)
    
    ;;; Setze die Durability auf 0 wenn nicht vorhanden.
    if (%dura == $null) { var %dura 0 }
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7,1MC-Book14,1 Item 3,1[15,1 $+ %item $+ 3,1] 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 6Type: 3,1[11,1 $+ %type $+ 3,1] 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7Name: 3,1[12,1 $+ %Name $+ 3,1] 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 14Beschreibung: 3,1[15,1 $+ %Desc $+ 3,1] 
    if (%type == FOOD) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 15Sättigung: 3,1[15,1 %Hunger 3,1]  }
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 10Haltbarkeit: 3,1[12,1 %Dura 3,1] 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7,1MC-Book14,1 Item 3,1[15,1 $+ %item $+ 3,1] 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
    /halt
  }
  if ($readini($GameData(Items), %item, Name) == $null) && (%t == $me) && ($istok(%commands,$2,46) == $true) && (%com == item) { 
    msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Das Item 4 $+ %item  Existiert nicht.
    /halt
  }
  if ($readini($GameData(Items), %item, Name) == $null) && (%t == $chan) && ($istok(%commands,$2,46) == $true) && (%com == item) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book Das Item 4 $+ %item  Existiert nicht.
    /halt
  } 
  if ($2 == $null) || ($istok(%commands,$2,46) == $false) && (%t == $chan) { msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book 4FEHLER:  Richtige Parameter 7!mcbock itemlist - Wieviele Items sind vorhanden. | msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book 4FEHLER:  Richtige Parameter 7!mcbock item <itemname>. | /halt }
  if ($2 == $null) || ($istok(%commands,$2,46) == $false) && (%t == $me) { msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book 4FEHLER:  Richtige Parameter 7!mcbock itemlist - Wieviele Items sind vorhanden. | msg $nick 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 7MC-Book 4FEHLER:  Richtige Parameter 7!mcbock item <itemname>. | /halt }


}

;;; Biome Generierung

on *:text:!biomes:#: {
  var %biomes plains desert forest taiga swamp jungle
  var %firstbiome 1
  while ($gettok(%biomes,%firstbiome,32)) {
    var %biomename $v1
    var %chunk 1
    while (%chunk <= 50) {
      var %xcords $rand(-50,50)
      var %zcords $rand(-50,50)
      var %chunklabel %xcords $+ / $+ %zcords
      echo -ag for biome %biomename Chunk[ $+ %xcords $+ / $+ %zcords $+ ] was created
      writeini $GameData(chunk) %chunklabel Name %biomename
      inc %chunk

      ;; check if a line with chunklabel alredy exists if this true generate new cords
      ;; and write them to the file

      var %existchunk $read($gamedata(chunk),w,*[ $+ %chunklabel $+ ]*)
      if (%existchunk == $null) { inc %chunk }
      if (%existchunk != $null) { 
        echo -> %existchunk exists in file
        var %xcords $rand(-50,50)
        var %zcords $rand(-50,50)
        var %chunklabel %xcords $+ / $+ %zcords
        writeini $GameData(chunk) %chunklabel Name %biomename
        inc %chunk
        echo -ag for biome %biomename a new Chunk[ $+ %xcords $+ / $+ %zcords $+ ] was created
      }
    }
    inc %firstbiome
  }
}

;;; Erkunden ;;;

on *:text:!explore*:#: {
  if ($exists($Spielerdb($nick)) == $false) { 
    msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]  12EXPLORE-4ERROR Spieler $nick Existiert nicht!. 
    msg $chan !explore ist nur für Registrierte Spieler nutzbar!
    halt 
  }
  if ($exists($Spielerdb($nick)) == $true) {
    set -u3 %currentpos $readini($Spielerdb($nick),AccountInfo,LastPos)
    set -u3 %cur-x $gettok(%currentpos,1,32)
    set -u3 %cur-z $gettok(%currentpos,2,32)
    Msg $chan Aktuelle Position %cur-x / %cur-z
    if ($2 == N) && ($3 isnum) { 
      set -u3 %newcur-x $calc(%cur-x + $3)
      msg $chan Du bewegst dich $3 Blöcke nach Norden und erreicht somit chunk %newcur-x / %cur-z
      writeini $Spielerdb($nick) Accountinfo LastPos $replace(%currentpos,%cur-x,%newcur-x)
    }
    if ($2 == S) && ($3 isnum) { 
      set -u3 %newcur-x $calc(%cur-x - $3)
      msg $chan Du bewegst dich $3 Blöcke nach Süden und erreicht somit chunk %newcur-x / %cur-z
      writeini $Spielerdb($nick) Accountinfo LastPos $replace(%currentpos,%cur-x,%newcur-x)
    }
  }
  set %chunklabel %newcur-x $+ / $+ %cur-z
  set %biomename $readini($GameData(chunk), %chunklabel, Name)
  if (%biomename == $null) { msg $chan you reached chunk[ $+ %chunklabel $+ $chr(93) }
  if (%biomename != $null) {
    msg $chan you have reached biome %biomename
  }
}

;;; Materialgenerierung ;;;

on 100:text:!materialgen:#: {
  var %maxmat $lines(material-id.txt)
  msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Datenbankgenerierung 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
  msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Generiere 12,1 %maxmat 7,1 Items.....
  msg $chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 4,1Dies dauert einen Moment...
  set %displaychan $chan
  /timerdbgen1 1 5 /itemdbgen
}

;;; Spielerinventar ;;;

on 1:text:!inventar:#: {
  set -u5 %nick $nick
  $getInventory(%nick)
  $ShowInventar(%nick)
}
