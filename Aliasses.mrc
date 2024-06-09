;;;;;; MinecraftBot ;;;;;;;; V1.1b
;;;;;; Author: Serkons
;;;;;; Githubname: Svdermant
;;;;;; GithubRepo: https://github.com/svdermant/MinecraftBot/
;;;;;; Erstellungsdatum: 11. Juni . 2023

;;;;;; Minecraft Server Aliasses;;;;;

;; ==== Starten des Bots =========
;; Bei Erststart wird der Bot eingerichten und
;; an den MinecraftServer Angepasst
;; ======================

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

    set %pfad $readini(system.dat, MineCraftServer, ServerPfad)
    if (%pfad = $null) { echo 4*** WARNUNG Es wurde kein Serverpfad angegeben. Bitte behbe das Problem...
      set %pfad $?="Bitte gib den Pfad an wo die Serverfiles liegen also auch die Startbat etc)" | writeini system.dat MineCraftServer ServerPfad %pfad
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
    writeini system.dat botinfo botname %bot.name 
    /nick %bot.name
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

    echo 12*** Gib bitte an wo deine Serverdateien sich befinden!
    set %pfad $?="Gib hier bitte den Pfad zu deinem Server an. in diesem pfad sollte sich ebenfalls alle anderen daten befinden (start.bat etc)
    if ($exists(%pfad) == $false) { echo 4 Der Pfad der Serverdaten darf nicht leer sein. Startvorgang Abgebrochen | /exit | halt }
    writeini system.dat MineCraftServer ServerPfad %pfad

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

  if ($sha1($read(version,l,2)) != 84d6ca7a78e14a4bfe036cdbad9153ef4e92d9d6) || ($exists(version) == $false) { echo -a  Funktionsweise Stark eingeschränkt }

}

;; == Beim Beenden des Bots ===
;; Variablen werden in der Vars.ini
;; gespeichert.      
;; =================

on 1:EXIT: {
  /save -rv vars.ini
}

;; === Verbindungsevent ===
;; Beim Verbinden zu einem Server 
;; Werden Passwort und Name Automatisch Gesetzt
;; === Verbindungsevent ===

on 1:CONNECT: {
  if ($sha1($read(version,l,2)) != aa790deb9ff60de7b621436e3066f94a6fb12ffc) || ($exists(version) == $false) {
    echo -ag Das Copyright wurde Beschädigt.
    /quit 4Warnung Coprigth fehlt oder Key ist Incorrect.
  }
  if ($sha1($read(version,l,2)) != aa790deb9ff60de7b621436e3066f94a6fb12ffc) && ($exists(version) == $true) {
    echo -ag Der Minecraftbot 11,1 $me  Ist Einsatzbereit!
    if ($me == $readini(system.dat, botinfo, botname)) {
      /ns identify $readini(system.dat, botinfo, botpass)
      /timer.join1 1 3 /join %m-channel
    }
    if ($me != $readini(system.dat, botinfo, botname)) {
      /nick $readini(system.dat, botinfo, botname)
      /ns recover $readini(system.dat, botinfo, botname) $readini(system.dat, botinfo, botpass)
    }
  }
}
;; == Raumbeitritt
;; Hier wird Version und Key geprüft
;; ==========

on 1:JOIN:#:{
  if ($sha1($read(version,l,2)) != aa790deb9ff60de7b621436e3066f94a6fb12ffc) || ($exists(version) == $false) {
    msg $chan Das Copyright wurde Beschädigt.
    /quit 4Warnung Coprigth fehlt oder Key ist Incorrect.
  }
  if ($sha1($read(version,l,2)) != aa790deb9ff60de7b621436e3066f94a6fb12ffc) && ($exists(version) == $true) {
    msg $chan Der Minecraftbot 11,1 $me  Ist Einsatzbereit!
  }
}

;; === Systemcheck ====
;; Hier werden die Standardwerte gesetzt und geprüft
;; ================

