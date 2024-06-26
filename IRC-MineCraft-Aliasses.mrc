;;;;;; MinecraftBot ;;;;;;;; V1.1b
;;;;;; Author: Serkons
;;;;;; Githubname: Svdermant
;;;;;; GithubRepo: https://github.com/svdermant/MinecraftBot/
;;;;;; Erstellungsdatum: 11. Juni . 2023

;;;;; IRC-MineCraft Aliasse ;;;;;

;;; Alias Systemzeit
;; Gibt die Systemzeit Wieder...
;;;;;;;;;;;;;;;;;;;;;;

alias Systemzeit {
  var %systemzeit $asctime(hh:nn)
  return %systemzeit
}


;;; Standard verzeichnis Aliasse

alias botdir { return $mircdir }
alias Spielerdb { return $botdir $+ Spielerdaten\ $+ $1 $+ .db }
alias GameData { return $botdir $+ Irc-MC\data\ $+ $1 $+ .db }

;;; Alias Applecounter
;;; Zählt Äpfel beim Baum.

alias applecounter {
  var %x 1
  var %apples 0
  var %maxlines $readini($GameData(oaktree), TreeImage, Lines)
  while (%x <= %maxlines) {
    inc %apples $count($readini($GameData(oaktree),Treeimage,Line $+ %x),o)
    inc %x
  }
  echo Number of apples: %apples
}

;;;-----------
;;; Alias DisplayTree
;;; Zeigt denn gegebenen Baum im Raum an.
;;; $1 = Baumname
;;; $2 = Channel
;;;-----------------

Alias DisplayTree {
  var %ImageLines $readini($GameData($1), TreeImage, Lines)
  var %x 1
  while (%x <= %ImageLines) {
    msg %displaychan $readini($GameData($1), TreeImage, Line $+ %x)
    inc %x
  }
}

;;;-------
;;; Alias GetInventory
;;; Ermittelt das Spielerinventar an
;;; $1 = Spielername
;;;-------

Alias GetInventory {
  unset %Itemlist | Unset %Itemlist2
  var %maxslots $readini($Spielerdb($1), AccountInfo, InventarSlots)
  var %value 1
  while (%value <= %maxslots) {
    var %item $readini($Spielerdb($1), Inventarslot $+ %value, Name)
    var %isitem $readini($GameData(Items), %item, Name)
    var %Anzahl $readini($Spielerdb($1), Inventarslot $+ %value, Anzahl)
    if ((%Anzahl != $null) && (%Anzahl >= 1)) {
      if ($numtok(%itemlist,46) <= 20) { %itemList = $addtok(%itemList, 4 %Item $+ $chr(040) $+ %Anzahl $+ $chr(041), 46) } 
      else { %itemlist2 = $addtok(%itemList2, 4 %Item $+ $chr(040) $+ %Anzahl $+ $chr(041), 46) }
    }
    inc %value
  }
}

;;;-------
;;; Alias ShowInventar
;;; Zeigt das Spielerinventar an
;;; $1 = Spielername
;;;-------

alias ShowInventar {
  var %replacechar $chr(044) $chr(032)
  %itemlist = $replace(%itemlist, $chr(046), %replacechar)
  %itemlist2 = $replace(%itemlist2, $chr(046), %replacechar)
  if (%itemlist != $null) {
    msg $1 Inventar %Itemlist
  }
  if (%itemlist2 != $null) {
    msg $1 %itemlist2
  }
  unset %Itemlist*
}

;;;--------------
;;; Alias LastPos
;;; Generiert eine Zufällige Startposition
;;;--------------

