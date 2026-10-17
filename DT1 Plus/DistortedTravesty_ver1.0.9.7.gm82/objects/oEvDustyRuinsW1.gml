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
qtTextEvent=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=71 //intro to Dusty Ruins
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
    msgCreate("Detect anything here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("There's a bit of interferance, so I'm unsure.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Let's do what we normally do then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You do all the work and I sit back, eat popcorn, and drink soda?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("You do that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Yeah, it gets boring watching you sometimes!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You'd do the same thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("True, no worries I still less than three you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("How heart warming.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11
  {
    global.gameProgress=72
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Dusty Ruins"
    global.gamePaused=false
  }
}
else if global.gameProgress=73 //Dusty Ruins 2 Rock Trap
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1712
    {
      barrier1=instance_create(1456,240,oEventBarrier)
      barrier2=instance_create(1920,240,oEventBarrier)
      sceneProgress+=1
    }
  }
  if sceneProgress=1 and global.gamePaused=false
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1568,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=60
    else if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1824,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=120
    else if scrCountPass(sceneDelay,120) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1696,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=165
    else if scrCountPass(sceneDelay,165) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1632,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=210
    else if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1760,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=270
    else if scrCountPass(sceneDelay,270) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1568,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1824,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=345
    else if scrCountPass(sceneDelay,345) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1632,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=390
    else if scrCountPass(sceneDelay,390) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1760,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=480
    else if scrCountPass(sceneDelay,480) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1568,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1824,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1696,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=570
    else if scrCountPass(sceneDelay,570) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1824,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=615
    else if scrCountPass(sceneDelay,615) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1760,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=660
    else if scrCountPass(sceneDelay,660) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1696,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=705
    else if scrCountPass(sceneDelay,705) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1632,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=750
    else if scrCountPass(sceneDelay,750) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1568,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=810
    else if scrCountPass(sceneDelay,810) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1568,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=840
    else if scrCountPass(sceneDelay,840) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1632,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=870
    else if scrCountPass(sceneDelay,870) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1696,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=900
    else if scrCountPass(sceneDelay,900) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1760,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=930
    else if scrCountPass(sceneDelay,930) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1824,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=1050
    else if scrCountPass(sceneDelay,1050) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_SwitchHit,0,1)
      with oEventBarrier
        instance_destroy()
      sceneProgress+=1
    }
  }
  if sceneProgress=2
  {
    if oPlayer1.x>=3632
    {
      boulder=instance_create(3328,-48,oBigBoulder)
      sceneProgress+=1
    }
  }
}
else if global.gameProgress=76 and room=rDustyRuins5 //Boss Fight (Flame Instigator)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=336
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
    if oPlayer1.y<320
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
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      boss=instance_create(496,320,oFlameInstigator)
      boss.sprite_index=sKredaeusRainFire1
      boss.image_index=3
      boss.image_xscale=-1
      boss.image_alpha=0
      for (i=0;i<10;i+=1)
      {
        newImage[i]=instance_create(496,320,oMisc)
        newImage[i].type=0
        newImage[i].sprite_index=sKredaeusRainFire1
        newImage[i].image_speed=0
        newImage[i].image_index=3
        newImage[i].image_xscale=-4
        newImage[i].image_yscale=4
        newImage[i].image_alpha=0
        newImage[i].delay=7*i
      }
    }
    //else if sceneDelay>=2
    else if sceneDelay>1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      for (i=0;i<10;i+=1) //spawn in effect
      {
        //newImage[i].delay-=1
        newImage[i].delay-=gDeltaTime //60fps change: per 30fps tick
        if newImage[i].delay<=0 and newImage[i].image_alpha<0.09
        {
          //newImage[i].image_alpha+=0.01
          newImage[i].image_alpha+=0.01*gDeltaTime //60fps change: per 30fps tick
          //newImage[i].image_xscale+=0.34
          newImage[i].image_xscale+=0.34*gDeltaTime //60fps change: per 30fps tick
          //newImage[i].image_yscale-=0.34
          newImage[i].image_yscale-=0.34*gDeltaTime //60fps change: per 30fps tick
        }
      }
    }
    if sceneDelay>=90
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      boss.image_alpha=1
      with oMisc
        instance_destroy()
    }
    //else if sceneDelay=10
    else if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
      boss.sprite_index=sKredaeusIdle
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Semi-cool entrance. I can do a lot better though.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I smell the Muffins on you...#Hand them over!",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What would he want them for?#He's not even with The Darkness.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("How would you know?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Your text box isn't red.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("The details are irrelevant.#I will not ask again, give me the Muffins!",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("It's just not happening man.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      boss.sprite_index=sKredaeusShootStraight
      boss.image_index=1
    }
    if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("It can't be avoided then.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Kick ass!!#I hope this is as epic as I'm hoping it will be.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      boss.sprite_index=sKredaeusIdle
      barrier1=instance_create(144,256,oBossBarrier)
      barrier2=instance_create(672,256,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=77
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Flame Instigator"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=77 //boss fight ends (Flame Instigator)
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
      oPlayer1.x=416
      oPlayer1.y=321
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
    msgCreate("Piece of cake.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      newPowerUp=instance_create(oPlayer1.x-8,oPlayer1.y-96,oMisc)
      newPowerUp.type=0
      newPowerUp.sprite_index=sNewTechPickup
      newPowerUp.image_speed=0.2
      effect_create_above(ef_ring,newPowerUp.x+8,newPowerUp.y+8,1,c_orange)
      oPlayer1.sprite_index=sPlayerLookUp
    }
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Awesome, I love new abilities!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=31 and sceneDelay<=78
    if sceneDelay>30 and sceneDelay<=78 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //newPowerUp.y+=1.25
      newPowerUp.y+=1.25*gDeltaTime //60fps change: per 30fps tick
    }
    if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    global.hasSuaveToken=true
    msgCreate("You obtained:#SUAVE TOKEN#This allows you to dash mid-air.#To Air Dash, hold [Up] or [Down] while pressing jump when you are in the air.#You are invulnerable while its effects last.#It also consumes 1 Dash Point to use.",1,oMessageCutscene,"")
    with oMisc
      instance_destroy()
  }
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I have a feeling this is going to be incredibly useful.#But anyway, time to keep going.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11
  {
    global.gameProgress=78
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=79 and room=rDustyRuins6 //Quicktime Event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=2816
    {
      global.gamePaused=true
      stopPlayer()
      oPlayer1.y=256
      oPlayer1.sprite_index=sPlayerJump
      qtTextEvent="PRESS [X] TO NOT DIE!!"
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //if keyboard_check_pressed(ord("X"))
    if (keyboard_check_pressed(ord("X")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      sceneProgress+=1
      oPlayer1.sprite_index=sPlayerStab
      qtTextEvent="PRESS [F] TO NOT DIE!!"
    }
  }
  else if sceneProgress=2
  {
    //if keyboard_check_pressed(ord("F"))
    if (keyboard_check_pressed(ord("F")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      sceneProgress+=1
      oPlayer1.sprite_index=sPlayerGuard
      qtTextEvent="PRESS [A] TO NOT DIE!!"
    }
  }
  else if sceneProgress=3
  {
    //if keyboard_check_pressed(ord("A"))
    if (keyboard_check_pressed(ord("A")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      sceneProgress+=1
      oPlayer1.sprite_index=sPlayerChestHit
      qtTextEvent="PRESS [I] TO NOT DIE!!"
    }
  }
  else if sceneProgress=4
  {
    //if keyboard_check_pressed(ord("I"))
    if (keyboard_check_pressed(ord("I")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      sceneProgress+=1
      oPlayer1.sprite_index=sPlayerCasted
      qtTextEvent="PRESS [L] TO NOT DIE!!"
    }
  }
  else if sceneProgress=5
  {
    //if keyboard_check_pressed(ord("L"))
    if (keyboard_check_pressed(ord("L")) or scrPadAnyPressed()) //gamepad change: and any gamepad action button (scrGamepadInit)
    {
      io_clear()
      sceneProgress+=1
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.y=335
      qtTextEvent="SUCCESS!!"
    }
  }
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=45
    {
      qtTextEvent=""
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("What the hell was that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That was a Quick Time Event... a really bad one.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You're joking right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I'm afraid not.#And from the scans, it seems Quick Time Events are popping up all over the world.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Dude, we gotta stop them!#Any idea how?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("There's a city close by, maybe the residents would know.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Sounds like a plan, let's do this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    global.gameProgress=80
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rDirtyRuins1 and global.gamePaused=false
{

  if sceneProgress=0
  {
    if oPlayer1.x>=1072 and oPlayer1.x<=1168
    {
      barrier1=instance_create(880,48,oEventBarrier)
      barrier1.image_yscale=3.25
      barrier2=instance_create(1344,48,oEventBarrier)
      barrier2.image_yscale=3.25
      sceneProgress+=1
    }
  }
  if sceneProgress=1 and global.gamePaused=false
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=120
    else if scrCountPass(sceneDelay,120) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1024,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1216,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=160
    else if scrCountPass(sceneDelay,160) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=220
    else if scrCountPass(sceneDelay,220) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=230
    else if scrCountPass(sceneDelay,230) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1024,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=240
    else if scrCountPass(sceneDelay,240) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=250
    else if scrCountPass(sceneDelay,250) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1216,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=260
    else if scrCountPass(sceneDelay,260) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=350
    else if scrCountPass(sceneDelay,350) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=360
    else if scrCountPass(sceneDelay,360) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1216,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=370
    else if scrCountPass(sceneDelay,370) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=380
    else if scrCountPass(sceneDelay,380) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1024,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=390
    else if scrCountPass(sceneDelay,390) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=480
    else if scrCountPass(sceneDelay,480) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=520
    else if scrCountPass(sceneDelay,520) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(1024,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1216,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=680
    else if scrCountPass(sceneDelay,680) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=710
    else if scrCountPass(sceneDelay,710) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=740
    else if scrCountPass(sceneDelay,740) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=770
    else if scrCountPass(sceneDelay,770) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=800
    else if scrCountPass(sceneDelay,800) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=830
    else if scrCountPass(sceneDelay,830) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=860
    else if scrCountPass(sceneDelay,860) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=890
    else if scrCountPass(sceneDelay,890) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=920
    else if scrCountPass(sceneDelay,920) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1120,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=950
    else if scrCountPass(sceneDelay,950) //60fps change: once, when the count reaches it
    {
      boulder=instance_create(928,-48,oBigBoulder); boulder.bActive=true
      boulder=instance_create(1312,-48,oBigBoulder); boulder.bActive=true
    }
    //else if sceneDelay=1020
    else if scrCountPass(sceneDelay,1020) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_SwitchHit,0,1)
      with oEventBarrier
        instance_destroy()
      sceneProgress+=1
    }
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

if global.gameProgress=79 and qtTextEvent!="" //Quicktime Event
{
  qtTextX=view_xview[0]+256
  qtTextY=view_yview[0]+192
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_Continue)
  draw_set_halign(fa_center)
  draw_text(qtTextX,qtTextY,qtTextEvent)
}
