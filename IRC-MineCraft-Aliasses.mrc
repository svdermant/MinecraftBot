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
