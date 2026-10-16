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
if global.gameProgress=129
{
  discombobulateY=oPlayer1.y-384
  discomFrame=0
  oPlayer1.visible=false
  oPlayer1.image_speed=0.1
}
if room=rMetropolisM4
{
  autoScroll=instance_create(0,room_height-(view_hview[0]/2)+32,oMisc)
  autoScroll.type=0
  autoScroll.sprite_index=sNull
  view_object[0]=autoScroll
}
else if room=rCutscene1
{
  bossFinishFadeAlpha=1
  fadeColor=c_black

  npcInformant=instance_create(288,352,oMisc)
  npcInformant.sprite_index=sInformantIdle
  npcInformant.image_speed=0
  npcInformant.image_xscale=1
  npcInformant.type=1

  npcSyrus=instance_create(384,289,oMisc)
  npcSyrus.sprite_index=sSyrusHangRestrain
  npcSyrus.image_xscale=-1
  npcSyrus.type=1
}
else if room=rCutscene2
{
  bossFinishFadeAlpha=1
  fadeColor=c_black

  npcX=instance_create(room_width+48,304,oMisc)
  npcX.sprite_index=sMegamanXDash
  npcX.image_xscale=-1
  npcX.type=1

  block[0]=tile_add(tileMMfort1,32,0,32,32,448,240,100000)
  block[1]=tile_add(tileMMfort1,32,0,32,32,448,272,100000)
  block[2]=tile_add(tileMMfort1,32,0,32,32,480,240,100000)
  block[3]=tile_add(tileMMfort1,32,0,32,32,480,272,100000)
}
else if room=rGyroL3
{
  autoScroll=instance_create(view_wview[0]/2-16,0,oMisc)
  autoScroll.type=0
  autoScroll.sprite_index=sNull
  view_object[0]=autoScroll
}
else if global.gameProgress=141 and room=rFortL1_6
  blendColor=0
