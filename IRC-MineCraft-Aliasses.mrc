;;;;; IRC-MineCraft Aliasse ;;;;;

alias botdir { return $mircdir }
alias Spielerdb { return $botdir $+ Spielerdaten\ $+ $1 $+ .db }


;;;--------------
;;; Alias LastPos
;;; Generiert eine Zufällige Startposition
;;;--------------

Alias LastPos {
  var %maxcords 3
  var %cordgen 1
  while (%cordgen <= %maxcords)  {
    echo -ag Durchgang %cordgen
    var %x $rand(1,500)
    var %y $rand(1,64)
    var %z $rand(1,500)
    var %negate-x $rand(1,100) 
    var %negate-y $rand(1,100) 
    var %negate-z $rand(1,100) 
    echo -ag Negate Changen x= %negate-x y= %negate-y z= %negate-z
    if (%negate-x <= 50) { var %xpos - $+ %x }
    if (%negate-y <= 50) { var %ypos - $+ %y }
    if (%negate-z <= 50) { var %zpos - $+ %z }
    if (%negate-x >= 50) { var %xpos %x }
    if (%negate-y >= 50) { var %ypos %y }
    if (%negate-z >= 50) { var %zpos %z }
    inc %cordgen
  }
  echo -ag LastPos are: x= %xpos y= %ypos z= %zpos 
  set %mcposition %xpos %ypos %zpos
  echo -ag ->>>> %mcposition
}

;;;----------------
;;; Alias Sortlist
;;; Sortiert die Todoliste
;;;---------------

Alias sortlist {
  var %maxlines $lines(ircmc-todo.txt)
  echo -ag Lines: %maxlines
  var %x 1
  while (%x <= %maxlines) {
    var %id $read(ircmc-todo.txt,%x)
    echo -ag Eintrag in Zeile: %x = %id
    var %idtoken $gettok(%id,10-13,32)
    echo -ag Idtoken in Zeile: %x = %idtoken
    if (%x !isin %idtoken) || (%x isin %idtoken) { var %newidtoken 4→9 %x 15 4← }
    echo -ag Neues Idtoken in Zeilen %x = %newidtoken
    echo -ag Neuer Text mit richtiger ID: $replace(%id,%idtoken,%newidtoken)
    /write -l $+ %x ircmc-todo.txt $replace(%id,%idtoken,%newidtoken)
    inc %x
  }
}

;;;---------------
;;; Alias Inventargen
;;; Generiert das Spielerinventar anhand der Inventarslots
;;; $1 = Spielername

Alias inventargen {
  var %maxinvslots $readini($Spielerdb($1), AccountInfo, InventarSlots)
  echo Inventarslots für $1 sind %maxinvslots
  var %x 1
  while (%x <= %maxinvslots) {
    writeini $Spielerdb($1) InventarSlot $+ %x Name AIR
    writeini $Spielerdb($1) InventarSlot $+ %x Anzahl 0
    inc %x
  }  
}

;;; --------------
;;; Alias firstitems
;;; Erstellt die Ersten 5 Items 
;;; $1 = Spielername
;;; ---------------------------

Alias firstitems {
  var %firstitems 6
  var %itemnames WOODEN_AXE.WOODEN_HOE.WOODEN_SHOVEL.WOODEN_PICKAXE.WOODEN_SWORD.APPLE
  var %Anzahl 1
  var %x 1
  while (%x <= %firstitems) {
    var %item $readini($Spielerdb($1),InventarSlot $+ %x,Name)
    var %currentitem $gettok(%itemnames,%x,46)
    if ($readini($Spielerdb($1),InventarSlot $+ %x,Name) == AIR) { var %firstitem $gettok(%itemnames,%x,46) }
    if ($readini($Spielerdb($1),InventarSlot $+ %x,Name) == AIR) && (%currentitem == APPLE) { var %Anzahl 6 }

    ;;;InventarSlot %x hat das Item %firstitem Anzahl %anzahl

    writeini $Spielerdb($1) InventarSlot $+ %x Name %firstitem
    writeini $Spielerdb($1) InventarSlot $+ %x Anzahl %Anzahl
    inc %x
  }
}

alias todo-fix {
  var %todoliste $botdir $+ ircmc-todo.txt
  var %maxlines $lines(%todoliste)
  echo -ag Zeilenanzahl %maxlines
  var %x 1
  var %fixed 0
  var %fixedlabel 7,1[9▒7] 4→11F14i11X14Ed4← 7[9▒7,1]
  while (%x <= %maxlines) {
    if (%fixedlabel !isin $read(%todoliste,%x)) { inc %x }
    if (%fixedlabel isin $read(%todoliste,%x)) {
      msg %chan $gettok($read(%todoliste,%x),1-,32)
      inc %fixed
      inc %x
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4 %fixed  Fixed Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

alias todo-fertig {
  var %todoliste $botdir $+ ircmc-todo.txt
  var %maxlines $lines(%todoliste)
  echo -ag Zeilenanzahl %maxlines
  var %x 1
  var %fertig 0 
  var %fertiglabel 7,1[9√7]
  while (%x <= %maxlines) {
    if (%fertiglabel !isin $read(%todoliste,%x)) { inc %x }
    if (%fertiglabel isin $read(%todoliste,%x)) {
      msg %chan $gettok($read(%todoliste,%x),1-,32)
      inc %fertig
      inc %x
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4 %fertig  Fertige Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

alias todo-neu {
  var %todoliste $botdir $+ ircmc-todo.txt
  var %maxlines $lines(%todoliste)
  echo -ag Zeilenanzahl %maxlines
  var %x 1
  var %neu 0 
  var %neulabel 7[8ↈ13NEU8ↈ7,1]
  while (%x <= %maxlines) {
    if (%neulabel !isin $read(%todoliste,%x)) { inc %x }
    if (%neulabel isin $read(%todoliste,%x)) {
      msg %chan $gettok($read(%todoliste,%x),1-,32)
      inc %neu
      inc %x
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Todo Liste 4 %neu  Neue Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}