alias system_defaults_check {
  if (%Head-3 == $null) || (%Head-3 != 0,1) { set %Head-3 0,1 }
  if (%rcon != $null) || (%rcon == $null) { set %rcon [RCON Client /0:0:0:0:0:0:0:1 }
  if (%rcon2 != $null) || (%rcon2 == $null) { set %rcon2 Thread RCON Client /0:0:0:0:0:0:0:1 shutting down }
  if (%rcon3 != $null) || (%rcon3 == $null) { set %rcon3 /INFO]: }
  if (%valid-settings != $null) || (%valid-settings == $null) { set %valid-settings allow-nether.level-type.allow-flight.broadcast-console-to-ops.broadcast-rcon-to-ops.debug.difficulty.enable-command-block.enable-rcon.enable-status.enforce-secure-profile.enforce-whitelist.force-gamemode.fuction-permission-level.gamemode.generate-structures.hide-online-players.level-name.max-players.motd.pvp.server-port.simulation-distance.spawn-animals.spawn-monsters.spawn-npcs.spawn-protection.white-list }
  if (%true-false-settings != $null) || (%true-false-settings == $null) { set %true-false-settings allow-nether.level-type.allow-flight.broadcast-console-to-ops.broadcast-rcon-to-ops.debug.difficulty.enable-command-block.enable-rcon.enable-status.enforce-secure-profile.enforce-whitelist.force-gamemode.gamemode.generate-structures.hide-online-players.level-name.spawn-animals.spawn-monsters.spawn-npcs.whitelist }
  if (%level != $null) || (%level == $null) { set %level level-type }
  if (%num-settings != $null) || (%num-settings == $null) { set %num-settings fuction-permission-level.max-players.server-port.simulation-distance.spawn-protection }
  if (%moblist != $null) || (%moblist == $null) { set %moblist piglinbrute.snowman.panda.bee.axolotl.zoglin.cow.furnaceminecart.pig.spawnerminecart.allay.skeleton.llama.mule.bat.husk.frog }
  if (%moblist2 != $null) || (%moblist2 == $null) { set %moblist2 hoglin.zombiehorse.rabbit.silverfish.zombievillager.giant.drowned.enderdragon.dolphin.elderguardian.stray.shulker.turtle.chestminecart }
  if (%moblist3 != $null) || (%moblist3 == $null) { set %moblist3 vex.salmon.goat.ocelot.endercrystal.horse.vindicator.glowsquid.phantom.minecart.experienceorb.evoker.warden.squid.parrot.creeper.cavespider.enderman }
  if (%moblist4 != $null) || (%moblist4 == $null) { set %moblist4 zombifiedpiglin.magmacube.tadpole.chicken.ravager.hopperminecart.donkey.witherskeleton.strayskeleton.fox.slime.pillager.blaze.piglin.chestboat.endermite }
  if (%moblist5 != $null) || (%moblist5 == $null) { set %moblist5 tropicalfish.cat.pigzombie.zombie.mushroomcow.irongolem.guardian.polarbear.traderllama.ghast.sheep.tntminecart.skeletonhorse.illusioner.pufferfish.wanderingtrader }
  if (%moblist6 != $null) || (%moblist6 == $null) { set %moblist6 amorstand.wolf.villager.boat.strider.witch.cod.spider.wither }
  if (%flaglist1 != $null) || (%flaglist1 == $null) { set %flaglist1 ability-pvp.allowed-cmds.block-break.block-place.block-trampling.blocked-cmds.build.respawn-anchor-explode.chest-access.chorus-fruit-teleport.coral-fade.creeper-explosion.crop-growth.damage-animals.deny-message.deny-spawn.ecs-create-admin-shop.ecs-create-shop.ecs-remove-admin-shop.ecs-remove-shop.ecs-use-admin-shop.ecs-use-shop.enderdragon-block-damage.enderman-grief.enderpearl.entity-item-frame-destroy }
  if (%flaglist2 != $null) || (%flaglist2 == $null) { set %flaglist2 entity-painting-destroy.entry.entry-deny-message.exit.exit-deny-message.exit-override.lava-fire.lava-flow.leaf-decay.lighter.lightning.mythic-drops-unidentified-item.natural-health-regen.natural-hunger-drain.nonplayer-protection-domains.notify-enter }
  if (%flaglist3 != $null) || (%flaglist3 == $null) { set %flaglist3 exit-via-teleport.exp-drops.fall-damage.farewell.farewell-title.feed-amount.feed-delay.feed-max-hunger.feed-min-hunger.fire-spread.firework-damage.frosted-ice-form.frosted-ice-melt.game-mode.ghast-fireball.grass-growth.greeting.greeting-title.heal-amount.heal-delay.heal-max-health.heal-min-health.ice-form.ice-melt.interact.invincible.item-drop.item-frame-rotation.item-pickup }
  if (%flaglist4 != $null) || (%flaglist4 == $null) { set %flaglist4 mi-commands.mi-consumables.mi-tools.mi-weapons.mmo-abilities.mob-damage.mob-spawning.mushroom-growth.mycelium-spread.mypet-damage.mypet-deny.mypet-fly.mypet-leash.mythic-drops.mythic-drops-custom.mythic-drops-identity-tome.mythic-drops-socket-effects.mythic-drops-socket-extender.mythic-drops-socket-gem.mythic-drops-tiered }
  if (%flaglist5 != $null) || (%flaglist5 == $null) { set %flaglist5 notify-leave.other-explosion.passthrough.pistons.potion-splash.pvp.pvp-mode.ravager-grief.receive-chat.respawn-anchors.ride.rock-growth.sculk-growth.send-chat.sleep.snow-fall.snow-melt.snowman-trails.soil-dry.spawn.teleport.teleport-message.time-lock.tnt.use.use-anvil.use-dripleaf.vehicle-destroy.vehicle-place.vine-growth.water-flow.weather-lock.wither-damage.copper-fade }
  if (%thirdflags1 != $null) || (%thirdflags1 == $null) { set %thirdflags1 ability-pvp.allow-block-place.allow-block-break.allow-entity-damage.allow-entity-destroy.allow-entity-place.blocked-effects.chat-prefix }
  if (%thirdflags2 != $null) || (%thirdflags2 == $null) { set %thirdflags2 chat-suffix.command-on-entry.command-on-exit.console-command-on-entry.console-command-on-exit.deny-block-break.deny-block-place.deny-entity-damage.deny-entity-destroy.deny-entity-place.disable-collision }
  if (%thirdflags3 != $null) || (%thirdflags3 == $null) { set %thirdflags3 ecs-create-admin-shop.ecs-create-shop.ecs-remove-admin-shop.ecs-remove-shop.ecs-use-admin-shop.ecs-use-shop.fly }
  if (%thirdflags4 != $null) || (%thirdflags4 == $null) { set %thirdflags4 fly-speed.frostwalker.give-effects.glide.godmode.item-durability.keep-exp.keep-inventory.mi-commands.mi-consumables.mi-tools.mi-weapons.min-class-level.mmo-abilities.mypet-damage.mypet-deny.mypet-fly.mypet-leash }
  if (%thirdflags5 != $null) || (%thirdflags5 == $null) { set %thirdflags5 mythic-drops.mythic-drops-custom.mythic-drops-itentity-tome.mythic-drops-socket-effects.mythic-drops-socket-extender.mythic-drops-socket-gem.mythic-drops-tiered.mythic-drops-unidentified-item.nether-portals.pvp-mode.respawn-anchor-explode.teleport-on-entry.teleport-on-exit.villager-trade.walk-speed.weight-rpg }
  if (%moblists != $null) || (%moblists == $null) { set %moblists piglinbrute.snowman.panda.bee.axolotl.zoglin.cow.furnaceminecart.pig.spawnerminecart.allay.skeleton.llama.mule.bat.husk.frog.hoglin.zombiehorse.rabbit.silverfish.zombievillager.giant.drowned.enderdragon.dolphin.elderguardian.stray.shulker.turtle.chestminecart.vex.salmon.goat.ocelot.endercrystal.horse.vindicator.glowsquid.phantom.minecart.experienceorb.evoker.warden.squid.parrot.creeper.cavespider.enderman.zombifiedpiglin.magmacube.tadpole.chicken.ravager.hopperminecart.donkey.witherskeleton.strayskeleton.fox.slime.pillager.blaze.piglin.chestboat.endermite.tropicalfish.cat.pigzombie.zombie.mushroomcow.irongolem.guardian.polarbear.traderllama.ghast.sheep.tntminecart.skeletonhorse.illusioner.pufferfish.wanderingtrader.amorstand.wolf.villager.boat.strider.witch.cod.spider.wither }

  ;;;;Checke ob die Scripte geladen sind.
  load -rs Mcraft-Commands.mrc
  load -rs Irc-minecraft.mrc
  load -rs Irc-Minecraft-Aliasses.mrc
  /save -rv vars.ini
}

;; == Aliasse ===

;;; => Alias allowd-placed-blocks <==
;;; Prüft die Zugelassenen Blöcke und setzt diese

