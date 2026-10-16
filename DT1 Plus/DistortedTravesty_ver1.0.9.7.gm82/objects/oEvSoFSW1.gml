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
currentFloor=0

if room=rSoFS_Floor1
{
  newMPlatform1=instance_create(432,464,oMovingPlatform)
  newMPlatform1.doNotMove=1
  newMPlatform1.sprite_index=sInvisibleSolidMask
  newMPlatform1.xDir=0
  newMPlatform1.yDir=-2
  newMPlatform1.shiftChange=96
  newMPlatform1.spriteChange=6
  newMPlatform1.image_xscale=3
  newMPlatform2=instance_create(352,112,oMovingPlatform)
  newMPlatform2.doNotMove=1
  newMPlatform2.sprite_index=sInvisibleSolidMask
  newMPlatform2.xDir=0
  newMPlatform2.yDir=2
  newMPlatform2.shiftChange=96
  newMPlatform2.spriteChange=6
  newMPlatform2.image_xscale=3
  newSwitch1=instance_create(48,80,oMapSwitch)
}
else if room=rSoFS_Floor4
{
  var xSpawn,ySpawn;
  xSpawn=64
  ySpawn=64
  for(i=0;i<40;i+=1)
  {
    newLongSpike=instance_create(xSpawn,ySpawn,oLongSpikeL)
    if ySpawn<400
      newLongSpike.newSpeed=1
    else
      newLongSpike.newSpeed=0.5
    newLongSpike.newMax=196
    newLongSpike.newDetectX=144
    xSpawn=432
    newLongSpike=instance_create(xSpawn,ySpawn,oLongSpikeR)
    if ySpawn<400
      newLongSpike.newSpeed=1
    else
      newLongSpike.newSpeed=0.5
    newLongSpike.newMax=196
    newLongSpike.newDetectX=144
    xSpawn=64
    ySpawn+=16
  }
}
else if room=rSoFS_Floor14
  rockDropTime=60
else if room=rSoFS_Floor15
  rockDropTime=85
else if room=rSoFS_Floor36
{
  rockDropTime1=85
  rockDropTime2=105
}
else if room=rSoFS_Floor41
{
  floorTime=0
  floorDelay=6
  musicFreq=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if room=rSoFS_Floor1
  {
    if newSwitch1.activated=1
    {
      newMPlatform1.yVel=newMPlatform1.yDir
      newMPlatform1.bCanMove=true
      newMPlatform2.yVel=newMPlatform2.yDir
      newMPlatform2.bCanMove=true
      newSwitch1.activated=2
    }
  }
  else if room=rSoFS_Floor14
  {
    rockDropTime+=1
    if rockDropTime>=70
    {
      newRock=instance_create(416,160,oBigBoulder)
      newRock.bActive=1
      newRock=instance_create(128,160,oBigBoulder)
      newRock.bActive=1
      rockDropTime=0
    }
  }
  else if room=rSoFS_Floor15
  {
    rockDropTime+=1
    if rockDropTime>=95
    {
      newRock=instance_create(32,32,oBigBoulder)
      newRock.bActive=1
      newRock=instance_create(96,32,oBigBoulder)
      newRock.bActive=1
      newRock=instance_create(416,32,oBigBoulder)
      newRock.bActive=1
      newRock=instance_create(480,32,oBigBoulder)
      newRock.bActive=1
      rockDropTime=0
    }
  }
  else if room=rSoFS_Floor36
  {
    rockDropTime1+=1
    if rockDropTime1>=95
    {
      newRock=instance_create(432,32,oBigBoulder)
      newRock.bActive=1
      rockDropTime1=0
    }
    rockDropTime2+=1
    if rockDropTime2>=115
    {
      newRock=instance_create(80,-32,oBigBoulder)
      newRock.bActive=1
      rockDropTime2=0
    }
  }
  else if room=rSoFS_Floor21 or room=rSoFS_Floor22 or room=rSoFS_Floor23 or room=rSoFS_Floor24 or room=rSoFS_Floor25 or room=rSoFS_Floor37 or room=rSoFS_Floor38
  {
    oPlayer1.dashRecoveryTime=0
    oPlayer1.dashPoints=0
  }
  else if room=rSoFS_Floor41 //Going up the tower elevator
  {
    musicFreq+=1
    var tempFplay;
    tempFplay=findMusic(0)
    SS_SetSoundFreq(tempFplay,findFreq()+(musicFreq*40))

    floorTime+=1
    if currentFloor<98
    {
      if floorTime>=floorDelay
      {
        background_vspeed[1]+=0.2
        currentFloor+=1
        floorTime=0
      }
    }
    else
    {
      if floorTime>=60
      {
        if global.sofsMax=8
          global.sofsMax=9
        transition_steps=15
        transition_kind=5
        room_goto(rSoFS_Floor99)
      }
    }
  }
}

if global.sofsMax=10 and room=rSoFS_Floor100 //Boss Fight (Spire Guardian)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=192
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
    if sceneDelay=1
    {
      boss=instance_create(368,192,oSpireGuardian)
      boss.image_alpha=0
      boss.image_xscale=-1
    }
    else if sceneDelay>=2
    {
      boss.image_alpha+=0.02
      if boss.image_alpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Figures there would be something at the top here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It isn't going to go easy on you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I wouldn't expect it to.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      barrier=instance_create(80,256,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      sceneProgress=10
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Spire Guardian"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
  else if sceneProgress=10 and enemyCount=0 //boss fight ends (Spire Guardian)
  {
    global.gamePaused=true
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=11
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.05
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      with oSpireGuardRed
        instance_destroy()
      with oSpireGuardBlue
        instance_destroy()
      with oSpireGuardGreen
        instance_destroy()
      oPlayer1.x=192
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
  else if sceneProgress=13
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=14
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("That was intense looking.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("That was a very agonizing battle.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Oh it wasn't that bad.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("You always say that!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Like I keep telling you, from my point of view, it wasn't that bad.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Well anyway, I just want to see what's at the top.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21
  {
    newExit=instance_create(256,288,oExit)
    newExit.bShowArrow=true
    newExit.exitType=0
    newExit.sprite_index=sSoFSDoor
    newExit.visible=true
    newExit.newMapX=0
    newExit.newMapY=0
    newExit.toRoom=rSoFS_TopFloor

    global.sofsMax=11
    global.currentBoss=""
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
//award floor exit message
if currentFloor=0 and room!=rSoFS_TopFloor
{
  draw_set_font(fnt_MessageMenu)
  draw_set_halign(fa_center)
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_text(80,144,"Exit to#bottom floor")
  draw_text(256,144,"Continue to#next floor")
}
//show current floor
if currentFloor>0
{
  floorShowX=view_xview[0]+464
  floorShowY=view_yview[0]+68
  draw_set_font(fnt_MessageMenu)
  draw_set_halign(fa_left)
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_text(floorShowX,floorShowY+1,"Floor " +string(currentFloor))
  draw_text(floorShowX+1,floorShowY,"Floor " +string(currentFloor))
  draw_text(floorShowX+1,floorShowY+1,"Floor " +string(currentFloor))
  draw_set_color(c_white)
  draw_text(floorShowX,floorShowY,"Floor " +string(currentFloor))
}

if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
//timer
if currentFloor>0 and currentFloor<100
  countdownTimer(1,c_white)
