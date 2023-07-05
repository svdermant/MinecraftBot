;;;;;; Mcraft Bot ;;;;;;;; V1.0

on 1:START: {
  echo 12*** Willkommen zum Minecraftbot v1.0 by Serkons aka Rene ***
  /.titlebar MineCraftBot version 1.0 by Serkons

  if (%first.run = false) { 
    set %bot.owner $readini(system.dat, botinfo, bot.owner) 
    if (%bot.owner = $null) { echo 4*** Warnung kein Botadmin gesetzt.. Bitte dies Beheben. **** 
    set %bot.owner $?="Bitte gib den Namen an den der Bot benutzen möchte" |  writeini system.dat botinfo bot.owner %bot.owner | .auser 100 %bot.owner }
    else { echo 12*** Die Botadminliste lautet zur Zeit:04 %bot.owner 12*** 
    }

    set %m-channel $readini(system.dat, botinfo, mchannel) 
    if (%m-channel = $null) { echo 04*** Warnung kein MinecaftChannel gesetzt. Setze einen *** 
    set %m-channel $?="Gib bitte den Minecraftraumnamen an bitte mit einer $chr(35) am Anfang." |  writeini system.dat botinfo mchannel %m-channel }
    else { echo 12*** Der Minecraftraum wurde Erstellt:04 %battlechan 12*** }

    set %bot.name $readini(system.dat, botinfo, botname)
    if (%bot.name = $null) { echo 4*** WARNUNG: Der Nickname des Bots ist nicht in der Systemdatei festgelegt. Bitte behebe das Problem jetzt.
    set %bot.name $?="Bitte gebe den Nicknamen des Bots ein, den der Bot verwenden soll" | writeini system.dat botinfo botname %bot.name | /nick %bot.name }
    else { /nick %bot.name } 

    set %mlog $readini(system.dat, MineCraftServer, Logpfad)
    if (%mlog = $null) { echo 4*** WARNUNG Es wurde kein Logpfad des MinecraftServers angegeben. Bitte behebe das Problem ...
      set %mlog $?="Bitte gib den Pfad an wo die MineCraft Serverlog liegt. (zb C:\MeinServer\Logs\latest.log)" | writeini system.dat MineCraftServer LogPfad %mlog
    }
    set %mProp $readini(system.dat, MineCraftServer, ServerPropPfad)
    if (%mProp = $null) { echo echo 4*** WARNUNG Es wurde keine Einstellungsdatei des MinecraftServers angegeben. Bitte behebe das Problem ...
      set %mProp $?="Bitte gib den Pfad zur Serverproperties datei an (zb C:\MeinServer\server.properties)" | writeini system.dat MineCraftServer ServerPropPfad %mProp
    }
    set %rcon_password $readini(system.dat, MineCraftServer, rconpass)
    if (%rcon_password = $null) { echo echo 4*** WARNUNG Es wurde keine Rconpassword des MinecraftServers angegeben. Bitte behebe das Problem ...
      set %rcon_password $?="Bitte gib das Rconpasswort an" | writeini system.dat MineCraftServer rconpass %rcon_password
    }
    var %botpass $readini(system.dat, botinfo, botpass)
    if (%botpass = $null) { 
      echo 12*** Legen nun bitte das Passwort fest, mit dem Sie den Bot registrieren möchten
      var %botpass $?="Gebe ein Passwort ein, welches du für den Bot bei  Nickserv verwendest"
      if (%botpass = $null) { var %bosspass none }
      writeini system.dat botinfo botpass %botpass
      echo 12*** OK.  Das Passwort wurde auf04 %botpass gestellt -- Vergiss nicht den Bot zu registrieren.
    }

    $system_defaults_check
  }

  if ((%first.run = true) || (%first.run = $null)) { 
    echo 12*** Es scheint, dass dies das erste Mal ist, wo du den MinecraftBot ausführst Der Bot wird nun versuchen, dir bei der Einrichtung zu helfen.
    echo 12*** Bitte lege jetzt den Spitznamen/Namen des Bots fest. Es gelten die normalen IRC-Nick-Regeln (z. B. keine Leerzeichen).
    set %bot.name $?="Bitte gib den Namen an welchen du Verwenden möchtest"
    if (%bot.name == $null) { echo 12**** Der Botname fehlt **** Programm wird geschlossen. | /exit }
    writeini system.dat botinfo botname %bot.name | /nick %bot.name
    echo 12*** Großartig. Der Nickname des Bots ist nun auf 4 %bot.name  eingestellt

    echo 12*** Gib nun den Botbesitzer an  
    set %bot.owner $?="Gib bitte den Namen an von wem der Bot benutzt werden darf"
    writeini system.dat botinfo bot.owner %bot.owner
    echo 12*** Gut der Botowner ist auf 4 %bot.owner gestellt

    echo 12***Legen nun bitte den IRC-Kanal fest, in dem der Bot verwendet werden soll.
    set %m-channel $?="Gib den Raumnamen an mit einer $chr(35) zu beginn"
    writeini system.dat botinfo mchannel %m-channel
    echo 12*** Der Bot wird nun in04 %m-channel laufen

    echo 12*** Lege nun bitte das Passwort fest, mit dem du den Bot bei Nickserv Registriert hast
    var %botpass $?="Gib das Password an"
    if (%botpass = $null) { var %bosspass none }
    writeini system.dat botinfo botpass %botpass
    echo 12*** OK. Das Passwort wurde auf 4 %botpass  gesetzt – Vergesse nicht, den Bot bei nickserv zu registrieren.

    echo 12*** Gib nun den Korrekten Pfad inclusive dateiname zu den Serverlogs des Minecraft Servers an.
    set %mlog $?="Gib jetzt den Pfad an. z.B: C:\MeinServer\Logs\latest.log"
    if ($exists(%mLog) == $false) { echo 4 Der Pfad der Serverlogdatei darf nicht leer sein. Startvorgang Abgebrochen | /exit | halt }
    writeini system.dat MineCraftServer LogPfad %mlog
    echo 12*** Ok. Weiter geht es mit der Angabe der Einstellungsdatei ***

    echo 12**Gib nun den Pfad deiner ServerProperties datei an
    set %mProp $?="Wo liegt die Servereinstellungsdatei"?
    if ($exists(%mProp) == $false) { echo 4 Der Pfad der Einstellungsdatei darf nicht leer sein. Startvorgang Abgebrochen | /exit | halt }
    writeini system.dat MineCraftServer ServerPropPfad %mProp

    echo 12**Gib nun das Rconpassword an dies wird Benötigt um Serverinterne funktionen zu steuern. Der Bot läüft zwar auch ohne aber man kann den Server dann schwer verwalten.
    set %rpass $read(%mProp,w,rcon.password*)
    set %r.pass $remove(%rpass,rcon.password=)
    set %rcon_password $?="Gib das Rconpasswort an was in deiner Serverproperties datei steht"
    if (%rcon_password == $null) { 
      echo 4 Kein Rconpassword angegeben. Serverseitige funktionen deaktiviert. 
      set %first.run false
      .auser 100 %bot.owner
      $system_defaults_check 
      /halt 
    }
    if (%rcon_password != %r.pass) {
      echo 4 Kein Rconpassword angegeben. Serverseitige funktionen deaktiviert. 
      set %first.run false
      .auser 100 %bot.owner
      $system_defaults_check 
      /halt 
      /halt 
    }
    writeini system.dat MineCraftServer rconpass %rcon_password

    set %first.run false
    .auser 100 %bot.owner
    $system_defaults_check
  }

  echo 12*** Dieser Bot wird am besten mit der mIRC-Version 04 7.41 laufen 12 *** 
  echo 12*** Deine version ist: 04 $version 12 ***

  if (($version > 6.3) && ($version < 7.41)) { echo 04*** Deine Version ist älter als die empfohlene Version für diesen Bot. Einige Dinge funktionieren möglicherweise nicht richtig. Es wird empfohlen, ein Update durchzuführen. 12*** }
  if ($version > 7.41) { echo 04*** Deine Version ist neuer als die empfohlene Version für diesen Bot. Obwohl er funktionieren sollte, ist es derzeit ungetestet und kann Macken oder Fehler aufweisen. Bei Problemen wird ein Downgrade auf 7.41 empfohlen. 12 *** }
}

