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

if global.gameProgress=105 and room=rWestSideJungle5
  boss=instance_create(576,272,oDragonroot)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=100 //intro to West Side Jungle
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
    else if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Wow, this is really nice looking and not what I expected at all.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You're right, this IS really nice looking, but don't trust your eyes.#Remember, looks can be decieving.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I'll just get through this place the best way I can so we can get this over with.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=101
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="West Side Jungle"
    global.gamePaused=false
  }
}
if global.gameProgress=102 and room=rWestSideJungle2 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=3408
    {
      global.teleportEnabled=1
      newBarrierL1=instance_create(3296,0,oEventBarrier)
      newBarrierL2=instance_create(3296,64,oEventBarrier)
      newBarrierL3=instance_create(3296,128,oEventBarrier)
      newBarrierL4=instance_create(3296,192,oEventBarrier)
      newBarrierL5=instance_create(3296,256,oEventBarrier)
      newBarrierL6=instance_create(3296,320,oEventBarrier)
      newBarrierR1=instance_create(3728,0,oEventBarrier)
      newBarrierR2=instance_create(3728,64,oEventBarrier)
      newBarrierR3=instance_create(3728,128,oEventBarrier)
      newBarrierR4=instance_create(3728,192,oEventBarrier)
      newBarrierR5=instance_create(3728,256,oEventBarrier)
      newBarrierR6=instance_create(3728,320,oEventBarrier)
      enemyCount=12
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
    newEnemy=instance_create(3344,96,oBroccoliHolder) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3696,96,oBroccoliHolder) //2
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=150
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(3344,96,oBalboa) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3696,96,oBalboa) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=220
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(3280,208,oFreakedOutFish) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3760,208,oFreakedOutFish) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(3344,192,oGearDiskRider) //7
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3696,192,oGearDiskRider) //8
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    newEnemy=instance_create(3344,192,oRedEyedSpikeTop) //9
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3696,192,oRedEyedSpikeTop) //10
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=11
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=225
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=12
  {
    newEnemy=instance_create(3440,192,oWeirdAssElectricThing) //11
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3696,192,oWeirdAssElectricThing) //12
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=13 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=103
  }
}
else if global.gameProgress=105 and room=rWestSideJungle5 //Boss Fight (Dragonroot)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=416
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
    if oPlayer1.y<272
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
    msgCreate("Looks like I'm in for quite a treat here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      boss.sprite_index=sDragonrootHeadUp
    //else if sceneDelay=25
    else if scrCountPass(sceneDelay,25) //60fps change: once, when the count reaches it
    {
      playSound(global.snd_EnemyRoar1,0,1)
      boss.sprite_index=sDragonrootRoar
    }
    else if sceneDelay>=60
    {
      boss.sprite_index=sDragonrootIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I think you're the treat.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("For a plant, its breath sure is nasty.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      newBarrierL1=instance_create(112,0,oBossBarrier)
      newBarrierL2=instance_create(112,64,oBossBarrier)
      newBarrierL3=instance_create(112,128,oBossBarrier)
      newBarrierL4=instance_create(112,192,oBossBarrier)
      newBarrierL5=instance_create(112,256,oBossBarrier)
      newBarrierL6=instance_create(112,320,oBossBarrier)
      newBarrierR1=instance_create(640,0,oBossBarrier)
      newBarrierR2=instance_create(640,64,oBossBarrier)
      newBarrierR3=instance_create(640,128,oBossBarrier)
      newBarrierR4=instance_create(640,192,oBossBarrier)
      newBarrierR5=instance_create(640,256,oBossBarrier)
      newBarrierR6=instance_create(640,320,oBossBarrier)
      for(i=0;i<272;i+=16)
      {
        newSpike=instance_create(128,i,oDirtSpikeL)
        newSpike.sprite_index=sDR_Spikes
      }
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=106
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Dragonroot"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=106 //boss fight ends (Dragonroot)
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
      with oDirtSpikeL
        instance_destroy()
      oPlayer1.x=416
      oPlayer1.y=272
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
    msgCreate("Wow, why was a plant worse than... nevermind, I'm gonna keep moving.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    global.stockWeaponGem+=1
    global.stockArmor+=1
    global.stockRing+=1
    global.gameProgress=107
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

if global.gameProgress=102 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
