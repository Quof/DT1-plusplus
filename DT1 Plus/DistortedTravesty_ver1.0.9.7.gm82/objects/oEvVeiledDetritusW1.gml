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

if room=rVeiledDetritus1 and global.gameProgress<=223
{
  circleAlpha=1
  circleSize=0

  npcLink=instance_create(720,320,oMisc)
  npcLink.sprite_index=sLinkSwordStand
  npcLink.image_speed=0
  npcLink.type=1

  npcSamus=instance_create(816,320,oMisc)
  npcSamus.sprite_index=sSamusStand
  npcSamus.image_speed=0
  npcSamus.image_xscale=-1.25
  npcSamus.image_yscale=1.25
  npcSamus.type=1
}
else if room=rVDlock5_2 and global.gameProgress=235
  xSpawn=304
else if room=rVDtheArtist
{
  depth=50
  artistBlend=0
  npcTheArtist=instance_create(352,352,oMisc)
  npcTheArtist.sprite_index=sTheArtistIdle
  npcTheArtist.image_xscale=-1
  npcTheArtist.image_blend=c_black
  npcTheArtist.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=222 //intro to Veiled Detritus
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
    msgCreate("Why did you land me here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("There's a Muffin here... and something else.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Care to share?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm very sure it's The Artist, he sure doesn't want anyone knowing#he's here though.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("How did you find that out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It's the same signal those Binary Indexes are giving off.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Well let's hope you're right, if anyone knows how to truly stop The Darkness,#it would be him.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I'm very sure he has the Muffin I'm picking up.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Maybe he can explain those too.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10
  {
    global.gameProgress=223
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Veiled Detritus"
    global.gamePaused=false
  }
}
else if global.gameProgress=223 //NPC Fight (Link? & Samus?)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=352
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
        playSound(global.snd_GameOver,0,1)
        bossFinishFadeAlpha=1
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      playSound(global.snd_CASdie,0,1)
      instance_create(0,0,oViewShaker)
      effect=instance_create(616,240,oEffect)
      effect.sprite_index=sRobotExplosion
      effect.image_xscale=1.5
      effect.image_yscale=1.5
    }
    else if sceneDelay=9
    {
      playSound(global.snd_CASdie,0,1)
      effect=instance_create(608,288,oEffect)
      effect.sprite_index=sRobotExplosion
      effect.image_xscale=1.4
      effect.image_yscale=1.4
    }
    else if sceneDelay=17
    {
      playSound(global.snd_BreakOut,0,1)
      instance_create(0,0,oViewShaker)
      effect=instance_create(640,256,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_xscale=1.5
      effect.image_yscale=1.5
    }
    else if sceneDelay=28
    {
      playSound(global.snd_CASdie,0,1)
      effect=instance_create(624,224,oEffect)
      effect.sprite_index=sBomberExplosion
      effect.image_xscale=2
      effect.image_yscale=2
    }
    else if sceneDelay=39
    {
      playSound(global.snd_Shock,0,1)
      effect=instance_create(640,288,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_xscale=2
      effect.image_yscale=2
    }
    else if sceneDelay=48
    {
      playSound(global.snd_Shock,0,1)
      instance_create(0,0,oViewShaker)
      effect=instance_create(640,304,oEffect)
      effect.sprite_index=sRobotExplosion
      effect.image_xscale=3
      effect.image_yscale=3
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    circleSize+=4
    if circleSize>=208
    {
      circleAlpha-=0.02
      if circleAlpha<=0
        sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Whoa, what the heck?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    oPlayer1.sprite_index=sPlayerWalk
    oPlayer1.image_speed=0.5
    oPlayer1.x+=7
    if oPlayer1.x>=560
    {
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_speed=0.1
      sceneProgress+=1
    }
  }
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay=30
    {
      x=oPlayer1.x
      view_object[0]=noone
    }
    else if sceneDelay>=31 and sceneDelay<=90
      view_xview[0]+=2
    else if sceneDelay=110
    {
      circleSize=0
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Which one is real?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I think Samus, but I can't tell for sure.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay>=11 and sceneDelay<=26
      circleSize+=0.5
    else if sceneDelay=69
      circleAlpha=0.5
    else if sceneDelay>=70
    {
      if circleAlpha<1
        circleAlpha+=0.01
      circleSize+=4
      if circleSize>=600
      {
        with oMisc
          visible=0
        view_object[0]=oPlayer1
        oPlayer1.sprite_index=sPlayerGuard
        sceneDelay=0
        sceneProgress+=1
      }
    }

    if sceneDelay<=68 and sceneDelay mod 2=0
    {
      if circleAlpha=1
        circleAlpha=0.75
      else
        circleAlpha=0.5
    }
  }
  else if sceneProgress=11
  {
    circleAlpha-=0.02
    if circleAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=20
      oPlayer1.sprite_index=sPlayerIdle
    else if sceneDelay=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("That was different.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I need to warn you that The Darkness is also here looking for the Muffin.#You may see more Shrouds than normal.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Good to know.#I'll be careful.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16
  {
    global.gameProgress=224
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=225 //map explaination
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
    msgCreate("One more thing I need to tell you before you venture into this place.#I have set up a map for you.#To access it, go into your menu and into the Muffin section.#For this place, I decided to over-write that and place the map there.#Don't forget about options like 'Remember Menu Position', it comes#in handy if you check maps a lot like me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Nifty, it should come in handy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It will, this place is huge.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4
  {
    global.gameProgress=226
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=232 //Veiled Detritus under temple
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
    msgCreate("Am I getting close to the signal you were talking about?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Yeah, just a few rooms and you should be there.#You are currently under the ruins. This is very well sealed off.#There also doesn't seem to be any sign of the Shrouds.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Yay!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=233
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rVDlock5_1 and global.gameProgress=233 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=4208
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(4096,80,oEventBarrier)
      newBarrierR=instance_create(4464,80,oEventBarrier)
      enemyCount=48
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
    sceneDelay+=1
    if sceneDelay mod 5=0
    {
      newEnemy=instance_create(4432,80,oZRatHead) //12
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay mod 5=0
    {
      newEnemy=instance_create(4144,80,oZRatHead) //24
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay mod 6=0
    {
      newEnemy=instance_create(4432,80,oZRatHead)
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(4144,80,oZRatHead) //48
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    if sceneDelay>=72
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and enemyCount=0
  {
    var skullSpd;
    skullSpd=1.1
    for(i=0;i<10;i+=1)
    {
      newEnemy=instance_create(4288,64,oZSkullBall)
      newEnemy.spdUp=skullSpd
      newEnemy.bActive=true
      skullSpd+=0.1
    }
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=234
  }
}
else if room=rVDlock5_2 and global.gameProgress=235 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=928
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(272,16,oEventBarrier)
      newBarrierL.image_yscale=3
      newBarrierR=instance_create(1568,16,oEventBarrier)
      newBarrierR.image_yscale=3
      enemyCount=39
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
    sceneDelay+=1
    if sceneDelay mod 3=0
    {
      newEnemy=instance_create(xSpawn,48,oZRatHead) //39
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      xSpawn+=32
    }
    if xSpawn>=1552
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=236
  }
}
else if global.gameProgress=237 and room=rVDlock5_3 //Boss Fight (Arrghus)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=512
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
        boss=instance_create(512,176,oArrghus)
        boss.image_alpha=0
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
      oPlayer1.sprite_index=sPlayerLookUp
      rockDist=256
      rockDir=0
    }
    else if sceneDelay>=31 and sceneDelay<=154
    {
      if oVDbossBlocks.leftBlock.x<448
        oVDbossBlocks.leftBlock.x+=2
      if oVDbossBlocks.rightBlock.x>544
        oVDbossBlocks.rightBlock.x-=2
      if oVDbossBlocks.topBlock.y<0
        oVDbossBlocks.topBlock.y+=1
      if oVDbossBlocks.bottomShortLeft.y>288
        oVDbossBlocks.bottomShortLeft.y-=0.5
      if oVDbossBlocks.bottomShortRight.y>288
        oVDbossBlocks.bottomShortRight.y-=0.5
    }
    else if sceneDelay=180
    {
      for(i=0;i<8;i+=1)
      {
        rockFormation[i]=instance_create(-32,-32,oMisc)
        rockFormation[i].sprite_index=sNeteryuRock
        rockFormation[i].type=1
      }
    }
    else if sceneDelay>=181 and sceneDelay<=244
    {
      for(i=0;i<8;i+=1)
      {
        rockFormation[i].x=boss.x+lengthdir_x(rockDist,rockDir+(i*45))
        rockFormation[i].y=boss.y+lengthdir_y(rockDist,rockDir+(i*45))
      }
      rockDir-=5
      rockDist-=4
    }
    else if sceneDelay>=245
    {
      with oMisc
        instance_destroy()
      boss.image_alpha=1
      effect=instance_create(boss.x,boss.y,oEffect)
      effect.sprite_index=sBomberExplosion
      effect.image_blend=make_color_rgb(130,55,0)
      effect.image_speed=0.85
      effect.image_xscale=1.1
      effect.image_yscale=1.1
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Have fun with that.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Oh thanks. You're SUCH a great help.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I'll get some info on it for you.#From what I already know, this is not with The Darkness.#It's guarding something.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Be careful, yada yada, I know the drill.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You're making it easy on me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Ever noticed that they don't attack while we're busy chatting?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("It's the rpg cutscene rules, you should've figured this out by now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I've been neglecting rpgs these days.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You're missing out on some good titles.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("I think I'll survive, either way, shut up so it attacks.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Considering what you're always up against, it's a good thing you're more#into action games.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Indeed, now would you please stop talking?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Oh right, sorry.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("STOP!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("You are such an ass.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrier=instance_create(240,256,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=238
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Arrghus"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=238 or room=rBR_Arrghus //boss fight ends (Arrghus)
{
  if sceneProgress=0
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
  }

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
      with oMisc
        instance_destroy()
      oPlayer1.x=512
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
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("A door is about to appear.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Was there a point in telling me that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Not really...#Anyway, I don't know what is beyond that door.#That thing was guarding something. Prepare for the worst.#Save first.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Way to break immersion.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("What immersion?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    newExit=instance_create(384,288,oExit)
    newExit.sprite_index=sEnergyRip1
    newExit.bShowArrow=true
    newExit.exitType=0
    newExit.newMapX=0
    newExit.newMapY=0
    newExit.toRoom=rVDtheArtist
    newExit.newStep=60
    newExit.newTrans=20

    global.gameProgress=239
    global.currentBoss=""
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=240 //First encounter with The Artist
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
      stopAllMusic()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Where in the...#What is this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("A pitch black empty void apparently.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Brilliant observation, but really... where am I?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Some sort of confined space. It's... protected.#I can't modify anything here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I'm going to hope for nothing hostile then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("So you came...",1,oMessageCutscene,"Mysterious Voice")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("What? Who's there?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,"Mysterious Voice")
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      artistBlend+=2.5
      npcTheArtist.image_blend=make_color_rgb(artistBlend,artistBlend,artistBlend)
      if artistBlend>=255
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("You can't possibly be Dr. Light.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You are correct " +string(global.mainCharacters[0]) +string(", this is merely the form I chose to take#within this."),1,oMessageCutscene,"Dr. Light?")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Who are you then?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Surely you should know.",1,oMessageCutscene,"Dr. Light?")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I'd rather not assume anything.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I know who you are.#I traced you through your messages you left behind.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("So it really is him?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Yes, I am...",1,oMessageCutscene,"Dr. Light?")
  else if sceneProgress=18
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      var tempMplay;
      tempMplay=global.msc_DireMoment
      playMusic(tempMplay,0)
    }
    else if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("The Artist.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("You're the guy responsible for all this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("As unfortunate as it is for me to say it.#Yes, I am truely the cause of everything.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("You have some explaining to do.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("I intend to tell you everything. And do not worry about#what is being said, The Darkness can not hear us within this space.#It is a place not even it can hear. One of the benefits of understanding it.#Now... I'm sure you want to know what The Darkness' original purpose was.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Yes, I'd like to know why someone would ever build something like this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("This isn't some Matrix-like VR program is it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("No, nothing like that.#This program, it was to be the greatest tool of it's kind.#We were going to revolutionize it all.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("People would see us, see me, as the one who changed everything.#Who pushed us forward.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("I'm not really following you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("The Darkness was going to be the most sophisticated and advanced#game tool the world has ever seen.#Far beyond anything you know.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("A game building tool? Are you kidding me?#How the hell did it get like this?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Not only was it to be the most sophisticated tool,#but its core structure allowed for it to use any data placed into it#and to modify it.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Even to modify itself and adapt.#We were able to successfully integrate any previous system into it.#No... not us, it did it on its own. All we had to do was present#data to it and it knew how to fully integrate that with itself.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("I began conducting my own tests.#It was even able to use data that wasn't directly related to games.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("I even got it to map out the Earth.#I don't think you realize how exciting a time that was.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("It was after this that I should have noticed a problem...",1,oMessageCutscene,"The Artist")
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("It presented to me some interesting data...",1,oMessageCutscene,"The Artist")
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Hmm?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("It had showed everything about me.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("What do you mean by that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("Everything that I was, things personal to me, my family... everything...#Along with everyone else on the team. I had never given it that data.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("If I had known what I was getting into, I would have shut it down then,#but I didn't. I made an even bigger mistake of not informing#anyone within my team.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("Why didn't you let anyone know about that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("If anyone knew it was handling sensitive data,#many of those on the team would have stopped development.#I couldn't have that, not when we were so close to revealing it to the world.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("That's ridiculous.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("Judge me all you want, you would have done the same#had you been in my situation. I realize what I've done and take full responsibility.#I want to shut down The Darkness.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate("By hiding huh?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("I cannot allow myself to be taken by it. It needs me to unlock its control.#If it is allowed full control, there is nothing we could do#to stop it. " +string(global.mainCharacters[1] +string(" may be able to hide you from it now, but you would#not have that luxury if those locks are lifted.")),1,oMessageCutscene,"The Artist")
  else if sceneProgress=49 and bWaitForInput=false
    msgCreate("What are these locks?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=50 and bWaitForInput=false
    msgCreate("Before it fully brought me into this,#I was able to lock down many of its controls over this place.#It was a safety feature I placed in after I realized it#could essentially gather info on anyone it wanted.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=51 and bWaitForInput=false
    msgCreate("It needs me to unlock these systems.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=52 and bWaitForInput=false
    msgCreate("But it can't force you to do this can it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=53 and bWaitForInput=false
    msgCreate("It can replicate any data within itself that it analyzes.#That is all it needs to do. This is why I have remained hidden.#And why I have guided you... Guided you to me and to the Muffins.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=54 and bWaitForInput=false
    msgCreate("So there is a way to bring The Darkness down and save everyone?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=55 and bWaitForInput=false
    msgCreate("Yes, The Darkness can be shut down... Those Muffins,#they are segments of code which allow you to override any system within this.#Normally any attempt at causing The Darkness to stop functioning or telling it#to shut down would simply cause it to override the command or rewrite#the segment of code which is causing the problem. Its top priority is#to keep itself running.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=56 and bWaitForInput=false
    msgCreate("However, those Muffins would allow you to temporarily override that function#and more importantly, cause it to shut down.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=57 and bWaitForInput=false
    msgCreate("If all seven of them were brought together,#it would be enough to shut it down.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=58 and bWaitForInput=false
    msgCreate("So this would save everyone then?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=59 and bWaitForInput=false
    msgCreate("The Darkness would indeed be stopped.#The problem is getting those Muffins.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=60 and bWaitForInput=false
    msgCreate("You have one of them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=61 and bWaitForInput=false
    msgCreate("Perceptive, and before you ask, I do intend to give it to you.#It would be too risky for me to attempt to shut it down myself.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=62
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(144,240,oMagicalMuffin)
      muffin.muffinType=4
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
  else if sceneProgress=63 and bWaitForInput=false
    msgCreate("Never tried this flavor of Muffin before, but I'm up for new things.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=64 //---------- Muffin Sequence ----------
    getMuffin(4)
  else if sceneProgress=65 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL ALMOND MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=66
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=67 and bWaitForInput=false
    msgCreate("There are still two more out there.#One of them are located north-west from the ruins here.#Seek out that Muffin first.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=68 and bWaitForInput=false
    msgCreate("Then I will do that.#Something is bugging me though...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=69 and bWaitForInput=false
    msgCreate("What is it? I will tell you anything you want to know.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=70 and bWaitForInput=false
    msgCreate("The game characters... specifically X.#Why are they against The Darkness?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=71 and bWaitForInput=false
    msgCreate("As a test of its capabilities,#I gave The Darkness all the data I could on existing characters.#The ones we all know from our past. Based on this, it created#a persona for each of them. Quite accurately I must say.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=72 and bWaitForInput=false
    msgCreate("As for why they are against The Darkness, I don't understand that myself.#Perhaps a ghost in the machine would explain it best.#Maybe it created them too perfectly. Their personality is to strive#for the greater good. In the case with X, he was designed to#protect humanity. His desire for this, so to say, is very strong.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=73 and bWaitForInput=false
    msgCreate("I am willing to believe my lock is holding back The Darkness#from overriding their desire to help us.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=74 and bWaitForInput=false
    msgCreate("All the more important that you are not caught then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=75 and bWaitForInput=false
    msgCreate("And why I can no longer stay within this space.#It will not be long before The Darkness finds me here.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=76 and bWaitForInput=false
    msgCreate("Where would you go?#The Darkness' scouts were all over this place looking for you.#It wouldn't take long for it to find you out there.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=77 and bWaitForInput=false
    msgCreate("Abstracity, it is still untouched by The Darkness, is it not?",1,oMessageCutscene,"The Artist")
  else if sceneProgress=78 and bWaitForInput=false
    msgCreate("Yes, it is safe.#Its defenses have easily been keeping The Darkness out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=79 and bWaitForInput=false
    msgCreate("I don't like that idea.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=80 and bWaitForInput=false
    msgCreate("Do you have anywhere else in mind?",1,oMessageCutscene,"The Artist")
  else if sceneProgress=81 and bWaitForInput=false
    msgCreate("Unfortunately I don't. I just feel we're missing something here.#I'm getting a bad feeling from that idea.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=82 and bWaitForInput=false
    msgCreate("But he can't stay here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=83 and bWaitForInput=false
    msgCreate("I know, I just wish there was an alternative.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=84 and bWaitForInput=false
    msgCreate("I'm sure " +string(global.mainCharacters[5]) +string(" and the others will protect him if anything happens."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=85 and bWaitForInput=false
    msgCreate("Yeah... I suppose.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=86 and bWaitForInput=false
    msgCreate("If you know its exact location, we can be sent straight there from this place.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=87 and bWaitForInput=false
    msgCreate("For plot convenience of course!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=88 and bWaitForInput=false
    msgCreate("Alright, then let's get you two out of this place.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=89
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      stopAllMusic()
      depth=-120
      image_alpha=0
      bossFinishFadeAlpha=1
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=90
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=91
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.02
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=92
  {
    global.gameProgress=241
    sceneProgress=0
    room_goto(rAbstracityAptTopRoom)
  }

  if sceneProgress>=18
  {
    if image_alpha>0
      image_alpha-=0.0001
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
if room=rVeiledDetritus1 and global.gameProgress<=223
{
  if sceneProgress=4
  {
    draw_set_alpha(circleAlpha)
    draw_circle(712,256,circleSize,0)
  }
  else if sceneProgress=10 or sceneProgress=11
  {
    draw_set_alpha(circleAlpha)
    draw_circle(npcLink.x+30,npcLink.y-33,circleSize,0)
    draw_circle(npcSamus.x-20,npcSamus.y-33,circleSize,0)
  }
}
else if room=rVDlock5_1 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+340,view_yview[0]+68,"Baddies Remaining:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if room=rVDlock5_2 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+356,view_yview[0]+68,"More Bad Guys:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if room=rVDtheArtist
{
  draw_set_alpha(image_alpha)
  draw_set_color(c_black)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
