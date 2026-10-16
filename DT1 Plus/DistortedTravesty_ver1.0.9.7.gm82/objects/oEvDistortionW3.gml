#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
if global.gameProgress=196
  bossFinishFadeAlpha=1
else
  bossFinishFadeAlpha=0
fadeColor=c_white
newCaption=0
ranNum=0
if global.gameProgress=202 and room=rDistortionW3_5
{
  deathLineX=64
  if global.difficulty=1
    deathLineSpeed=3.2
  else if global.difficulty=2
    deathLineSpeed=3.4
  else if global.difficulty=3
    deathLineSpeed=3.5
  else if global.difficulty=4
    deathLineSpeed=3.7
}
else if global.gameProgress=206 and room=rDistortionW3_7
{
  deathLineY=2064
  if global.difficulty=1
    deathLineSpeed=1.9
  else if global.difficulty=2
    deathLineSpeed=2
  else if global.difficulty=3
    deathLineSpeed=2.1
  else if global.difficulty=4
    deathLineSpeed=2.2
}
else if room=rDistortionW3_8
{
  fadeColor=c_black
  breakoutScore=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=196 and room=rDistortionW3_1 //intro to Distortion 3
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      oPlayer1.image_speed=0.1
      oPlayer1.sprite_index=sPlayerIdle
    }
    else if sceneDelay>=90
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.02
      else
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Oh wow, we've really gone back this time.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Oh no, I still have nightmares about this game.#I played it way too much when I was younger.#<True fact about me, except the nightmare part.>",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Well unfortunately this is Distortion, which means we have to deal with " +string(global.mainCharacters[3]) +string("."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Hopefully this doesn't get as bad as that game got.#Actually, what am I saying, it'll be worse... way worse.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Something to keep in mind, the enemies here are very fragile,#but they hit very hard.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Let's do the typical thing we do in these places.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I sit back and watch you do all the work?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Precisely.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I've already begun searching for an exit.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    global.gameProgress=197
    global.teleportEnabled=2
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Distortion WTF"
    global.gamePaused=false
  }
}
else if global.gameProgress=199 and room=rDistortionW3_3 and global.gamePaused=false //Shroud Lord fight 1
{
  if sceneProgress=0
  {
    if oPlayer1.x>=720
    {
      barrierL=instance_create(480,-64,oBossBarrier)
      barrierL.image_yscale=5.5
      barrierR=instance_create(928,-64,oBossBarrier)
      barrierR.image_yscale=5.5

      boss=instance_create(1120,160,oShroudLordLv1)
      boss.activateBoss=1
      playSound(global.snd_BreakOut,0,1)
      instance_create(0,0,oViewShaker)
      bossFinishFadeAlpha=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=630
    {
      boss.controlType=1
      bossMoveSpd=1
    }
    else if sceneDelay>=631 and sceneDelay<=719
    {
      boss.x+=bossMoveSpd
      boss.y-=bossMoveSpd/4
      if bossMoveSpd<7
        bossMoveSpd+=0.35
    }
    else if sceneDelay>=720
    {
      msgCreate("Wow, what was that all about?",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=90
      with oShroudLordLv1
        instance_destroy()
      with oShroudArmLv1
        instance_destroy()
      with oBossBarrier
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
      global.gameProgress=200
    }
  }
}
else if global.gameProgress=202 and room=rDistortionW3_5 //spike wall
{
  if sceneProgress=0
  {
    if oPlayer1.x>=352
      sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if global.gamePaused=false
    {
      if deathLineX+32>=oPlayer1.x
        oPlayer1.life-=oPlayer1.maxLife
      deathLineX+=deathLineSpeed
    }
  }
}
else if global.gameProgress=203 and room=rDistortionW3_6 //chat with Hexor
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("You got through ANOTHER of my traps!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Your traps fail, and your originality fails even more.#You already tried a trap like that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I'll try something else.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It's not that hard to block most of your traps.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Don't get your hopes up, I'm working on a way to block you out completely.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You challenging MY hacking skills?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("You will see soon enough that you cannot beat me.#I know everything about you already.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Stalker.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Just keep moving.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    global.gameProgress=204
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=204 and room=rDistortionW3_6 //take the top path
{
  if sceneProgress=0
  {
    if oPlayer1.x>=4360
    {
      global.gamePaused=true
      stopPlayer()
      oPlayer1.xVel=0
      oPlayer1.yVel=0
      oPlayer1.x=4304
      oPlayer1.y=224
      with oSkullHead
        instance_destroy()
      with oEventBarrier
        instance_destroy()
      instance_create(4352,160,oEventBarrier)
      bossFinishFadeAlpha=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What's going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I did that.#Take the top path.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("But I KNOW the exit is right in front of me!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Yes, however there is a data string I want access to in that door up there.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You think it has data about The Darkness?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I'm very sure it does.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Alright, let's... no, I'LL do this!#I just hope I'm not walking right into a trap.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I can't say it won't be guarded.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Well of course not!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11
  {
    global.gameProgress=205
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=206 and room=rDistortionW3_7 //spike wall
{
  if global.gamePaused=false
  {
    if deathLineY+4<=oPlayer1.y
      oPlayer1.life-=oPlayer1.maxLife
    deathLineY-=deathLineSpeed
  }
}
else if global.gameProgress=207 and room=rDistortionW3_8 //Boss Fight (Breakout Mystery)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=512
    {
      global.gamePaused=true
      stopPlayer()
      oPlayer1.xVel=0
      oPlayer1.yVel=0
      oPlayer1.image_speed=0.1
      oPlayer1.sprite_index=sPlayerIdle
      stopAllMusic()
      view_xview[0]=512
      bossFinishFadeAlpha=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.02
    else if bossFinishFadeAlpha<=0
    {
      sceneDelay+=1
      if sceneDelay=1
        global.gamePaused=true
      else if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("This isn't what I think it is... is it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Try getting out of this one.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("It's just Breakout, you can handle this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I did win the Intergalactic Breakout Competition after all.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That was me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Fine, I got second.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    if sceneDelay=0
    {
      oPlayer1.sprite_index=sPlayerLookUp
      xSpawn=592
      ySpawn=96
      sceneDelay+=1
    }
    playSound(global.snd_MMbuster,0,0.65)
    newBlock=instance_create(xSpawn,ySpawn,oBreakoutBlock)
    if ySpawn>=96 and ySpawn<=104
      newBlock.pointValue=3
    if ySpawn>=112 and ySpawn<=120
      newBlock.pointValue=2
    if ySpawn>=128 and ySpawn<=144
      newBlock.pointValue=1
    xSpawn+=16
    if xSpawn>=816
    {
      xSpawn=592
      ySpawn+=8
      if ySpawn>=152
      {
        oBreakoutBlock.useColor=1
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      oPlayer1.raveTime=0
      global.gameProgress=208
      sceneDelay=0
      sceneProgress=0
      oBreakoutPaddle.activateBoss=1
      storeStatus(0)
      global.currentBoss="Breakout Mystery"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=208 //boss fight ends (Breakout Mystery)
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay>=10
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and enemyCount<=12
  {
    msgCreate("Alright, I've hacked the blocks.#You can destroy them yourself now.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=150
    oBreakoutBlock.bCanHit=true
    sceneProgress+=1
  }
  else if sceneProgress=2 and enemyCount=0
  {
    var expWorth;
    if global.difficulty=1
      expWorth=55000
    else if global.difficulty=2
      expWorth=70000
    else if global.difficulty=3
      expWorth=82000
    else if global.difficulty=4
      expWorth=95000
    oPlayer1.expTotal+=round(expWorth)
    oPlayer1.expCurrent+=round(expWorth)
    if global.optShowExpEarned=true
    {
      newAward=instance_create(oPlayer1.x,oPlayer1.y-26,oKillAward)
      newAward.expValue=expWorth
    }
    global.gamePaused=true
    fadeColor=c_white
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    var ranX,ranY;
    sceneDelay+=1
    if sceneDelay mod 3=0 and sceneDelay<90
    {
      playSound(global.snd_CASdie,0,1)
      ranX=576+random(256)
      ranY=64+random(288)
      effect=instance_create(ranX,ranY,oEffect)
      effect.sprite_index=sBomberExplosion
    }
    if sceneDelay=90
      playSound(global.snd_EnemyDie,0,1)
    if sceneDelay>=90
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
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      view_xview[0]=0
      with oMapDoor
        instance_destroy()
      with oBreakoutBall
        instance_destroy()
      oPlayer1.x=352
      oPlayer1.y=273
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
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
    msgCreate("Explain to me again why we went this way?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Data, and lots of it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("What did you find out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("There is indeed an air field in the Windy Slopes.#I found out I can remotely fly the ship there,#however, you need to be close to them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Is that for plot convenience?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Nothing, continue.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Another set of data I couldn't decipher completely has me worried.#It said The Darkness has already sent in its spies, but I couldn't#read anymore of it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("You shouldn't go poking around where you don't belong.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("I'm going to continue on.#I want to see this air field.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17
  {
    global.gameProgress=209
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=210 and room=rDistortionW3_9 //please no more!
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Does this ever end?#I was sure the exit was RIGHT THERE!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It was, but then it was moved.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It's what I do.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I blame this on you " +string(global.mainCharacters[1]) +string(".#If you had not made me go up that tower."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("It was good exercise.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I was a pain in my ass!#But whatever, I'm pretty sure the end is coming up.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    global.gameProgress=211
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=211 and room=rDistortionW3_9 and global.gamePaused=false //Shroud Lord fight 2
{
  if sceneProgress=0
  {
    if oPlayer1.x>=2048
    {
      bLeftCheck=0
      bRightCheck=0
      fireCreate=0
      barrierL=instance_create(1824,-64,oBossBarrier)
      barrierL.image_yscale=5
      barrierR=instance_create(2256,-64,oBossBarrier)
      barrierR.image_yscale=5

      boss=instance_create(2448,96,oShroudLordLv1)
      boss.activateBoss=1
      playSound(global.snd_BreakOut,0,1)
      instance_create(0,0,oViewShaker)
      bossFinishFadeAlpha=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if instance_exists(boss.bossSL_Rhand) and bRightCheck=0
    {
      if boss.bossSL_Rhand.lifePercent<=0.5
      {
        bRightCheck=1
        if bLeftCheck=0
        {
          fireCreate=instance_create(2048,0,oMisc)
          fireCreate.type=1
          fireCreate.sprite_index=sALfireball
          fireCreate.image_xscale=2
          fireCreate.image_yscale=2
          fireCreate.image_alpha=0.3
        }
      }
    }
    if instance_exists(boss.bossSL_Lhand) and bLeftCheck=0
    {
      if boss.bossSL_Lhand.lifePercent<=0.5
      {
        bLeftCheck=1
        if bRightCheck=0
        {
          fireCreate=instance_create(2048,0,oMisc)
          fireCreate.type=1
          fireCreate.sprite_index=sALfireball
          fireCreate.image_xscale=2
          fireCreate.image_yscale=2
          fireCreate.image_alpha=0.3
        }
      }
    }

    //fire start ------------------------------
    if instance_exists(fireCreate)
    {
      fireCreate.image_angle+=15
      fireCreate.y+=10
      if fireCreate.y>=288
      {
        for(i=1960;i<2144;i+=16)
        {
          firePit=instance_create(i,288,oMarioLava)
          firePit.sprite_index=sFlameUp
        }
        with fireCreate
          instance_destroy()
      }
    }
    //----------------------------------------

    if bRightCheck=1 and bLeftCheck=1
    {
      bRightCheck=101
      boss.controlType=1
      bossMoveSpd=1
    }
    if bRightCheck>=100
      bRightCheck+=1

    if bRightCheck>=101 and bRightCheck<=220
    {
      boss.x+=bossMoveSpd
      boss.y-=bossMoveSpd/4
      if bossMoveSpd<7
        bossMoveSpd+=0.35
    }
    else if bRightCheck>=221
    {
      msgCreate("There it was again.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      with oShroudLordLv1
        instance_destroy()
      with oShroudArmLv1
        instance_destroy()
      with oBossBarrier
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
      global.gameProgress=212
    }
  }
}
else if global.gameProgress=213 and room=rDistortionW3_10 //finally the end!
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("FINALLY!!#I'm so glad that's over.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Once you get out, just keep going along the Windy Plains.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Of course!#I want to see this ship that you're supposedly able to fly remotely.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Hey now, I can do it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    global.gameProgress=214
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
if room=rDistortionW3_8
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_left)
  draw_text(904,72,"SCORE#" +string(breakoutScore))
  draw_sprite_ext(sPlayerIdle,0,906,176,0.5,0.5,0,c_white,1)
  draw_text(920,158,"x " +string(oPlayer1.life))
}

if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
if global.gameProgress=202 and room=rDistortionW3_5
{
  if sceneProgress=1
  {
    for(i=0;i<room_height;i+=16)
      draw_sprite(sD3SpikeWall,-1,deathLineX,i)
  }
}
else if global.gameProgress=206 and room=rDistortionW3_7
{
  for(i=0;i<room_width;i+=16)
    draw_sprite_ext(sD3SpikeWall,-1,i,deathLineY+32,1,1,90,c_white,1)
}