alias allowed-placed-blocks {
  set -u7 %blocklist on
  if (%invalidmats != $null)  {
    msg %m-channel Folgende Werte konnten für die Flag 4allowed-block-place  nicht gesetzt werden:
    msg %m-channel 7 $+ %invalidmats 
    /unset %invalidmats
  }
  if (%materiallist != $null) {
    set -u3 %com rg f %regionsid -w %welt %currentflag %materiallist
    /msg %m-channel 3[7Worldguard3] 7 $+ %flag  für die Welt ( 4 $+ %welt $+  ) wurde auf ( 4 $+ %materiallist  ) gestellt
    set -u4 %tps3 3[7Worldguard3] 12 Aufgabe durchgeführt
    //run rcon.exe -a localhost:25575 -p %rcon_password " %com "
    /unset %regionsid
    /timerwg.reload1 1 3 //run rcon.exe -a localhost:25575 -p %rcon_password "wg reload"
    /set -u8 %tps4 3[7Worldguardconfiguration wurden neu geladen3]
    /unset %materiallist
    /halt
  }
}

;; Alias Spid (System Prozess ID) & systempid ====
;; Definiert die PID bei Extremfall (Wenn nur 1 Java Anwendung läuft)
;; =============

alias spid {
  /run -ap %pfad $+ process.bat
}

Alias systempid {
  if (%syspid == $null) || (!%syspid) { /set %syspid $read(%pfad $+ server.pid,1) }
  /msg %m-channel   7[9!7] 7,1[9BotPID: 08 $+ %pid $+ 07] 7[9!7] 7,1[9SystemPID: 08 $+ %syspid $+ 07]
}

;; Alias Flagcheck =====
;; Hier wird geprüft ob die Flag existiert
;; Als returnwert kommt on bzw off

alias flagcheck {
  if ($istok(%flaglist1,$1,46) == $true) || ($istok(%flaglist2,$1,46) == $true) || ($istok(%flaglist3,$1,46) == $true) || ($istok(%flaglist4,$1,46) == $true) || ($istok(%flaglist5,$1,46) == $true) || ($istok(%thirdflags1,$1,46) == $true) || ($istok(%thirdflags2,$1,46) == $true) || ($istok(%thirdflags3,$1,46) == $true) || ($istok(%thirdflags4,$1,46) == $true) || ($istok(%thirdflags5,$1,46) == $true)  { return on }
  if ($istok(%flaglist1,$1,46) == $false) || ($istok(%flaglist2,$1,46) == $false) || ($istok(%flaglist3,$1,46) == $false) || ($istok(%flaglist4,$1,46) == $false) || ($istok(%flaglist5,$1,46) == $false) || ($istok(%thirdflags1,$1,46) == $false) || ($istok(%thirdflags2,$1,46) == $false) || ($istok(%thirdflags3,$1,46) == $false) || ($istok(%thirdflags4,$1,46) == $false) || ($istok(%thirdflags5,$1,46) == $false) { return off }

}

;; Analyse Echos
//echo -a $gettok(%lvl-tok,13-,46)
;;==========

;; == Alias Checklog-LVL ==
;; Wird ausgeführt wenn gelevelte Mobs durch Checklog gelesen werden
;; ===============

