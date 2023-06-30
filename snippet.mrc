alias head {
  var %maxheads = 10
  var %head $read -l $+ $rand(1,%maxheads) heads.txt
  var %headresult %head
  return %headresult
}

alias headmitte {
  var %maxheads = 10
  var %head $read -l $+ $rand(1,%maxheads) heads-m.txt
  var %headresult %head
  return %headresult
}

off *:text:!head:#: {
  var %head $head
  var %head2 $headmitte
  msg $chan %head <- Foderes Symbol:textinirgendeinerweise: %head2 Mitte: textfortsetung Ende mit symbol-> %head
}