on 1:EXIT: {
  /save -rv vars.ini
}

on 1:CONNECT: {
  if ($me == $readini(system.dat, botinfo, botname)) {
    /ns identify $readini(system.dat, botinfo, botpass)
  }
  if ($me != $readini(system.dat, botinfo, botname)) {
    /ns recover $readini(system.dat, botinfo, botname) $readini(system.dat, botinfo, botpass)
  }
}

;;;;;;;;; Systemcheck ;;;;;;;;;;;;;;

alias system_defaults_check {
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
  set %flaglist1 ability-pvp.allowed-cmds.block-break.block-place.block-trampling.blocked-cmds.build.chest-access.chorus-fruit-teleport.coral-fade.creeper-explosion.crop-growth.damage-animals.deny-message.deny-spawn.ecs-create-admin-shop.ecs-create-shop.ecs-remove-admin-shop.ecs-remove-shop.ecs-use-admin-shop.ecs-use-shop.enderdragon-block-damage.enderman-grief.enderpearl.entity-item-frame-destroy
  set %flaglist2 entity-painting-destroy.entry.entry-deny-message.exit.exit-deny-message.exit-override.lava-fire.lava-flow.leaf-decay.lighter.lightning.mythic-drops-unidentified-item.natural-health-regen.natural-hunger-drain.nonplayer-protection-domains.notify-enter
  set %flaglist3 exit-via-teleport.exp-drops.fall-damage.farewell.farewell-title.feed-amount.feed-delay.feed-max-hunger.feed-min-hunger.fire-spread.firework-damage.frosted-ice-form.frosted-ice-melt.game-mode.ghast-fireball.grass-growth.greeting.greeting-title.heal-amount.heal-delay.heal-max-health.heal-min-health.ice-form.ice-melt.interact.invincible.item-drop.item-frame-rotation.item-pickup
  set %flaglist4 mi-commands.mi-consumables.mi-tools.mi-weapons.mmo-abilities.mob-damage.mob-spawning.mushroom-growth.mycelium-spread.mypet-damage.mypet-deny.mypet-fly.mypet-leash.mythic-drops.mythic-drops-custom.mythic-drops-identity-tome.mythic-drops-socket-effects.mythic-drops-socket-extender.mythic-drops-socket-gem.mythic-drops-tiered
  set %flaglist5 notify-leave.other-explosion.passthrough.pistons.potion-splash.pvp.pvp-mode.ravager-grief.receive-chat.respawn-anchors.ride.rock-growth.sculk-growth.send-chat.sleep.snow-fall.snow-melt.snowman-trails.soil-dry.spawn.teleport.teleport-message.time-lock.tnt.use.use-anvil.use-dripleaf.vehicle-destroy.vehicle-place.vine-growth.water-flow.weather-lock.wither-damage




  ;;;;Checke ob die Scripte geladen sind.
  load -rs Mcraft-Commands.mrc
  /save -rv vars.ini
}

