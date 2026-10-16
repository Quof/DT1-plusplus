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
if global.gameProgress=184 //intro to Windy Slopes
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
    msgCreate("What exactly are we doing here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You just need to pass through these woods.#The Muffin's signal has gotten somewhat stronger, so I'm#sure it's beyond this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Should be easy enough.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("There's some ruins here too I believe.#And I think there's also some airbase.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Can I steal a ship?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Eh, no.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Actually... WAIT!#Before you leave, maybe you should head in that airbase' direction.#I might be able to hack one of the ships for you to fly.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Your awesome level just went through the roof.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It's what I do.#Now go kick some Darkness ass!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    global.gameProgress=185
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Windy Slopes"
    global.gamePaused=false
  }
}
else if global.gameProgress=189 and room=rWindyCaves2 //no dashing here
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
    msgCreate("You're not going to like what I'm about to say.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It better not have anything to do with me not having any Dash Points.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Nevermind, you already took notice.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I hate everything.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.gameProgress=190
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rWindyCaves2 and global.gameProgress=190 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=3088
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(2768,32,oEventBarrier)
      newBarrierL.image_yscale=2
      newBarrierR=instance_create(3392,32,oEventBarrier)
      newBarrierR.image_yscale=2
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
    newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=180
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    for(i=0;i<2;i+=1)
    {
      newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //3
      newEnemy.bActive=true
      newEnemy.questType=1
    }
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay>=330
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    for(i=0;i<2;i+=1)
    {
      newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //5
      newEnemy.bActive=true
      newEnemy.questType=1
    }
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay>=150
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=450
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    for(i=0;i<2;i+=1)
    {
      newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //8
      newEnemy.bActive=true
      newEnemy.questType=1
    }
    sceneProgress+=1
  }
  else if sceneProgress=11
  {
    sceneDelay+=1
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=12
  {
    for(i=0;i<2;i+=1)
    {
      newEnemy=instance_create(oPlayer1.x,oPlayer1.y,oBlackMantle) //10
      newEnemy.bActive=true
      newEnemy.questType=1
    }
    sceneProgress+=1
  }
  else if sceneProgress=13 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=191
  }
}
else if global.gameProgress=193 and room=rWindyCaves4 //Boss Fight (Enflamed Blazing Bat)
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
    if oPlayer1.y<288
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
      boss=instance_create(448,368,oEnflamedBlazingBat)
      boss.image_xscale=-1
    }
    else if sceneDelay>=30
    {
      if boss.y>240
        boss.y-=2
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
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("What are you doing in my home?",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I need to unlock the passageway on the surface.#Once I have the key to that, I'll leave.#Sorry I'm trespassing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("The key!#You want the key to my treasure!#You shall not have it!",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I must get through that passage though!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Lies!!#I HATE liars!#You're all after my treasures!",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I'm sure we can talk this over right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I shall consume you in the blazing inferno!",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Failed diplomacy check.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      bDrawBossImage=false
      boss.visible=true
      newBarrier=instance_create(144,224,oBossBarrier)
      newBarrier.image_yscale=1.5
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=194
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Enflamed Blazing Bat"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=194 //boss fight ends (Enflamed Blazing Bat)
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
      oPlayer1.x=320
      oPlayer1.y=288
      oPlayer1.image_xscale=1
      npcBBat=instance_create(416,240,oMisc)
      npcBBat.type=0
      npcBBat.sprite_index=sEnflamedBlazingBatNormal
      npcBBat.image_xscale=-1
      npcBBat.image_speed=0.33
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
    msgCreate("I can't believe you beat my guardian.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You still going to attack?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("If you do not leave, I will.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I just need the passage on the surface unlocked.#That's all I came down here for.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You really don't want my treasure?",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Of course not. Once I have the key, I'll leave.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Alright, you can have the key.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("For once, we didn't run into The Darkness'.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("The Darkness?! You are fighting against it?#If only you had said so sooner!#I despise that abomination. It is because of it, that my world disappeared.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("How were you not caught by it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I have been hiding...#I have also decided on something.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("I will help you.#The Darkness is not something you should fight alone.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Sweet, I could use all the help I can get.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Oh, and I'll release the barrier on my treasure a few rooms back.#This is merely a ploy to make you backtrack and lengthen gameplay.",1,oMessageCutscene,"Blazing The Bat")
  else if sceneProgress=19
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      for(i=0;i<3;i+=1)
        effect_create_above(ef_ring,npcBBat.x,npcBBat.y,i,c_red)
      with npcBBat
        instance_destroy()
    }
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=20 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate("Blazing will now assist you in various ways when the Shrouds find you.",1,oMessageCutscene,"")
  }
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Turned out to be beneficial.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22
  {
    newKey=instance_create(544,280,oKey)
    newKey.objectNum=5
    effect_create_above(ef_ring,newKey.x,newKey.y,2,c_white)
    global.gameProgress=195
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=195 and room=rWindySlopes4 //Into Distortion 3
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1424
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.1
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    stopAllMusic()
    global.gameProgress=196
    writeToPlayerGlobals()
    room_goto(rDistortionW3_1)
  }
}
else if global.gameProgress=216 and room=rWindySlopes5 and global.gamePaused=false //Shroud Lord fight 3
{
  if sceneProgress=0
  {
    if oPlayer1.x>=512
    {
      barrierL=instance_create(0,0,oBossBarrier)
      barrierL.image_xscale=2
      barrierL.image_yscale=5
      barrierR=instance_create(992,0,oBossBarrier)
      barrierR.image_xscale=2
      barrierR.image_yscale=5

      bossMoveSpd=1
      boss=instance_create(960,224,oShroudLordLv1)
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
    {
      msgCreate("It's out here too?!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if boss.lifePercent<=0.8
      sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=1 and sceneDelay<=120
    {
      boss.x+=bossMoveSpd
      boss.y-=bossMoveSpd/4
      if bossMoveSpd<7
        bossMoveSpd+=0.35
    }
    else if sceneDelay>=121
    {
      msgCreate("I really wish that thing would leave me alone.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      with oShroudLordLv1
        instance_destroy()
      with oShroudArmLv1
        instance_destroy()
      with oBossBarrier
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
      global.gameProgress=217
    }
  }
}
else if global.gameProgress=218 and room=rWindySlopes6 //a plane
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
    msgCreate("This... isn't an airfield.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I decided to get you hyped up this whole time.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Hyped?!#THIS is a let down!#LOOK AT THAT THING!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("What's wrong with it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("It's puny and perspective doesn't match.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You wanna find another way over the mountains?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I hate it when you're right about everything.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You going to get in?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("When have I ever been able to fly a plane?#I'm a video game nerd who works at corporate...#nevermind, that job depresses me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Lucky for you, I can fly it remotely, remember?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Wait, so I have to sit in that wussy looking plane while#someone else controls it?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Precisely.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Ugh, I'm going to be nervous the whole time.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("You were never good at bullet hells anyway.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("THAT is what we are going up against?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("The Darkness controls the skies around these areas, why wouldn't it use those#types of attacks?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I don't think I want to get in that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I can't control it unless you are close by, you have to get in.#And you aren't going to make good time going over those mountains.#So unless you've got a better idea, I suggest you get in that plot convenient plane.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("This really sucks, I hate those games.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Yeah, but I'm awesome at them.#Besides, you've been going up against storms of bullets anyway.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Alright, I've never really doubted your ability before, so why now?#Kick some ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("That's the spirit!#Just get in when you're ready.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23
  {
    global.gameProgress=219
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rWindyCaves2
{
  oPlayer1.dashRecoveryTime=0
  oPlayer1.dashPoints=0
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
if global.gameProgress=190 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Oh no, evil guys:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
if room=rWindyCaves3
{
  draw_set_alpha(1)
  draw_set_color(make_color_rgb(216,0,0))
  draw_rectangle(192,352,3904,384,false)
  draw_set_alpha(0.2)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(192,64,3904,384,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
else if room=rWindyCaves4
{
  draw_set_alpha(0.2)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(160,0,736,384,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
