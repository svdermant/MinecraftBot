;;;    Script Test Datei mit erstem Hashtable verusch   ;;;
;;; ===========================================;;;

on *:text:@region*:%m-channel: {
  var %regionname $3
  var %weltname $5
  var %flagname $6
  var %werte $7-
  if ($2 == $null) || ($2 != flag) { msg %m-channel 4FEHLER:  Fehlende Parameter. Befehlseingabe ist: 7 @region flag regionname -w weltname flagname werte | /halt }
  if ($2 == flag) && (%regionname == $null) { msg %m-channel 4FEHLER:  Regionname Fehlt! | /msg %m-channel Befehlseingabe ist: 7 @region flag regionname -w weltname flagname werte | /halt }
  if ($2 == flag) && (%regionname != $null) && ($4 == $null) { msg %m-channel 4FEHLER:  Weltname Fehlt! | /msg %m-channel Befehlseingabe ist: 7 @region flag regionname -w weltname flagname werte | /halt }
  if ($2 == flag) && (%regionname != $null) && ($4 == -w) && (%weltname != $null) && (%flagname != allow-block-place)  || (%flagname == $null)  { msg %m-channel 4FEHLER:  Flagname Fehlt! | /msg %m-channel Befehlseingabe ist: 7 @region flag regionname -w weltname flagname werte | /halt }
  if ($2 == flag) && (%regionname != $null) && ($4 == -w) && (%weltname != $null) && (%flagname == allow-block-place) && (%werte == $null) { msg %m-channel 4FEHLER:  Die Werte für %flagname Fehlen. | /msg %m-channel Befehlseingabe ist: 7 @region flag regionname -w weltname allow-block-place BLOCKID | /halt }
  if ($2 == flag) && (%regionname != $null) && ($4 == -w) && (%weltname != $null) && (%flagname == allow-block-place) && (%werte != $null) {
    var %maxmaterials $lines(material-id.txt)
    /hmake -s materialien $calc(%maxmaterials / 10)
    var %zeile 1
    while (%zeile <= %maxmaterials) {
      var %eintrag $read(material-id.txt, %zeile)
      var %item MATID $+ %zeile
      /hadd -s materialien %item %eintrag
      inc %zeile
    }
  }
}
;;; @region flag regionname -w weltname flagname werte ;;; <---- Aufbau des Testbefehls

!region flag -w NPCTest flag werte

;; Suchmechanismus in HashTable
$hfind(materialien,ACACIA_BOAT,0,n,echo -ag Data $hget(materialien,$1)).data

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

alias plugins {
  var %maxpl $findfile(%pfad $+ plugins/, *.jar,0)
  var %x 1
  while (%x <= %maxpl) {
    echo -ag Pluginname: $findfile(%pfad $+ plugins/, *.jar,%x)
    inc %x
  }
}
