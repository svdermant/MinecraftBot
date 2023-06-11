;;;;;; Mcraft Bot ;;;;;;;; V1.0

on *:LOAD: {
  set %m-channel #Aygon-Minecraft
  set %Head-3 0,1
  set %rcon [RCON Client /0:0:0:0:0:0:0:1
  set %rcon2 Thread RCON Client /0:0:0:0:0:0:0:1 shutting down
  set %rcon3 /INFO]:
  set %valid-settings allow-nether.level-type.allow-flight.broadcast-console-to-ops.broadcast-rcon-to-ops.debug.difficulty.enable-command-block.enable-rcon.enable-status.enforce-secure-profile.enforce-whitelist.force-gamemode.fuction-permission-level.gamemode.generate-structures.hide-online-players.level-name.max-players.motd.pvp.server-port.simulation-distance.spawn-animals.spawn-monsters.spawn-npcs.spawn-protection.white-list
  set %true-false-settings allow-nether.level-type.allow-flight.broadcast-console-to-ops.broadcast-rcon-to-ops.debug.difficulty.enable-command-block.enable-rcon.enable-status.enforce-secure-profile.enforce-whitelist.force-gamemode.gamemode.generate-structures.hide-online-players.level-name.spawn-animals.spawn-monsters.spawn-npcs.whitelist
  set %level level-type
  set %num-settings fuction-permission-level.max-players.server-port.simulation-distance.spawn-protection
  set %moblist piglinbrute.snowman.panda.bee.axolotl.zoglin.cow.furnaceminecart.pig.spawnerminecart.allay.skeleton.llama.mule.bat.husk.frog
  set %moblist2 hoglin.zombiehorse.rabbit.silverfish.zombievillager.giant.drowned.enderdragon.dolphin.elderguardian.stray.shulker.turtle.chestminecart
  set %moblist3 vex.salmon.goat.ocelot.endercrystal.horse.vindicator.glowsquid.phantom.minecart.experienceorb.evoker.warden.squid.parrot.creeper.cavespider.enderman
  set %moblist4 zombifiedpiglin.magmacube.tadpole.chicken.ravager.hopperminecart.donkey.witherskeleton.strayskeleton.fox.slime.pillager.blaze.piglin.chestboat.endermite
  set %moblist5 tropicalfish.cat.pigzombie.zombie.mushroomcow.irongolem.guardian.polarbear.traderllama.ghast.sheep.tntminecart.skeletonhorse.illusioner.ufferfish.anderingtrader
  set %moblist6 amorstand.wolf.villager.boat.strider.witch.cod.spider.wither
}

;;;; Logsystem vom Minecraft Server ;;;;;;

