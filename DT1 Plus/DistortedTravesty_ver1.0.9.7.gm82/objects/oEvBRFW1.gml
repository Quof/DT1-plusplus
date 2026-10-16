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

if room=rBRF_Entrance and (global.gameProgress>=152 and global.gameProgress<=153)
{
  npcX=instance_create(2032,280,oMisc)
  npcX.sprite_index=sMegamanXIdle
  npcX.type=1
}
if room=rBRFort5
{
  bCheck=0
  standPlatform=instance_create(928,368,oPlatformTouch)
  standPlatform.sprite_index=sMovingPlatform2
  standPlatform.moveSpeedX=0
  standPlatform.moveSpeedY=-0.6
  standPlatform.spriteChange=7
  standPlatform.xSize=50
  standPlatform.drawRangeX=room_width
}
if global.gameProgress=168 and room=rBRFort9
{
  bDrawBossImage=false
  bossYdraw=0
  drawColor=0
  wobble=0
}
if room=rBRFort14
{
  //****************************** PLATFORM 1 ******************************
  movePlatform=instance_create(0,2048,oMovingPlatform)
  movePlatform.sprite_index=sMovingPlatform2
  movePlatform.xDir=-1
  movePlatform.yDir=0
  movePlatform.shiftChange=128
  movePlatform.spriteChange=5
  movePlatform.image_xscale=3
  movePlatform.image_yscale=16
  movePlatform.newRangeX=1024
  movePlatform.newRangeY=544
  var spikeY;
  spikeY=0
  for(i=0;i<16;i+=1)
  {
    followSpike=instance_create(0,0,oMarioSpikeL)
    followSpike.idFollow=movePlatform
    followSpike.xFollow=192
    followSpike.yFollow=spikeY+16
    spikeY+=16
  }
  //****************************** PLATFORM 2 ******************************
  movePlatform=instance_create(448,1536,oMovingPlatform)
  movePlatform.sprite_index=sMovingPlatform2
  movePlatform.xDir=-1
  movePlatform.yDir=0
  movePlatform.shiftChange=192
  movePlatform.spriteChange=5
  movePlatform.image_xscale=4
  movePlatform.image_yscale=32
  movePlatform.newRangeX=1024
  movePlatform.newRangeY=768
  var spikeY;
  spikeY=0
  for(i=0;i<32;i+=1)
  {
    followSpike=instance_create(0,0,oMarioSpikeR)
    followSpike.idFollow=movePlatform
    followSpike.xFollow=0
    followSpike.yFollow=spikeY
    spikeY+=16
  }
  //****************************** PLATFORM 3 ******************************
  movePlatform=instance_create(0,1536,oMovingPlatform)
  movePlatform.sprite_index=sMovingPlatform2
  movePlatform.xDir=-1
  movePlatform.yDir=0
  movePlatform.shiftChange=192
  movePlatform.spriteChange=5
  movePlatform.image_xscale=4
  movePlatform.image_yscale=32
  movePlatform.newRangeX=1024
  movePlatform.newRangeY=768
  var spikeY;
  spikeY=0
  for(i=0;i<32;i+=1)
  {
    followSpike=instance_create(0,0,oMarioSpikeL)
    followSpike.idFollow=movePlatform
    followSpike.xFollow=256
    followSpike.yFollow=spikeY+16
    spikeY+=16
  }
  //****************************** PLATFORM 4 ******************************
  movePlatform=instance_create(-16,512,oMovingPlatform)
  movePlatform.sprite_index=sMovingPlatform2
  movePlatform.xDir=-1.5
  movePlatform.yDir=0
  movePlatform.shiftChange=126 //144
  movePlatform.spriteChange=5
  movePlatform.image_xscale=4
  movePlatform.image_yscale=48
  movePlatform.newRangeX=1024
  movePlatform.newRangeY=1024
  var spikeY;
  spikeY=0
  for(i=0;i<48;i+=1)
  {
    followSpike=instance_create(0,0,oMarioSpikeL)
    followSpike.idFollow=movePlatform
    followSpike.xFollow=256
    followSpike.yFollow=spikeY+16
    spikeY+=16
  }
  //****************************** PLATFORM 5 ******************************
  movePlatform=instance_create(464,512,oMovingPlatform)
  movePlatform.sprite_index=sMovingPlatform2
  movePlatform.xDir=-1.5
  movePlatform.yDir=0
  movePlatform.shiftChange=126
  movePlatform.spriteChange=5
  movePlatform.image_xscale=4
  movePlatform.image_yscale=48
  movePlatform.newRangeX=1024
  movePlatform.newRangeY=1024
  var spikeY;
  spikeY=0
  for(i=0;i<48;i+=1)
  {
    followSpike=instance_create(0,0,oMarioSpikeR)
    followSpike.idFollow=movePlatform
    followSpike.xFollow=0
    followSpike.yFollow=spikeY
    spikeY+=16
  }
}