else if room=rFortL2_3 or room=rFortL2_4
{
  lightFlash=0
  bLightOn=false
  if room=rFortL2_3
    xPos=3008
  else if room=rFortL2_4
  {
    xPos=32
    if global.gameProgress<=149
    {
      npcCopyX=instance_create(592,320,oMisc)
      npcCopyX.sprite_index=sMegamanXIdle
      npcCopyX.image_xscale=1
      npcCopyX.type=1
    }
  }
  yPos=224
}
else if room=rMaverickFactory2
{
  //****************************** SPIKE SET 1 ******************************
  movePlatform=instance_create(1056,320,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-144
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-144
  }
  //****************************** SPIKE SET 2 ******************************
  movePlatform=instance_create(1312,352,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=-4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-112
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-112
  }
  //****************************** SPIKE SET 3 ******************************
  movePlatform=instance_create(1312,320,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-144
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-144
  }
  //****************************** SPIKE SET 4 ******************************
  movePlatform=instance_create(1568,352,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=-4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-112
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-112
  }
  //****************************** SPIKE SET 5 ******************************
  movePlatform=instance_create(1568,320,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-144
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-144
  }
  //****************************** SPIKE SET 6 ******************************
  movePlatform=instance_create(1824,352,oMovingPlatform)
  movePlatform.visible=false
  movePlatform.xDir=-4
  movePlatform.yDir=0
  movePlatform.shiftChange=64
  var spikeX,spikeY;
  spikeX=-64
  spikeY=-112
  for(i=0;i<6;i+=1)
  {
    for(ii=0;ii<3;ii+=1)
    {
      followSpike=instance_create(0,0,oStaticSpike)
      followSpike.idFollow=movePlatform
      followSpike.xFollow=spikeX
      followSpike.yFollow=spikeY
      spikeY+=16
    }
    spikeX+=16
    spikeY=-112
  }
}
else if room=rMaverickFactory3 and global.MMnapalmProg<=7
{
  npcZero=instance_create(416,320,oMisc)
  npcZero.sprite_index=sMMzeroIdle
  npcZero.image_xscale=-1
  npcZero.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=129 //intro to Metropolis
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    if sceneDelay=30
    {
      readyText=instance_create(256,192,oMisc)
      readyText.type=0
      readyText.sprite_index=sNull
      readyText.readyWidth=0
      readyText.progress=0
    }
    else if sceneDelay=121
    {
      with readyText
        instance_destroy()
    }
    else if sceneDelay>=150
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if discombobulateY>=oPlayer1.y
    {
      discomFrame=1
      sceneDelay+=1
      if sceneDelay>=3
      {
        oPlayer1.visible=true
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else
      discombobulateY+=16
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=15
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("So the objective is to save X.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Yes, and I've hacked into X's data.#I gave you something that will only work in this area.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What is it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It is X's Buster Cannon. It has all the same advantages and drawbacks#the original has. At this time, you cannot charge it. However,#your 'Wave of Awesome' simulates many of X's attacks and could be#very useful here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I'll keep that in mind.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Also, note that I've put you right in the middle of a factory in#this city. It's the closest entry-point I could find to X.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Awesome, that means I'm trespassing somewhere and all guns are going#to be pointed at me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10
  {
    global.gameProgress=130
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Metropolis"
    global.gamePaused=false
  }
}
else if room=rMetropolisM4 and global.gamePaused=false //autoscroll up
{
  if autoScroll.y>192
    autoScroll.y-=1
  if autoScroll.y+(view_hview[0]/2)+48<oPlayer1.y
    oPlayer1.life-=oPlayer1.maxLife
}
else if room=rCutscene1 //cutscene - Syrus and The Informant
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=45
    {
      bossFinishFadeAlpha-=0.01
      if bossFinishFadeAlpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Jerry has gotten into the city, and is quick I must say, but it does not matter.#We have X now thanks to him, and saving him would be pointless,#not that he'll be able to.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Why did X possess such a threat in the first place?#What's so important with him?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It is not X himself, but that The Darkness was unable to locate him.#We cannot have any uprisings can we?#X was merely the last of them, his abilities made him able to avoid the initial phase.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Jerry will save him.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It wouldn't matter at this point if he did.#The Darkness already has what it needs.#Besides, Xs hiding place has been found, he has no where to run now.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I don't understand it Gene, why did you turn against us?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That is no longer who I am. He died that day.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Whatever, but WHY?!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("If you had seen what I have,#you would understand that The Darkness cannot be stopped.#It grows every second, and there is not a thing you,#your friend, nor I can do.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("It is only using you, The Darkness does not value your life!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I am aware of this, but it is far better than the fate you and everyone else will face.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("You're a coward, you should be fighting with us!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Say what you want, it changes nothing.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("What is it?... What is The Darkness?#What makes it so unstoppable?!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("The Darkness...",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=17
  {
    sceneDelay+=1
    if sceneDelay=71
      npcInformant.sprite_index=sInformantEye
    else if sceneDelay=78
      npcInformant.image_index=1
    else if sceneDelay=85
      npcInformant.image_index=2
    else if sceneDelay=92
      npcInformant.image_index=3
    else if sceneDelay=99
      npcInformant.image_index=4
    else if sceneDelay=120
      npcInformant.image_index=3
    else if sceneDelay=130
      npcInformant.image_index=4
    else if sceneDelay=140
      npcInformant.image_index=3
    else if sceneDelay=150
      npcInformant.image_index=4
    else if sceneDelay=160
      npcInformant.image_index=3
    else if sceneDelay=167
      npcInformant.image_index=2
    else if sceneDelay=174
      npcInformant.image_index=1
    else if sceneDelay=181
      npcInformant.image_index=0
    else if sceneDelay=188
      npcInformant.sprite_index=sInformantIdle
    else if sceneDelay>=240
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("It is a vast neural network.#Capable of highly sophisticated logic, able to modify its own behavior and structure.#Understanding of abstract thought and able to analyze anything within its control.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("It's... a program?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("When you break it down, yes.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Bull, I have seen it manifest itself in physical forms plenty of times!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("That's one of the many things it has learned.#And really now, look where we are.#Do you think the normal rules of logic apply here?",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("That's impossible, how do you explain us here?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("The Phase Distortion.#Even I do not understand it completely myself.#All I know is we were not originally intended to be part of this.#However, it became necessary.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Necessary?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("It could not have anyone getting in the way of its plans.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("If that is true, it must have a place it is stored.#All we need to do is find it!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("You do not understand. There is no core to this, no physical location.#It is everywhere and in everything,#even if someone were to tamper with its core functions,#it would simply rewrite itself to disallow that process again.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("But someone still designed it.#Who were they?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Like I know, it keeps that information locked away.#From what I have gathered, it was intended to create.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("That's too vague. Create what?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("What you see here, this world.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("Then... what does it want?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Those Muffins.#I'm uncertain why myself, and if I did, that is not something I would share with you.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("We WILL find a way to stop it!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=36
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      bossFinishFadeAlpha+=0.01
      if bossFinishFadeAlpha>=0.4
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=37
  {
    sceneDelay+=1
    if sceneDelay=20
      npcInformant.sprite_index=sInformantHoldHat
    else if sceneDelay>=80
    {
      bossFinishFadeAlpha-=0.01
      if bossFinishFadeAlpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=38
  {
    sceneDelay+=1
    if sceneDelay=30
      npcInformant.sprite_index=sInformantIdle
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("What now?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("It seems The Darkness has had a change of heart.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("How comforting, but what the hell does that mean?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("It simply means The Darkness has come up with a brilliant idea.#Jerrys attempts at stopping us will be futile!#He was merely a small mishap, things are going according to plan.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("Please don't start monologging.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("Shut it! You're in no position to mock me.#Exciting times are ahead of us!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=45
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      bossFinishFadeAlpha+=0.01
      if bossFinishFadeAlpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=46
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      global.gamePaused=false
      transition_steps=30
      transition_kind=21
      room_goto(rMetropolisT1)
    }
  }
}
else if global.gameProgress=132 and room=rMetropolisStageSelect //stage select
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
    msgCreate("I don't think I have to tell you what's going on here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I think you should anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Or not.#Just go and do this and I'll help when I can.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("They were cheap here, there's only four.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Oh, one other thing, I've set this as your new start location.#You will come here when you come to Metropolis from the map.#You can use that door on the left to go back to the Factory.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6
  {
    global.gameProgress=133
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rNapalmL3 and global.MMnapalmProg=2 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=3136
    {
      global.teleportEnabled=1
      var yPos;
      yPos=0
      for(i=0;i<6;i+=1)
      {
        newBarrierL=instance_create(2848,yPos,oEventBarrier)
        newBarrierR=instance_create(3408,yPos,oEventBarrier)
        yPos+=64
      }
      enemyCount=12
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
    var yPos;
    yPos=96
    for(i=0;i<2;i+=1) //4
    {
      newEnemy=instance_create(2816,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      newEnemy=instance_create(3440,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      yPos+=96
    }
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=120
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    var yPos;
    yPos=96
    for(i=0;i<2;i+=1) //8
    {
      newEnemy=instance_create(2816,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      newEnemy=instance_create(3440,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      yPos+=96
    }
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay>=120
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    var yPos;
    yPos=96
    for(i=0;i<2;i+=1) //12
    {
      newEnemy=instance_create(2816,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      newEnemy=instance_create(3440,yPos,oPukaperry)
      newEnemy.bActive=true
      newEnemy.questType=1
      yPos+=96
    }
    sceneProgress+=1
  }
  else if sceneProgress=7 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.MMnapalmProg=3
  }
}
else if room=rGyroL3 and global.gamePaused=false //autoscroll right
{
  if autoScroll.x<4880
    autoScroll.x+=2.25
  if autoScroll.x-(view_wview[0]/2)-20>oPlayer1.x
    oPlayer1.life-=oPlayer1.maxLife
}
else if room=rCutscene2 //cutscene - X escapes
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      bossFinishFadeAlpha-=0.01
      if bossFinishFadeAlpha<=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay mod 4=0 and sceneDelay<=46
    {
      playSound(global.snd_CASdie,0,1)
      explosion=instance_create(448+random(64),240+random(64),oEffect)
      explosion.sprite_index=sBomberExplosion
      explosion.image_speed=0.5
    }
    if sceneDelay=43
    {
      playSound(global.snd_CASdie,0,1)
      explosion=instance_create(480,272,oEffect)
      explosion.sprite_index=sBomberExplosion
      explosion.image_speed=0.5
      explosion.image_xscale=2
      explosion.image_yscale=2
    }
    if sceneDelay=46
    {
      for(i=0;i<4;i+=1)
      {
        tile_delete(block[i])
      }
    }
    if sceneDelay>=105
    {
      npcX.x-=12
      if npcX.x<400
      {
        npcX.sprite_index=sMegamanXIdle
        sceneDelay=0
        sceneProgress+=1
      }
    }
    if sceneDelay=108
    {
      var tempMplay;
      tempMplay=global.msc_MMxTheme
      playMusic(tempMplay,0)
    }
  }
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Did they seriously think they could keep me captive for too long?",1,oMessageCutscene,"X")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("It doesn't really matter, I know what needs to be done now.#I'll take care of him before he becomes a further problem.",1,oMessageCutscene,"X")
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay>=20
    {
      npcX.sprite_index=sMegamanXDash
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7
  {
    bossFinishFadeAlpha+=0.01
    if bossFinishFadeAlpha>=1
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    if global.optMusic=true
      sound_stop(global.msc_MMxTheme)
    global.gameProgress=134
    sceneProgress=0
    global.gamePaused=false
    transition_steps=30
    transition_kind=21
    room_goto(rMetropolisStageSelect)
  }

  if sceneProgress>=7
    npcX.x-=12
}
else if global.gameProgress=135 and room=rFortL1_1 //intro to fortress level
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
    msgCreate("X is here in this factory.#I'm analyzing this place and there are some really weird things going on.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Anything I should be worried about?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("X has moved.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("They must be transporting him somewhere.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("That and I'm picking up a second signal.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("From X?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yes, I'm seeing two of him, they are not completely identical.#But close enough.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I'm guessing they are trying to throw us off.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("The two signals are fairly close in proximity.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Well seeing as there is only one path, I guess I'll get moving.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("OH!!#There is one more important detail I need to mention...#You'll LOVE this!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("No I won't.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Mental Insurrection is ineffective on the robots here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("You're lying.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Have I ever?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("... ... ...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I hate you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("It's not my fault.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I'm blaming you anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20
  {
    global.gameProgress=136
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=141 and room=rFortL1_6 //Boss Fight (King Mech)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=240
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      stopAllMusic()
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
      boss=instance_create(416,304,oKingMech)
      boss.image_xscale=-1
      boss.image_blend=make_color_rgb(blendColor,blendColor,blendColor)
    }
    else if sceneDelay>=16
    {
      if blendColor<255
        blendColor+=2.5
      else
      {
        global.currentBoss="King Mech"
        var tempMplay;
        tempMplay=findMusic()
        playMusic(tempMplay,0)
        sceneDelay=0
        sceneProgress+=1
      }
      boss.image_blend=make_color_rgb(blendColor,blendColor,blendColor)
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I wasn't expecting this all.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It's just big, that's not necessarily a bad thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("That's easy for you to say!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      instance_activate_object(oObjectDispenser)
      newBarrierL1=instance_create(112,208,oBossBarrier)
      newBarrierR1=instance_create(544,208,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=142
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=142 //boss fight ends (King Mech)
{
  if sceneProgress=0 and enemyCount=0
  {
    global.gamePaused=true
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    with oEProjectileBase
      instance_destroy()
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    var ranX,ranY;
    sceneDelay+=1
    if sceneDelay mod 3=0 and sceneDelay<75
    {
      playSound(global.snd_CASdie,0,1)
      ranX=(oKingMech.x-(oKingMech.sprite_width/2))+random(oKingMech.sprite_width)
      ranY=(oKingMech.y-oKingMech.sprite_height)+random(oKingMech.sprite_height)
      effect=instance_create(ranX,ranY,oEffect)
      effect.sprite_index=sBomberExplosion
    }
    if sceneDelay=75
      playSound(global.snd_EnemyDie,0,1)
    if sceneDelay>=75
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
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      with oPlatformTouch
        instance_destroy()
      oPlayer1.x=336
      oPlayer1.y=304
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
    msgCreate("Not necessarily a bad thing he says.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You look fine to me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Did you see how many guns and explosives that thing had?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I had them analyzed before you even saw them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Yeah well... I'm just gonna go save X now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10
  {
    instance_deactivate_object(oObjectDispenser)
    global.gameProgress=143
    global.currentBoss=""
    var tempMplay;
    tempMplay=global.msc_MMfort2
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=144 and room=rFortL2_1 //oh no, there's more
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
    msgCreate("Oh my God no... just... no, WHY?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Why is there more?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Because you... nevermind.#X is VERY close. Both of the signals are.#I don't like this, stay on your toes.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Just no more spikes. PLEASE!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.gameProgress=145
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=148 and room=rFortL2_4 //X is close
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
    msgCreate("X is in this room, but this isn't the holding cells.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Maybe he broke out.#Last time I checked, X was pretty bad ass.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Possible. But either way, go find him so I can get you two out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4
  {
    global.gameProgress=149
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=149 and room=rFortL2_4 //Boss Fight (Copy X)
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
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Dude X, you did get out!#Well that makes things easier.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3
  {
    sceneDelay+=1
    if sceneDelay=3
      npcCopyX.image_xscale=-1
    else if sceneDelay=50
    {
      npcCopyX.sprite_index=sMegamanXAim
      stopAllMusic()
    }
    else if sceneDelay>=85
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Whoa X, I hope you're playing around!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("This is for the better.",1,oMessageCutscene,"X?")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What are you talking about?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      chargeEffect=instance_create(npcCopyX.x,npcCopyX.y-17,oMisc)
      chargeEffect.sprite_index=sMMcharging
      chargeEffect.type=1
    }
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("What the hell X?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      npcX=instance_create(96,320,oMisc)
      npcX.sprite_index=sMegamanXDash
      npcX.type=1
      
      xBlast=instance_create(npcCopyX.x-8,npcCopyX.y-17,oMisc)
      xBlast.sprite_index=sTechWoA_N
      xBlast.image_angle=180
      xBlast.image_speed=0.5
      xBlast.type=1
      with chargeEffect
        instance_destroy()
    }
    else if sceneDelay>=10
    {
      npcX.x+=17.5
      xBlast.x-=9
      if npcX.x>=416
      {
        oPlayer1.sprite_index=sPlayerGuard
        effect=instance_create(npcX.x,npcX.y-17,oEffect)
        effect.sprite_index=sBomberExplosion
        npcX.sprite_index=sMegamanXAim
        with xBlast
          instance_destroy()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=20
    {
      npcCopyX.sprite_index=sMegamanXIdle
      var tempMplay;
      tempMplay=global.msc_MMxTheme
      playMusic(tempMplay,0)
    }
    if sceneDelay>=45
    {
      oPlayer1.sprite_index=sPlayerIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("What the hell?#There's... 2 of them!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("That is a copy of me.",1,oMessageCutscene,"X")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("How did this come about?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("It's the Dark...",1,oMessageCutscene,"X")
  else if sceneProgress=15
  {
    sceneDelay+=1
    if sceneDelay=5
      npcX.sprite_index=sMegamanXKneel
    if sceneDelay>=30
    {
      oPlayer1.sprite_index=sPlayerDuck
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Are you okay X?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I'll be fine, but it put something into that blast#that is crippling me.",1,oMessageCutscene,"X")
  else if sceneProgress=18
  {
    sceneDelay+=1
    if sceneDelay=20
      oPlayer1.sprite_index=sPlayerIdle
    if sceneDelay>=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Then you take it easy for a moment X.#I'll handle him.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Be careful, not only can it copy my abilities,#The Darkness can modify them to suit its own purpose.",1,oMessageCutscene,"X")
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Duly noted X.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("As for you, your ass is going down!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23
  {
    sceneDelay+=1
    if sceneDelay>=1 and sceneDelay<=60
      fadeVolume(global.msc_MMxTheme,150)
    if sceneDelay=65
    {
      with npcCopyX
        instance_destroy()
      newBarrier=instance_create(240,256,oBossBarrier)
      boss=instance_create(592,320,oCopyX)
      boss.image_xscale=-1
      view_object[0]=noone
      view_xview[0]=208
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=150
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Copy X"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=150 //boss fight ends (Copy X)
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
      oPlayer1.x=432
      oPlayer1.y=320
      view_object[0]=oPlayer1
      oPlayer1.image_xscale=1
      with oMisc
        instance_destroy()
      npcX=instance_create(496,320,oMisc)
      npcX.sprite_index=sMegamanXIdle
      npcX.image_xscale=-1
      npcX.type=1
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
      fadeColor=c_black
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Kicked its ass? I would say YES!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("That was quite a feat you just pulled off.#I'm impressed.",1,oMessageCutscene,"X")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It comes naturally.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Like your ability to piss off women.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I think it's time to move on.#So... X, what happened here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("As you have just seen, The Darkness can duplicate our data.#It can copy everything about us and then use that data and modify it.#Luckily the only thing it can't replicate perfectly is who the person is,#it must monitor the subject first for that. However, it seems hell-bent on#just destroying us completely, so that is not an issue it seems.",1,oMessageCutscene,"X")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("This explains Dark Mind and Meta-Knight, as well as that guy in the Dusty Ruins.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("They can't copy us just by watching us can they?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("It appears they cannot. They had me hooked up to some device.#I blew it away before I escaped.",1,oMessageCutscene,"X")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Speaking of that, how DID you escape?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("... ... ...",1,oMessageCutscene,"X")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("I'm guessing I should know this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I'm X, how WOULDN'T I escape?",1,oMessageCutscene,"X")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("You make a good point.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I was also able to intercept a message.#Your friend in the Black Rock Fortress must have been#able to sneak it out.",1,oMessageCutscene,"X")
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("I gotta hear this then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.02
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=22
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Those Muffins.#I'm uncertain why myself, and if I did, that is not something I would share with you.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("We WILL find a way to stop it!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=25
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.02
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=26
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("It cuts out after that.",1,oMessageCutscene,"X")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("So wait...#The Darkness is... just a program?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("I should have figured this out sooner.#It's all making some sense now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("I'm kinda following this, but how would we stop this thing?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("I don't know, but from what I just heard and the data I hacked from Distortion,#it was meant to manage and control a large amount of data.#I think we will find more answers in the Black Rock Fortress.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Which reminds me, take this.#It will get you through the barrier surrounding it.",1,oMessageCutscene,"X")
  else if sceneProgress=33 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate("You obtained:#Seal Decoder",1,oMessageCutscene,"")
  }
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("What will you do now X?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("I will watch from afar.#I will be far more useful if I continue to investigate all I can about The Darkness.",1,oMessageCutscene,"X")
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("Be careful then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("I will, and we will meet again, I assure you of that.",1,oMessageCutscene,"X")
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Before you go, there is one thing that needs to be done that hasn't been done yet.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("I know what you are talking about.",1,oMessageCutscene,"X")
  else if sceneProgress=40
  {
    sceneDelay+=1
    if sceneDelay=30
    {
      var tempMplay;
      tempMplay=global.msc_MMvictory
      playMusic(tempMplay,0,1)
    }
    else if sceneDelay=200
    {
      npcX.sprite_index=sMegamanXWin
      chargeEffect=instance_create(npcX.x-2,npcX.y-35,oEffect)
      chargeEffect.sprite_index=sMMwin
      chargeEffect.image_speed=0.5
    }
    else if sceneDelay=225
    {
      npcX.sprite_index=sPlayerDiscombobulate
      npcX.image_speed=0
    }
    else if sceneDelay>=226
    {
      npcX.y-=16
      if npcX.y<=-16
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=41
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("I had that coming after making that spike joke at him.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("I fully agree.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("You would.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("Anyway, I've marked the location of the Black Rock Fortress.#I sure hope you're ready for this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=46
  {
    exitPortal=instance_create(608,288,oDungeonPortal)
    exitPortal.toRoom=rWorldMap
    exitPortal.newMapX=320
    exitPortal.newMapY=272
    global.gameProgress=151
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.MMnapalmProg=7 and room=rMaverickFactory3 //Boss Fight (Wild Skull Machine)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=256
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      stopAllMusic()
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
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Extra stages aren't supposed to have boss fights.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Is it a rule somewhere?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I just don't want to fight Zero.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay=15
    {
      boss=instance_create(416,-240,oWildSkullMachine)
      boss.image_xscale=-1
    }
    else if sceneDelay>=16 and sceneDelay<=35
    {
      boss.y+=24
    }
    else if sceneDelay=36
    {
      playSound(global.snd_CASdie,0,1)
      effect=instance_create(npcZero.x,npcZero.y-16,oEffect)
      effect.sprite_index=sBomberExplosion
      with npcZero
        instance_destroy()
    }
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Hey look, you don't have to fight Zero!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That is so not funny.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrierL1=instance_create(112,256,oBossBarrier)
      newBarrierR1=instance_create(512,256,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.MMnapalmProg=8
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Wild Skull Machine"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.MMnapalmProg=8 //boss fight ends (Wild Skull Machine)
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
      oPlayer1.x=336
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
      fadeColor=c_black
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Did you see what the reward was for beating it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Kinda.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I already know, it's pretty awesome.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8
  {
    global.MMnapalmProg=9
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
if global.gameProgress=129
{
  if sceneDelay>=30 and sceneDelay<=120
  {
    with readyText
    {
      draw_sprite_part(sText_Ready,-1,0,0,readyWidth,14,x,y)
      if progress=0
      {
        if readyWidth<39
          readyWidth+=1
        else
          progress+=1
      }
      else if progress>=1
      {
        progress+=1
        if progress mod 10=0
          if readyWidth=39
            readyWidth=0
          else
            readyWidth=39
      }
    }
  }
  if sceneProgress=1
    draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
}
if room=rCutscene1
{
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_line_width(384,208,384,240,2)
}
if room=rFortL2_3 or room=rFortL2_4
{
  lightFlash+=1
  if lightFlash mod 10=0
  {
    if bLightOn=false
      bLightOn=true
    else
      bLightOn=false
  }
  if bLightOn=true
  {
    draw_set_alpha(1)
    draw_set_color(make_color_rgb(252,216,168)) //3008,240 -- 14,7 - 6
    draw_line(xPos+14,yPos+7,xPos+19,yPos+7)
    draw_line(xPos+13,yPos+10,xPos+18,yPos+10)
    draw_set_color(make_color_rgb(254,254,254))
    draw_line_width(xPos+13,yPos+9,xPos+20,yPos+9,2)
  }
}
