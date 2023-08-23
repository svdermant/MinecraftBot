alias 10blines {
  var %i = 0
  var %x = 10
  while (%i < %x) {
    inc %i
    say $read(%scripte-pfad $+ \neue-scripte.txt, %i)
  }
}

alias last3lines {
  var %maxlines $lines(%scripte-pfad $+ neue-scripte.txt)
  say $read(%scripte-pfad $+ \neue-scripte.txt, %maxlines)
  say $read(%scripte-pfad $+ \neue-scripte.txt, $calc(%maxlines -1))
  say $read(%scripte-pfad $+ \neue-scripte.txt, $calc(%maxlines -2))
}
