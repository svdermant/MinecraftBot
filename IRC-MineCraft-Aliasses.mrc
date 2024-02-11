;;;;; IRC-MineCraft Aliasse ;;;;;

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