if (room=rBRFort17 and global.gameProgress<=181) or room=rBR_Necrobane
{
  npcInformant=instance_create(320,304,oMisc)
  npcInformant.sprite_index=sInformantIdle
  npcInformant.image_speed=0
  npcInformant.image_xscale=-1
  npcInformant.type=1

  npcSyrus=instance_create(400,257,oMisc)
  npcSyrus.sprite_index=sSyrusHangRestrain
  npcSyrus.image_xscale=-1
  npcSyrus.type=1

  bossImage=0
  imageScaleX=-1
  imageScaleY=1
  imageBlend=c_black
  imageAlpha=0.4
}

if global.gameProgress=182
{
  bossFinishFadeAlpha=1
  fadeColor=c_black
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=152 //intro to Black Rock Fortress
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("The Fortress is at the end of this path.#You ready for this?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It doesn't matter at this point, I have to do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3
  {
    global.gameProgress=153
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Black Rock Fortress"
    global.gamePaused=false
  }
}
else if global.gameProgress=153 //talk to X near Fortress
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1936
    {
      fadeColor=c_black
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
    if oPlayer1.y<280
      oPlayer1.y+=4
    else
    {
      sceneDelay+=1
      if sceneDelay=1
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=45
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What are you doing out here X?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Just thinking about when this started.#We had all finally gotten everything together,#and things had ended so well.#I figured my days were over.",1,oMessageCutscene,"X")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Not likely, they won't quit remaking your older adventures.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Don't remind me, I just want to be laid to rest.#I wanted to stop after the 5th installment...#I was actually good back then.",1,oMessageCutscene,"X")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Does it bother you that you don't technically exist?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay=45
      npcX.image_xscale=-1
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That is the strangest question I have ever been asked.",1,oMessageCutscene,"X")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It probably should, but honestly it does not.#Questioning whether I truly exist is pointless now, don't you think?#You shouldn't be able to exist in this world, but here you are.",1,oMessageCutscene,"X")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I suppose so.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You should get going, your friend can't escape on his own.#While you are in there, I will scout for more Muffins.#They seem to be the key to this whole thing.",1,oMessageCutscene,"X")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("And I will save your friends too.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Thank you and be careful.#Don't trust your eyes, you never know what The Darkness has replicated in there.#Let Jeremy be your eyes.",1,oMessageCutscene,"X")
  else if sceneProgress=14
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha<1
        bossFinishFadeAlpha+=0.05
      else if bossFinishFadeAlpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=15
  {
    global.gameProgress=154
    writeToPlayerGlobals()
    transition_steps=30
    transition_kind=21
    room_goto(rBFortressIntro)
  }
}
else if room=rBRFort5 and global.gameProgress=160 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=416
    {
      global.teleportEnabled=1
      newBarrierL1=instance_create(144,48,oEventBarrier)
      newBarrierL1.image_yscale=1.25
      newBarrierL2=instance_create(144,128,oEventBarrier)
      newBarrierL3=instance_create(144,192,oEventBarrier)
      newBarrierL3.image_yscale=1.25
      newBarrierR1=instance_create(672,48,oEventBarrier)
      newBarrierR1.image_yscale=1.25
      newBarrierR2=instance_create(672,128,oEventBarrier)
      newBarrierR3=instance_create(672,192,oEventBarrier)
      newBarrierR3.image_yscale=1.25
      enemyCount=14
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
    var xSpawn;
    xSpawn=272
    for(i=0;i<4;i+=1)
    {
      newEnemy=instance_create(xSpawn,160,oNyarlathotep) //4
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      xSpawn+=96
    }
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=240
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    var xSpawn;
    xSpawn=224
    for(i=0;i<4;i+=1)
    {
      newEnemy=instance_create(xSpawn,112,oGorades) //8
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      xSpawn+=128
    }
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
    newEnemy=instance_create(96,240,oThunderDragon) //9
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(736,240,oThunderDragon) //10
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay>=240
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(208,224,oSagym) //11
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(624,224,oSagym) //12
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=270
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    newEnemy=instance_create(224,224,oBergrift) //13
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(608,224,oBergrift) //14
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=11 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=161
  }
}
else if global.gameProgress=162 and room=rBRFort6 //game characters?
{
  if sceneProgress=0
  {
    if oPlayer1.x>=544
    {
      fadeColor=c_black
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
      else if sceneDelay>=20
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What the hell is this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("The trapped heros.#Their data is being collected.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Are these the real ones?#I'd like to know so that I don't have to worry about#them breaking out and being hostile.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("They are the real thing.#Every one of them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Can I break them out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Unfortunately not through conventional methods.#I'm afraid that busting them out could have negative impacts#on them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("What do we do then?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Continue on, I'll try to find a safe way to break them out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Think about the kind of revolution we could start if we could free all of them.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Yeah. I have a feeling we're going to need this kind of firepower#to take on The Darkness.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12
  {
    global.gameProgress=163
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=163 and room=rBRFort6 //enemy trap event - Shroud(2)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=640
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(272,272,oEventBarrier)
      newBarrierR=instance_create(960,272,oEventBarrier)
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    newEnemy=instance_create(896,320,oShroud)
    newEnemy.bActive=true
    newEnemy.spawnCount=1
    newEnemy.xSdist=-528
    newEnemy.ySdist=0
    newEnemy.dtXpointSelf=416
    newEnemy.dtYpointSelf=192
    newEnemy.dtXpointOther=832
    newEnemy.dtYpointOther=192
    newEnemy.dtTele=true
    bossFinishFadeAlpha=1
    sceneProgress+=1
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=3 and instance_number(oShroud)=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with newBarrierL
      instance_destroy()
    with newBarrierR
      instance_destroy()
    with oEProjectileBase
      instance_destroy()
    sceneProgress+=1
  }
  if sceneProgress=4
  {
    fadeColor=c_black
    global.gamePaused=true
    stopPlayer()
    xVel=0
    yVel=0
    oPlayer1.sprite_index=sPlayerJump
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    if oPlayer1.y<336
      oPlayer1.y+=4
    else
    {
      sceneDelay+=1
      if sceneDelay=1
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=20
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What was that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("The Shrouds...#From the data collected, I see that they are scouts.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Which means?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("They are always in groups, mostly pairs.#They are constantly on the look out for a specific target.#In this case, you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Yay.#There was sarcasm in that, but you can't tell through text.#I don't ever want want to see another one of those again.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I'll lie and say you won't.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Awesome.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13
  {
    global.gamePaused=false
    sceneProgress=0
    global.gameProgress=164
  }
}
if global.gameProgress=164 and room=rBRFort6 //new techs
{
  if sceneProgress=0 and !instance_exists(oNewTechPickup)
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
      with oEventBarrier
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("You should try it out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What did you think I was going to do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You should make a mental note that the Grand Slam skill works#like your jump attack. If you get enough time with it,#you become invincible for the rest of its duration.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("That could be useful.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.gameProgress=165
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=168 and room=rBRFort9 //Boss Fight (Neo Guardian)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=448
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
      oPlayer1.y+=4
    else
    {
      sceneDelay+=1
      if sceneDelay=1
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=20
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      boss=instance_create(576,320,oNeoGuardian)
      boss.visible=false
    }
    else if sceneDelay=9
      bDrawBossImage=true
    else if sceneDelay>=10
    {
      if wobble=0
        wobble=3
      else
        wobble=0
      if bossYdraw<140
        bossYdraw+=1
      else
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if drawColor<255
        drawColor+=3
      else
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Further access is prohibited.#Commence destruction of entity code named: '" +string(global.mainCharacters[0]) +string("'."),1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You got my name right! I'm impressed.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Analyzing target...#Optimal attack sequence chosen.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Lets do this then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      bDrawBossImage=false
      boss.visible=true
      newBarrierL1=instance_create(272,256,oBossBarrier)
      newBarrierR1=instance_create(640,256,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=169
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Neo Guardian"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=169 //boss fight ends (Neo Guardian)
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
      with oMRustySpike
        instance_destroy()
      with oPlatformFollower
        instance_destroy()
      oPlayer1.x=464
      oPlayer1.y=320
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
  if global.difficulty<=2
  {
    if sceneProgress=5 and bWaitForInput=false
      msgCreate("That wasn't so bad.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=6 and bWaitForInput=false
      msgCreate("Try it on a harder setting and see if you say the same thing.",1,oMessageCutscene,global.mainCharacters[1])
  }
  else
  {
    if sceneProgress=5 and bWaitForInput=false
      msgCreate("Okay, that was a bit worse than I thought it would be.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=6 and bWaitForInput=false
      msgCreate("Yeah it kinda was. You probably wouldn't say that if you had fought#it on an easier setting.",1,oMessageCutscene,global.mainCharacters[1])
  }
  if sceneProgress=7
  {
    global.gameProgress=170
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rBRFort11 and global.gameProgress=172 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=576
    {
      global.teleportEnabled=1
      var yBarrier;
      yBarrier=64
      for(i=0;i<5;i+=1)
      {
        newBarrierL=instance_create(336,yBarrier,oEventBarrier)
        newBarrierR=instance_create(800,yBarrier,oEventBarrier)
        yBarrier+=64
      }
      enemyCount=16
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
    newEnemy=instance_create(416,192,oGorades) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(736,192,oGorades) //2
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
    newEnemy=instance_create(416,320,oBergrift) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(736,320,oBergrift) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(352,160,oThunderDragon) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(800,160,oThunderDragon) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(528,120,oNyarlathotep) //7
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(624,120,oNyarlathotep) //8
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=180
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    var yEspawn;
    yEspawn=304
    for(i=0;i<3;i+=1) //14
    {
      newEnemy=instance_create(560,yEspawn,oNyarlathotep)
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(592,yEspawn,oNyarlathotep)
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      yEspawn+=32
    }
    newEnemy=instance_create(352,160,oThunderDragon) //15
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(800,256,oThunderDragon) //16
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=11 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=173
  }
}
if global.gameProgress=177 //Almost there
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("They are in the next room.#Prepare yourself for the worst.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Preparing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You got that from me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Got me there.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I'm detecting a Muffin too.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Figured they would have one here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    global.gameProgress=178
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=179 and room=rBRFort17 //Boss Fight (Necrobane)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=208
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
    if oPlayer1.y<304
      oPlayer1.y+=4
    else
    {
      sceneDelay+=1
      if sceneDelay=1
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=20
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You've arrived just as expected.#You brought the Muffins straight to The Darkness.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I'm actually here to kick some ass, free our friend,#and take your Muffin while I'm at it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Do you even know why you are gathering the Muffins?#Or even how to use them?",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Eh...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Pathetic, you cannot save this place.#You might as well become part of it now.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Gene, you should be with us! Stop this!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Gene?... Of course!#I knew you were familiar!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I no longer go by that name " +string(global.mainCharacters[1]) +string(".#Yes, I know all about you two."),1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("You would seriously ally yourself with this program over us?#I don't understand.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You can't, none of you can.#Once you become part of the system, you will see things my way.#It is only a matter of time before The Darkness has full control.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("What do you mean?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("The creator of The Darkness put a restraint over its entire system.#He must have done it before he was pulled through.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("What would happen if this 'restraint' was lifted?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("It would be able to fully control this world.#Nothing would be out of its grasp.#It would easily be able to integrate our entire world into its system.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("And you want to help it do this? You're crazy you know that?#Give me the Muffin and let our friend go or I'll use force.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Even if you could manage to stop me here, " +string(global.mainCharacters[3]) +string(" is still out there.#Once he is freed from Distortion, finding this Creator#will be simple and the lock will be removed."),1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Who is this " +string(global.mainCharacters[3]) +string(" guy?"),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I do not know, he is not from our world,#but he seems to have a full understanding of The Darkness.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("This is annoying, just let our friend go!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("What was that game series you didn't like that much " +string(global.mainCharacters[0]) +string("?#Wasn't it Castlevania?"),1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Err what? I mainly don't like Castlevania 2.#But yeah, I was never fond of the series in general.#Not to mention I wasn't very good at it... Why?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("The Darkness allows me to use practically any data it has.#One I will show you now.#You will wish you had become part of it!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Blah blah BLAH!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      shakeScreen=instance_create(256,oPlayer1.y,oCutsceneShake)
      shakeScreen.shakePower=8
      view_object[0]=oCutsceneShake
      bossFinishFadeAlpha=1
      npcInformant.sprite_index=sInformantEye
      npcInformant.image_index=6
      bossImage=1
    }
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("I will show you what The Darkness has given me!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("You do not deserve to become part of it!#I will remove your very existence from this world!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=28
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossImage=0
      imageScaleX=0
      imageScaleY=0
      view_object[0]=noone
      with oCutsceneShake
        instance_destroy()
      npcInformant.image_blend=c_black
      bossFinishFadeAlpha=1
    }
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=29
  {
    sceneDelay+=1
    if sceneDelay=29
    {
      imageAlpha=1
      bossImage=1
    }
    else if sceneDelay>=30
    {
      npcInformant.y-=0.5
      if imageScaleX>-1
        imageScaleX-=0.005
      if imageScaleY<1
        imageScaleY+=0.005

      if sceneDelay<80
      {
        npcInformant.image_xscale+=0.005
        npcInformant.image_yscale-=0.01
      }
      if sceneDelay>=80
      {
        if bossFinishFadeAlpha<0.1
          bossFinishFadeAlpha+=0.004
      }
    }
    if imageScaleY=1
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=30
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=31
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      imageBlend=c_white
    }
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=32
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("It is time you face what I am truly capable of!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=34
  {
    sceneDelay+=1
    if sceneDelay=15
    {
      with oBackgroundFollow
        instance_destroy()

      background_visible[0]=true
      background_index[0]=backBRFBossClouds
      background_xscale[0]=2
      background_yscale[0]=1.5
      background_hspeed[0]=-1

      boss=instance_create(928,176,oNecrobane)
      boss.image_xscale=-1
      view_xview[0]=544
      oPlayer1.x=752
      oPlayer1.y=304
      bossFinishFadeAlpha=1
    }
    else if sceneDelay>=16
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.05
      if bossFinishFadeAlpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("PERISH ANOMALLY!!#Enjoy your last moments of existence!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("Well it has the lame taunts down to a tee.#Now we just need a bit more monologging and we're set for cheesiness.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=180
      sceneProgress=1
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Necrobane"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=180 or room=rBR_Necrobane //boss fight ends (Necrobane)
{
  if sceneProgress=0
  {
    with oBackgroundFollow
      instance_destroy()

    background_visible[0]=true
    background_index[0]=backBRFBossClouds
    background_xscale[0]=2
    background_yscale[0]=1.5
    background_hspeed[0]=-1
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if oNecrobane.specialAttack=1000
    {
      backBossFire=instance_create(0,0,oBackgroundFollow)
      backBossFire.type=3
      backBossFire.backSet=backBRFBossFire
      backBossFire.wSize=512
      backBossFire.hSize=384
      backBossFire.bgAlpha=0.5
      backBossFire.blendType=0
      backBossFire.bScrollType=1
      backBossFire.xScrollSpeed=-2
      backBossFire.depth=5

      backRedWave=instance_create(0,0,oBackgroundFollow)
      backRedWave.type=3
      backRedWave.backSet=backBRFBossRedWave
      backRedWave.wSize=512
      backRedWave.hSize=384
      backRedWave.blendType=1
      backRedWave.bScrollType=2
      backRedWave.yScrollSpeed=-3
      backRedWave.depth=6

      bossFinishFadeAlpha=1
      fadeColor=c_red
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
    {
      fadeColor=c_white
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and enemyCount=0
  {
    global.gamePaused=true
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=4
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.05
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      view_xview[0]=0
      oPlayer1.x=256
      oPlayer1.y=304
      oPlayer1.image_xscale=1
      npcSyrus.sprite_index=sSyrusStand
      npcSyrus.x=320
      npcSyrus.y=304
      background_visible[0]=false
      background_index[0]=noone
      with backBossFire
        instance_destroy()
      with backRedWave
        instance_destroy()
      with npcInformant
        instance_destroy()
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("You may have stopped me, but this is merely the beginning.#You are both so naive to what is going on.#My existance from this place will perish, but The Darkness will#not so easily be stopped.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You okay?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I'll be fine...#I just can't believe you got all the way in here.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("We wouldn't leave you like that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Before the heart-filled reunion starts, it's Muffin time!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Awesome, it's been forever since we've come across one.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(256,192,oMagicalMuffin)
      muffin.muffinType=3
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay>=9 and sceneDelay<=109
      bossFinishFadeAlpha-=0.01
    else if sceneDelay>=120
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Not my favorite flavor, but whatever.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 //---------- Muffin Sequence ----------
    getMuffin(3)
  else if sceneProgress=19 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL COCONUT MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=20
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Well I don't want to be here for any longer.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Same here, let's go.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=23
  {
    sceneDelay+=1
    if sceneDelay=15
    {
      shakeScreen=instance_create(256,oPlayer1.y,oCutsceneShake)
      shakeScreen.shakePower=8
      view_object[0]=oCutsceneShake
    }
    else if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("What the...?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("This place is unstable!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Hold on, I'm going to try something.#I think I can get you guys out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("At a pace fast enough so we aren't crushed is preferable.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Okay, hold still.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("Well that wasn't dramatic at all.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Maybe I'm just that good.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.01
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=32
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  if sceneProgress=33
  {
    global.gameProgress=181
    global.currentBoss=""
    sceneProgress=0
    writeToPlayerGlobals()
    room_goto(rAbstracityAptTopRoom)
  }
}
if global.gameProgress=182 //talk with X in front of Black Rock
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      oPlayer1.x=1616
      oPlayer1.y=280
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.02
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What's up X?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("A few things must be brought up.#The first is, I have located a Muffin.#From what my scans tell me, it is to the west.#I do not know its exact location though.",1,oMessageCutscene,"X")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("That's not a problem, I can locate it once we are closer.#I'll begin scanning for a location now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("The Darkness inhabits the area heavily, be careful.",1,oMessageCutscene,"X")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I never am.#What else is going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("When you were in the Fortress, you came across some of my allies.",1,oMessageCutscene,"X")
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Yeah, but we couldn't break them out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("If you did not, then who did?#They are no longer in there.",1,oMessageCutscene,"X")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("What? ... Really?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Yes, I am uncertain of what's going on, but it gives me a very uneasy feeling.",1,oMessageCutscene,"X")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("They were all the real deal, I checked.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("I do not doubt it, but I cannot see any way that they could #have broken free without help.",1,oMessageCutscene,"X")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("What should we do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("At this point, there is not much that we can do.#I wanted to get everyone together.#We are nothing if we do not combine our efforts.",1,oMessageCutscene,"X")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("I have an idea.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Oh boy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Love your support.#Anyway, how about we look for them?#When we find them, tell them our plan.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("You will need proof that you are not working for The Darkness.#Take this device, it will let them know who you are#and that we are allied.",1,oMessageCutscene,"X")
  else if sceneProgress=20 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate("You obtained:#Identity Decoder",1,oMessageCutscene,"")
  }
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("It isn't finished yet.#I would like to upgrade it with a mechanism that will#identify if someone is not the original.",1,oMessageCutscene,"X")
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("That would be very helpful...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("I feel like we've missed something important.#Something that should be obvious.",1,oMessageCutscene,"X")
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Well as long as you guys keep me informed, I'll keep kicking ass properly.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("On that note, I found a location.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Any idea what's over there?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Not at all... yet.#We're just gonna have to play it by ear for now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("We've kinda been doing that anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("There is one other thing I must warn you of.",1,oMessageCutscene,"X")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("...?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("You came across a creature known as a Shroud.",1,oMessageCutscene,"X")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Yeah, they were a pain in the ass. What's going on with them?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("They are scouting for you now.#Be very careful, they will always be on the lookout for you anywhere#you go now.",1,oMessageCutscene,"X")
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("You're kidding right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("I'm afraid not. I know their tracking IDs though,#so I'll give you a heads up if they are around.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("Preferably before they see me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("Do I ever disappoint?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Only your girlfriend. ZING!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("It's only funny when that joke is pointed at you...#Mainly because it's true.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("You suck!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("Something I've been meaning to ask...#What are you wearing?",1,oMessageCutscene,"X")
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("Oh this?#I was cosplaying as an anime character before I was sucked into this world.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("Why didn't you take that off before going to the IEF building anyway?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("That dude said some of my favorite video games sucked.#I had no time to go home from the con to get changed.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("A wha... nevermind, I just looked it up.#In case you're wondering, built in wifi.",1,oMessageCutscene,"X")
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("Eh... so... we've strayed WAY off topic.#I'm gonna head off now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate("If anything comes up, I'll let " +string(global.mainCharacters[1]) +string(" know."),1,oMessageCutscene,"X")
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("Sounds good.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=49
  {
    global.gameProgress=183
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Black Rock Fortress"
    global.gamePaused=false
  }
}

if room=rBRFort5 //block item
{
  if bCheck=0
  {
    if standPlatform.y<=128 or oPlayer1.x>=2688
    {
      newBarrier=instance_create(2592,208,oEventBarrier)
      newBarrier=instance_create(2592,272,oEventBarrier)
      bCheck=1
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
if global.gameProgress=160 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if global.gameProgress=172 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Oh no Bad Guys:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}

if global.gameProgress=168 and room=rBRFort9
{
  if bDrawBossImage=true
  {
    draw_sprite_part_ext(sNeoGuardianBody,0,0,0,98,bossYdraw,625+wobble,180,-1,1,make_color_rgb(drawColor,drawColor,drawColor),1)
    if bossYdraw>100
      draw_sprite_ext(sNeoGuardianArm,0,568+wobble,211,-1,1,90,make_color_rgb(drawColor,drawColor,drawColor),1)
  }
}

if (room=rBRFort17 and global.gameProgress<180) or room=rBR_Necrobane
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_line_width(400,176,400,208,2)

  if bossImage=1
    draw_sprite_ext(sNecrobaneIdle,0,npcInformant.x-4,npcInformant.y-30,imageScaleX,imageScaleY,0,imageBlend,imageAlpha)
}
