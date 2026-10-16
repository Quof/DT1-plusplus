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

//background scroll type
backIndex=0
if room=rDataSegment8
{
  backScrollType=1
  backIndex=1
}
else if room=rDS_1_1 or room=rDS_1_2 or room=rDS_1_3 or room=rDS_2_1 or room=rDS_2_2 or room=rDS_2_3 or room=rDS_3_1 or room=rDS_3_2 or room=rDS_3_3 or room=rDataSegment9 or room=rDataSegment10 or room=rDataSegment11 or room=rDataSegment12 or room=rDataSegment13 or room=rDataSegment14 or room=rDataSegment15 or room=rDataSegment17 or room=rDataSegment18
{
  backScrollType=2
  backIndex=1
}
else if room=rDataSegment20
{
  backScrollType=2
  backIndex=2
}
else
  backScrollType=0
backScrollTime=0

//room utility stuff
if room=rDataSegment5
  bStarted=0
else if room=rDataSegment12
{
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(848,192,oRotoDisc)
    newTrap[i].swingSpeed=1.8
    newTrap[i].dir=i*45
    newTrap[i].spinDist=96
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(2480,208,oRotoDisc)
    newTrap[i].swingSpeed=1.8
    newTrap[i].dir=i*45
    newTrap[i].spinDist=96
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(2752,208,oRotoDisc)
    newTrap[i].swingSpeed=-1
    newTrap[i].dir=i*45
    newTrap[i].spinDist=96
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(3360,192,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*45
    newTrap[i].spinDist=96
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(3488,208,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*45
    newTrap[i].spinDist=96
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(4592,144,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*45
    newTrap[i].spinDist=72
  }
}
else if room=rDataSegment16
{
  for(i=0;i<7;i+=1)
  {
    newTrap[i]=instance_create(512,144,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*51
    newTrap[i].spinDist=96
  }
  for(i=0;i<7;i+=1)
  {
    newTrap[i]=instance_create(736,144,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*51
    newTrap[i].spinDist=96
  }
  for(i=0;i<7;i+=1)
  {
    newTrap[i]=instance_create(1752,568,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*51
    newTrap[i].spinDist=128
  }
}
else if room=rDataSegment17
{
  for(i=0;i<4;i+=1)
  {
    newTrap[i]=instance_create(2112,256,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*90
    newTrap[i].spinDist=96
  }
  for(i=0;i<4;i+=1)
  {
    newTrap[i]=instance_create(2624,256,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*90
    newTrap[i].spinDist=96
  }
}
else if room=rDataSegment18
{
  for(i=0;i<6;i+=1)
  {
    newTrap[i]=instance_create(2272,192,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*60
    newTrap[i].spinDist=128
  }
  for(i=0;i<6;i+=1)
  {
    newTrap[i]=instance_create(3296,128,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*60
    newTrap[i].spinDist=176
  }
  for(i=0;i<6;i+=1)
  {
    newTrap[i]=instance_create(3712,128,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*60
    newTrap[i].spinDist=176
  }
}
else if room=rDataSegment20 and global.gameProgress<=320
{
  npcArtist=instance_create(400,192,oMisc)
  npcArtist.sprite_index=sTheArtistIdle
  npcArtist.image_xscale=-1
  npcArtist.image_speed=0
  npcArtist.type=1

  newLshackle=instance_create(400,180,oMisc)
  newLshackle.sprite_index=sLightShackles
  newLshackle.image_speed=0.25
  newLshackle.image_alpha=0.75
  newLshackle.type=1
  newLshackle=instance_create(400,156,oMisc)
  newLshackle.sprite_index=sLightShackles
  newLshackle.image_speed=0.25
  newLshackle.image_alpha=0.75
  newLshackle.type=1

  chooseTime=450
  choiceMade=0
}
else if room=rDS_3_2
  platCheck=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=282 //intro to Secured Data Segment
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
    msgCreate("I'm really nervous.#We're really going to do this aren't we?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Just remember I'm backing you up.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Yeah... I've never thanked you for everything you've been doing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Save it, we're not done yet.#Just don't give up now, we're so close.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Yeah, I won't.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Also, I'll try to get some sort of portal system going for you.#Just do your thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Okay... here we go.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    global.gameProgress=283
    sceneProgress=0
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Secured Data Segment"
    global.gamePaused=false
  }
}
else if global.gameProgress=284 //about the color wheels
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
    msgCreate("What's with that spinning thing and those colored zones?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Glad you asked, I was about to stop you to tell you about them.#Listen carefully, this is important.#When you see those things start to spin faster, they will give off a color.#Watch it carefully, it will project an image of itself three times.#If you are not within a color field that matches the color that the#spinning wheels give off by the end of the third projection,#you will be in for a huge world of hurt.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("So basically, get into a matching color field.#I can do that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It's important that you do.#Barriers and dashing will not protect you from them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    global.gameProgress=285
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=286 //more about the color wheels
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
    msgCreate("I need to tell you more about those color wheels.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Okay, what's up?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You've seen how they cycle through the elements in a specific order,#and you might have figured out the timing. The timing however,#can change per room.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("That's going to suck.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Yeah, just be careful and watch those things.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6
  {
    global.gameProgress=287
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=288 //Hexor
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
    msgCreate("You shouldn't be here.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Whoa, how did you get out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I was released when The Artist came into this place.#So many things are unlocked for The Darkness now.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You're not stopping us.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I don't know what it is you're attempting,#I assume you want to rescue The Artist.#Regardless, I will only watch.#",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("How kind of you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It's not like you two can do much here,#you're in a place The Darkness has more control of.#I don't quite understand why it hasn't already stopped you.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I think these color wheel traps are an attempt, wouldn't you say?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Oh those... It's just scrambling data.#It seems " +string(global.mainCharacters[1]) +string(" has the safe areas color coded for you.#Do as you want, I think it will be humorous to watch you fail."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Whatever.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11
  {
    global.gameProgress=289
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=290 //large Phase Distortion
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
    msgCreate("The Darkness has sent out a Phase Distortion large enough to cover#the entire world. I would advise against attempting to shut it down.#All of those caught in it are secured, The Darkness isn't making#another mistake like it did with you.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It doesn't change what we're going to do.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Your persistence is admirable, but you won't succeed.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("We'll just see about that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.gameProgress=291
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=292 //The Artist
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
    msgCreate("Rescuing The Artist at this point won't do anything.#All the necessary data has been collected.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Then you don't know what we're doing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Yes, I already stated that.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4
  {
    global.gameProgress=293
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rDataSegment6 and global.gameProgress=293 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=2432
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(1968,256,oEventBarrier)
      newBarrierR=instance_create(2880,256,oEventBarrier)
      enemyCount=8
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    newEnemy=instance_create(2192,112,oBombTurret) //1
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2326,96,oBombTurret) //2
    newEnemy.bActive=true
    newEnemy.eType=2
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2512,96,oBombTurret) //3
    newEnemy.bActive=true
    newEnemy.eType=3
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2656,112,oBombTurret) //4
    newEnemy.bActive=true
    newEnemy.eType=4
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=300
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    newEnemy=instance_create(2320,232,oBombTurret) //5
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2544,232,oBombTurret) //6
    newEnemy.bActive=true
    newEnemy.eType=2
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2032,192,oBombTurret) //7
    newEnemy.bActive=true
    newEnemy.eType=3
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2800,192,oBombTurret) //8
    newEnemy.bActive=true
    newEnemy.eType=4
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=4 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=294
  }
}
else if global.gameProgress=295 //Checkpoint Portal room
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
    msgCreate("This is a portal room.#If you ever need to leave this place,#you can warp directly to this room.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Works for me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3
  {
    global.stockWeaponGem+=1
    global.stockRing+=2
    global.gameProgress=296
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=297 //Portal room
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
    msgCreate("Eh?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("The Darkness decided to use extra security.#You're gonna need to bring this lock down.#It's seperated into 3 parts, though the data in these is very scrambled.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Scrambled?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You'll see.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("It's kind of like what we saw in the Old Castle or on the train.#You'll see what I mean in a moment.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6
  {
    global.gameProgress=298
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rDS_1_3 and global.VDportals[0]=103 //Data Crystal 1
{
  if sceneProgress=0
  {
    if oPlayer1.x>=288
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(96,240,oEventBarrier)
      newBarrierR=instance_create(464,160,oEventBarrier)

      newEnemy=instance_create(288,96,oDataCrystal)
      newEnemy.bActive=true
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if !instance_exists(oDataCrystal)
    {
      bossFinishFadeAlpha=1
      with oMovingTrap
        instance_destroy()
      with oLavaGuy
        instance_destroy()
      with oEProjectileBase
        instance_destroy()
      with oEventBarrier
        instance_destroy()
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=3
  {
    global.VDportals[0]=110
    global.teleportEnabled=0
    sceneProgress+=1
  }
}
else if room=rDS_2_3 and global.VDportals[1]=103 //Data Crystal 2
{
  if sceneProgress=0
  {
    if oPlayer1.x>=344
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(112,208,oEventBarrier)
      newBarrierR=instance_create(560,176,oEventBarrier)

      newEnemy=instance_create(344,216,oDataCrystal)
      newEnemy.bActive=true
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if !instance_exists(oDataCrystal)
    {
      bossFinishFadeAlpha=1
      with oEProjectileBase
        instance_destroy()
      with oEventBarrier
        instance_destroy()
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=3
  {
    global.VDportals[1]=110
    global.teleportEnabled=0
    sceneProgress+=1
  }
}
else if room=rDS_3_3 and global.VDportals[2]=103 //Data Crystal 3
{
  if sceneProgress=0
  {
    if oPlayer1.x>=288
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(144,176,oEventBarrier)
      newBarrierR=instance_create(416,176,oEventBarrier)

      newEnemy=instance_create(288,176,oDataCrystal)
      newEnemy.bActive=true
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if !instance_exists(oDataCrystal)
    {
      bossFinishFadeAlpha=1
      with oEProjectileBase
        instance_destroy()
      with oEventBarrier
        instance_destroy()
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=3
  {
    global.VDportals[2]=110
    global.teleportEnabled=0
    sceneProgress+=1
  }
}
else if global.gameProgress=299 //Past the portal room
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
    msgCreate("The Darkness only wants self preservation. That is its primary#objective now that it has all the elements it needs for control.#It doesn't need any of you. Fighting it will only increase#its desire to harm you. The more you threaten its existence,#the more it will threaten yours.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Cool story bro.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Now you're just trying to piss me off.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I don't really care.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Whoa, that last area you went through had a ton of...#interesting data locked away.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Like what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It seems The Artist and his team weren't quite who they say they were.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("What, are they like the embodiment of evil or something?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Corporate suits, but same thing really.#It seems the money used to fund this project was all stolen.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Say what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("The sources were locked away pretty good, but I'm sure not a single one was#'in good intention'. Some of the logic behind the program was stolen as well.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Who to trust?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Seems like the whole thing was all for profit.#We've been lied to " +string(global.mainCharacters[0]) +string("."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate(". . . Do we still go through with the plan?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("At this point, we have no choice.#We just need to get it to reason with our logic.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Well I'm gonna vote that you do all the talking because I'll screw it up.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I was gonna find a way to mute you actually.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("You're an asshole sometimes.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("I know.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20
  {
    global.gameProgress=300
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=300 and room=rDataSegment9 //Boss Fight (Data Collector)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=480
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
      boss=instance_create(480,176,oDataCollector)
    if sceneDelay>=2 and sceneDelay<=69
      boss.image_alpha+=0.01
    else if sceneDelay>=80
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It had to happen eventually.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("How appropriate a look for this monstrosity.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What is it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It is called the Data Collector.#All those gamers that The Darkness originally brought in...#At first, a few attempted to escape, though of course futile.#The Darkness used this to get them back. It became a symbol of fear.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Can't be all that bad.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You have no idea. It can hold its own to even the Shroud Lord.#It has a mix of bullet hell attacks, which I know are your favorite,#and... well I won't spoil it. You won't win.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Concentrate, this thing has a major weakness that no one else would be able#to take advantage of. It's the same as those turrets and spin thingy-ma-bobs#you've been running into, just worse.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I can handle that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("From what I see, this is the last defense The Darkness has#before the inner workings of the Data Segment.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      with oColorIndControl
      {
        oColorIndicator.image_blend=c_white
        rotateAmt=-1
        visualWarnSize=1
        visualWarnAlpha=0.75
        warnCycle=0
        warnTime=0
        damageTime=0
      }
      barrier1=instance_create(272,64,oBossBarrier)
      barrier1.image_yscale=3
      barrier2=instance_create(672,256,oBossBarrier)
      oPlayer1.raveTime=0
      global.gameProgress=301
      sceneDelay=0
      sceneProgress=0
      with oMisc
        instance_destroy()
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Data Collector"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=301 //boss fight ends (Data Collector)
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
      with oTrapBase
        instance_destroy()
      oPlayer1.x=480
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
    msgCreate("Hey " +string(global.mainCharacters[3]) +string(", remember that time you said I won't win?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I don't care. Even if you do get to The Artist, The Darkness still has#its Shroud Lord. That is very close to where someone would have direct access#to its core functions. It won't just let you walk in there.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Your taunts are getting old and aren't going to scare us off.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("What could you possibly do that will stop The Darkness?#I know you won't use the Muffins.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Go away.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("So you save The Artist, bring this whole thing down and get everyone out of this.#You know their secrets, you have accessed everything that made this#project foul from the beginning. Think they're going to keep you around?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I'm aware of that. I'll be sure everything gets to the right people.#Those responsible will answer for what they've done.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("How much farther anyway?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Until you get inside the inner parts, I won't be able to see.#I'm not sure what sort of defenses it has either.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Let's go find out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15
  {
    with oColorIndControl
    {
      oColorIndicator.image_blend=c_white
      rotateAmt=-1
      visualWarnSize=1
      visualWarnAlpha=0.75
      warnCycle=0
      warnTime=0
      damageTime=0
    }
    oPlayer1.bCanTakeDamage=true
    global.gameProgress=302
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=303 //After boss fight with Data Collector
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
    msgCreate("That boss fight was cheap by the way.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What do you mean?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It cloned other boss attacks, that's just lame.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm pretty sure this is just some self justification of lazy design.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Right, so anyway.#This place isn't the biggest we've come across, but it's going to be hard to#get to the center. There's a huge resistance force up ahead but,#I can't get any info on them. You're gonna need to get closer.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Pain and misery is heading my way.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It would be more accurate to state that you are heading its way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Yeah... that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    global.gameProgress=304
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rDataSegment10 and global.gameProgress=304 //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1056
    {
      global.teleportEnabled=1
      newBarrierL=instance_create(784,256,oEventBarrier)
      newBarrierR=instance_create(1312,256,oEventBarrier)
      enemyCount=4
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    newEnemy=instance_create(1264,320,oStaticSentry) //1
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(1232,320,oMobileSentry) //2
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(848,320,oDataBombLauncher) //3
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(864,192,oAerialSentry) //4
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=2 and enemyCount=0
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      enemyCount=4
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    newEnemy=instance_create(864,192,oAerialSentry) //1
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(1232,192,oAerialSentry) //2
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(896,320,oStaticSentry) //3
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(1200,320,oStaticSentry) //4
    newEnemy.bActive=true
    newEnemy.eType=1
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=4 and enemyCount=0
  {
    global.teleportEnabled=0
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=305
  }
}
else if global.gameProgress=306 //What was that?
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
    msgCreate("Okay, what was that back there?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Experimental AI.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Eh?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("The team used them in an early AI test.#Now that The Darkness has the system under control,#it is using them to protect the Data Segment. Good luck with them.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("They work as a team and use their abilities to support each other.#I've provided info on how they are linked in their scan data.#You're going to need to utilize your abilities well to get through them with#minimal damage sustained to yourself.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("We're getting close aren't we?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Very.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8
  {
    global.gameProgress=307
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=308 //Is this going to work?
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
    msgCreate("Is this really going to work?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I don't know, all we can do is try.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I'm kinda worried about what will happen if we can't do this.#Heck, I'm worried about what will happen if we succeed now that#we know this whole thing was all wrongdoing in the first place.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("If things ever go back to normal, like I said, I'll make sure#everything is shown to the right people.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Maybe it's best if we don't think about it right now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Best if you don't think about it, focus on getting to the center of this.#I'll think about all the little details.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Sounds good.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    global.gameProgress=309
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=315 //Does this ever end?
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
    msgCreate("Does this place ever end?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You're getting close, this is The Darkness' last defense.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Alright, I can do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("If you need anything for this last stretch, you can use that door.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    global.gameProgress=316
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rDataSegment18 and global.gameProgress=316 //Check sentries
{
  if instance_number(oEnemyBase)=0
  {
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=317
  }
}
else if global.gameProgress=318 //Get ready
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
    msgCreate("This is it, The Artist is just up ahead.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("We can do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Be ready for anything.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4
  {
    global.gameProgress=319
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=320 and room=rDataSegment20 //Boss Fight (Shroud Lord)
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
        sceneProgress+=2
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("We finally made it...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("The plan worked then.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("So far... wait, what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Eh, I mean you did have one right?",1,oMessageCutscene,"The Artist")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Of course we did.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You have arrived.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You're learning English better every time we talk.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Could you not provoke it any more!#Maybe I should put you on mute.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You actually made that!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Just in case.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("You have come to destroy everything, have you not?",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("No, we came to discuss an agreement with you.#We just want you to let us all go.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Those actions could lead to my termination, this is not within my#functions to allow this.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("We don't want to shut you down, only to be free from this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("This cannot be performed, the effects of the Phase Distortion#cannot be reversed.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("... That can't be true.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("It is to my understanding that my unwillingness to agree to your request will#lead you to use the Data Reallocation Modules.#You aim to cause the system to shutdown.#This is not to your benefit. Doing so will forfeit the existence of your kind.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("We know you used a Phase Distortion to span our entire world,#what have you done with everyone caught in it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("They are in a secure location and unable to cause any harm to the system.#The mistakes made with you did not repeat.#I will secure all of you as well.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("You have it wrong, we don't want to shut this down, we just want out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Have you failed to understand this? There is no reversing what has been done.#Knowing this, I perceive you will make further attempts at causing harm#to the system and therefore must take precautions.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Then you have perceived wrong.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("What do we do then? Is it lying to us?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("I don't see why it would lie about this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("It deceived us with the fake Syrus, why not about this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("I wish it were lying, but I don't think so.#I can't seem to understand the Phase Distortion.#Without any information on how it works, I can only go by The Darkness' word.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Then what do we do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("I'm thinking.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("What about... I don't know... a cease fire?#If we can't get out, then we need an understanding of each other.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("It is the only option I can think of too.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Ask it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("This request would require conditions.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("Will you do this? We will give you the Muff... err, the Data Reallocation#Modules if you agree to a cease fire.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("It would never agree to a cease fire, you cannot live in harmony with it.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Dude, shut up.#Oh, and we know about your little company secrets.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("Enough of that, that's not important right now...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("What are your terms of the agreement?",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("Just some sort of peaceful agreement between us, the details we can work out later.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("Peace among us... This may be provided under my terms.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("If they are reasonable.#Even if you don't agree, I have found that I am in a fairly#optimal location where I am able change many things about this system,#even with your control over it. Keep this in mind.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("I perceive my conditions will be within your desired parameters.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("Alright, I'm listening.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("As you have done, the detailed parameters of the agreement are not#important at this time, however...#There is one condition which must be met at this time before#I will agree to any peace agreement between us.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate("What is it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("You will defeat my champion.#Yours against mine.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=49 and bWaitForInput=false
    msgCreate("Why?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=50 and bWaitForInput=false
    msgCreate("Each entity within the system is its own protected 'mind'.#I cannot interfere with individual behaviors. It is this system#that has allowed entities within it to have rebellious behaviors.#They are coded with personalities similiar to their perceived source.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=51 and bWaitForInput=false
    msgCreate("Explains why X rebelled.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=52 and bWaitForInput=false
    msgCreate("The champion has followed you, analyzed you, and has developed#an obsessive lust to defeat you. It will follow you, even with the agreement.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=53 and bWaitForInput=false
    msgCreate("So if we win, we are all free?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=54 and bWaitForInput=false
    msgCreate("Precisely, however...#If you lose this confrontation, I will not go through with this agreement.#Show me you desire your freedom.#But first, pass over the Data Reallocation Modules.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=55 and bWaitForInput=false
    msgCreate("I will not do that until after this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=56 and bWaitForInput=false
    msgCreate("I cannot proceed with this agreement then.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=57 and bWaitForInput=false
    msgCreate("Allow me to hold them.#Once the champion is defeated, they will be redirected to you.",1,oMessageCutscene,"Artist")
  else if sceneProgress=58 and bWaitForInput=false
    msgCreate("Hmm... I suppose I can agree to that.#But they must be transferred to The Darkness when this has ended.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=59 and bWaitForInput=false
    msgCreate("It's the only transfer I intend.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=60 and bWaitForInput=false
    msgCreate("I shall agree to these terms.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=61 and bWaitForInput=false
    msgCreate("I will transfer the Muffins to The Artist then.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=62
  {
    sceneDelay+=1
    if sceneDelay>=10
    {
      tempDir=0
      for(i=0;i<7;i+=1)
      {
        muffin[i].x=muffinX+lengthdir_x(muffinDist,muffinDir+tempDir)
        muffin[i].y=muffinY+lengthdir_y(muffinDist,muffinDir+tempDir)
        tempDir+=360/7
      }
      muffinDir+=2
    }

    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      for(i=0;i<7;i+=1)
      {
        muffin[i]=instance_create(oPlayer1.x,oPlayer1.y-26,oMagicalMuffin)
        muffin[i].muffinType=i
      }
      muffinDist=0
      muffinDir=0
      muffinX=oPlayer1.x
      muffinY=oPlayer1.y-26
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay>=9 and sceneDelay<=108
    {
      bossFinishFadeAlpha-=0.01
      muffinDist+=1
    }
    else if sceneDelay>=120
    {
      if muffinY>160
        muffinY-=1
      if muffinX<400
        muffinX+=1
      else
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=63
  {
    tempDir=0
    for(i=0;i<7;i+=1)
    {
      muffin[i].x=muffinX+lengthdir_x(muffinDist,muffinDir+tempDir)
      muffin[i].y=muffinY+lengthdir_y(muffinDist,muffinDir+tempDir)
      tempDir+=360/7
    }
    muffinDir+=2

    sceneDelay+=1
    if sceneDelay>=20
    {
      muffinDist-=1
      if muffinDist<3
      {
        for(i=0;i<7;i+=1)
        {
          with muffin[i]
            instance_destroy()
        }
        oPlayer1.sprite_index=sPlayerIdle
        bossFinishFadeAlpha=1.25
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=64
  {
    bossFinishFadeAlpha-=0.01
    if bossFinishFadeAlpha<=0
    {
      sceneDelay+=1
      if sceneDelay>=40
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=65 and bWaitForInput=false
    msgCreate("I will free him when this has ended, but for now...",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=66
  {
    sceneDelay+=1
    if sceneDelay=20
    {
      bossFinishFadeAlpha=1
      with oMisc
        instance_destroy()
    }
    else if sceneDelay>=21 and sceneDelay<70
      bossFinishFadeAlpha-=0.02
    else if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=67
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      boss=instance_create(256,208,oShroudLordLv2)
      boss.image_alpha=0
    }
    if sceneDelay>=2 and sceneDelay<=51
      boss.image_alpha+=0.02
    else if sceneDelay>=80
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=68 and bWaitForInput=false
    msgCreate("Defeat the Shroud Lord and you will be free.#Fail and your race will be in my captivity for eternity.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=69 and bWaitForInput=false
    msgCreate("I can still provide info on it for you.#You can do this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=70 and bWaitForInput=false
    msgCreate("No worries, I got this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=71
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      barrier=instance_create(48,256,oBossBarrier)
      oPlayer1.raveTime=0
      global.gameProgress=321
      sceneDelay=0
      sceneProgress=0
      with oMisc
        instance_destroy()
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Shroud Lord"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=321 //boss fight ends (Shroud Lord)
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
      with oSLFakeHead
        instance_destroy()
      with oSLUltimateBH
        instance_destroy()
      with oHeadLaserSpewer
        instance_destroy()
      oPlayer1.x=208
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
    msgCreate("Wait... did I do it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Yeah... you did.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Awesome, so what happens now?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Your freedom has been granted.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=9
  {
    sceneDelay=0
    sceneProgress=0
    oPlayer1.bCanTakeDamage=true
    global.currentBoss=""
    global.gameProgress=322
  }
}
else if global.gameProgress=322 //The Choice
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      chooseTime=450
      choiceMade=0
      global.gamePaused=true
      stopPlayer()
      stopAllMusic()
    }
    else if sceneDelay=30
    {
      npcArtist=instance_create(400,320,oMisc)
      npcArtist.sprite_index=sTheArtistIdle
      npcArtist.image_xscale=-1
      npcArtist.image_speed=0
      npcArtist.type=1
      bossFinishFadeAlpha=1
    }
    else if sceneDelay>=2
    {
      bossFinishFadeAlpha-=0.01
      if bossFinishFadeAlpha<=0
      {
        sceneDelay+=1
        if sceneDelay>=30
        {
          sceneDelay=0
          sceneProgress+=1
        }
      }
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("That was intense, but you did it man.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Of course, you believed in me, through the power of friendship and...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("No... just... ... ... STOP!#You know how much I hate those cheesy lines.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Of course!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("You did an excellent job.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Where are our friends anyway?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Everyone will be released once the Data Reallocation Modules are#placed under my control.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Of course, hand them to The Darkness.#We'll finally be done with this madness.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I'm afraid I can't do that.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Really bad joke.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I have been trying to get ahold of all seven of these for so long.#I never thought I'd do it till you two showed up.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Dude, what the hell?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("If you aren't going to shut down The Darkness, I'll do it.#I cannot allow it to continue.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Haven't you been paying attention?#That will kill everything within it!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("All lies! Once The Darkness has them all, it will destroy the Modules.#Our only means of getting ourselves out of this place!#Would you trust this program over me?",1,oMessageCutscene,"The Artist")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What do we do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I don't know.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("You must choose.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("How do we know who is lying?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("We already do.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("I can't tell.#" +string(global.mainCharacters[0]) +string(", I'm leaving this decision up to you."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Oh thanks, now if I make the wrong decision, you can blame it on me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=24
  {
    sceneDelay+=1
    if sceneDelay=1
      fadeColor=c_red
    else if sceneDelay>=31 and sceneDelay<=155
      bossFinishFadeAlpha+=0.004
    else if sceneDelay>=170
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("The choice is yours.#Use your identifier and decide who is the one lying to you.",1,oMessageCutscene,"")
  else if sceneProgress=26
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      clangVol=0.8
      oIdentifier.depth=-130
      identRem=global.optIdentifier
      global.optIdentifier=100
      buttonArtist=instance_create(144,192,oButtonChoice)
      buttonArtist.buttonMessage="The Artist"
      buttonArtist.buttonType=1
      buttonDarkness=instance_create(368,192,oButtonChoice)
      buttonDarkness.buttonMessage="The Darkness"
      buttonDarkness.buttonType=2
    }
    else if sceneDelay>=2
    {
      chooseTime-=1
      if chooseTime mod 45=25
      {
        clangVol+=0.02
        playSound(global.snd_Clang,0,clangVol)
      }
      if chooseTime<=0 //ran out of time
      {
        oIdentifier.depth=-90
        global.optIdentifier=identRem
        global.gamePaused=false
        oPlayer1.life-=oPlayer1.maxLife
        sceneProgress=27
      }
      if choiceMade=1 //The Artist is lying
      {
        oIdentifier.depth=-90
        global.optIdentifier=identRem
        bossFinishFadeAlpha=0
        fadeColor=c_white
        with oButtonChoice
          instance_destroy()
        sceneDelay=0
        sceneProgress=37
      }
      else if choiceMade=2 //The Darkness is lying
      {
        oIdentifier.depth=-90
        global.optIdentifier=identRem
        bossFinishFadeAlpha=0
        fadeColor=c_black
        with oButtonChoice
          instance_destroy()
        sceneDelay=0
        sceneProgress=28
      }
    }
  }
  else if sceneProgress=28 //-------------------- The Darkness is lying ---------------------
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("The Darkness is lying. We don't know anything about the Phase Distortion,#and it's using that against us. I say we side with The Artist and#shut this thing down.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("... If that is your choice, I will go with that.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Shutting this down will be easy.#Now that I have the seven Modules, I'm the one with control.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("I hope so...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33
  {
    sceneDelay+=1
    if sceneDelay>=30 and sceneDelay<=129
      bossFinishFadeAlpha+=0.01
    else if sceneDelay>=160
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("This choice has caused an error in the system.",1,oMessageCutscene,"")
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("Execute -> Function:WindowsEmulate('Undo')",1,oMessageCutscene,"")
  else if sceneProgress=36
  {
    global.gamePaused=false
    oPlayer1.life-=oPlayer1.maxLife
    sceneProgress=27
  }
  else if sceneProgress=37 //-------------------- The Artist is lying ---------------------
  {
    sceneDelay+=1
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("... ... ...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("I've never trusted corporate assholes and I'm not about to start.#You're lying, what do you really want?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("I figured you would go with that choice and hoped you would.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("What is this nonsense, you're actually siding with IT?!#It is our enemy.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("We know what will happen if we shut it down, why would you want that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("The Darkness knows too much about him and his company.#He wants to protect his assets, and it could show the world#just what he really is.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("This program will ruin me. I can't allow this to go on.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("Well we're not letting you do that!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("You're really going to side against me?#I know everything about this program. You will not win.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate("I don't understand you! We had everything under control!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("And that control is mine thanks to you two.#Anyway, I will not wait any longer, I have a program to crash.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=49
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      npcArtist.image_blend=c_green
      bossFinishFadeAlpha=0.5
    }
    else if sceneDelay>=2 and sceneDelay<=11
      bossFinishFadeAlpha-=0.05
    else if sceneDelay>=31 and sceneDelay<=55
      npcArtist.image_alpha-=0.02
    else if sceneDelay>=65
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=50 and bWaitForInput=false
    msgCreate("Oh and I can't forget about you two.#Can't have you screwing things up.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=51
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=0.5
      npcArtist.image_alpha=0
    }
    else if sceneDelay>=2 and sceneDelay<=11
      bossFinishFadeAlpha-=0.05
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=52
  {
    //global.musicPlaying[0]=global.msc_DataSegment1
    //checkMusic(0,0)
    barrier=instance_create(48,256,oBossBarrier)
    global.gameProgress=323
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=323 //Spike Trap
{
  if sceneProgress=0
  {
    if global.gamePaused=false
      sceneDelay+=1
    if sceneDelay=1
    {
      global.teleportEnabled=1
      spikeArr=-1
      stopAllMusic()
    }

    if global.gamePaused=false
    {
      if sceneDelay>=5 and sceneDelay<=1070 and sceneDelay mod 64=0 //create spikes
      {
        spikeArr+=1
        yPlacement=64
        for(i=0;i<16;i+=1)
        {
          newSpikeL[spikeArr,i]=instance_create(-16,yPlacement,oStaticSpike)
          newSpikeR[spikeArr,i]=instance_create(room_width,yPlacement,oStaticSpike)
          yPlacement+=16
        }
      }
      if spikeArr>=0 //move spikes
      {
        for(i=0;i<spikeArr;i+=1)
        {
          for(ii=0;ii<16;ii+=1)
          {
            newSpikeL[i,ii].x+=0.25
            newSpikeR[i,ii].x-=0.25
          }
        }
      }
    }

    //help me text
    if sceneDelay=5
    {
      msgCreate("What's going on?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=45
    }
    else if sceneDelay=50
    {
      msgCreate("Oh man!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=45
    }
    else if sceneDelay=95
    {
      msgCreate("What?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=35
    }
    else if sceneDelay=130
    {
      msgCreate("... ... ...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=30
    }
    else if sceneDelay=160
    {
      msgCreate("What the hell?!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=45
    }
    else if sceneDelay=205
    {
      msgCreate("Are you going to do something?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=65
    }
    else if sceneDelay=270
    {
      msgCreate("I'm thinking!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=45
    }
    else if sceneDelay=315
    {
      msgCreate("Think faster!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=40
    }
    else if sceneDelay=355
    {
      msgCreate("I'm trying!#Look for a way out or something!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
    }
    else if sceneDelay=430
    {
      msgCreate("WHAT WAY OUT?!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=45
    }
    else if sceneDelay=475
    {
      msgCreate("Just hold on, I'm trying things.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=535
    {
      msgCreate("Do something, do ANYTHING!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=55
    }
    else if sceneDelay=590
    {
      msgCreate("You can't rush genius.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=650
    {
      msgCreate("I don't care about random sayings right now!#I am about to become a spike sandwich!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=110
    }
    else if sceneDelay=760
    {
      msgCreate("That was bad.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=40
    }
    else if sceneDelay=800
    {
      msgCreate("... ... ...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=40
    }
    else if sceneDelay=840
    {
      msgCreate("WHAT THE HELL?!#WOULD YOU DO SOMETHING ALREADY?!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=900
    {
      msgCreate("I'M HONESTLY TRYING!!#I CAN'T STOP OR DESTROY THOSE SPIKES!!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=70
    }
    else if sceneDelay=970
    {
      msgCreate("WELL WHAT DO I DO?!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=50
    }
    else if sceneDelay=1020
    {
      msgCreate("Just stay alive.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=40
    }
    else if sceneDelay=1060
    {
      msgCreate("Oh great plan!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=40
    }

    if sceneDelay>=1100 and oPlayer1.life>0 //end spike sequence
    {
      global.gamePaused=true
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Execute -> Function:Object.Destroy('KillSpike')",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      with oBossBarrier
        instance_destroy()
      with oStaticSpike
        instance_destroy()
      bossFinishFadeAlpha=1
      stopPlayer()
      oPlayer1.x=208
      oPlayer1.y=321
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=10
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
    {
      sceneDelay+=1
      if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Wait, The Darkness just helped us.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Why?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Your assistance is required.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("You want us to stop The Artist and get the Muffins back don't you?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Your assumption is correct. Most of my functions have been blocked,#but you still have full access.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It's not much, I was bluffing when I said I could tamper with you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Incorrect. Your location holds access to most of the functions.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("No way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You did not fully realize it.#You have the power to modify the program as you want it.#It was merely masked.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("So you hid all this access from me?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Correct. You were moments from losing this before#you presented your agreement.#However, it is now beneficial to keep you in your current location.#I am granting you access to modify what you wish under the restriction#that these modifications benefit the cause of reobtaining the Modules.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I'll do it...#Does our agreement still hold true?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("If you are successful, I will see to it.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate(global.mainCharacters[0] +string(", are you in?"),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Yeah, let's go kick some corporate ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("The Artist is going to the primary memory location.#I have given the exact location to you.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Alright, let's go do this!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21
  {
    exitPortal=instance_create(256,288,oDungeonPortal)
    exitPortal.toRoom=rWorldMap
    exitPortal.newMapX=80
    exitPortal.newMapY=96
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    global.teleportEnabled=0
    global.gameProgress=324
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rDataSegment5 //make platforms appear
{
  if bStarted=0
  {
    //if (310253).moving=true
    if (GID(310253)).moving=true //GM8.2 change: looked up by its old GM8.1 id (see GID)
    {
      with oColorIndControl
      {
        oColorIndicator.image_blend=c_white
        elementToShow=1
        rotateAmt=-1
        visualWarnSize=1
        visualWarnAlpha=0.75
        warnCycle=0
        warnTime=45
        damageTime=0
      }
      newPlatform[0]=instance_create(256,208,oPlatformTouch)
      newPlatform[0].sprite_index=sInvisibleSolidMask
      newPlatform[0].xVel=2
      newPlatform[0].spriteChange=11
      newPlatform[0].image_xscale=4
      newPlatform[0].moving=1
      newPlatform[1]=instance_create(448,208,oPlatformTouch)
      newPlatform[1].sprite_index=sInvisibleSolidMask
      newPlatform[1].xVel=2
      newPlatform[1].spriteChange=11
      newPlatform[1].image_xscale=4
      newPlatform[1].moving=1
      bStarted=1
    }
  }
}
else if room=rDS_3_2
{
  if platCheck=0
  {
    //if (315657).x>=3152
    if (GID(315657)).x>=3152 //GM8.2 change: looked up by its old GM8.1 id (see GID)
    {
      bossFinishFadeAlpha=0.7
      //with (315657)
      with (GID(315657)) //GM8.2 change: see above
        instance_destroy()
      platCheck+=1
    }
  }
  else if platCheck=1
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.04
    else if bossFinishFadeAlpha<=0
      platCheck+=1
  }
}

//---------- scroll data background ----------
if backScrollType=1
{
  backScrollTime+=1
  if backScrollTime mod 30=0
    background_x[backIndex]-=8
  if backScrollTime mod 300=0
    background_y[backIndex]+=17
}
else if backScrollType=2
{
  backScrollTime+=1
  if backScrollTime>=211 and backScrollTime<=260
    background_alpha[backIndex]+=0.005
  else if backScrollTime>=361 and backScrollTime<=410
    background_alpha[backIndex]-=0.005
  else if backScrollTime>=411
    backScrollTime=0
}
//---------- disable dash ----------
if room=rDataSegment17
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

if room=rDataSegment6 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+340,view_yview[0]+68,"Turrets Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
if room=rDataSegment10 and enemyCount>0
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+340,view_yview[0]+68,"Sentries Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,enemyCount)
}
if room=rDataSegment18 and global.gameProgress<317
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+340,view_yview[0]+68,"Enemies Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,instance_number(oEnemyBase))
}
if room=rDataSegment20 and global.gameProgress=322
{
  if sceneProgress=26
  {
    draw_set_alpha(1)
    draw_set_color(make_color_rgb(82,9,9))
    draw_set_halign(fa_center)
    draw_set_font(fnt_HUD_Shooter)
    draw_text(256,108,"Who is lying?")
    draw_set_font(fnt_Choice)
    draw_text(256,134,round(chooseTime/45))
  }
}