Alias LastPos {
  var %maxcords 1
  var %cordgen 1
  while (%cordgen <= %maxcords)  {
    echo -ag Durchgang %cordgen
    var %x $rand(-50,50)
    var %y $rand(-64,64)
    var %z $rand(-50,50)
    echo -ag x= %x y= %y z= %z
    inc %cordgen
  }
  echo -ag LastPos sind: x= %x y= %y z= %z 
  set %mcposition %x %y %z
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
  var %fixedlabel 4→11F14i11X14Ed4←
  while (%x <= %maxlines) {
    if (%fixedlabel !isin $read(%todoliste,%x)) { inc %x }
    if (%fixedlabel isin $read(%todoliste,%x)) { 
      echo fixed ist in zeile %x
      msg %chan $gettok($read(%todoliste,%x),1-,32)
      inc %x
      inc %fixed
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste 4,1 %fixed 14,1 Fixed Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

alias todo-fertig {
  var %todoliste $botdir $+ ircmc-todo.txt
  var %maxlines $lines(%todoliste)
  echo -ag Zeilenanzahl %maxlines
  var %x 1
  var %fertig 0 
  var %fertiglabel 7,1[9√7]
  while (%x <= %maxlines) {
    if (%fertiglabel !isin $read(%todoliste,%x)) { inc %x }
    if (%fertiglabel isin $read(%todoliste,%x)) {
      msg %chan $gettok($read(%todoliste,%x),1-,32)
      inc %fertig
      inc %x
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste 4,1 %fertig 14,1 Fertige Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

alias todo-neu {
  var %todoliste $botdir $+ ircmc-todo.txt
  var %maxlines $lines(%todoliste)
  echo -ag Zeilenanzahl %maxlines
  var %x 1
  var %neu 0
  var %neulabel 7[8ↈ13NEU8ↈ7,1]
  while (%x <= %maxlines) {
    if (%neulabel !isin $read(%todoliste,%x)) { inc %x }
    if (%neulabel isin $read(%todoliste,%x)) {
      msg %chan 14,1 $gettok($read(%todoliste,%x),1-,32)
      inc %neu
      inc %x
    }
  }
  msg %chan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]14,1 Todo Liste 4,1 %neu 14,1 Neue Einträge 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

;;; Itemgenerierung

alias itemdbgen {
  write $GameData(items) ;;;; Items Datenbank
  write $GameData(items) ;;;; Struktur
  write $GameData(items) ;;;; [MATERIAL]
  write $GameData(items) ;;;; Type= (MaterialBlock,Food,TOOL,Weapon)
  write $GameData(items) ;;;; Name=
  write $GameData(items) ;;;; Desc=
  write $GameData(items) ;;;; Durability=

  set %letters a b c d e f g h i j k l m n o p q r s t u v w x y z _ ?
  var %uppercase A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ ?

  var %textlen $lines(material-id.txt)
  echo -ag Anzahl der Materialien %textlen
  var %x 1 
  while (%x <= %textlen) {
    set %replacetext $replace($read(material-id.txt,%x),$chr(32),_)
    var %matlen $len(%replacetext)
    var %b 1
    while (%b <= %matlen) {
      var %letter $right($left(%replacetext,%b),1)
      var %isletter $istok(%letters,%letter,32)
      var %letterpos $findtok(%letters,%letter,32)
      var %repo $gettok(%uppercase,%letterpos,32))
      var %text. $+ %b $+ %repo $+
      var %textout $remove($addtok(%textout, %text. $+ %b $+ %repo $+, 32),%b)
      inc %b
    }
    var -s %material $remove(%textout,$chr(32))
    echo -ag -> %material
    var -s %desc $materialdesc(%material)
    if (%desc == $null) { 
      dec %x
      msg %displaychan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 10,1 Es wurden erfolgreich 12,1 %x 9,1 Items/Materialien 10,1 Erstellt.
      msg %displaychan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Datenbankgenerierung 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
      halt
    }
    ;;write -l $+ %x C:\McraftBot_Data\materialID.db MaterialID= $+ %x Name= $+ %material
    writeini $GameData(items) %material Type MaterialBlock
    writeini $GameData(Items) %material Name $replace(%material,_,$chr(32))
    writeini $GameData(Items) %material Desc %desc
    ;;writeini $GameData(Items) %material Desc Die Beschreibung zu %material
    writeini $GameData(Items) %material Durability 2
    unset %textout
    inc %x
  }
  msg %displaychan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] 10,1 Es wurden erfolgreich 12,1 %x 9,1 Items/Materialien 10,1 Erstellt.
  msg %displaychan 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1] Datenbankgenerierung 7,1[9▒7] 4→11I14rC-11M14inecraft4← 7[9▒7,1]
}

set %semp $char(93)

;; Materialbezeichnung.

alias materialdesc {
  var %maxmats $lines($GameData(materialdesc))
  var %x 1
  set %matarial $1
  ;;set %matarial $replace($read(material-id.txt, %x),$chr(32),_)
  set %newmatdesc $remove($read($GameData(materialdesc), w, * $+ %matarial $+ *), MaterialID=, %matarial $+ , $chr(61), DESC, $chr(59))
  return %newmatdesc
  echo -ag The Description to Material %matarial is %newmatdesc
  echo -ag --> %matarial
  echo -ag --> %newmatdesc
}

;set %newmatdesc $remove($read($GameData(materialdesc), w, * $+ %matarial $+ *), %matarial, MaterialID=,$chr(59),Desc=)


Alias Itemdbgen2 {
  var %maxlines $lines(material-id.txt)
  var %x 1
  while (%x <= %maxlines) {
    var %material $read(material-id.txt, %x)
    var %name $replace(%material,_,$chr(32))
    var %dura 2
    writeini $GameData(items) %material Type MaterialBlock
    writeini $GameData(items) %material Name %name
    writeini $GameData(items) %material Desc Die Beschreibung für %material
    writeini $GameData(items) %material Durability %dura
    inc %x
  }
  echo -ag Itemsdb wurde Geschrieben.
}