Alias checklog {
  var %i $lines(%mlog)
  if (%temp.r != $read(%mlog, %i)) {
    set %temp.r $read(%mlog, %i)
    var %temp.rv $remove(%temp.r, [<ip address withheld>], $time)
    var %temp.rv2 %Head-3 $replace( $+ %temp.rv, logged in with entity, 9meldet sich an mit, left the game, 14Verlies den Server00, $&
      /INFO]:, /INFO]:, [Async Chat Thread, MC-Chat, $&
      Server thread/INFO,11S14erver 11E14vent0],issued Server command:, Server Befehl4:7, $&
      Craft Scheduler Thread, Craft-Planer-Thread, $& 
      fell from a high place, 5[10Ist aus Großer Höhe gefallen5, $&
      was shot by Skeleton, 5[10Wurde erschossen von: 4Skelett5], was stung to death, 5[10wurde zu Tode gestochen5], $&
      was fireballed by Blaze, 5[10Wurde von 4Lohe5 10flambiert5], $&
      was fireballed by Ghast, 5[10Wurde von 4Ghast5 10flambiert5], $&
      was slain by Cave Spider, 5[10Wurde von 4Höhlenspinne5 10erschlagen5], $&
      was blown up by Creeper, 5[10Wurde vom 4Creeper5 10in die Luft gesprengt5], $&
      was slain by Wither Skeleton, 5[10Wurde von 4Wither Skelett5 10erschlagen5], $&
      was slain by Warden, 5[10Wurde von 4Wärter5 10erschlagen5], $&
      was slain by Piglin Brute, 5[10Wurde von 4Piglin Babar!5 10erschlagen5], $&
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
      was slain by Zombie Villager, 5[10Wurde vom 4Zombiedorfbewohner5 10erschlagen5], $&
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
    var %temp.rv4 $remove(%temp.rv2, %rcon, %rcon2, %time, %rcon3)
    var %te.1 $replace(%temp.rv4,$chr(32),.)
    var %te.1rem $gettok(%te.1,2,46)
    var %te.2 $remtok(%te.1,%te.1rem,1,46)
    var %temp.rv3a $replace(%te.2,.,$chr(32))
    var %temp.rv3 $remove(%temp.rv2, %te.1rem, %rcon, %rcon2, %time, %rcon3,]:)
    msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %temp.rv3 $iif(%command != $null, -, %command) %tps3
  }
}