Alias checklog {
  set %i $lines(C:\Users\Administrator\AppData\Roaming\mIRC\logs\latest.log)
  if (%temp.r != $read(C:\Users\Administrator\AppData\Roaming\mIRC\logs\latest.log, %i)) {
    set %temp.r $read(C:\Users\Administrator\AppData\Roaming\mIRC\logs\latest.log, %i)
    set %time $timestamp
    set %temp.rv $remove(%temp.r, $timestamp, [<ip address withheld>], %time, $time)
    set %temp.rv2 %Head-3 $replace( $+ %temp.rv, logged in with entity, 9meldet sich an mit, left the game, 14Verlies den Server00, $&
      /INFO]:, /INFO]: $timestamp, [Async Chat Thread, MC-Chat, $&
      Server Thread,11S14erver 11E14vent0],issued Server command:, Server Befehl4:7, $& 
      fell from a high place, :5[10Ist aus Großer Höhe gefallen5, $&
      was shot by Skeleton, 5[10Wurde erschossen von: 4Skelett5], was stung to death, 5[10wurde zu Tode gestochen5], $&
      was fireballed by Blaze, 5[10Wurde von 4Lohe5 10flambiert5], $&
      was fireballed by Ghast, 5[10Wurde von 4Ghast5 10flambiert5], $&
      was slain by Cave Spider, 5[10Wurde von 4Höhlenspinne5 10erschlagen5], $&
      was blown up by Creeper, 5[10Wurde von 4Creeper5 10in die Luft gesprengt5], $&
      was slain by Wither Skeleton, 5[10Wurde von 4Wither Skelett5 10erschlagen5], $&
      was slain by Warden, 5[10Wurde von 4Wärter5 10erschlagen5], $&
      was slain by Piglin Brute, 5[10Wurde von 4Piglin Babar5 10erschlagen5], $&
      was slain by Husk, 5[10Wurde von 4Wüstenzombie5 10erschlagen5], $&
      was slain by Panda, 5[10Wurde von 4Panda5 10erschlagen5], $&
      was slain by Zoglin, 5[10Wurde von 4Zoglin5 10erschlagen5], $&
      was slain by Wolf, 5[10Wurde von 4Wolf5 10erschlagen5], $&
      died, 5[10Starb!!5], $&
      was shot by, 5[10Wurde erschossen von5]:4 , $&
      was slain by Hoglin, 5[10Wurde von 4Hoglin5 10erschlagen5], $&
      was shot by Pillager, 5[10Wurde von 4Plünderer5 10erschossen5], $&
      was shot by Stray, 5[10Wurde von 4Eiswanderer5 10erschossen5], $&
      was slain by Magma Cube, 5[10Wurde von 4Magma Würfel5 10erschlagen5], $&
      was killed by Witch using magic, 5[10Wurde von 4Hexe5 10mit Magie getötet5], $&
      was slain by Zombie Villager, 5[10Wurde von 4Zombiedorfbewohner5 10erschlagen5], $&
      was slain by Zombie, 5[10Wurde von 4Zombie5 10erschlagen5], $&
      hit the ground too hard whilst trying to escape Spider, 5[10fiel beim Versuch 4Spinne5 10zu entkommen der Schwerkraft zum Opfer5], $&
      was slain by Spider, 5[10Wurde von 4Spinne5 10erschlagen5], $&
      was slain by Zombified Piglin, 5[10Wurde von 4Zombiefizierter Piglin5 10erschlagen5], $&
      was slain by Piglin, 5[10Wurde von 4Piglin5 10erschlagen5], $&
      was slain by Vindicator, 5[10Wurde von 4Diener5 10erschlagen5], $&
      was slain by Ravager, 5[10Wurde von 4Verwüster5 10erschlagen5], $&
      was slain by Zombie Villager, 5[10Wurde von 4Zombiedorfbewohner5 10erschlagen5], $&
      was killed by Elder Guardian using magic, 5[10Wurde von 4Großer Wächter5 10mit Magie getötet5], $&
      was slain by Elder Guardian, 5[10Wurde von 4Großer Wächter5 10erschlagen5], $&
      was slain by Enderman, 5[10Wurde von 4Enderman5 10erschlagen5], $&
      was slain by Shulker, 5[10Wurde von 4Shulker5 10erschlagen5], $&
      was slain by Endermite, 5[10Wurde von 4Endermite5 10erschlagen5], $&
      was slain by Vex, 5[10Wurde von 4Plagegeist5 10erschlagen5], $&
      was slain by Polar Bear, 5[10Wurde von 4Eisbär5 10erschlagen5], $&
      was killed by Evoker using Magic, 5[10Wurde von 4Magier5 10mit Magie getötet5], $&
      was impaled by Drowned, 5[10Wurde von 4Ertrunkener5 10aufgespiest5], $&
      was killed trying to hurt Elder Guardian, 5[10Wurde beim Versuch, 4Großer Wächter5 10zu töten, erschlagen5], $&
      was killed trying to hurt Guardian, 5[10Wurde beim Versuch, 4Wächter5 10zu töten, erschlagen5], $&
      was slain by Drowned, 5[10Wurde von 4Ertrunkenen5 10erschlagen5], $&
      was slain by Blaze, 5[10Wurde von 4Lohe5 10erschlagen5], $&
      blew up, 5[10Wurde in die Luft gesprengt!5], $&
      was doomed to fall, 5[10Wurde zum absturz verdammt!5], $&
      tried to swim in lava, 5[10Versuchte in 4Lava5 10zu schwimmen5], $&
      drowned, :5[10Ertrank im Wasser5]) 
    set %temp.rv3 $remove(%temp.rv2, $timestamp, %rcon, %rcon2, %time, %rcon3)
    ::: msg %checkchan 1,7[0-1]0,14 S4Y No.071 1][0,14 RolePlay Server 1,7[0-1] %temp.rv1
    ;; msg #Aygon-Minecraft 7,1[4-7] 11I14GameRPG 11N14o.2 4|-| 11M14inecraft 11S14erver 7[4-7]0,1 %temp.rv3 %command %tps3
    msg #Bot-Lounge 7,1[4-7] 11C14hatlog 7]4▬7[11 I14game11RPG 9═►11 %SrvNR.2 9◄═ 7]4▬7[ 9→11M14inecraft9← 7,1[4-7]00,01 $+ %temp.rv3 %command %tps3   
    msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %temp.rv3 %command %tps3
  }
}