alias checklog-lvl {
  set %lvl-log.r %temp.r
  set %lvl-tok $replace(%lvl-log.r,$chr(32),.)
  set %lvl-tok1rem $remtok(%lvl-tok,$gettok(%lvl-tok,1,46),46)
  set %item $gettok(%lvl-tok,13-,46) 
  set %moblevel $gettok(%lvl-tok1rem,8,46)
  if (%moblevel == Lvl) { set %moblevel $gettok(%lvl-tok1rem,9,46) 
    set %lvl-log.rv3 $replace(%lvl-tok1rem,.,$chr(32))
    set %lvl-log.rv $replace(%lvl-log.rv3, was shot by Lvl %moblevel $chr(124) Skeleton,  5[10Wurde von LvL:7 %moblevel 4Skelett10  erschossen5], $&
      [Server thread/INFO]:,14[11S10erver 11E10vent14], $&
      was blown up by Lvl %moblevel $chr(124) Creeper, 5[10Wurde von LvL:7 %moblevel 4Creeper 10 in die Luft gesprengt5], $&
      was fireballed by Lvl %moblevel $chr(124) Blaze,5[10Wurde von LvL:7 %moblevel 4Lohe10 flambiert5], $&
      was burnt to a crisp whilst fighting Blaze, Wurde währen des Kampfes mit  LvL:7 %moblevel 5Lohe 10 geröstet, $&
      was fireballed by Lvl %moblevel $chr(124) Ghast, 5[10Wurde von LvL:7 %moblevel 4Ghast10 flambiert5], $&
      was slain by Lvl %moblevel $chr(124) Cave Spider, 5[10Wurde von LvL:7 %moblevel 4Höhlenspinne10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Spider, 5[10Wurde von LvL:7 %moblevel 4Spinne10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Wither Skeleton, 5[10Wurde von LvL:7 %moblevel 4Wither Skelett10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Warden, 5[10Wurde von LvL:7 %moblevel 4Wächter10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Zombiefied Piglin, 5[10Wurde von LvL:7 %moblevel 4Zombiefizierter Piglin10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Piglin, 5[10Wurde von LvL:7 %moblevel 4Piglin10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Husk, 5[10Wurde von LvL:7 %moblevel 4Wüstenzombie10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Panda, 5[10Wurde von LvL:7 %moblevel 4Panda10 erschlagen5], $&    
      was slain by Lvl %moblevel $chr(124) Zoglin, 5[10Wurde von LvL:7 %moblevel 4Zoglin10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Wolf, 5[10Wurde von LvL:7 %moblevel 4Wolf10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Magma Cube, 5[10Wurde von LvL:7 %moblevel 4Magma Würfel10 erschlagen5], $&
      was shot by Lvl %moblevel $chr(124) Pillager, 5[10Wurde von LvL:7 %moblevel 4Plünderer10 erschossen5], $&
      was shot by Lvl %moblevel $chr(124) Stray, 5[10Wurde von LvL:7 %moblevel 4Eiswanderer10 erschossen5], $&
      was slain by Lvl %moblevel $chr(124) Zombie Villager, 5[10Wurde von LvL:7 %moblevel 4Zombiedorfbewohner10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Zombie, 5[10Wurde von LvL:7 %moblevel 4Zombie10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Elder Guardian, 5[10Wurde von LvL:7 %moblevel 4Großer Wächter10 erschlagen5], $&
      was killed trying to hurt %moblevel $chr(124) Elder Guardian, 5[10Wurde beim Versuch LvL:7 %moblevel 4Großer Wächter10 zu verletzen getötet5], $&
      was killed by Lvl %moblevel $chr(124) Witch using magic, 5[10Wurde von LvL:7 %moblevel 4Hexe10 mit Magie getötet5], $&
      was slain by Lvl %moblevel $chr(124) Enderman,5[10Wurde von LvL:7 %moblevel 4Enderman10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Shulker,5[10Wurde von LvL:7 %moblevel 4Shulker10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Vindicator, 5[10Wurde von LvL:7 %moblevel 4Diener10 erschlagen5], $&
      was killed by Lvl  %moblevel $chr(124) Elder Guardian using magic, 5[10Wurde von LvL:7 %moblevel 4Großer Wächter10 mit Magie getötet5], $&
      was slain by Lvl %moblevel $chr(124) Endermite,5[10Wurde von LvL:7 %moblevel 4Endermite10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Vex, 5[10Wurde von LvL:7 %moblevel 4Plagegeist10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Polar Bear, 5[10Wurde von LvL:7 %moblevel 4Polar Bär10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Drowned, 5[10Wurde von LvL:7 %moblevel 4Ertrunkener10 erschlagen5], $&
      was impaled by Lvl %moblevel $chr(124) Drowned, 5[10Wurde von LvL:7 %moblevel 4Ertrunkener10 aufgespießt5], $&
      was slain by Lvl %moblevel $chr(124) Ravager, 5[10Wurde von LvL:7 %moblevel 4Verwüster10 erschlagen5], $&
      was slain by Lvl %moblevel $chr(124) Hoglin, 5[10Wurde von LvL:7 %moblevel 4Hoglin10 erschlagen5])
    if (using isin %lvl-log.rv) && (%item != $null) { set %lvl-log.rv $replace(%lvl-log.rv,using,mit) | /unset %item }
    msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,11,1 $+ $chr(32)0,1 %lvl-log.rv
    /halt
  }
  set %lvl-log.rv3 $replace(%lvl-tok1rem,.,$chr(32))
  set %lvl-log.rv $replace(%lvl-log.rv3, was shot by Lvl %moblevel $chr(124) Skeleton,  5[10Wurde von LvL:7 %moblevel 4Skelett10  erschossen5], $&
    [Server thread/INFO]:,14[11S10erver 11E10vent14], $&
    was blown up by Lvl %moblevel $chr(124) Creeper, 5[10Wurde von LvL:7 %moblevel 4Creeper 10 in die Luft gesprengt5], $&
    was fireballed by Lvl %moblevel $chr(124) Blaze,5[10Wurde von LvL:7 %moblevel 4Lohe10 flambiert5], $&
    was burnt to a crisp whilst fighting Blaze, Wurde währen des Kampfes mit  LvL:7 %moblevel 5Lohe 10 geröstet, $&
    was fireballed by Lvl %moblevel $chr(124) Ghast, 5[10Wurde von LvL:7 %moblevel 4Ghast10 flambiert5], $&
    was slain by Lvl %moblevel $chr(124) Cave Spider, 5[10Wurde von LvL:7 %moblevel 4Höhlenspinne10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Spider, 5[10Wurde von LvL:7 %moblevel 4Spinne10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Wither Skeleton, 5[10Wurde von LvL:7 %moblevel 4Wither Skelett10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Warden, 5[10Wurde von LvL:7 %moblevel 4Wächter10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Zombiefied Piglin, 5[10Wurde von LvL:7 %moblevel 4Zombiefizierter Piglin10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Piglin, 5[10Wurde von LvL:7 %moblevel 4Piglin10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Husk, 5[10Wurde von LvL:7 %moblevel 4Wüstenzombie10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Panda, 5[10Wurde von LvL:7 %moblevel 4Panda10 erschlagen5], $&    
    was impaled by Lvl %moblevel $chr(124) Drowned, 5[10Wurde von LvL:7 %moblevel 4Ertrunkener10 aufgespießt5], $&
    was slain by Lvl %moblevel $chr(124) Zoglin, 5[10Wurde von LvL:7 %moblevel 4Zoglin10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Wolf, 5[10Wurde von LvL:7 %moblevel 4Wolf10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Magma Cube, 5[10Wurde von LvL:7 %moblevel 4Magma Würfel10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Zombie Villager, 5[10Wurde von LvL:7 %moblevel 4Zombiedorfbewohner10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Zombie, 5[10Wurde von LvL:7 %moblevel 4Zombie10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Elder Guardian, 5[10Wurde von LvL:7 %moblevel 4Großer Wächter10 erschlagen5], $&
    was shot by Lvl %moblevel $chr(124) Pillager, 5[10Wurde von LvL:7 %moblevel 4Plünderer10 erschossen5], $&
    was shot by Lvl %moblevel $chr(124) Stray, 5[10Wurde von LvL:7 %moblevel 4Eiswanderer10 erschossen5], $&
    was killed trying to hurt %moblevel $chr(124) Elder Guardian, 5[10Wurde beim Versuch LvL:7 %moblevel 4Großer Wächter10 zu verletzen getötet5], $&
    was killed by Lvl  %moblevel $chr(124) Elder Guardian using magic, 5[10Wurde von LvL:7 %moblevel 4Großer Wächter10 mit Magie getötet5], $&
    was killed by Lvl %moblevel $chr(124) Witch using magic, 5[10Wurde von LvL:7 %moblevel 4Hexe10 mit Magie getötet5], $&
    was slain by Lvl %moblevel $chr(124) Enderman,5[10Wurde von LvL:7 %moblevel 4Enderman10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Shulker,5[10Wurde von LvL:7 %moblevel 4Shulker10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Endermite,5[10Wurde von LvL:7 %moblevel 4Endermite10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Vex, 5[10Wurde von LvL:7 %moblevel 4Plagegeist10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Polar Bear, 5[10Wurde von LvL:7 %moblevel 4Polar Bär10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Vindicator, 5[10Wurde von LvL:7 %moblevel 4Diener10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Ravager, 5[10Wurde von LvL:7 %moblevel 4Verwüster10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Drowned, 5[10Wurde von LvL:7 %moblevel 4Ertrunkener10 erschlagen5], $&
    was slain by Lvl %moblevel $chr(124) Hoglin, 5[10Wurde von LvL:7 %moblevel 4Hoglin10 erschlagen5])
  if (using isin %lvl-log.rv) && (%item != $null) { set %lvl-log.rv $replace(%lvl-log.rv,using,mit) | /unset %item }
  msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,11,1 $+ $chr(32) 0,1 %lvl-log.rv
}

;; === Alias Checklog ====
;; Sämtliche Logvorgänge werden ausgegeben. 
;; Inklusive Chatnachrichten und Fehlermeldungen.
;; =======================

Alias checklog {
  if ($exists(%mlog) == $false) { return }
  var %i $lines(%mlog)
  var %sev 11S10erver
  var %Loading Loading
  var %igchat Async Chat Thread
  var %Enabling Enabling
  var %named Named entity
  set %scom issued server command
  set %login [<ip address withheld>] logged in
  set %loginip logged in 
  var %left left the game
  set %sec [Not Secure] [Server]
  set %cp Craft-Planer-Thread
  set %cp2 [Craft-Planer-Thread]
  if (%temp.r != $read(%mlog, %i)) {
    set %temp.r $read(%mlog, %i)
    if (Lvl isin %temp.r) { /checklog-lvl | /halt }
    var %temp.rv $remove(%temp.r, [<ip address withheld>], $time)
    var %temp.rv2 %Head-3 $replace( $+ %temp.rv, left the game, 4Verlies den Server, $&
      /INFO]:, /INFO]:, [Async Chat Thread, 14[11M10C-11C11hat14], $&
      [Server Thread,  14[11S10erver 11E10vent14],Owner,4O8w7n3e12r14, $&
      issued Server command:, Server Befehl4:7, $&
      [Craft Scheduler Thread, 14[11C10raft-11P10laner-11T10hread14], $&
      fell from a high place, 5[10Ist aus Großer Höhe gefallen5, $&
      was shot by Skeleton, 5[10Wurde erschossen von: 4Skelett5], $&
      was stung to death, 5[10wurde zu Tode gestochen5], $&
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
      burned to death, 5[10zu tode verbrannt!5], $&
      tried to swim in lava, 5[10Versuchte in 4Lava5 10zu schwimmen5], $&
      drowned, :5[10Ertrank im Wasser5])
    set %temp.rv2.1 $replace(%temp.rv2,suffocated in a wall, 5[10In der 4Wand5 10erstickt!!5], $&
      /WARN,-4Warnung14,[ServerMain,14[11H10aupt 11S10erver14] ,Loaded recipes, 7Rezepte Geladen)
    var %temp.rv2 %temp.rv2.1
    set %temp.rv4 $remove(%temp.rv2, %rcon, %rcon2, %time, %rcon3)
    set %te.1 $replace(%temp.rv4,$chr(32),.)
    set %te.1rem $gettok(%te.1,1,46)
    set %te.2rem $gettok(%te.1,4,46)
    set %te.2rem.a $gettok(%te.1,5,46)
    set %te.2 $remtok(%te.1,%te.1rem,1,46)
    set %temp.rv3a $replace(%te.2,.,$chr(32))
    set %temp.rv3 $remove(%temp.rv2, %te.1rem, %rcon, %rcon2, %time, %rcon3,]:,te.2rem,%te.2rem.a)
    set %temp.rv3 $replace($remtok(%te.2,$gettok(%te.2,4,46),46),.,$chr(32)) 
    set %temp.rv3lag $replace($remtok(%te.2,$gettok(%te.2,2,46),46),.,$chr(32))
    set %temp.rv3a $remove(%temp.rv4,%te.2rem, - $+ $chr(32) - $+ $chr(32),%te.1rem)
    if (MC $+ $chr(45) $+ CHAT isin %temp.r) || (%igchat isin %temp.r) { 
      var %te.3rem $gettok(%te.1,5,46)
      var %temp4 $remtok(%te.1,$gettok(%te.1,4,46),46) 
      var %temp.rv3 $remove(%temp.rv2, %te.1rem, %rcon, %rcon2, %time, %rcon3,]:,%te.3rem)
      var %temp.rv3b $remove(%temp4,%te.1rem,%te.3rem)
      set %temp.rv3mchat $replace(%temp.rv3b,.,$chr(32))
      msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]9,1 $remtok(%temp.rv3mchat, $gettok(%temp.rv3mchat,1,32), 32) 7,1[9▒7] 
      /halt
    }
    if (%named isin %temp.r) { 
      ;;;msg %m-channel Namenloses Entity $gettok(%te.1,7-8,46)
      var %entity $gettok(%te.1,7-8,46)
      var %entity.token $addtok(%entity.token,$remove($replace($gettok(%te.1,7-9,46),.,$chr(32),[,$chr(32),/,$chr(32)),',$chr(44)),32)
      ;;;msg %m-channel entity Tokens (32Bit): %entity.token 
      var %mob $gettok(%entity.token,2-3,32)
      var %deathmsg 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]9,1 ◄► $+ %mob $+ ◄► 5[10Starb!!5] 14,1 Grund: 5 [10 $+ $remove($replace($gettok(%te.1,24-,46),.,$chr(32)),$chr(91),$chr(93)) $+ 5]
      msg %m-channel %deathmsg
      /halt 
    }
    if (/WARN isin %temp.r) { inc %warn }
    if (/ERROR isin %temp.r) { inc %err }
    if (%mcwhois == on) { /halt }
    if (%Loading isin %temp.r) || (Loaded! isin %temp.r) || (%Enabling isin %temp.r) || (Disabling isin %temp.r) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $+ $remove(%temp.rv4,%cls,$gettok(%te.1,5,46),$chr(32) $+ -) %tps3 | /halt }
    if (%plisten == on) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $iif(%command != $null, -, %command) %tps3 | /halt }
    if (%flagset == on) && (%tps3 != $null) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps3 | /unset %tps3 | /halt }
    if (%flagset == on) && (%tps4 != $null) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps4 | /unset %tps4 | /halt }
    if (%blocklist == on) && (%tps3 != $null) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps3 | /unset %tps3 | /halt }
    if (%blocklist == on) && (%tps4 != $null) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps4 | /unset %tps4 | /halt }
    if (%regselect == on) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps3 | /halt }
    if (%god == on) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 Spieler %p in den Godmodus gesetzt | /timer.ungod1 1 3 /unset %god | /halt }
    if (%sec isin %temp.r) { var %say.msg $remove(%temp.rv4, - $+ $chr(32) - $+ $chr(32),%te.1rem) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %say.msg %tps3 | /halt }
    if (%login isin %temp.r) || (%loginip isin %temp.r) { var %log 9meldet sich an mit | var %log2 9meldet sich an mit14,1 | var %cls $gettok(%te.1,2,46) | var %logtext $replace($gettok(%temp.r,4,32),[,$chr(32),],$chr(32),:,$chr(32)) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]14,1 $gettok(%logtext, 1, 32) 9hat sich eingeloggt. | /halt } 
    if (%left isin %temp.r) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]14,1  $remove(%temp.rv4,%cls,%te.1rem) 14,1 | /halt } 
    if (%scom isin %temp.r) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $remove(%temp.rv4,%cls,%te.1rem) | /halt }
    ;;;if (%say isin %temp.r) {  var %cls $gettok(%te.1,2,46) | var %say.msg $remove(%temp.rv4,%cls,[Not Secure] [Rcon]) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %say.msg %tps3 | /halt }
    if (%say isin %temp.r) {  return | /halt }
    if (Timings isin %temp.rv4) || (Flushing isin %temp.rv4) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $remove(%temp.rv4,%cls,$gettok(%te.1,2,46),$chr(32) $+ -)  | /halt }
    if (%laglag == on) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 %tps3 | /unset %laglag | /halt }
    if (Closing Server isin %temp.rv4) { unset %pid | set %serverstarted no | var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $remove(%temp.rv4,%cls,%te.1rem) | msg %m-channel 7,1[4!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 4◄>14 wurde 4gestopt <► 7[4!7] | /timer.dellogs1 1 3 /run -ap cmd.exe /c DEL %pfad $+ logs\*.* /Q /F | /halt }
    if (%start == on) || (%stop == on) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $remove(%temp.rv4,%cls,$gettok(%te.1,5,46),$chr(32) $+ -)  | /halt }
    if (%tps == on) { msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $iif(%command != $null, -, %command) %tps3 | /halt }
    if (version isin %temp.rv3) { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $remove(%temp.rv4,%cls,$gettok(%te.1,5,46)) %tps3 | /halt }
    set %cls $gettok(%te.1,2,46)
    if (SlimeFun isin %temp.rv4) || (Postal isin %temp.rv4) || (BlueMap isin %temp.rv4) || (BlockRegen isin %temp.rv4) || (Essentials isin %temp.rv4) || (Vault isin %temp.rv4)  { var %cls $gettok(%te.1,2,46) | msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $+ $remove(%temp.rv4,%cls,$chr(91) $+ $chr(93), $chr(32) $+ -,$gettok(%te.1,5,46)) $iif(%command != $null, -, %command) %tps3 | /halt }
    msg %m-channel 7,1[9▒7] 4→11M14inecraft4← 7[9▒7,1]0,1 $+ $remove(%temp.rv4,%cls,$chr(91) $+ $chr(93), $chr(32) $+ -,$gettok(%te.1,5-,46)) $iif(%command != $null, -, %command) %tps3
  }
}

;;; Aliasse zum Betriebsystem Abfrage:
;;; Ob es bei Linux auch geht keine Ahnung
;;; Quelle: https://forums.mirc.com/ubbthreads.php/topics/230837/Re:_Some_$os...._extra_identif

alias osVersion { return $gettok($OSGET(Name),1,124) }
alias osBuild { return $OSGet(Version) }
alias osSP { return SP $+ $OSGet(ServicePackMajorVersion) }
alias osReg { return $OSGet(RegisteredUser) }


alias -l OSGet {
  var %r
  if ($com(osLoc)) { .comclose osLoc }
  if ($com(osSrv)) { .comclose osSrv }
  if ($com(osOS)) { .comclose osOS }


  .comopen osLoc WbemScripting.SWbemLocator
  if ($comerr) { goto error }
  elseif (!$com(osLoc,ConnectServer,3,dispatch* osSrv)) { goto error }
  elseif (!$com(osSrv,ExecQuery,3,bstr*,select $1 from Win32_OperatingSystem,dispatch* osOS)) { goto error }
  %r = $comval(osOS,1,$1)

  :error
  if ($com(osLoc)) { .comclose osLoc }
  if ($com(osSrv)) { .comclose osSrv }
  if ($com(osOS)) { .comclose osOS }
  return %r
}

;; Alias clearedlogs ====
;; Zum Löschen der Serverlog datein wird dieser Aufgerufen.
;; =====

alias clearedlogs {
  if (!%clearlog) { msg %m-channel Zeit Abgelaufen }
}

;; Alias Checkstarted ====
;; Wenn Server gestartet wird dieser 
;; Die Fehler und Warnungen Zählen
;; Funktioniert in verbindung mit Alias Checklog
;; ======================

alias checkstarted {
  var %done $read(%mLog, w, *[Server thread/INFO]: Done*)
  if (%done != $null)  { 
    set %co $iif(%warn > 0,%head2 7Incl:11 %warn 13Warnungen %head2, %head2 7Keine 13Warnungen %head2)
    set %error $iif(%err > 0,%head2 7Incl:11 %err 12Fehler %head2, %head2 7Keine 12Fehler %head2)
    msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 wurde erfolgreich 9 ◄> Gestartet! <► 7[9!7]  %co %error
    msg %m-channel 7,1[9!7] 11 I14game11RPG 7]4▬7[ 9→11M14inecraft9← 11S14erver 9◄>14 Laden der Restconfiguration 9 ◄> Beitritt zum Server möglich<► 7[9!7]
    ;;/timerspid1 1 2 /spid
    if (%warn >= 1) || (%err >= 1) { msg %m-channel %head2 4ACHTUNG11 Es gab einige Warnungen/Fehler. Überprüfe die Console für Details  %head2 }
    /timer.checkstarted1 off
  }
}

;; == Alias plist ==
;; Gibt die Online Spielerliste Wieder.
;; ===============

alias plist {
  set %plist $read(%pfad $+ help2.txt,l,1)
  set %players $read(%pfad $+ help2.txt,l,2)
  set %c1 $chr(3)
  set %plist2 $replace(%plist, There are, Es sind 4, of a max of, von, players online, Spieler im Spiel)
  set %plist3 $replace(%plist, §6, %c1 $+ 7, §4, %c1 $+ 5, §c, %c1 $+ 41, §f, %c1 $+ 0, §r, $chr(3))
  set %players1 $replace(%players, §6default@r:, 4(7Standard4), §6§7[§6Owner§7]§r§r:, 14[7Owner14])
  set %playerlist1 3Gruppe: $replace(%players1, §6, %c1 $+ 7, §4, %c1 $+ 5, §c, %c1 $+ 41, §f, %c1 $+ 0, §r, $chr(3))
  if (!%mcwhois) { timersend1 1 4 /msg %m-channel %plist3 }
  if (%players1 != $null) && (!%mcwhois) { /timersend2 1 5 /msg %m-channel %playerlist1 }
}

;; === Alias Lagausgabe ===
;; Wiedergibt die Serverauslastung im Channel
;; ======

alias lagausgabe {
  var %i 1
  var %zeilen $lines(%pfad $+ lag.txt)
  while (%i <= %zeilen) {
    var %text $read -l $+ %i %pfad $+ lag.txt
    var %text.result $replace(%text, $&
      Laufzeit:,7L14aufzeit4:9, $&
      Tage,11T14ag0'14e9, $&
      Stunden,11S14tunde0'14n9, $&
      Minuten,11M14inute0'14n9, $&
      Sekunden,11S14ekunde0'14n9, $&
      Aktuelle TPS , 7A14ktuelle TPS, $&
      Maximaler Speicher: , 7M14aximaler 7S14peicher4:9, $& 
      Reservierter Speicher: , 7R14eservierter 7S14peicher4:9, $& 
      Freier Speicher: , 7F14reier 7S14peicher4:9, $& 
      World ",7W14orld4:12, $&
      Nether ",7N14ether4:12, $&
      The End ",7T14he 7E14nd4:12, $&
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
  /timer.ausgabe2 1 2 /lagausgabe2
}

;; == Alias Lagausgabe2 ===
;; Resultiert das Ergebnis von Lagausgabe
;; ==========

alias lagausgabe2 {
  var %x 1
  var %zeilen2 $lines(lagres.txt)
  while (%x <= %zeilen2) {

    msg %m-channel $read(lagres.txt,l,%x)
    inc %x
  }
  /timerdelete.lag1 1 6 /remove lagres.txt
}

;;;; Ausgabe Serverresult vom !server settings Befehl ;;;;;;

alias serverresult {
  msg %m-channel 10,1 $+ %head003 7 Nether Erlauben: 4 $+ %allow-nether  %head002 7 Flugmodus Aktiv: 4 $+ %allow-flight %head002 7 Ausgabe der Consolenbefehle zu Ops senden: 4 $+ %settings.5.result %head002 7 RCON Befehle an OPS senden: 4 %broadcast-rcon-to-ops %head003 
  msg %m-channel 10,1 $+ %head003 7 Debug Modus: 8 $+ %debug %head002 7 Schwierigkeitsgrad: 8 $+ %difficulty %head002 7 Befehlsblöcke erlauben: 4 $+ %enable-command-block %head002 7 Remotezugriff: 4 $+ %enable-rcon %head002 7 Server in der Serverliste anzeigen: 4 $+ %enable-status %head003
  msg %m-channel 10,1 $+ %head003 7Nur Mojang Accounts: 4 $+ %enforce-secure-profile %head002 7 Privater Zugang: 4 $+ %enforce-whitelist %head002 7 Erzwungener Spielmodus: 8 $+ %force-gamemode %head002 7 Funktionslevel: 8 $+ %function-permission-level %head003 
  msg %m-channel 10,1 $+ %head003 7Spielmodus: 8 $+ %gamemode %head002 7 Strukturen erzeugen: 4 $+ %generate-structures %head002 7 Online Spieler verstecken: 4 $+ %hide-online-players %head002 7 Hauptwelt: 8 $+ %level %head003 
  msg %m-channel 10,1 $+ %head003 7 Seed: 4 $iif(%level-seed == $null, 4 Zufällig  , $+ %level-seed) %head002 7 Welttyp: 8 $+ $remove(%level-type,minecraft\:) %head002 7 Max Spieler: 12 $+ %max-players %head002 7 Weltgrenze liegt bei: 12 $+ %max-world-size 7Blöcken %head002 7 MOTD: 8 $+ %motd %head002 7 PVP: 4 $+ %pvp %head003
  msg %m-channel 10,1 $+ %head003 7Serverport: 12 $+ %server-port %head002 7 Simulationsentfernung: 12 %simulation-distance %head002 7 Tiere erzeugen: 04 $+ %spawn-animals %head002 7 Monster erzeugen: 04 $+ %spawn-monsters %head003
  msg %m-channel 10,1 $+ %head003 7 NPC's erzeugen: 04 $+ %spawn-npcs %head002 7 Spawn Schutz: 12 $+ %spawn-protection 7Blöcke %head002 7 Privater Server: 04 $+ %white-list %head003
}

;; === Alias Ausgabe ===
;; Wird zum Löschen von Welten benutzt.
;; ================

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

;; === Alias vault-ausgabe ====
;; Konvertierung von Währungen auf einem Minecraftserver
;; ================

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

;; === Alias Zeitsteuerung-Tag & Zeitsteuerung-Nacht ===
;; Hiermit wird die Minecraftserverzeit gesteuert.
;; ======================

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

;; === Alias TPS && tpsausgabe ===
;; Ticks Per Secound definiert die Auslastung des Servers
;; ein wert unter 15 ist beängstigend
;; =============

alias tps {
  if (20 isin %newtag) { set %tagresult 10[11A4u7s9g10e13z14e8i7c12h9n6e3t9!4!9!10] }
  if (18 isin %newtag) { set %tagresult 11[12Normale Auslastung10] }
  if (20 isin %newlag) { set %tagresult2  10[11A4u7s9g10e13z14e8i7c12h9n6e3t9!3!9!10] }
  if (18 isin %newlag) { set %tagresult2 11[12Normale Auslastung10] }
}

alias tpsausgabe {
  set %tps $read -l $+ 1 %pfad $+ tps.txt
  set %tps1 $remove(%tps,§r)
  set %newtag $replace(%tps1,§6,$chr(3) $+ 7,§a,$chr(3) $+ 9 $+ $chr(32))
  $tps
  /msg %m-channel %newtag %tagresult
  /timer.deletetps1 1 7 /remove %pfad $+ tps.txt
}


;; == Alias scriptlines ==
;; Ermittelt die Anzahl der Zeilen des Gesamten Scriptes
;; ===============

alias scriptlines { 
  var %x = 1 
  while (%x <= $script(0)) {
    set %script.lines $calc(%script.lines + $lines($script(%x))) 
    inc %x 
  } 
  set %scriptlines %script.lines
  unset %script.lines 
}

;;; Some Stuff from Quims

;;; == Alias GetAllyml ====
;; Wird zum Auslesen der Regionen sowie
;; Zum bearbeiten dieser Aufgerufen.
;; =============

alias getallyml { 
  ;;echo -sg >>
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
    ;;echo -sg >>> $prop
    if ($prop) {
      if ($regex(%v,/^\x20{ $+ %s $+ $chr(125) $+ $prop $+ :(.*)/)) {
        var %rm $regml(1)
        if ($regml(1) == $null) {
          var %rn $readn
          while (1) {
            ;;echo -sg main %s $read($1,nt,$calc(%rn + 1))
            if ($read($1,tnr,/^\x20{ $+ $calc(%s + 4) $+ $chr(125) $+ ([^ ]+.*)/,$calc(%rn + 1))) {
              ;;echo -sg ?a
              if ($readn == $calc(%rn + 1)) {
                ;;echo -sg ????
                var %rm1 $regml(1)
                if ($regex(%rm1,/^([^:]+):\x20*(.*)/F)) var %n %n $+ , $regml(1) $+ : $regml(2)
              }
              elseif ($read($1,tnr,/^\x20{ $+ $calc(%s + 5) $+ $chr(125) $+ (.*)/,$calc(%rn + 1))) {
                var %l $v1
                if ($readn == $calc(%rn + 1)) {
                  var %n %n %l
                }
                else break
              }
              else {
                ;;;echo -sg ??????????????
                break

              }
            }
            else {
              ;;echo -sg here?
              break
            }
            inc %rn
          }
          return $+($chr(123),$mid(%n,3),$chr(125))
        }
        if ($regex($mid($regml(1),2),^(\{.*\}|\[.*\]|[^{}\[\]]+)$)) return %rm
        var %r %rm
        while (1) {
          var %t $read($1,tn,$calc($readn + 1))
          var %r %r %t
          if ($right(%t,1) isin }]) break
        }
        return %r
        ;;echo -ag %r
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
  ;;echo -ag %n 
}

/*            if ($regml(3) isin {[) {
  var %r2 $v1
  inc %rn 2
  while (1) {
    var %l $read($1,tnr,/ $+ $iif(%r2 == [,\],\}) $+ $/,%rn)
    if ($readn) && ($v1 == %rn) { var %n %n $+ %l | dec %rn | break }
    else {
      var %n %n $+ $read($1,tn,%rn)
      inc %rn
    }
  }
}
*/

alias getallyml-oldcode { 
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

;; Weitere Aliasse von mir (Serkons)

;; == Alias Regcheck ==
;; Prüft ob die Region existiert etc
;; ==============

alias regcheck {
  var -s %file %pfad $+ plugins\WorldGuard\worlds\ $+ $1 $+ \regions.yml
  return $istok($getallyml(%file,regions),$2,32)
}

;; == Alias Ver ====
;; Gibt die Botversion wieder.
;; =============

Alias ver {
  var %version $read(version,l,1)
  return %version 
}

;; ===Allias McWhois ===
;; Ermittelt die Whois eiones Onlinespielers
;; ========== 

alias mcwhois {
  if (%whoisnick isin %playerlist1) { 
    msg %m-channel 11,1===3,1[7,1Whois von Spieler 4,1 $+ %whoisnick $+ 3,1]11,1===
    ;;;$mcwhois($2)
    ;;;/timer1 1 3 /mcwhoisout
    ;;;/halt
    set -u6 %mcwhois on 
    write -l1 %pfad $+ mcwhois.bat rcon.exe -a localhost:25575 -p %rcon_password " $+ whois %whoisnick $+ " > whois- $+ %whoisnick $+ .txt
    //run -ap %pfad $+ mcwhois.bat 
    ;;/timer.mcwhois1 1 2 /remove %pfad $+ mcwhois.bat
    echo ag -> whois %whoisnick
    /timerout1 1 2 /mcwout %whoisnick
    /timerwhoissend1 1 4 /mcwhoisout
  }
  else {
    msg %m-channel Sorry aber der Spieler $2 ist nicht im Spiel eingeloggt oder exisiert nicht.
    ;;;/halt
  }
}

;; == Alias mcwout ===
;; Gibt die Whois von mcwhois wieder
;; Arbeitet mit Alias mcwhoisout zusammen.
;; ==============

Alias mcwout {
  set %mcplayerpos $remove($read(%pfad $+ whois- $+ %whoisnick $+ .txt, ntw, *Position*),§6,§r,$chr(44))
  var %mctokens $replace(%mcplayerpos,$chr(32),.)
  set %playersworld $remove($gettok(%mctokens,3,46),$chr(40))
  set %playerposx $gettok(%mctokens,4,46)
  set %playerposy $gettok(%mctokens,5,46)
  set %playerposz $remove($gettok(%mctokens,6,46),$chr(41))
  //echo -ag Spielerwelt = %playersworld
  //echo -ag Pos x = %playerposx
  //echo -ag Pos y = %playerposy
  //echo -ag Pos z = %playerposz
  set %wout $addtok(%wout, 3S10pielerwelt: 14 $+ %playersworld, 32)
  set %wout $addtok(%wout, 3Pos 10x = 07 $+ %playerposx, 32)
  set %wout $addtok(%wout, 3Pos 10y = 07 $+ %playerposy, 32)
  set %wout $addtok(%wout, 3Pos 10z = 07 $+ %playerposz, 32)
}

alias mcwhoisout {
  if (%mcwhois == on) { 
    ;;;//msg %m-channel %wout
    unset %wout
    var %maxlines $lines(%pfad $+ whois- $+ %whoisnick $+ .txt)
    var %x 2
    while (%x <= %maxlines) {
      set %m $read(%pfad $+ whois- $+ %whoisnick $+ .txt, tn, %x)
      if (UUID isin %m) { inc %x | set %uid $read(%pfad $+ whois- $+ %whoisnick $+ .txt, w, **UUID**) | set %m $read(%pfad $+ whois- $+ %whoisnick $+ .txt, tn, %x) | set %mout $replace(%m,§6,7,§4,4,§r,,§f,0,§a,9) | set %mout $remove(%mout, $gettok(%mout,2,32)) | set %mount $gettok(%uid,4,32) | msg %m-channel 9 ► 7 UUID: %mount }
      if (IP-Adresse isin %m) { inc %x | set %m $read(%pfad $+ whois- $+ %whoisnick $+ .txt, tn, %x) | set %mout $replace(%m,§6,7,§4,4,§r,,§f,0,§a,9) | set %mout $remove(%mout, $gettok(%mout,2,32)) }
      if (Position isin %m) { inc %x | set %pos $read(%pfad $+ whois- $+ %whoisnick $+ .txt, w, **Position**)  | set %m $read(%pfad $+ whois- $+ %whoisnick $+ .txt, tn, %x) | set %mout $replace(%m,§6,7,§4,4,§r,,§f,0,§a,9) | set %mout $remove(%mout, $gettok(%mout,2,32)) | set %position $gettok(%pos,4-,32) | msg %m-channel 9 ► 7 Position: %position  }
      if (Spielzeit isin %m) { set %m $read(%pfad $+ whois- $+ %whoisnick $+ .txt, tn, %x) | set %mout $replace(%m,§6,7,§4,4,§r,,§f,0,§a,9) | set %mout $remove(%mout, $gettok(%mout,2,32)) }
      set %mout $replace(%m,§6,7,§4,4,§r,,§f,0,§a,9)
      set %mout $remove(%mout, $gettok(%mout,2,32))
      msg %m-channel 9 ►  %mout 
      inc %x
    }
  }
}

;; Alias Zeilenentfernen
;; Der Name muss nicht erklärt werden .
;; ==================

alias Zeilenentfernen {
  var %maxlines $lines(material-id.txt)
  var %x 1
  while (%x <= %maxlines) {
    var %value $read(material-id.txt,%x)
    var %newvalue $remove(%value,%x,=)
    write -l $+ %x newmats.txt %newvalue
    inc %x
  }
}

;; Alias ct ;;
;; Farbigen Text schreiben.
;; ======

alias ct {
  return $regsubex($1-,/(?<= |^)(\S)/g,%c1\1 $+ %c2)
}