alias lagausgabe {
  var %i 1
  var %zeilen $lines(%pfad $+ lag.txt)
  while (%i <= %zeilen) {
    var %text $read -l $+ %i %pfad $+ lag.txt
    var %text.result $replace(%text, $&
      Laufzeit:,7L14aufzeit4:9, $&
      Stunden,11S14tunden9, $&
      Minuten,11M14inuten9, $&
      Sekunden,11S14ekunden9, $&
      Aktuelle TPS , 7A14ktuelle TPS, $&
      Maximaler Speicher: , 7M14aximaler 7S14peicher4:9, $& 
      Reservierter Speicher: , 7R14eservierter 7S14peicher4:9, $& 
      Freier Speicher: , 7F14reier 7S14peicher4:9, $& 
      World ",7W14orld4:9, $&
      Nether ",7N14ether4:9, $&
      The End ",7T14he 7E14nd4:9, $&
      ": ,4//, $&
      chunks,11C14hunks, $&
      einheiten,11E14inheiten, $&
      tiles,11T14iles, $&
      §6, $chr(3) $+ 07, §c, $chr(3) $+ 09, §a, $chr(3) $+ 09)
    write -l $+ %i lagres.txt  7,1[9▒7]4  %text.result 7,1[9▒7]4
    inc %i 
    ;;; msg %m-channel 
  } 
  if (20 isin $read(lagres.txt,l,2)) { var %input $read(lagres.txt,l,2) | var %inputrep $replace(%input,20, 20 10[11A14usgezeichnet9!10])  | write -l2 lagres.txt %inputrep }
  /timer.ausgabe2 1 10 /lagausgabe2
}

alias lagausgabe2 {
  var %x 1
  var %zeilen2 $lines(lagres.txt)
  while (%x <= %zeilen2) {

    msg %m-channel $read(lagres.txt,l,%x)
    inc %x
  }
}

;;;; Ausgabe Serverresult vom !server settings Befehl ;;;;;;

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
  msg %m-channel 10,1 $+ %head003 7 Nether Erlauben: 4 $+ %settings.4.result  %head002 7 Flugmodus Aktiv: 4 $+ %settings.3.result %head002 7 Ausgabe der Consolenbefehle zu Ops senden: 4 $+ %settings.5.result %head002 7 RCON Befehle an OPS senden: 4 $+ %settings.6.result %head003 
  msg %m-channel 10,1 $+ %head003 7 Debug Modus: 8 $+ %settings.7.result %head002 7 Schwierigkeitsgrad: 8 $+ %settings.8.result %head002 7 Befehlsblöcke erlauben: 4 $+ %settings.9.result %head002 7 Remotezugriff: 4 $+ %settings.12.result %head002 7 Server in der Serverliste anzeigen: 4 $+ %settings.13.result %head003
  msg %m-channel 10,1 $+ %head003 7Nur Mojang Accounts: 4 $+ %settings.14.result %head002 7 Privater Zugang: 4 $+ %settings.15.result %head002 7 Erzwungener Spielmodus: 8 $+ %settings.17.result %head002 7 Funktionslevel: 8 $+ %settings.18.result %head003 
  msg %m-channel 10,1 $+ %head003 7Spielmodus: 8 $+ %settings.19.result %head002 7 Strukturen erzeugen: 4 $+ %settings.20.result %head002 7 Online Spieler verstecken: 4 $+ %settings.23.result %head002 7 Hauptwelt: 8 $+ %settings.26.r %head003 
  msg %m-channel 10,1 $+ %head003 7 Seed: 4 $iif(%settings.27.r == $null, 4 Zufällig  , $+ %settings.27.r) %head002 7 Welttyp: 8 $+ %settings.28.result %head002 7 Max Spieler: 12 $+ %settings.30.r %head002 7 Weltgrenze liegt bei: 12 $+ %settings.32.r 7Blöcken %head002 7 MOTD: 8 $+ %settings.33.r %head002 7 PVP: 4 $+ %settings.39.result %head003
  msg %m-channel 10,1 $+ %head003 7Serverport: 12 $+ %settings.49.r %head002 7 Simulationsentfernung: 12 %settings.50.r %head002 7 Tiere erzeugen: 04 $+ %settings.51.result %head002 7 Monster erzeugen: 04 $+ %settings.52.result %head003
  msg %m-channel 10,1 $+ %head003 7 NPC's erzeugen: 04 $+ %settings.53.result %head002 7 Spawn Schutz: 12 $+ %settings.54.r 7Blöcke %head002 7 Privater Server: 04 $+ %settings.59.result %head003
}

