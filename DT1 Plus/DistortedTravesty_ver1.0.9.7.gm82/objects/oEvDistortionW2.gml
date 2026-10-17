#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
if global.gameProgress=118
  bossFinishFadeAlpha=1
else
  bossFinishFadeAlpha=0
fadeColor=c_white

if global.gameProgress=118 and room=rDistortionW2_1
{
  npcX=instance_create(176,480,oMisc)
  npcX.sprite_index=sMegamanXIdle
  npcX.image_xscale=-1
  npcX.image_speed=0
  npcX.type=1
}

if room=rDistortionW2_2
{
  if window_get_fullscreen()
    window_set_fullscreen(false)
  window_center()
  windowX=window_get_x()
  windowY=window_get_y()
  windowXcenter=windowX
  setDelay=0
  text_Full="Keep running across this, you'll be fine. Trust me on this, you'll be safe..."
  text_New=""
  text_Pos=-1
  text2_Full="Run along this to get to that chest. Aren't I nice...?"
  text2_New=""
  text2_Pos=-1
  text3_Full="Isn't this area lovely? No seriously, don't you love this area? See if you can find all the switches, just don't die cause then you have to hit them all again. :( Yep, a sad face..."
  text3_New=""
  text3_Pos=-1
}
else if room=rDistortionW2_3
{
  text_Full="There isn't much left here... Yep, this was short, however the best is yet to come. Partial suffering may be involved. I'll laugh and you will cry, but don't dismay... I don't know where I was going with that. LOOK OUT!!"
  text_New=""
  text_Pos=-1
  fakeErrorProg=0
}
else if room=rDistortionW2_6
{
  if global.gameProgress=126
    boss=instance_create(512,256,oDemonCursor)
  drawWRec=false
  recSpread=0
  recAlpha=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=118 //intro to Distortion 2
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      oPlayer1.image_speed=0.1
      oPlayer1.sprite_index=sPlayerIdle
      snd_WindowsStartup=SS_LoadSound("Sound\DT_WindowsStartup.wav",0)
    }
    //else if sceneDelay=89
    else if scrCountPass(sceneDelay,89) //60fps change: once, when the count reaches it
      playSound(snd_WindowsStartup,0,1)
    //else if sceneDelay>=90 and sceneDelay<=130
    else if sceneDelay>89 and sceneDelay<=130 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if bossFinishFadeAlpha>0
        //bossFinishFadeAlpha-=0.04
        bossFinishFadeAlpha-=0.04*gDeltaTime //60fps change: per 30fps tick
    }
    else if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("This place...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("We're inside one of their Data Centers, this could actually be of use.",1,oMessageCutscene,"X")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Really, how so?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I know what X means.#From in here we can easily get information on The Darkness that would otherwise#be nearly impossible to retrieve.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Can't you hack their systems?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I've tried, but that " +string(global.mainCharacters[3] +string(" guy keeps me out.")),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That is exactly what I had in mind.#The problem is The Darkness has complete control of this area.#Progress isn't going to be easy.",1,oMessageCutscene,"X")
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Hasn't stopped me before.#If you can hinder The Darkness' control of this place, we can find a way to#steal their data.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I will do what I can and try to find a way out.#I'll go a different route so we cover more ground.",1,oMessageCutscene,"X")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Alright, let's do this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Jerry, if you do this, it could be a major turning point for everyone.#Be careful.",1,oMessageCutscene,"X")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You too, watch out for spikes.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("You're an ass.",1,oMessageCutscene,"X")
  else if sceneProgress=14
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
      npcX.sprite_index=sPlayerDiscombobulate
    //else if sceneDelay=6
    else if scrCountPass(sceneDelay,6) //60fps change: once, when the count reaches it
      npcX.image_index=0
    //else if sceneDelay>=7
    else if sceneDelay>6 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //npcX.y-=16
      npcX.y-=16*gDeltaTime //60fps change: per 30fps tick
      if npcX.y<=0
      {
        with npcX
          instance_destroy()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=15
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Didn't realize he was so sensitive about it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I'm hacking your Max Life if you make another bad joke.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18
  {
    global.gameProgress=119
    global.teleportEnabled=2
    SS_FreeSound(snd_WindowsStartup)
    global.stockWeaponGem+=1
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Distortion Windows"
    global.gamePaused=false
  }
}
else if global.gameProgress=121 and room=rDistortionW2_3 //Chat about scattered data
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Why is this place like this? Everything is scattered about.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Remember, this Distortion world is the scattered data caused by the Phase#Distortion, but I think The Darkness also uses it as some sort of filter.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("For what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm very certain The Darkness used the Phase Distortion to gather the Muffins.#X even eluded to that conclusion before we were sucked into this place.#I think this is where they throw the worlds that they know don't have a Muffin.#Or at least the ones they are able to.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate(global.mainCharacters[5] +string(" and the others in Abstracity said they have a shield that keeps#The Darkness out. Do you think that's what they mean?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Most likely.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It won't be long now till they purge the info they need from him#to bring those towers down.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Why do they want to take that place so bad?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Come on now, I've seen enough James Bond films to know not#to give away the plans.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Just stop talking, we're going to crack this here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Just try.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You've almost found something " +string(global.mainCharacters[0]) +string(". Keep going, once you get#close enough to a loose data sample, I can easily hack it."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("It's pointless, just give up.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Just shut it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15
  {
    global.gameProgress=122
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=122 and room=rDistortionW2_3 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=528
    {
      for(i=0;i<512;i+=64)
      {
        newBarrierL=instance_create(368,i,oEventBarrier)
        newBarrierR=instance_create(832,i,oEventBarrier)
      }
      enemyCount=16
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
    newEnemy=instance_create(416,384,oIEIcon) //1
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(800,384,oIEIcon) //2
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=180
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(448,352,oNoPicError) //3
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(512,352,oNoPicError) //4
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(672,352,oNoPicError) //5
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(736,352,oNoPicError) //6
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=300
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(336,336,oRoflcopter) //7
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(880,336,oRoflcopter) //8
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=300
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(400,384,oNoPicError) //9
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(400,448,oNoPicError) //10
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(816,384,oNoPicError) //11
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(816,448,oNoPicError) //12
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=330
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    newEnemy=instance_create(336,336,oRoflcopter) //13
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(880,336,oRoflcopter) //14
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(496,352,oIEIcon) //15
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(720,352,oIEIcon) //16
    newEnemy.bActive=true
    newEnemy.questType=6
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=11 and enemyCount=0
  {
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=123
  }
}
else if global.gameProgress=126 and room=rDistortionW2_6 //Boss Fight (Demon Cursor)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=384
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
    if oPlayer1.y<352
      //oPlayer1.y+=4
      oPlayer1.y+=4*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I really hate that cursor.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Ignore it, from here I can extract data from their system.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I will not allow you to do that.#You will stop here and now.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Hardly, I've already hacked the system and locked out most of your functions.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You cannot contain The Darkness that easily.#I will show you.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      rightArm=instance_create(boss.x+36,boss.y-48,oMisc)
      rightArm.type=0
      rightArm.sprite_index=sShroudLArm
      rightArm.image_speed=0.1
      rightArm.image_alpha=0
      leftArm=instance_create(boss.x-36,boss.y-48,oMisc)
      leftArm.type=0
      leftArm.sprite_index=sShroudLArm
      leftArm.image_xscale=-1
      leftArm.image_speed=0.1
      leftArm.image_alpha=0
    }
    //else if sceneDelay>=31 and sceneDelay<=50
    else if sceneDelay>30 and sceneDelay<=50 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //rightArm.image_alpha+=0.01
      rightArm.image_alpha+=0.01*gDeltaTime //60fps change: per 30fps tick
      //leftArm.image_alpha+=0.01
      leftArm.image_alpha+=0.01*gDeltaTime //60fps change: per 30fps tick
    }
    else if sceneDelay>=71 and sceneDelay<=90
      //effect_create_above(ef_smoke,boss.x+random(10),boss.y+random(10),0,c_black)
      if gDeltaDoTicks effect_create_above(ef_smoke,boss.x+random(10),boss.y+random(10),0,c_black) //60fps change: once per 30fps tick
    //else if sceneDelay=91
    else if scrCountPass(sceneDelay,91) //60fps change: once, when the count reaches it
      drawWRec=true
    //else if sceneDelay>=92
    else if sceneDelay>91 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //recSpread+=7
      recSpread+=7*gDeltaTime //60fps change: per 30fps tick
      if recSpread>=384
      {
        //recAlpha-=0.02
        recAlpha-=0.02*gDeltaTime //60fps change: per 30fps tick
        boss.sprite_index=sDemonCursorDefault
        if recAlpha<=0
        {
          drawWRec=false
          sceneDelay=0
          sceneProgress+=1
        }
      }
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Behold!#The Darkness can manifest and corrupt anything.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I'm not scared of a Demonic Windows Cursor.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("You will be.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Secondary objective reconfigured: The anomally will be purged!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I feel so loved. I'm number two on its list.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=25
    if scrCountPass(sceneDelay,25) //60fps change: once, when the count reaches it
    {
      oEvDistortionWindows2.bossBackShow=true
      background_index[1]=backDCursorFight
      background_visible[1]=true
      background_x[1]=160
      background_vtiled[1]=false
      background_htiled[1]=false
    }
    //else if sceneDelay=50
    else if scrCountPass(sceneDelay,50) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Okay, who threw on the lame anime wallpaper?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Sorry, I messed up somewhere.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("NO, no you didn't!#I know you too well, you're laughing right now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Okay you caught me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Take it off! I can't fight with that there!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I don't think The Darkness cares.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("You suck.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      with oMisc
        instance_destroy()
      newBarrier=instance_create(144,288,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=127
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Demon Cursor"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=127 //boss fight ends (Demon Cursor)
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
      background_visible[1]=false
      oEvDistortionWindows2.bossBackShow=false
      oExit.visible=true
      oHealingPost.visible=true
      oSaveDoor.visible=true
      endBoss()
      oPlayer1.x=432
      oPlayer1.y=353
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
    msgCreate("Ugh, why won't you stop? Don't you know you can't win!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I've never lost anything.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("What about that argument with your ex?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("THAT doesn't count!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("What happened to her?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I'd SO rather not talk about it.#Not to mention this isn't the best time to talk about#my failure of a love life.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Well good news, I've cracked their system...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("What did you find?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("First, I'm going to get you out of here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("We need to find X before we leave.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Heh, that will do you no good.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("What do you mean?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I told you, I have control here. We've taken him.#We would have you too if it weren't for your friend.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I'm cutting him out.#Okay, for a moment I can speak to you without him knowing#what is being said.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Do you know where X is?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Yes, I've scanned for his location and he is nearby.#I've got the location marked on the map.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("We're going to save him.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("If we are to get into the Black Rock Fortress we have to.#X has the Seal Decoder on him.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Okay, how do I get out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("I'm placing down a portal for you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Glad to be leaving this place.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("There's something else I've found...#The IEF building, it's here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Really, even that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("The Darkness' reach on our world is expanding.#We need to hurry.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=29
  {
    exitPortal=instance_create(608,320,oDungeonPortal)
    exitPortal.toRoom=rWorldMap
    exitPortal.newMapX=16
    exitPortal.newMapY=128
    global.gameProgress=128
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rDistortionW2_2 and global.gamePaused=false //sliding window
{
  //force windowed mode
  if window_get_fullscreen()
  {
    window_set_fullscreen(false)
    window_center()
  }
  //move the window
  if oPlayer1.xVel>0
  {
    //windowX+=1
    windowX+=gDeltaTime //60fps change: counts 30fps ticks
    window_set_position(windowX,windowY)
  }
  else if oPlayer1.xVel<0
  {
    //windowX-=1
    windowX-=gDeltaTime //60fps change: counts 30fps ticks
    window_set_position(windowX,windowY)
  }
  else
  {
    windowX=window_get_x()
    windowY=window_get_y()
    window_set_position(windowX,windowY)
  }
  //rotate the view - based on window position
  view_angle[0]=0+(windowXcenter-windowX)/5
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room!=rDistortionW2_6
{
  draw_background(backWindowsTaskbar,view_xview[0],view_yview[0]+352)
  draw_set_font(fnt_MSWorld)
  draw_set_halign(fa_right)
  draw_set_color(c_black)
  draw_set_alpha(1)
  if current_minute<10
    cMinuteSpace="0"
  else
    cMinuteSpace=""
  if current_hour>12
  {
    cHour=current_hour-12
    dt="PM"
  }
  else
  {
    cHour=current_hour
    dt="AM"
  }
  draw_text(view_xview[0]+502,view_yview[0]+360,string(cHour) +string(":") +string(cMinuteSpace) +string(current_minute) +string(" ") +string(dt))
}

if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
if room=rDistortionW2_6
{
  if drawWRec=true
  {
    draw_set_color(c_white)
    draw_set_alpha(recAlpha)
    draw_rectangle(view_xview[0],oDemonCursor.y-recSpread,view_xview[0]+view_wview[0],oDemonCursor.y+recSpread,false)
  }
}
if global.gameProgress=122 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}

if room=rDistortionW2_2
{
  if collision_rectangle(1152,128,1184,160,oPlayer1,true,true) and text_Pos=-1
  {
    textCollision=instance_create(1248,256,oScaledCollision)
    text_Pos=0
  }
  if text_Pos>=0
  {
    draw_set_halign(fa_left)
    if text_Pos<string_length(text_Full)
    {
      draw_text(1248,256,text_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      text_Pos+=1
      text_New+=string_char_at(text_Full,text_Pos)
      } //60fps change (added)
      textCollision.image_xscale=string_width(text_New)
      textCollision.image_yscale=string_height(text_New)
    }
    else
      draw_text(1248,256,text_Full)
  }

  if collision_rectangle(656,784,688,816,oPlayer1,true,true) and text2_Pos=-1
  {
    text2Collision=instance_create(160,768,oScaledCollision)
    text2_Pos=0
  }
  if text2_Pos>=0
  {
    draw_set_halign(fa_left)
    if text2_Pos<string_length(text2_Full)
    {
      draw_text(160,768,text2_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      text2_Pos+=1
      text2_New+=string_char_at(text2_Full,text2_Pos)
      } //60fps change (added)
      text2Collision.image_xscale=string_width(text2_New)
      text2Collision.image_yscale=string_height(text_New)
    }
    else
      draw_text(160,768,text2_Full)
  }

  if collision_rectangle(16,1072,48,1104,oPlayer1,true,true) and text3_Pos=-1
  {
    text3Collision=instance_create(208,1104,oScaledCollision)
    text3_Pos=0
  }
  if text3_Pos>=0
  {
    draw_set_halign(fa_left)
    if text3_Pos<string_length(text3_Full)
    {
      draw_text(208,1104,text3_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      text3_Pos+=1
      text3_New+=string_char_at(text3_Full,text3_Pos)
      } //60fps change (added)
      text3Collision.image_xscale=string_width(text3_New)
      text3Collision.image_yscale=string_height(text_New)
    }
    else
      draw_text(208,1104,text3_Full)
  }
}
else if room=rDistortionW2_3
{
  if collision_rectangle(1600,336,1632,368,oPlayer1,true,true) and text_Pos=-1
  {
    textCollision=instance_create(1568,480,oScaledCollision)
    text_Pos=0
  }
  if text_Pos>=0
  {
    draw_set_halign(fa_left)
    if text_Pos<string_length(text_Full)
    {
      draw_text(1568,480,text_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      text_Pos+=1
      text_New+=string_char_at(text_Full,text_Pos)
      } //60fps change (added)
      textCollision.image_xscale=string_width(text_New)
      textCollision.image_yscale=string_height(text_New)
    }
    else
      draw_text(1568,480,text_Full)
  }
  if global.gameProgress=122 //fake error
  {
    if fakeErrorProg=0 and oPlayer1.x>=288
    {
      global.gamePaused=true
      snd_WindowsCriticalError=sound_add("Sound\DT_WindowsCriticalError.wav",0,true)
      sound_play(snd_WindowsCriticalError)
      window_set_fullscreen(true)
      sleep(50)
      window_set_fullscreen(false)
      window_center()
      fakeErrorProg=1
    }
    else if fakeErrorProg=1
    {
      draw_background(backErrorReport,view_xview[0]+64,view_yview[0]+64)
      if mouse_check_button_pressed(mb_left)
        fakeErrorProg=2
    }
    else if fakeErrorProg=2
    {
      sound_delete(snd_WindowsCriticalError)
      global.gamePaused=false
      fakeErrorProg=3
    }
  }
}
