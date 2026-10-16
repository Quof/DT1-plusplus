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
rm4Platform=0
sceneProgress=0
sceneDelay=0

if global.gameProgress=8 and room=rIEF6
{
  npcEngineer=instance_create(448,304,oMisc)
  npcEngineer.sprite_index=sNPC1
  npcEngineer.image_xscale=-1
  npcEngineer.type=1
}
if global.gameProgress=13 and room=rIEF9
{
  npcCEO=instance_create(448,304,oMisc)
  npcCEO.sprite_index=sNPC2
  npcCEO.image_xscale=1
  npcCEO.image_speed=0.15
  npcCEO.type=1
  screenFlash=0
  sLordX=0
  sLordY=0
  sLordMoveTime=0
  sLordMove=0
  bLMove=false
  bPortalOpen=false
  portalSize=0
  bPhaseEffect=false
  phaseTime=0
  phaseDistort=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=-9 //start start combat tutorial
{
  if sceneProgress=0
  {
    if oPlayer1.x>=3152
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      oPlayer1.image_xscale=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<256
      oPlayer1.y+=4
    else
    {
      oPlayer1.sprite_index=sPlayerIdle
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Stop dude.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Why, what's up?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I detect hostiles in the area.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Okay, so what?#All I have to do is whip out my awesome.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Do you even know how?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Of course!#I'll demonstrate on these so called hostiles.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    newBarrier1=instance_create(2992,192,oEventBarrier)
    newBarrier2=instance_create(3296,192,oEventBarrier)
    global.gameProgress=-8
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=-8 //combat tutorial
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay>=150
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    enemyCount=1
    newEnemy=instance_create(3264,-32,oCrabWalker)
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=2 and enemyCount=0
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    enemyCount=1
    newEnemy=instance_create(3040,-32,oCrabWalker)
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=4 and enemyCount=0
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5
  {
    enemyCount=2
    newEnemy=instance_create(3264,-32,oCrabWalker)
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(3040,-32,oCrabWalker)
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=6 and enemyCount=0
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7
  {
    enemyCount=1
    newEnemy=instance_create(3152,128,oSineFaller)
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=8 and enemyCount=0
  {
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    stringToShow="Awesome!#Time to keep going."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    global.gameProgress=-7
  }
}
if global.gameProgress=3 //start Rave Mode tutorial
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1456
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      oPlayer1.image_xscale=1
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<304
      oPlayer1.y+=4
    else
    {
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Why did you suddenly stop?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It's time to dance!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Well judging from what's about to happen, I have to agree.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("You can now enter Rave Mode!#During this, you are completely invulnerable to all enemy attacks,#however traps can still harm you. Your power is boosted significantly as well.#Normally you will have to kick ass in order to build up#power for Rave Mode, but this time is a freebie.#Rave Mode can be activated once you have built up enough#Rave Energy and press the [M] key.",1,oMessageCutscene,"")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Long explanations are long, let's just do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    newBarrier1=instance_create(1248,144,oEventBarrier)
    newBarrier2=instance_create(1648,144,oEventBarrier)
    global.gameProgress=4
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=4 //engage Rave Mode
{
  if sceneProgress=0
  {
    global.p1RaveEnergy=10000
    stringToShow="Press the [M] key to engage Rave Mode."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),96,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=90
    sceneProgress+=1
  }
  else if sceneProgress=1 and oPlayer1.bRaveActive=true
  {
    enemyCount=26
    sceneProgress+=1
  }
  else if sceneProgress=2
  {
    newEnemy=instance_create(1408,-16,oCrabWalker) //1
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //2
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1328,192,oSineFaller) //3
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1568,192,oSineFaller) //4
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(1408,-16,oCrabWalker) //5
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //6
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1456,-32,oCrabWalker) //7
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1456,-64,oCrabWalker) //8
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1392,128,oSineFaller) //9
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1504,128,oSineFaller) //10
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(1296,224,oSineFaller) //11
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1600,224,oSineFaller) //12
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1280,160,oSineFaller) //13
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1616,160,oSineFaller) //14
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    newEnemy=instance_create(1408,-16,oCrabWalker) //15
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //16
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1456,-96,oCrabWalker) //17
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1456,-224,oCrabWalker) //18
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1408,-16,oCrabWalker) //19
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //20
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    newEnemy=instance_create(1408,-16,oCrabWalker) //21
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //22
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=11
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=12
  {
    newEnemy=instance_create(1456,-32,oCrabWalker) //23
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1456,-64,oCrabWalker) //24
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=13
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=14
  {
    newEnemy=instance_create(1408,-16,oCrabWalker) //25
    newEnemy.bActive=true
    newEnemy.questType=2
    newEnemy=instance_create(1488,-16,oCrabWalker) //26
    newEnemy.bActive=true
    newEnemy.questType=2
    sceneProgress+=1
  }
  else if sceneProgress=15 and enemyCount=0
  {
    stringToShow="You can now gain Rave Energy by kicking ass."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),96,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=120
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=5
  }
}
if global.gameProgress>=6 and room=rIEF4 //room 4 platform
{
  if rm4Platform=0
  {
    mPlatform1=instance_create(664,192,oMovingPlatform)
    mPlatform1.xDir=0
    mPlatform1.yDir=0
    mPlatform1.shiftChange=48
    rm4Platform=1
  }
  else if rm4Platform=1 and global.switchTrigger[2]=1
  {
    mPlatform1.yVel=1
    mPlatform1.shiftTime=0
    rm4Platform=2
  }
}
else if global.gameProgress=8 and room=rIEF6 //boss fight (Displaced Cyborg)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=304
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
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I didn't expect you to just bash right through this place.#We figured you'd use a bit of stealth.",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Dude, I don't even know you, were you expecting someone else?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Don't play dumb, we know you're here to stop the projects our company has#been secretly working on.",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I really don't know what you're talking about. I'm just here to kick#your boss's ass for something he said earlier today.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Wait...you're not working with Them?",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Dude, I JUST told you what I'm here to do.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You have got to be kidding me...",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Whatever man, I'm kinda in a hurry, so would you please move?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("We can't take any chances. I'm going to have to put a stop to you.",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Awesome, bring it on then!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Your opponent will be this random, out of place, robot we made last year.",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Yeah, whatever. Just bring it anyway!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      boss=instance_create(496,304,oDCyborg)
      playSound(global.snd_BreakOut,0,1)
      effect_create_above(ef_smoke,boss.x,boss.y-24,2,c_gray)
      boss.sprite_index=sNeteryuArmOut
    }
    if sceneDelay>=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=15
  {
    sceneDelay+=1
    if sceneDelay=1
      boss.sprite_index=sNeteryuIdle
    if sceneDelay>=25 and sceneDelay<=57
      boss.y-=2
    if sceneDelay>=90
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("This will be enough for someone like you.",1,oMessageCutscene,"Random Engineer")
  else if sceneProgress=17
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      playSound(global.snd_BreakOut,0,1)
      effect_create_above(ef_smoke,npcEngineer.x,npcEngineer.y-24,2,c_gray)
      with npcEngineer
        instance_destroy()
    }
    if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("That guy doesn't know that I have the power of Awesome on my side.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Before you completely trash this thing, I need to warn you that Rave Mode cannot be#used during duels, aka boss battles. The reason is simple. In the slight off#chance that your opponent can also use Rave Mode, you wouldn't want to be doing#the same thing. Two Rave Modes at this proximity would be far too awesome#for the game engine to handle and thus the world would end.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Fine by me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21
  {
    oPlayer1.life=oPlayer1.maxLife
    playSound(global.snd_HealingPlant,0,1)
    effect=instance_create(oPlayer1.x,oPlayer1.y-(oPlayer1.sprite_height/2),oEffect)
    effect.sprite_index=sHeal
    sceneProgress+=1
  }
  else if sceneProgress=22
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Did you just randomly get healed?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Yes, but only because I'm bad ass.#Anyway, enough talking, this thing is going down!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("That's good because recovery items are locked during duels, aka boss fights.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      barrier1=instance_create(112,240,oBossBarrier)
      barrier2=instance_create(576,240,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=9
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="DCyborg"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=9 //boss fight ends (Displaced Cyborg)
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
      oPlayer1.x=352
      oPlayer1.y=305
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
    msgCreate("Nothing to it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Any idea what he was talking about?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("No, but it seems they're expecting someone to infiltrate.#It doesn't matter, the tower to the main office is up ahead.#We should be able to reach this guy in no time.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    global.gameProgress=10
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    global.gamePaused=false
    sceneProgress=0
  }
}
if global.gameProgress=11 and room=rIEF7 //random dialogue
{
  if sceneProgress=0
  {
    for (i=0;i<2;i+=1)
      charDialogue[i]=0
    sceneProgress+=1
  }
  if charDialogue[0]=0 and oPlayer1.y<=1648
  {
    stringToShow="I can tell this stretch is gonna suck."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]=1
  }
  if charDialogue[1]=0 and oPlayer1.y<=240
  {
    stringToShow="I'm gonna be pissed if I fall."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[1]=1
  }
  if charDialogue[1]=1 and oPlayer1.y>=464
  {
    stringToShow="DAMN IT!! Learn to control your jumps better!"
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[1]=2
  }
  if charDialogue[1]=2 and oPlayer1.y>=800
  {
    stringToShow="Dude, you suck."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),64,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[1]
    newMessage.fadingTime=120
    charDialogue[1]=3
  }
  else if charDialogue[1]=3 and sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if charDialogue[1]=3 and sceneProgress=2
  {
    stringToShow="Yeah yeah, the person controlling me just doesn't know what he/she is doing."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),320,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[1]=4
  }
}
if global.gameProgress=12 and room=rIEF8 //random dialogue
{
  if sceneProgress=0
  {
    for (i=0;i<1;i+=1)
      charDialogue[i]=0
    sceneProgress+=1
  }
  if charDialogue[0]=0 and oPlayer1.x>=96
  {
    stringToShow="Gotta love how these map edges have no consistency with the#ones they are connected to."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]=1
  }
  if charDialogue[0]=1 and oPlayer1.x>=832
  {
    stringToShow="I really hope this is the last map."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),56,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]=2
  }
}
else if global.gameProgress=13 and room=rIEF9 //the darkness comes
{
  if sceneProgress=0
  {
    if oPlayer1.x>=304
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
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Time to kick your sorry ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay=10
      npcCEO.image_xscale=-1
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You, what are you doing here?#Why the hell did you follow me to my corporate office?",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Dude, you said my favorite game was horrible.#Why WOULDN'T I be here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You came all the way here because of that?#All the while costing me thousands in property damage?!",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yep...also your company sucks anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You are SO sued!",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Can't you just send hordes of giant robots after me like all the others did?#That's far more fun.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I suppose I wouldn't be able to get anything from you, so maybe a#swift death would be appropriate.",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Hell yeah, now that's what I'm talking about!#Bring it!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      stopAllMusic()
      var tempMplay;
      tempMplay=global.msc_DarkEntity
      playMusic(tempMplay,0)
      shakeScreen=instance_create(oPlayer1.x,oPlayer1.y,oCutsceneShake)
      shakeScreen.shakePower=8
      view_object[0]=oCutsceneShake
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay>=30 and sceneDelay<=41
      shakeScreen.shakePower-=0.5
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Whatever you're sending out, it sounds awesome!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("This isn't me.",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Say what...?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      view_object[0]=oPlayer1
      with shakeScreen
        instance_destroy()
      screenFlash=1
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay=2
    {
      sLordX=320
      sLordY=128
      shroudLordPic[0]=instance_create(sLordX,sLordY,oMisc) //body
      shroudLordPic[0].sprite_index=sShroudLBody
      shroudLordPic[0].type=2
      shroudLordPic[1]=instance_create(sLordX,sLordY+40,oMisc) //head
      shroudLordPic[1].sprite_index=sShroudLHead
      shroudLordPic[1].image_speed=0.15
      shroudLordPic[1].type=1
      shroudLordPic[2]=instance_create(sLordX+88,sLordY-18,oMisc) //right arm
      shroudLordPic[2].sprite_index=sShroudLArm
      shroudLordPic[2].image_speed=0.1
      shroudLordPic[2].type=1
      shroudLordPic[3]=instance_create(sLordX-88,sLordY-18,oMisc) //left arm
      shroudLordPic[3].sprite_index=sShroudLArm
      shroudLordPic[3].image_xscale=-1
      shroudLordPic[3].image_speed=0.1
      shroudLordPic[3].type=1
    }
    else if sceneDelay>=3 and screenFlash>0
      screenFlash-=0.04
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
    if sceneDelay=10
      bLMove=true
    else if sceneDelay=35
      oPlayer1.sprite_index=sPlayerLookUp
  }
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What in the hell is that?",1,oMessageCutscene,"Random CEO")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Join us.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("For tickets to the next Disturbed concert, hell yeah I'd join you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("All will soon become part of the system.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("In that case...company benefits?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Irregularity discovered.#Destruction of the irregularity is inevitable.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("You may want to actually leave.#The darkness readings are off the scale.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("I'm not sure what you mean by that, but I'll take your word for it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("You will become part of the system.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=26
  {
    sceneDelay+=1
    if sceneDelay=1
      bLMove=false
    else if sceneDelay=16
    {
      shroudLordPic[2].sprite_index=sShroudLArmFist
      shroudLordPic[2].image_speed=0.8
    }
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Your hand is spazzing out there, you gonna be okay?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Distortion Phase commencing. Anomally will be removed!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("Say what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=30
  {
    sceneDelay+=1
    if sceneDelay=1
      bLMove=false
    else if sceneDelay=16
      shroudLordPic[2].sprite_index=sShroudLArmUp
    else if sceneDelay=40
    {
      bPortalOpen=true
      //playSound(global.snd_WorldPortal,1,1,2500)
    }
    else if sceneDelay=50
      oPlayer1.sprite_index=sPlayerChestHit
    else if sceneDelay>=55
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("WHOA!! What is this!?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=32
  {
    sceneDelay+=1
    if sceneDelay=5
      portalSize=1
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("The anomaly will be removed!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=34
  {
    sceneDelay+=1
    if sceneDelay=5
      portalSize=2
    else if sceneDelay=15
      bPhaseEffect=true
    else if sceneDelay>=65
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("What the heck is happening?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=36
  {
    if screenFlash>=1
    {
      sceneDelay+=1
      if sceneDelay=1
      {
        stopAllMusic()
        //SS_StopSound(global.snd_WorldPortal)
        bPhaseEffect=false
        oPlayer1.life=oPlayer1.maxLife
        writeToPlayerGlobals()
        room_goto(rDonutPlains1)
      }
    }
    else
      screenFlash+=0.02
  }

  if bPhaseEffect=true //phase effect (blend mode: add)
  {
    phaseTime+=1
    if phaseTime=3
    {
      phaseDistort=round(random(10))
      phaseTime=0
    }
    if phaseDistort>7
      draw_set_blend_mode(bm_add)
    else
      draw_set_blend_mode(bm_normal)
  }
  if bPortalOpen=true //portal effect
  {
    if portalSize=2
      effect_create_above(ef_firework,oPlayer1.x,oPlayer1.y-27,0,c_black)
    effect_create_above(ef_flare,oPlayer1.x,oPlayer1.y-27,portalSize,c_purple)
    if portalSize>=1
      effect_create_above(ef_flare,oPlayer1.x,oPlayer1.y-27,0,c_aqua)
  }
  if bLMove=true //move Shroud Lord pic
  {
    sLordMoveTime+=1
    if sLordMoveTime>=1 and sLordMoveTime<=21
      sLordMove-=0.04
    else if sLordMoveTime>=22 and sLordMoveTime<=42
      sLordMove+=0.04
    else if sLordMoveTime>=52 and sLordMoveTime<=72
      sLordMove+=0.04
    else if sLordMoveTime>=73 and sLordMoveTime<=93
      sLordMove-=0.04
    else if sLordMoveTime>=103
      sLordMoveTime=0
    for (i=0;i<4;i+=1)
      shroudLordPic[i].y+=sLordMove
  }
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=4 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+372,view_yview[0]+68,"Bad Guys Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
else if global.gameProgress=9
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
else if global.gameProgress=13
{
  draw_set_alpha(screenFlash)
  draw_set_color(c_white)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