alias ausgabe {
  var %gomo $read(%pfad $+ task.txt, s,  java.exe)
  var %pid $replace(%gomo, $chr(32),.)
  var %numtok $numtok(%pid,46)
  var %pidnumber $gettok(%pid,1,46)
  if (%dir isin $finddir($mircdir, $+ %dir $+ *,1)) && (%pidnumber isnum) { msg %m-channel Sorry der Server Läuft bereits und ich konnte die Welt nicht löschen. Bitte stoppe ihn zuerst. Danke | halt }
  if (%dir isin $finddir($mircdir, $+ %dir $+ *,1)) && (%pidnumber == $null) { 
    msg %m-channel Achtung Welt wird gelöscht und beim Nächsten Neustart neu erstellt.
    /run cmd.exe /c RMDIR /S /Q %dir
    /halt
    /remove %pfad $+ task.txt
  }
}

alias vault-ausgabe {
  var %Ecos $read(%pfad $+ vault-info.txt,l,2)
  var %Ecos.r $remove(%Ecos, [Vault], ], [BagOfGold)
  var %Ecos.r1 $replace(%Ecos.r,$chr(32) $+ $chr(44) $+ $chr(32), $chr(44), $chr(44) $+ $chr(32), $chr(44), $chr(44),.,:,: $+ $chr(32))
  var %Ecos.r2 $remove(%Ecos.r1,$chr(32) )
  var %Ecos.r3 $replace(%Ecos.r2,:,: $+ $chr(32))
  if (%econ1 !isin %Ecos.r3) && (%econ2 !isin %Ecos.r3) { /msg %m-channel Konte %econ1 nicht finden. Bitte sei dir Sicher das du es Richtig geschrieben hast. | /msg %m-channel Gültige EcoPlugins sind: $remove(%Ecos.r3,Economy:) | halt }
  if (%econ1 isin %Ecos.r3) && (%econ2 !isin %Ecos.r3) { /msg %m-channel Konte %econ2 nicht finden. Bitte sei dir Sicher das du es Richtig geschrieben hast. | /msg %m-channel Gültige EcoPlugins sind: $remove(%Ecos.r3,Economy:) | halt }
  if (%econ1 isin %Ecos.r3) && (%econ2 isin %Ecos.r3) { 
    /msg %m-channel Währung wird von %econ1 zu %econ2 Konvertiert dieses kann einen Moment dauern.
    /run rcon.exe -a localhost:25575 -p %rcon_password "vault-convert %econ1 %econ2"
  }
}