alias lagausgabe {
  set %i 1
  set %zeilen $lines(C:\Users\Administrator\AppData\Roaming\mIRC\lag.txt)
  while (%i <= %zeilen) {
    set %text $read -l $+ %i lag.txt
    set %text.result $replace(%text, §6, $chr(3) $+ 07, §c, $chr(3) $+ 04, §a, $chr(3) $+ 09)
    inc %i
    msg %m-channel %text.result
  } 
}

;;;; Ausgabe Serverresult vom !server settings command ;;;;;;

alias serverresult {
  var %settings.4.r $remove(%settings.4,allow-nether=)
  var %settings.4.result $replace(%settings.4.r, true, 9ja, false, 4nein)
  var %settings.3.r $remove(%settings.3,allow-flight=)
  var %settings.3.result $replace(%settings.3.r, true, 9ja, false, 4nein)
  var %settings.5.r $remove(%settings.5,broadcast-console-to-ops=)
  var %settings.5.result $replace(%settings.5.r, true, 9ja, false, 4nein)
  var %settings.6.r $remove(%settings.6,broadcast-rcon-to-ops=)
  var %settings.6.result $replace(%settings.6.r, true, 9ja, false, 4nein)
  var %settings.7.r $remove(%settings.7,debug=)
  var %settings.7.result $replace(%settings.7.r, true, 9Aktiv, false, 4Inaktiv)
  var %settings.8.r $remove(%settings.8,difficulty=)
  var %settings.8.result $replace(%settings.8.r, easy, leicht, peaceful, friedlich, normal, normal, hard, schwer)
  var %settings.9.r $remove(%settings.9, enable-command-block=)
  var %settings.9.result $replace(%settings.9.r, true, 9ja, false, 4nein)
  var %settings.12.r $remove(%settings.12, enable-rcon=)
  var %settings.12.result $replace(%settings.12.r, true, 9ja, false, 4nein)
  var %settings.13.r $remove(%settings.13, enable-status=)
  var %settings.13.result $replace(%settings.13.r, true, 9ja, false, 4nein)
  var %settings.14.r $remove(%settings.14, enforce-secure-profile=)
  var %settings.14.result $replace(%settings.14.r, true, 9ja, false, 4nein)
  var %settings.15.r $remove(%settings.15,enforce-whitelist=)
  var %settings.15.result $replace(%settings.15.r, true, 9ja, false, 4nein)
  var %settings.17.r $remove(%settings.17,force-gamemode=)
  var %settings.17.result $replace(%settings.17.r, true, 9ja, false, 4nein)
  var %settings.18.r $remove(%settings.18,function-permission-level=)
  var %settings.18.result $replace(%settings.18.r, 1, Moderator, 2, GameMaster, 3, Admin, 4, Owner)
  var %settings.19.r $remove(%settings.19,gamemode=)
  var %settings.19.result $replace(%settings.19.r, survival, Überleben, creative, Kreativ)
  var %settings.20.r $remove(%settings.20,generate-structures=)
  var %settings.20.result $replace(%settings.20.r, true, 9ja, false, 4nein)
  var %settings.23.r $remove(%settings.23, hide-online-players=)
  var %settings.23.result $replace(%settings.23.r, false, 4nein, true, 9ja)
  var %settings.26.r $remove(%settings.26, level-name=)
  var %settings.27.r $remove(%settings.27, level-seed=)
  var %settings.30.r $remove(%settings.30, max-players=)
  var %settings.32.r $remove(%settings.32, max-world-size=)
  var %settings.33.r $remove(%settings.33, motd=)
  var %settings.39.r $remove(%settings.39, pvp=)
  var %settings.39.result $replace(%settings.39.r, true, 9ja, false, 4nein)
  var %settings.49.r $remove(%settings.49, server-port=)
  var %settings.50.r $remove(%settings.50, simulation-distance=)
  var %settings.51.r $remove(%settings.51, spawn-animals=)
  var %settings.51.result $replace(%settings.51.r, true, 9ja, false, 4nein)
  var %settings.52.r $remove(%settings.52, spawn-monsters=)
  var %settings.52.result $replace(%settings.52.r, true, 9ja, false, 4nein)
  var %settings.53.r $remove(%settings.53, spawn-npcs=)
  var %settings.53.result $replace(%settings.53.r, true, 9ja, false, 4nein)
  var %settings.54.r $remove(%settings.54, spawn-protection=)
  var %settings.59.r $remove(%settings.59, white-list=)
  var %settings.59.result $replace(%settings.59.r, true, 9ja, false, 4nein)
  var %settings.28.r $remove(%settings.28, level-type=)
  var %settings.28.result $replace(%settings.28.r, minecraft\:normal, Normal, minecraft\:flat, Flachland)

  msg %m-channel 10,1[7 Nether-Erlauben: 4 $+ %settings.4.result 10][7 Flugmodus Aktiv: 4 $+ %settings.3.result 10][7 Ausgabe der Consolenbefehle zu Ops senden: 4 $+ %settings.5.result 10][7 RCON Befehle an OPS senden: 4 $+ %settings.6.result 10] 
  msg %m-channel 10,1[7 Debug Modus: 8 $+ %settings.7.result 10][7 Schwierigkeitsgrad: 8 $+ %settings.8.result 10][7 Befehlsblöcke erlauben: 4 $+ %settings.9.result 10][7 Remotezugriff: 4 $+ %settings.12.result 10][7 Server in der Serverliste anzeigen: 4 $+ %settings.13.result 10]
  msg %m-channel 10,1[7 Nur Mojang Accounts: 4 $+ %settings.14.result 10][7 Privater Zugang: 4 $+ %settings.15.result 10][7 Erzwungener Spielmodus: 8 $+ %settings.17.result 10][7 Funktionslevel: 8 $+ %settings.18.result 10] 
  msg %m-channel 10,1[7 Spielmodus: 8 $+ %settings.19.result 10][7 Strukturen erzeugen: 4 $+ %settings.20.result 10][7 Online Spieler verstecken: 4 $+ %settings.23.result 10][7 Hauptwelt: 8 $+ %settings.26.r 10] 
  msg %m-channel 10,1[7 Seed: 4 $iif(%settings.27.r == $null, 4 Zufällig  , $+ %settings.27.r) 10][7 Welttyp: 8 $+ %settings.28.result 10][7 Max Spieler: 12 $+ %settings.30.r 10][7 Weltgrenze liegt bei: 12 $+ %settings.32.r 7Blöcken 10][7 MOTD: 8 $+ %settings.33.r 10][7 PVP: 4 $+ %settings.39.result 10]
  msg %m-channel 10,1[7 Serverport: 12 $+ %settings.49.r 10][7 Simulationsentfernung: 12 %settings.50.r 10][7 Tiere erzeugen: 04 $+ %settings.51.result 10][7 Monster erzeugen: 04 $+ %settings.52.result 10] 
  msg %m-channel 10,1[7 NPC's erzeugen: 04 $+ %settings.53.result 10][7 Spawn Schutz: 12 $+ %settings.54.r 7Blöcke 10][7 Privater Server: 04 $+ %settings.59.result 10]
}

alias ausgabe {
  set %gomo $read(C:\Users\Administrator\AppData\Roaming\mIRC\task.txt, s,  java.exe)
  set %pid $replace(%gomo, $chr(32),.)
  set %numtok $numtok(%pid,46)
  set -u5 %pidnumber $gettok(%pid,1,46)
  if (%dir isin $finddir($mircdir, $+ %dir $+ *,1)) && (%pidnumber isnum) { msg %m-channel Sorry der Server Läuft bereits und ich konnte die Welt nicht löschen. Bitte stoppe ihn zuerst. Danke | halt }
  if (%dir isin $finddir($mircdir, $+ %dir $+ *,1)) && (%pidnumber == $null) { 
    msg %m-channel Achtung Welt wird gelöscht und beim Nächsten Neustart neu erstellt.
    /run cmd.exe /c RMDIR /S /Q %dir
    /halt
    /remove task.txt
  }
}

alias vault-ausgabe {
  set %Ecos $read -l2 vault-info.txt
  set %Ecos.r $remove(%Ecos, [Vault], ], [BagOfGold)
  set %Ecos.r1 $replace(%Ecos.r,$chr(32) $+ $chr(44) $+ $chr(32), $chr(44), $chr(44) $+ $chr(32), $chr(44), $chr(44),.,:,: $+ $chr(32))
  set %Ecos.r2 $remove(%Ecos.r1,$chr(32) )
  set %Ecos.r3 $replace(%Ecos.r2,:,: $+ $chr(32))
  if (%econ1 !isin %Ecos.r3) && (%econ2 !isin %Ecos.r3) { /msg %m-channel Konte %econ1 nicht finden. Bitte sei dir Sicher das du es Richtig geschrieben hast. | /msg %reply-chan Gültige EcoPlugins sind: $remove(%Ecos.r3,Economy:) | halt }
  if (%econ1 isin %Ecos.r3) && (%econ2 !isin %Ecos.r3) { /msg %m-channel Konte %econ2 nicht finden. Bitte sei dir Sicher das du es Richtig geschrieben hast. | /msg %reply-chan Gültige EcoPlugins sind: $remove(%Ecos.r3,Economy:) | halt }
  if (%econ1 isin %Ecos.r3) && (%econ2 isin %Ecos.r3) { 
    /msg %m-channel Währung wird von %econ1 zu %econ2 Konvertiert dieses kann einen Moment dauern.
    /run rcon.exe -a localhost:25575 -p %dreckmist "vault-convert %econ1 %econ2"
    /remove vault-info.bat
    /remove vault-info.txt
  }
  ;;$replace(%Ecos.r, $chr(32) $chr(44), $chr(44))
  ::timer.say1 1 3 /msg %reply-chan %Ecos.r3
}

alias zeitsteuerung-tag {
  if (%zeit == tag) {
    /timer.nacht1 off
    /timer.nacht3 off
    /timer.bacht2 off 
    /timer.tag1 1 1230 /msg %m-channel Der Abend bricht an.. Ihr solltet euer Haus ⌂ oder Bett ∟ aufsuchen falls ihr überleben wollt in der Kommenden nacht.
    /timer.fag1 1 1230 /run rcon.exe -a localhost:25575 -p %dreckmist "broadcast Der Abend bricht an.. Ihr solltet euer Haus ⌂ oder Bett ∟ aufsuchen falls ihr überleben wollt in der Kommenden nacht."
    /timer.bag1 1 1240 /set %zeit nacht
    /timer.bag2 0 1 /zeitsteuerung-nacht
    /timer.bacht2 off
  }
}

alias zeitsteuerung-nacht {
  if (%zeit == nacht) {
    /timer.tag1 off
    /timer.bag2 off
    /timer.fag1 off 
    /timer.nacht1 1 510 /msg %m-channel  Der Tag bricht an.. ☼ ☼ 
    /timer.nacht3 1 510 /run rcon.exe -a localhost:25575 -p %dreckmist "broadcast Der Tag ☼  bricht an."
    /timer.nacht2 1 510 /set %zeit tag
    /timer.bacht2 0 1 /zeitsteuerung-tag
  }
}

alias tps {
  if ( 20 isin %newtag ) { set -u10 %tagresult 10[11Ausgezeichnet10] }
}

alias scriptlines { 
  var %x = 1 
  while (%x <= $script(0)) {
    set %script.lines $calc(%script.lines + $lines($script(%x))) 
    inc %x 
  } 
  set %scriptlines %script.lines
  unset %script.lines 
}
