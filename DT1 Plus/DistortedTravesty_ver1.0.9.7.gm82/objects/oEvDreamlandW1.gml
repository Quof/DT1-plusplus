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

if global.gameProgress=55 and room=rVegetableGarden4
{
  mkImage=instance_create(416,320,oMisc)
  mkImage.sprite_index=sMetaKnightIntro
  mkImage.image_xscale=-1
  mkImage.image_speed=0
  mkImage.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=51 //intro to Dreamland
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
    else if sceneDelay>=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Yes, yes, and more YES!#I love the Kirby games!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Should be interesting nonetheless.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3
  {
    global.gameProgress=52
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Vegetable Garden"
    global.gamePaused=false
  }
}
if global.gameProgress=55 and room=rVegetableGarden4 //Boss Fight (Meta-Knight)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=224
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
      oPlayer1.sprite_index=sPlayerIdle
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      oMisc.image_speed=0.3
    }
    else if sceneDelay>=75
    {
      sceneDelay=0
      sceneProgress+=1
    }
    if oMisc.image_index>=12
      oMisc.image_speed=0
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Does he want to fight?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("How would I know something like that?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Well what's he doing out here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Again, how would I know?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Don't you hack or something?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Shouldn't you know I can't see motives by now?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Have you noticed this entire conversation has been done entirely#in question format?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Do you think anyone would have noticed had we not pointed it out?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Shouldn't this epic boss battle start now?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("It would be, but I need to explain something crucial to you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("It better be good.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Yeah, it is.#When you scan him, you will see more than one entry for his cripple point.#That is a sequence of attacks you must hit him with quickly in order#to cripple him.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Wow, that really was good.#Now can the fight start?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      barrier1=instance_create(160,0,oBossBarrier)
      barrier2=instance_create(160,64,oBossBarrier)
      barrier3=instance_create(160,128,oBossBarrier)
      barrier4=instance_create(160,192,oBossBarrier)
      barrier5=instance_create(160,256,oBossBarrier)
      barrier6=instance_create(560,0,oBossBarrier)
      barrier7=instance_create(560,64,oBossBarrier)
      barrier8=instance_create(560,128,oBossBarrier)
      barrier9=instance_create(560,192,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=56
      sceneProgress=0
      with oMisc
        instance_destroy()
      boss=instance_create(416,320,oMetaKnight)
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="MetaKnight"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=56 //boss fight ends (Meta-Knight)
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
      oPlayer1.x=352
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
    msgCreate("Gave him an awesome ass kicking!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You sure did.#Hold on for a second, that Muffin is about to appear.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I'll get ready for it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(352,208,oMagicalMuffin)
      muffin.muffinType=1
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
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It's a Blueberry Muffin!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Time to add it to my Muffin collection.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 //---------- Muffin Sequence ----------
    getMuffin(1)
  else if sceneProgress=12 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL BLUEBERRY MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=13 and bWaitForInput=false
  {
    msgCreate(global.mainCharacters[0] +string(" learned:#Physical Technique: Wave of Awesome"),1,oMessageCutscene,"")
    global.techLv=2
  }
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I love getting more abilities I can kick ass with!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Wave of Awesome sounds pretty intense...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Oh wow, you need to get out of that area NOW!!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Why, what's going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Just go NOW!!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19
  {
    with oExit
      instance_destroy()
    global.gameProgress=57
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=57 and room=rVegetableGarden4 //Sucked in Distortion
{
  if sceneProgress=0
  {
    if oPlayer1.x>=896
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
    if oPlayer1.y<288
      //oPlayer1.y+=4
      oPlayer1.y+=4*gDeltaTime //60fps change: per 30fps tick
    else
    {
      oPlayer1.sprite_index=sPlayerChestHit
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //pX=oPlayer1.x-13+random(26)
    if gDeltaDoTicks pX=oPlayer1.x-13+random(26) //60fps change: once per 30fps tick
    //pY=oPlayer1.y-52+random(52)
    if gDeltaDoTicks pY=oPlayer1.y-52+random(52) //60fps change: once per 30fps tick
    //effect_create_above(ef_smoke,pX,pY,1,c_black)
    if gDeltaDoTicks effect_create_above(ef_smoke,pX,pY,1,c_black) //60fps change: once per 30fps tick
    //if sceneDelay>=20
    if sceneDelay>19 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      if bossFinishFadeAlpha<1
        //bossFinishFadeAlpha+=0.05
        bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    stopAllMusic()
    global.gameProgress=58
    writeToPlayerGlobals()
    room_goto(rDistortionW1_1)
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