alias zeitsteuerung-tag {
  if (%zeit == tag) {
    /timer.nacht1 off
    /timer.nacht3 off
    /timer.bacht2 off 
    /timer.tag1 1 1230 /msg %m-channel Der Abend bricht an. Ihr solltet euer Haus ⌂ oder Bett ∟ aufsuchen falls ihr überleben wollt in der Kommenden nacht.
    /timer.fag1 1 1230 /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast Der Abend bricht an. Ihr solltet euer Haus ⌂ oder Bett ∟ aufsuchen falls ihr überleben wollt in der Kommenden nacht."
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
    /timer.nacht3 1 510 /run rcon.exe -a localhost:25575 -p %rcon_password "broadcast Der Tag ☼  bricht an."
    /timer.nacht2 1 510 /set %zeit tag
    /timer.bacht2 0 1 /zeitsteuerung-tag
  }
}

alias tps {
  if (20 isin %newtag) { set %tagresult 10[11A4u7s9g10e13z14e8i7c12h9n6e3t9!4!9!10] }
  if (18 isin %newtag) { set %tagresult 11[12Normale Auslastung10] }
  if (20 isin %newlag) { set %tagresult2  10[11A4u7s9g10e13z14e8i7c12h9n6e3t9!3!9!10] }
  if (18 isin %newlag) { set %tagresult2 11[12Normale Auslastung10] }
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

alias tpsausgabe {
  set %tps $read -l $+ 1 %pfad $+ tps.txt
  set %tps1 $remove(%tps,§r)
  set %newtag $replace(%tps1,§6,$chr(3) $+ 7,§a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  /msg %m-channel %newtag %tagresult
  /timer.deletetps1 1 7 /remove %pfad $+ tps.txt
}



;;; Some Stuff from Quims

alias getallyml { 
  ;this is old code i had fixed it
  var %n,%t $2,%a 2,%s 0 
  while (%t != $null) && ($read($1,tnr,/^\x20{ $+ %s $+ $chr(125) $+ %t $+ :/)) { 
    inc %s 4 
    inc %a
    var %t $($ $+ %a,2) 
  } 
  var %l $readn + 1 
  while (1) { 
    var -p %v $read($1,tnr,/(.*),%l) 
    var -p %v $regml(1) 
    if ($prop) { 
      if ($regex(%v,/^\x20{ $+ %s $+ $chr(125) $+ $prop $+ : (.*)/)) {
        var %rm $regml(1)
        if ($regex($regml(1),^(\{.*\}|\[.*\]|[^{}\[\]]+)$)) return %rm
        var %r %rm
        while (1) {
          var %t $read($1,tn,$calc($readn + 1))
          var %r %r $+ %t
          if ($right(%t,1) isin }]) break
        }
        return %r
        echo -ag %r
      } 
    } 
    elseif ($regex(%v,/^\x20{ $+ %s $+ }([^\x20:]+):/)) { 
      var %n %n $regml(1) 
    } 
    if ($readn > $lines($1)) || ($regex(%v,^\x20{ $+ $calc(%s - 4) $+ }[^ ])) { 
      break 
    }
    var %l $readn + 1
  }
  return %n
  echo -ag %n 
}


alias setallyml {
  var %n,%t $2,%a 2,%s 0 
  while (%t != $null) && ($read($1,tnr,/^\x20{ $+ %s $+ $chr(125) $+ %t $+ :/)) {
    inc %s 4 
    inc %a
    var %t $($ $+ %a,2)
    if (%a == $calc($0 - 0)) break 
  }
  var %l $readn + 1 
  while (1) {
    var -p %v $read($1,tnr,/(.*)/,%l) 
    var -p %v $regml(1) 
    if ($prop) {
      if ($regex(%v,/^\x20{ $+ %s $+ $chr(125) $+ $prop $+ : (.*)/)) {
        write -l $readn $qt($1) $str(@,%s) $+ $prop $+ : %t
        convert@tospace $1
        return
      } 
    } 
    if ($readn > $lines($1)) || ($regex(%v,^\x20{ $+ $calc(%s - 4) $+ }[^ ])) { 
      write -il $readn $qt($1) $str(@,%s) $+ $prop $+ : %t
      convert@tospace $1
      return
    }
    var %l $readn + 1
  }
}

alias convert@tospace {
  bread $qt($1-) 0 $lof($1-) &a
  breplace &a 64 32
  bwrite -c $qt($1-) 0 -1 &a
}

;;;; My Stuff

alias regcheck {
  var -s %file %pfad $+ plugins\WorldGuard\worlds\ $+ $1 $+ \regions.yml
  return $istok($getallyml(%file,regions),$2,32)
}
