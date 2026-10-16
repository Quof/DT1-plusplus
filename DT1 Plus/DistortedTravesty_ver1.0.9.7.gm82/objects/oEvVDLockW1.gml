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
checkScene=-1
npcHelp=0
var pEntry;
if room=rVDlock1_1 or room=rVDlock1_2
  pEntry=0
else if room=rVDlock2_1 or room=rVDlock2_2
  pEntry=1
else if room=rVDlock3_1 or room=rVDlock3_2
  pEntry=2
else if room=rVDlock4_1 or room=rVDlock4_2
  pEntry=3

//********** Check entry room **********
if (room=rVDlock1_1 and global.VDportals[0]=0) or (room=rVDlock2_1 and global.VDportals[1]=0) or (room=rVDlock3_1 and global.VDportals[2]=0) or (room=rVDlock4_1 and global.VDportals[3]=0)
{
  if global.gameProgress=226
    checkScene=pEntry
}
//********** Check end room dialogue **********
if (room=rVDlock1_2 and global.VDportals[0]<=1) or (room=rVDlock2_2 and global.VDportals[1]<=1) or (room=rVDlock3_2 and global.VDportals[2]<=1) or (room=rVDlock4_2 and global.VDportals[3]<=1)
{
  if global.gameProgress=227 or global.gameProgress=228
  {
    checkScene=pEntry
    npcFI=instance_create(304,208,oMisc)
    npcFI.sprite_index=sKredaeusIdle
    npcFI.image_xscale=-1
    npcFI.type=1
  }
  else if global.gameProgress=229
  {
    global.VDportals[pEntry]=2
    global.gameProgress=230
  }
  else if global.gameProgress=230
  {
    checkScene=pEntry
    npcFI=instance_create(304,208,oMisc)
    npcFI.sprite_index=sKredaeusIdle
    npcFI.image_xscale=-1
    npcFI.image_speed=0.25
    npcFI.type=1

    animChange=0
    tempVal=0
    npcShootTime=45
    npcShootWait=60
    npcSpecialTime=120
    npcSpecialWait=390
  }
}
//********** Check end room lock **********
if (room=rVDlock1_2 and global.VDportals[0]<=2) or (room=rVDlock2_2 and global.VDportals[1]<=2) or (room=rVDlock3_2 and global.VDportals[2]<=2) or (room=rVDlock4_2 and global.VDportals[3]<=2)
{
  crystalLock=instance_create(608,80,oMisc)
  crystalLock.sprite_index=sVDCrystal
  crystalLock.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if checkScene>=0 and global.gameProgress=226 //first time in VD Lock
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
    msgCreate("This is not what I was expecting.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Neither was I.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I have to go in here don't I?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Yeah okay, whatever.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    global.gameProgress=227
    global.VDportals[checkScene]=1
    sceneProgress=0
    checkScene=-1
    global.gamePaused=false
  }
}
else if checkScene>=0 and global.gameProgress=227 //first chat with Flame Instigator
{
  if sceneProgress=0
  {
    if oPlayer1.x>=144
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
    if oPlayer1.y<208
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
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("You again!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I remember you.#Still looking for the Muffins I see.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("What are you doing here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("The same could be said for you.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I asked first.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Eh, I'm just here to visit an old friend.#Took awhile to track him down and I'm not#going to let you get in the way.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Hey man, I don't want to fight.#I know you're not with The Darkness, so we're on the same side.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You shouldn't assume that.#I do not have an Identity Decoder like you.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You know about this device I have?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I helped X build it, of course I know.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Well you are of the Mega Man world, so it makes#sense you know him.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Your logic is correct " +string(global.mainCharacters[1]) +string(", however that is still wrong.#I am not who you think I am."),1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Then who are you?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I am the lead engineer for The Darkness.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Whoa, WHAT!?#What do you look like that for?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("It is how I chose to look.#The name is simply an alias.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("How were you not caught by it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I built this thing, I know a thing or two about how to get around it.#Not for long though, it keeps changing.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Why did you attack me before?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("I didn't know who you were. In this world, you must assume everything is an enemy.#You never know what is working with The Darkness.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Argh, I have so many questions!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("They will have to wait, there is a high concentration of those scouts around here.#I do not want to get caught in here.#You probably want to unlock the seal leading to the lower level of this place.#Behind me is one of the four devices to unlock it.#Meet me in another of these locations and we can continue this, we cannot stay in#one area for long unless we want to get caught by The Darkness' scouts.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=23
  {
    sceneDelay+=1
    if sceneDelay>=1 and sceneDelay<=19
    {
      npcFI.image_xscale+=0.05
      npcFI.image_yscale+=0.2
    }
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
      with npcFI
        instance_destroy()
    }
  }
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Lets do what he says.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Conveniently, he goes to a place I need to go.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Do you trust him?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Not much choice and he knows where we're going.#If he is setting a trap, we're gonna have to fall into it eventually.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28
  {
    global.gameProgress=228
    global.VDportals[checkScene]=2
    sceneProgress=0
    checkScene=-1
    global.gamePaused=false
  }
}
else if checkScene>=0 and global.gameProgress=228 //second chat with Flame Instigator
{
  if sceneProgress=0
  {
    if oPlayer1.x>=144
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
    if oPlayer1.y<208
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
    msgCreate("Before you begin asking your questions, I have a few of my own.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Eh, sure.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Who are you? You were not part of the project.#So how have you evaded The Darkness for so long?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Well, I'm " +string(global.mainCharacters[0]) +string(" and my friend ") +string(global.mainCharacters[1]) +string(" has been helping me#from what he calls the 4th wall."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("You were not part of The Darkness' initial Phase Distortion, you are not gamers?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Labeling us as anything but gamers would be a crime!#That's all we do!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("All we USED to do.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Oh right, ever since we got those boring corporate jobs...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Hmm... interesting...",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("It's nothing, you said you had questions for me?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Yes, you wanted the Muffins I had earlier... Why?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("As I said before, I assumed you were with The Darkness.#I apologize if I came off a bit robotic, but it was necessary.#I try to hide my identity as much as possible from it.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("You are very eager to protect them, do you even know what they are?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Haven't a clue except that they seem to grant more power to those#that hold them. We've been told that they can stop The Darkness.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("They would greatly assist.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("You know what they can do don't you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Somewhat, but I don't trust you enough to tell you what I know.#I will say that your current course of actions are unwise.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("And why is that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("You seem to have this idea in your head that once you find these Muffins,#everything will be fine. It is not that simple. The Darkness will#not simply undo everything it has done. And what if you had the power to bring#The Darkness down, have you thought about what that would cause?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("You aren't fit to have them. If I could, I would take them from you.#They belong in more capable hands, you don't even understand#The Darkness' structure.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Apparently you don't either if it's constantly modifying itself.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Still better off than you.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Tell me more about The Darkness...#Why did you build it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("We only wanted to create something great. Something to be remembered.#None of us ever thought it go out of control like it did.#The vision 'he' had was magnificent, and we did everything we could#to see that vision to completion.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("What was it's purpose?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("I will have to tell you later, the scouts are close by.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("He's right, break the seal and get out of that area.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("I don't know if we'll meet again, I can't stick around here any longer.#I don't know how he's doing it, but your friend has been conceiling your location.#Whatever your plans are, be sure you are fully aware of the consequences.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=32
  {
    sceneDelay+=1
    if sceneDelay>=1 and sceneDelay<=19
    {
      npcFI.image_xscale+=0.05
      npcFI.image_yscale+=0.2
    }
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
      with npcFI
        instance_destroy()
    }
  }
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("Keep going, there are still 2 more of these locks.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=34
  {
    global.gameProgress=229
    global.VDportals[checkScene]=2
    sceneProgress=0
    checkScene=-1
    global.gamePaused=false
  }
}
else if checkScene>=0 and global.gameProgress=230 //third chat with Flame Instigator
{
  if sceneProgress=0
  {
    if oPlayer1.x>=144
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
    if oPlayer1.y<208
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
    msgCreate("Doing well on these locks, I'm impressed.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("They're not very easy.#One of them even locked out my dashing ability.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm sure you adapted just fine. You have very unique abilities.#They seem to counteract The Darkness quite well.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What is it you really want?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Peace with The Darkness.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Are you serious?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("There is no stopping it without adverse effects occuring, not at this point.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I don't get it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("It really doesn't matter. You won't get all the Muffins,#nor would you know how to use them.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Could you at least tell me what they are?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Absolutely not.#All the Muffins in your uncapable hands would make you#a bigger threat than The Darkness.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("And being cryptic is definately going to help.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      shakeScreen=instance_create(256,oPlayer1.y,oCutsceneShake)
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
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("They found us!",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Yeah, I'm pretty used to this by now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("It's 2 Shrouds.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Let them come!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("You wouldn't have a choice anyway.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20
  {
    global.gamePaused=false
    npcHelp=1
    global.teleportEnabled=1
    newBarrierL=instance_create(48,144,oEventBarrier)
    newBarrierR=instance_create(384,144,oEventBarrier)
    var tempMplay;
    tempMplay=global.msc_BossBattle2
    playMusic(tempMplay,0)
    sceneProgress+=1
  }
  else if sceneProgress=21
  {
    newEnemy=instance_create(336,64,oShroud)
    newEnemy.bActive=true
    newEnemy.spawnCount=1
    newEnemy.xSdist=-224
    newEnemy.ySdist=0
    newEnemy.dtXpointSelf=0
    newEnemy.dtYpointSelf=0
    newEnemy.dtXpointOther=0
    newEnemy.dtYpointOther=0
    newEnemy.dtTele=false
    bossFinishFadeAlpha=1
    sceneProgress+=1
  }
  else if sceneProgress=22
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=23 and instance_number(oShroud)=0
  {
    global.gamePaused=true
    global.teleportEnabled=0
    bossFinishFadeAlpha=1
    npcHelp=0
    npcFI.sprite_index=sKredaeusIdle
    npcFI.image_xscale=-1
    stopAllMusic()
    playSound(global.snd_SwitchHit,0,1)
    view_object[0]=oPlayer1
    with shakeScreen
      instance_destroy()
    with newBarrierL
      instance_destroy()
    with newBarrierR
      instance_destroy()
    with oAttackBase
      instance_destroy()
    with oEProjectileBase
      instance_destroy()
    with oEarthShift
      instance_destroy()
    sceneProgress+=1
  }
  else if sceneProgress=24
  {
    if sceneDelay=0
    {
      stopPlayer()
      oPlayer1.x=144
      oPlayer1.y=208
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_xscale=1
      oPlayer1.attackState=0
      sceneDelay=1
    }
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.1
    else if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=25
  {
    sceneDelay+=1
    if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Damn dude, you made them look easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("That's because you kept them off me.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Oh of course, now it makes sense.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("We cannot stay here, there will definately be more of them.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Don't want to talk I guess.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Our talk will have to continue later.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Cliffhangers... I hate them.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("Think about what you are doing.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=34
  {
    sceneDelay+=1
    if sceneDelay>=1 and sceneDelay<=19
    {
      npcFI.image_xscale+=0.05
      npcFI.image_yscale+=0.2
    }
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
      with npcFI
        instance_destroy()
    }
  }
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Why does everyone have to be so damn cryptic with me all the time!?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("It wasn't that bad.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Still!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("It doesn't matter right now, this is the last lock.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("True, guess I'll head that way.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37
  {
    global.gameProgress=231
    global.VDportals[checkScene]=2
    sceneProgress=0
    checkScene=-1
    global.gamePaused=false
  }
}
else if room=rVDlock1_2 and global.VDportals[0]=2 //break crystal 1
{
  if sceneProgress=0
  {
    if oPlayer1.x>=608
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
    sceneDelay+=1
    if sceneDelay=30
    {
      playSound(global.snd_Shock,0,1)
      effect=instance_create(crystalLock.x,crystalLock.y,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.newBlend=1
    }
    else if sceneDelay=31
    {
      with crystalLock
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate(global.mainCharacters[0] +string(" learned:#Fire Technique: Wildfire"),1,oMessageCutscene,"")
    global.fireLv=5
  }
  else if sceneProgress=3
  {
    global.VDportals[0]=3
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rVDlock2_2 and global.VDportals[1]=2 //break crystal 2
{
  if sceneProgress=0
  {
    if oPlayer1.x>=608
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
    sceneDelay+=1
    if sceneDelay=30
    {
      playSound(global.snd_Shock,0,1)
      effect=instance_create(crystalLock.x,crystalLock.y,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.newBlend=1
    }
    else if sceneDelay=31
    {
      with crystalLock
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate(global.mainCharacters[0] +string(" learned:#Water Technique: Piercing Stream"),1,oMessageCutscene,"")
    global.waterLv=5
  }
  else if sceneProgress=3
  {
    global.VDportals[1]=3
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rVDlock3_2 and global.VDportals[2]=2 //break crystal 3
{
  if sceneProgress=0
  {
    if oPlayer1.x>=608
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
    sceneDelay+=1
    if sceneDelay=30
    {
      playSound(global.snd_Shock,0,1)
      effect=instance_create(crystalLock.x,crystalLock.y,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.newBlend=1
    }
    else if sceneDelay=31
    {
      with crystalLock
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate(global.mainCharacters[0] +string(" learned:#Wind Technique: Hurricane"),1,oMessageCutscene,"")
    global.windLv=5
  }
  else if sceneProgress=3
  {
    global.VDportals[2]=3
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rVDlock4_2 and global.VDportals[3]=2 //break crystal 4
{
  if sceneProgress=0
  {
    if oPlayer1.x>=608
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
    sceneDelay+=1
    if sceneDelay=30
    {
      playSound(global.snd_Shock,0,1)
      effect=instance_create(crystalLock.x,crystalLock.y,oEffect)
      effect.sprite_index=sEnergyRip1
      effect.image_speed=0.75
      effect.newBlend=1
    }
    else if sceneDelay=31
    {
      with crystalLock
        instance_destroy()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    msgCreate(global.mainCharacters[0] +string(" learned:#Nothing!! Sucks to be you."),1,oMessageCutscene,"")
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("That's funny.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I didn't think so.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.VDportals[3]=3
    sceneProgress=0
    global.gamePaused=false
  }
}

//npc help script
if npcHelp=1 and global.gamePaused=false
{
  if animChange!=-1
    animChange+=1
  if npcFI.sprite_index=sKredaeusIdle
  {
    if x>oCharacter.x
      image_xscale=-1
    else
      image_xscale=1
  }
  if npcSpecialTime<npcSpecialWait
  {
    npcShootTime+=1
    if npcShootTime>=npcShootWait //shoot straight
    {
      if animChange=-1
        animChange=0
      npcFI.sprite_index=sKredaeusShootStraight
      if animChange=8
      {
        var shroudCheck;
        shroudCheck=instance_nearest(npcFI.x,npcFI.y,oShroud)
        if npcFI.x<shroudCheck.x
          npcFI.image_xscale=1
        else
          npcFI.image_xscale=-1
        if npcFI.image_xscale=1
          offsetX=12
        else
          offsetX=-12
        playSound(global.snd_SpellFireball,0,1)
        fireBall=instance_create(npcFI.x+offsetX,npcFI.y-32,oEvVDnpcAtk)
        fireBall.spiritPower=oPlayer1.spiritPower*2
        fireBall.fireSpeed=7
        fireBall.type=1
        if npcFI.image_xscale=1
          fireBall.direction=0
        else
          fireBall.direction=180
        npcShootTime=0
      }
    }
  }
  if npcShootTime<npcShootWait
    npcSpecialTime+=1
  if npcSpecialTime>=npcSpecialWait //special attack
  {
    if animChange=-1
      animChange=0
    if npcFI.sprite_index=sKredaeusIdle
      npcFI.sprite_index=sKredaeusRainFire1
    if npcFI.sprite_index=sKredaeusRainFire1
    {
      if animChange=48
      {
        npcFI.sprite_index=sKredaeusRainFire2
        animChange=0
      }
    }
    else if npcFI.sprite_index=sKredaeusRainFire2
    {
      if tempVal<=15
      {
        if animChange=4 //left gun
        {
          playSound(global.snd_SpellFireball,0,1)
          fireBall=instance_create(npcFI.x-9,npcFI.y-56,oEvVDnpcAtk)
          fireBall.spiritPower=oPlayer1.spiritPower*2
          fireBall.fireSpeed=7
          fireBall.type=2
          fireBall.direction=90
        }
        else if animChange=8 //right gun
        {
          playSound(global.snd_SpellFireball,0,1)
          fireBall=instance_create(npcFI.x+9,npcFI.y-56,oEvVDnpcAtk)
          fireBall.spiritPower=oPlayer1.spiritPower*2
          fireBall.fireSpeed=7
          fireBall.type=3
          fireBall.direction=90
          tempVal+=1
          animChange=0
        }
      }
      else
      {
        if animChange=4
        {
          npcFI.sprite_index=sKredaeusRainFire3
          animChange=0
        }
      }
    }
    else if npcFI.sprite_index=sKredaeusRainFire3
    {
      if animChange=12
      {
        tempVal=0
        animChange=-1
        npcFI.sprite_index=sKredaeusIdle
        npcSpecialTime=0
      }
    }
  }

  //revert animation to idle/jump after shooting
  if npcFI.sprite_index=sKredaeusShootStraight and animChange>=20
  {
    npcFI.sprite_index=sKredaeusIdle
    animChange=-1
  }
}

if room=rVeiledDetritus12 and global.VDportals[1]=3 //Boss Fight (Dark Gear)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1216
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.x=1216
      oPlayer1.y=304
      oPlayer1.sprite_index=sPlayerIdle
      boss=instance_create(1216,96,oDarkGear)
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
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You do not like bullet hells you say?",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=4 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerLookUp
    msgCreate("Hey now, I never said that.",1,oMessageCutscene,global.mainCharacters[0])
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Commencing attack sequence: Dislocation Influence",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What sense could that possibly make?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrierL1=instance_create(1024,240,oBossBarrier)
      newBarrierR1=instance_create(1392,240,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.VDportals[1]=4
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Dark Gear"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.VDportals[1]=4 //boss fight ends (Dark Gear)
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
      with oMisc
        instance_destroy()
      oPlayer1.x=1216
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
    msgCreate("I need to watch what I say now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I'm guessing given enough time, The Darkness can see what we're saying#no matter how much I encrypt our chats.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That's cheating.",1,oMessageCutscene,global.mainCharacters[0])
  if sceneProgress=8
  {
    global.VDportals[1]=5
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rVDlock3_1
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
