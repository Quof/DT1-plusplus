#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=0
fadeColor=c_white
sceneProgress=0
sceneDelay=0
qtTextEvent=""

if global.gameProgress=97 and room=rFrightTrain7
{
  boss=instance_create(336,96,oQuickTimeDistorter)

  npcInformant=instance_create(384,192,oMisc)
  npcInformant.sprite_index=sInformantIdle
  npcInformant.image_speed=0
  npcInformant.image_xscale=-1
  npcInformant.type=1

  npcSyrus=instance_create(496,-8,oMisc)
  npcSyrus.sprite_index=sSyrusAirRoll
  npcSyrus.image_speed=0.33
  npcSyrus.image_xscale=-1
  npcSyrus.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=87 //intro to Fright Train
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Are you surprised about " +string(global.mainCharacters[5]) +string(" being here too?"),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Yeah, it's crazy seeing them all here... I'm uneasy about all this now.#We can't go back home. It... just doesn't add up.#How can all this happen?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("If only we could make The Darkness speak to us...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Yeah, but at least " +string(global.mainCharacters[5]) +string(" is here, he's going to be a big help."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Well anyway, I've put up a Quick Time Event Blocker for you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Like a pop-up blocker?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Exactly, but it may not work for long.#Get to this thing and destroy it quick.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8
  {
    global.gameProgress=88
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Fright Train"
    global.gamePaused=false
  }
}
else if global.gameProgress=88 //trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=5312
    {
      global.teleportEnabled=1
      newBarrierL1=instance_create(5152,0,oEventBarrier)
      newBarrierL2=instance_create(5152,64,oEventBarrier)
      newBarrierL3=instance_create(5152,128,oEventBarrier)
      newBarrierR1=instance_create(5456,0,oEventBarrier)
      newBarrierR2=instance_create(5456,64,oEventBarrier)
      newBarrierR3=instance_create(5456,128,oEventBarrier)
      enemyCount=5
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    newEnemy=instance_create(5200,0,oTSentinel) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    newEnemy=instance_create(5424,0,oTSentinel) //2
    newEnemy.bActive=true
    newEnemy.questType=1
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=110
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(5696,160,oTRider) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    newEnemy=instance_create(4928,112,oTRider) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=190
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(5312,0,oTSentinel) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    sceneProgress+=1
  }
  else if sceneProgress=7 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=89
  }
}
if global.gameProgress=91 //Fright Train Interior
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("This looks more like a sewer than the interior of a train.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I'm inclined to agree, but regardless, that machine is here.#Also, I don't know if my Quick Time Blocker will work in here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Great.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=92
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=92 //quick time event - jump gap
{
  if sceneProgress=0
  {
    if oPlayer1.x>=352
    {
      global.gamePaused=true
      stopPlayer()
      qtTextEvent="PRESS [X] TO JUMP THE GAP!!"
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //if keyboard_check_pressed(ord("X"))
    if (keyboard_check_pressed(ord("X")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      oPlayer1.x=576
      oPlayer1.y=320
      sceneProgress+=1
      qtTextEvent=""
    }
  }
  else if sceneProgress=2
  {
    sceneProgress=10
    global.gamePaused=false
  }
  else if sceneProgress=10
  {
    if oPlayer1.x>=3136
    {
      global.gamePaused=true
      stopPlayer()
      qtTextEvent="PRESS [X] TO JUMP DOWN THE TUNNEL!!"
      sceneProgress+=1
    }
  }
  else if sceneProgress=11
  {
    //if keyboard_check_pressed(ord("X"))
    if (keyboard_check_pressed(ord("X")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      oPlayer1.x=3312
      oPlayer1.y=352
      sceneProgress+=1
      qtTextEvent=""
    }
  }
  else if sceneProgress=12
  {
    sceneProgress=20
    global.gamePaused=false
  }
  else if sceneProgress=20
  {
    if oPlayer1.x>=3600
    {
      global.gamePaused=true
      stopPlayer()
      qtTextEvent="PRESS [X] TO JUMP UP THE TUNNEL!!"
      sceneProgress+=1
    }
  }
  else if sceneProgress=21
  {
    //if keyboard_check_pressed(ord("X"))
    if (keyboard_check_pressed(ord("X")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      oPlayer1.x=3664
      oPlayer1.y=208
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
      qtTextEvent="ALMOST THERE!!#PRESS [Y] TO JUMP UP THE#REST OF THE TUNNEL!!"
    }
  }
  else if sceneProgress=22
  {
    //if keyboard_check_pressed(ord("Y"))
    if (keyboard_check_pressed(ord("Y")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      oPlayer1.x=3792
      oPlayer1.y=128
      sceneProgress+=1
      qtTextEvent="PRESS [Z] TO LAND PROPERLY!!"
    }
  }
  else if sceneProgress=23
  {
    //if keyboard_check_pressed(ord("Z"))
    if (keyboard_check_pressed(ord("Z")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      oPlayer1.x=3792
      oPlayer1.y=160
      sceneProgress+=1
      qtTextEvent=""
    }
  }
  else if sceneProgress=24
  {
    sceneProgress=30
    global.gamePaused=false
  }
}
else if global.gameProgress=94 //Fright Train Elevator Start
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Eh, what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It's an elevator of some sort.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I guessed that by the elevator music playing, but why?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=20
    if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_Clang,0,1)
      background_vspeed[0]=4
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Going up!#Where is this taking me?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I don't know, but you've got a lot of bad guys coming your way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7
  {
    global.teleportEnabled=2
    enemyCount=47
    global.gameProgress=95
    sceneProgress=10
    global.gamePaused=false
    timeline_index=tlFTrainTunnel
    timeline_running=true
    timeline_speed=gDeltaTime //60fps change (added): a timeline moves timeline_speed every frame; 1 per 30fps tick (1 at 30fps)
  }
}
else if global.gameProgress=95 //Fright Train Elevator Control
{
  if sceneProgress=0
  {
    enemyCount=47
    timeline_index=tlFTrainTunnel
    timeline_running=true
    sceneProgress=10
  }
  timeline_speed=gDeltaTime //60fps change (added): a timeline moves timeline_speed every frame; 1 per 30fps tick (1 at 30fps)
  if global.gamePaused=false
  {
    timeline_running=true
    if timeline_position>=751
      newTimeline.timeline_running=true
  }
  else
  {
    timeline_running=false
    if timeline_position>=751
      newTimeline.timeline_running=false
  }
  if timeline_position>=751
    newTimeline.timeline_speed=gDeltaTime //60fps change (added): the spike loop's timeline too
  //if sceneProgress=10 and timeline_position=750
  if sceneProgress=10 and timeline_position>=750 //60fps change: >= so it still starts if a frame rate change leaves the timeline between whole positions
  {
    newTimeline=instance_create(0,0,oMisc)
    newTimeline.type=0
    newTimeline.sprite_index=sNull
    newTimeline.timeline_index=tlFTrainTunnelSpikesLoop
    newTimeline.timeline_loop=true
    newTimeline.timeline_speed=gDeltaTime //60fps change (added): see above
    sceneProgress=11
  }
  if sceneProgress=11 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oMRustySpike
      instance_destroy()
    global.gamePaused=true
    sceneProgress+=1
  }
  else if sceneProgress=12
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Sweet, kicked their asses!#Time to move on.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    global.gamePaused=false
    global.gameProgress=96
    global.teleportEnabled=0
    writeToPlayerGlobals()
    room_goto(rFrightTrain6)
  }
}
else if global.gameProgress=97 and room=rFrightTrain7 //Boss Fight (Quick Time Distorter)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=240
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<192
      //oPlayer1.y+=4
      oPlayer1.y+=4*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=60
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You are just in time for it!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("For what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("The Quick Time Machine's grand finale.#I will unleash the greatest Quick Time Event the worlds have ever seen!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("You're a sick freak. What good can come from Quick Time Events?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I will lock down this world with them and The Darkness will take the worlds' Muffins!#It will consume and control everything!#We will be the worlds' masters!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=40
    if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_SwitchHit,0,1)
      with oQTD_Orb
        bSpinning=true
    }
    else if sceneDelay>=70
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Now Quick Time Machine!#Fill the land with your horrid conventions!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Not if I have anything to say about it.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=30
    if sceneDelay>29 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //if sceneDelay=50
      if scrCountPass(sceneDelay,50) //60fps change: once, when the count reaches it
        npcInformant.image_xscale=1
      //npcSyrus.y+=8
      npcSyrus.y+=8*gDeltaTime //60fps change: per 30fps tick
      if npcSyrus.y>=224
      {
        npcSyrus.sprite_index=sSyrusGroundHit
        playSound(global.snd_JumpStrike,0,1)
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=11
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      npcSyrus.sprite_index=sSyrusPointDUp
    else if sceneDelay>=60
    {
      playSound(global.snd_CASgun,0,1)
      with oQTD_Orb
        bSpinning=false
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=12
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.2
      bossFinishFadeAlpha+=0.2*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
    {
      npcSyrus.sprite_index=sSyrusStand
      sceneProgress+=1
    }
  }
  else if sceneProgress=13
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.2
      bossFinishFadeAlpha-=0.2*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=14
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("What did you do to it?!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Temporarily took out its Quick Time Dispensers.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What are you doing here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Figured I'd drop in and help you guys out a bit.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("It wasn't a bad entrance.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("You... you've destroyed a plot device!!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("We didn't need it AND it was annoying.#Do you realize how ANNOYING Quick Time Events are?#I'd rather scrape my ass with a cheese grater than go through one of those!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("I'll see to it that you suffer!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=23
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      npcInformant.sprite_index=sInformantEye
    //else if sceneDelay=8
    else if scrCountPass(sceneDelay,8) //60fps change: once, when the count reaches it
      npcInformant.image_index=1
    //else if sceneDelay=15
    else if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      npcInformant.image_index=2
    //else if sceneDelay=22
    else if scrCountPass(sceneDelay,22) //60fps change: once, when the count reaches it
      npcInformant.image_index=3
    //else if sceneDelay=29
    else if scrCountPass(sceneDelay,29) //60fps change: once, when the count reaches it
      npcInformant.image_index=4
    //else if sceneDelay=36
    else if scrCountPass(sceneDelay,36) //60fps change: once, when the count reaches it
      npcInformant.image_index=5
    //else if sceneDelay=43
    else if scrCountPass(sceneDelay,43) //60fps change: once, when the count reaches it
      npcInformant.image_index=6
    else if sceneDelay>=55
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Not this time!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      oPlayer1.sprite_index=sPlayerWalk
      var yPlace;
      yPlace=0
      for(i=0;i<4;i+=1)
      {
        lightningBolt[i]=instance_create(288,yPlace,oMisc)
        lightningBolt[i].type=0
        lightningBolt[i].sprite_index=sDTorsoLightning
        yPlace-=64
      }
    }
    //if sceneDelay>=1 and sceneDelay<=8
    if sceneDelay>0 and sceneDelay<=8 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //oPlayer1.x+=6
      oPlayer1.x+=6*gDeltaTime //60fps change: per 30fps tick
      for(i=0;i<4;i+=1)
      {
        //lightningBolt[i].y+=24
        lightningBolt[i].y+=24*gDeltaTime //60fps change: per 30fps tick
      }
    }
    //if sceneDelay=9
    if scrCountPass(sceneDelay,9) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=26
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.2
      bossFinishFadeAlpha+=0.2*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=27
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=20
    {
      oPlayer1.x=240
      oPlayer1.sprite_index=sPlayerKneel
      with npcInformant
        instance_destroy()
      with npcSyrus
        instance_destroy()
      for(i=0;i<4;i+=1)
      {
        with lightningBolt[i]
          instance_destroy()
      }
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=28
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.2
      bossFinishFadeAlpha-=0.2*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=29
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("That was close.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=20
    {
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Wait, where did they go?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_SwitchHit,0,1)
      with oQTD_Orb
        bSpinning=true
    }
    else if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("What the heck, it started again.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("It also has a combat function you know. It is quite formidable.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("What did you do with " +string(global.mainCharacters[5]) +string("?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("If you want to see your friend again, you will bring me the Muffins you have#to my fortress, The Black Rock Fortress!#That is, if you survive.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Black Rock... d... dude!#Worst... name... EVER!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("Taunt all you want, but unless you bring me those Muffins, your friend will die here.#I must also mention he has the means to find another Muffin.#Better hurry, we'll get it out of him one way or another.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("Kick this things ass!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("Wouldn't give it a second thought.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=42
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      barrier1=instance_create(144,0,oBossBarrier)
      barrier2=instance_create(144,64,oBossBarrier)
      barrier3=instance_create(144,128,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=98
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Quick Time Distorter"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=98 //boss fight ends (Quick Time Distorter)
{
  if sceneProgress=0 and enemyCount=0
  {
    global.gamePaused=true
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.05
      bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      endBoss()
      oPlayer1.x=288
      oPlayer1.y=192
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.05
      bossFinishFadeAlpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("That thing cheated, it really did.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I'm glad it couldn't activate its Quick Time Dispensers. " +string(global.mainCharacters[5]) +string(" really#did a number on it."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yeah... he did...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I know what you're thinking.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Damn straight you do, we need to save him.#Plus he's one of our gamer pals. You don't mess with people's#gaming buddies!#But umm... any idea on how we are going to find him?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I'll scan the area for the location 'Black Rock Fortress'.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("That's a good idea.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("But before that, claim your prize.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Oh dude, I almost forgot!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(288,80,oMagicalMuffin)
      muffin.muffinType=2
      playSound(global.snd_BreakOut,0,1)
    }
    //else if sceneDelay>=9 and sceneDelay<=109
    else if sceneDelay>8 and sceneDelay<=109 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //bossFinishFadeAlpha-=0.01
      bossFinishFadeAlpha-=0.01*gDeltaTime //60fps change: per 30fps tick
    else if sceneDelay>=120
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I've always liked that flavor.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 //---------- Muffin Sequence ----------
    getMuffin(2)
  else if sceneProgress=17 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL BANANA NUT MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=18 and bWaitForInput=false
  {
    msgCreate(global.mainCharacters[0] +string(" learned:#Fire Technique: Blast Off#Water Technique: Flood#Wind Technique: Cyclone#Earth Technique: Rupture"),1,oMessageCutscene,"")
    global.fireLv=3
    global.waterLv=3
    global.windLv=3
    global.earthLv=3
  }
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I found it!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("That was easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("You will never get in there.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("The hell?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
    {
      npcPhisitan=instance_create(368,192,oMisc)
      npcPhisitan.type=0
      npcPhisitan.sprite_index=sPhisitanStand
      npcPhisitan.image_xscale=-1
      playSound(global.snd_BreakOut,0,1)
      effect_create_above(ef_smoke,npcPhisitan.x,npcPhisitan.y-14,2,c_gray)
    }
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("The place is sealed and not only that, is heavily guarded.#I have seen it. The Darkness watches over it.#It's as if it has something in there to hide.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Dude, one of our friends are in there, we are not just going to#let The Darkness or whatever use him.#He'd do the same for us. We're all gamer buds here from our world,#we help each other out, it's what we do!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("If your public speaking skills were just a notch higher, you might've#squeezed a tear out of me with that.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("I see...#Well there is one way in... but it won't be easy.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Eh, we can handle it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("The Darkness has a seal on the place, now this seal can be broken if#you were to get an anti-seal mechanism.#I know who has it but... well let's just say he won't give it up easy.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Okay, we'll just get it our way then... a good old fashioned ass kicking.#Where is this guy and who is he?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Oh he's... well trust me, you'll know when you see him.#I'd come with you, but Abstracity needs me, we can't lose that place to The Darkness.#Now his location, he is south from Abstracity, but you will have to#cross the jungle. It is not a very friendly place. It may look like rainbows and sunshine,#but looks can be decieving.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("We'll do it, thank you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("I wish you both luck, and I want to save " +string(global.mainCharacters[5]) +string(" just as much as you do,#but the Black Rock Fortress is no place for you to mess around.#I have something for you, I think you'll like it."),1,oMessageCutscene,"Phisitan")
  else if sceneProgress=34 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    global.p1MoneyMax+=1500
    msgCreate("You have more bandwidth and can now hold " +string(global.p1MoneyMax) +string(" Internetz. Yay!!"),1,oMessageCutscene,"")
  }
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("Sweet awesome SWEET!#Thanks man!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("It hax the carrying capacity allowing you to hold more.#Well I don't think hax is the right word, more like disrupts it.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("So objects CAN distort the world!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Hmm?",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("Nothing, just thinking out loud is all.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("Well once again, good luck, you will need it.",1,oMessageCutscene,"Phisitan")
  else if sceneProgress=41
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_BreakOut,0,1)
      effect_create_above(ef_smoke,npcPhisitan.x,npcPhisitan.y-14,2,c_gray)
      with npcPhisitan
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("They crossed the line " +string(global.mainCharacters[0]) +string("."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("I know, we'll save him and get to the bottom of this whole thing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=44
  {
    exitPortal=instance_create(512,192,oDungeonPortal)
    exitPortal.toRoom=rWorldMap
    exitPortal.newMapX=416
    exitPortal.newMapY=240
    global.gameProgress=99
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}

if global.gameProgress=88 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if global.gameProgress=95 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"OMG Bad Guys:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}

if qtTextEvent!="" //Quicktime Event
{
  qtTextX=view_xview[0]+256
  qtTextY=view_yview[0]+192
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_Continue)
  draw_set_halign(fa_center)
  draw_text(qtTextX,qtTextY,qtTextEvent)
}
