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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=109 //intro to The Hideout
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Okay, all I need to do is find this guy and convince him to break the seal on the...#I just can't say that place's name without laughing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I agree, they have low standards, but yes, just find this guy.#I would like to recommend being careful here.#I'm not detecting that many bottomless pits, but I'm seeing quite a disturbance here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("This 'The Darkness' thing has disrupted everything hasn't it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm thinking Phase Distortion got everything.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    global.gameProgress=110
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="The Hideout"
    global.gamePaused=false
  }
}
else if global.gameProgress=110 and room=rTheHideout4 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.y>=1472
    {
      global.teleportEnabled=1
      newBarrierB1=instance_create(336,1807,oEventBarrier)
      newBarrierB1.image_angle=90
      newBarrierB1.image_yscale=1.5
      var xPos;
      xPos=32
      for(i=0;i<5;i+=1)
      {
        newBarrierT[i]=instance_create(xPos,1408,oEventBarrier)
        newBarrierT[i].image_angle=90
        newBarrierT[i].image_yscale=2
        xPos+=128
      }
      enemyCount=10
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    newEnemy=instance_create(128,1472,oPaletteSwapSentinel) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(624,1472,oPaletteSwapSentinel) //2
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(192,1680,oTreeTorch) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(576,1680,oTreeTorch) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=300
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(192,1584,oGunTurtle) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(576,1584,oGunTurtle) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(144,1632,oAeroScanner) //7
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(624,1632,oAeroScanner) //8
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(96,1792,oLaserTurtle) //9
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(672,1792,oLaserTurtle) //10
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    instance_activate_object(oPlatformScale)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=111
  }
}
else if global.gameProgress=111 and room=rTheHideout8 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=2528 and oPlayer1.y>=96
    {
      global.teleportEnabled=1
      newBarrierL1=instance_create(2400,224,oEventBarrier)
      newBarrierR1=instance_create(2752,224,oEventBarrier)
      enemyCount=8
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    newEnemy=instance_create(2448,288,oTreeTorch) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2720,288,oTreeTorch) //2
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(2448,288,oGunTurtle) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2720,288,oGunTurtle) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2592,288,oLaserTurtle) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay>=300
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(2464,208,oAeroScanner) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2688,208,oAeroScanner) //7
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2592,80,oPaletteSwapSentinel) //8
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=112
  }
}
else if global.gameProgress=113 and room=rTheHideout9 //Boss Fight (Metallicardian)
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
    if oPlayer1.y<336
      oPlayer1.y+=4
    else
    {
      sceneDelay+=1
      if sceneDelay=1
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=15
    {
      boss=instance_create(576,272,oMetallicardian)
      boss.image_xscale=-1
      effect_create_above(ef_ring,boss.x,boss.y-(boss.sprite_height/2),2,c_green)
    }
    else if sceneDelay>=40
    {
      global.currentBoss="Metallicardian"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Careful, I'm getting some crazy offensive output data for this thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Keep my senses sharp and yada yada, heard it all a million times.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Ha! Well do your thing, I'll have the scanner ready if you need it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrierL1=instance_create(208,272,oBossBarrier)
      newBarrierR1=instance_create(672,272,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=114
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=114 //boss fight ends (Metallicardian)
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
      bossFinishFadeAlpha+=0.05
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      with oMarioLava
        instance_destroy()
      oPlayer1.x=448
      oPlayer1.y=336
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
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Hopefully this guy is just through this path.#I'm anxious to see who it is.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I'm a bit anxious as well.#Hurry up and get to the next room.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Hold on, I think I need to go save first.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I hate you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9
  {
    global.gameProgress=115
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=117 //talk to Megaman X (first time)
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      fadeColor=c_black
    }
    if sceneDelay>=3
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.04
    else
    {
      stopPlayer()
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_xscale=1
      oPlayer1.x=336
      oPlayer1.y=320
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.04
      else
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I know I shouldn't be all THAT surprised, but still, look who it is!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I assume you have a good reason for coming here, so let's hear it.",1,oMessageCutscene,"X")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I heard you know how to break the seal on the Black Rock Fortress.#I need to get in there and I need your help to do so.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You heard right, I do know how to decode the seal, but you know that going into#that place is pointless don't you? Many have tried and failed.",1,oMessageCutscene,"X")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Sounds like they are doing it wrong then.#And I'm not asking you to come with, I just need you to get me in.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Why do you want into that place so much?#What could possibly be in there for you?",1,oMessageCutscene,"X")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("A friend was taken there and I'm going to bust him out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("We all have friends held captive in there.#We want them all back, but getting by The Darkness in such a#place is simply impossible. Even the famous 'Brothers' have been taken.",1,oMessageCutscene,"X")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("And if you do nothing, things will get worse.#This hideout you have here won't protect you for long.#I made it past all your traps and guards.#It's only a matter of time before The Darkness does the same.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,"X")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("X, if you don't help us, The Darkness will only spread more.#All we're asking is that you remove that seal.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("What happened to all of you?#I thought you would all go up against anything, regardless of the odds.#Fearless bravery and all that garbage.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15
  {
    sceneDelay+=1
    if sceneDelay=30
      oMegamanX.sprite_index=sMegamanXCloseEyes
    else if sceneDelay=85
      oMegamanX.sprite_index=sMegamanXIdle
    else if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("You know... you're right.#The Darkness has made us all fearful.#... Fine, I will help you, but I have a request.",1,oMessageCutscene,"X")
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Sure, what do you need?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("When you are in there, will you save everyone that you can?",1,oMessageCutscene,"X")
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Of course, I'll do what I can.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Thank you, give me a moment to get the Seal Decoder ready for you.",1,oMessageCutscene,"X")
  else if sceneProgress=21
  {
    sceneDelay+=1
    if sceneDelay>=10
      draw_set_blend_mode(bm_subtract)
    if sceneDelay=10
    {
      shakeScreen=instance_create(oPlayer1.x,oPlayer1.y,oCutsceneShake)
      shakeScreen.shakePower=8
      view_object[0]=oCutsceneShake
      //draw_set_blend_mode(bm_subtract)
      oMegamanX.sprite_index=sMegamanXKneel
      oPlayer1.sprite_index=sPlayerKneel
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay>=30 and sceneDelay<=51
      shakeScreen.shakePower-=0.25
    else if sceneDelay>=60
    {
      view_object[0]=oPlayer1
      with shakeScreen
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Damn, did they follow you?",1,oMessageCutscene,"X")
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("I don't think so.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=24
  {
    sceneDelay+=1
    if sceneDelay=30
      oMegamanX.textScan="Muffin#Detected"
    else if sceneDelay=65
      oMegamanX.sprite_index=sMegamanXIdle
    else if sceneDelay>=70
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Wait, you have the Muffins with you?",1,oMessageCutscene,"X")
  else if sceneProgress=26
  {
    sceneDelay+=1
    if sceneDelay>=20
    {
      fadeColor=c_white
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Yes, I am trying to get them before The Darkness does.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("So they did follow you!#Idiot, why do you think The Darkness used the Phase Distortion in the first place?",1,oMessageCutscene,"X")
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("More importantly, what's happening?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("We're being sucked into the Distortion itself.",1,oMessageCutscene,"X")
  else if sceneProgress=31
  {
    pX=oPlayer1.x-13+random(26)
    pY=oPlayer1.y-52+random(52)
    effect_create_above(ef_smoke,pX,pY,1,c_black)
    pX=oMegamanX.x-12+random(24)
    pY=oMegamanX.y-34+random(34)
    effect_create_above(ef_smoke,pX,pY,1,c_black)
    sceneDelay+=1
    if sceneDelay>=20
      if bossFinishFadeAlpha<1
        bossFinishFadeAlpha+=0.05
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=32
  {
    stopAllMusic()
    global.gameProgress=118
    writeToPlayerGlobals()
    room_goto(rDistortionW2_1)
  }
}

if room=rTheHideout2 and global.switchTrigger[11]=true
{
  if !variable_local_exists("varTempUse")
  {
    instance_activate_object(oUseElevator)
    instance_activate_object(oObjTeleCon)
    varTempUse=1
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
if global.gameProgress=110 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if global.gameProgress=111 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}

if room=rTheHideout9 and global.currentBoss="Metallicardian" and instance_exists(oMarioLava)
{
  draw_set_alpha(0.2)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(224,32,672,336,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
