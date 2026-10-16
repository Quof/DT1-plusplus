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
screenStaticTime=irandom(60)
dataShow=0

if room=rShadyWoods4 and (global.gameProgress>=247 and global.gameProgress<=249)
{
  boss=instance_create(928,168,oPhalanx)
  if global.currentBoss="Ultimate Phalanx"
  {
    boss.activateBoss=1
    sceneProgress=20
  }
}

if (room=rShadyWoods2 or room=rShadyWoods3) and global.gameProgress=249 //Distortion Aura
{
  staticAlpha=0.25
  background_index[6]=backStatic
  background_visible[6]=false
  background_foreground[6]=true
  background_alpha[6]=staticAlpha
  background_hspeed[6]=31
  background_vspeed[6]=21
  backrgb=255

  data_Full=">CHECKING SOURCE . . .   #>" +string_upper(working_directory) +string("#>CHECKING CONTROL MODULE . . .   #>INITIATING CONTROL PRIORITY OVERRIDE FUNCTION . . . ")
  data_New=""
  data_Pos=0
  typingCount=0
  typingSpeed=3
  resetCount=0
}

if room=rShadyCaves3 //bullet spawners
{
  bulPointX1=144
  bulPointY1=112
  bulPointX2=368
  bulPointY2=112
  bulDir1=0
  bulDir2=180
  if global.difficulty=1
  {
    bulPower=450
    bulFreq=10
    bulSpiral=2
    bigCircle=200
  }
  else if global.difficulty=2
  {
    bulPower=500
    bulFreq=9
    bulSpiral=3
    bigCircle=190
  }
  else if global.difficulty=3
  {
    bulPower=550
    bulFreq=8
    bulSpiral=4
    bigCircle=180
  }
  else if global.difficulty=4
  {
    bulPower=600
    bulFreq=7
    bulSpiral=5
    bigCircle=170
  }
}
else if room=rShadyCaves5
{
  if global.gameProgress<=274
  {
    boss=instance_create(928,168,oPhalanx)
    if global.currentBoss="Ultimate Phalanx"
      boss.activateBoss=1
    if global.gameProgress<273 and global.currentBoss="Ultimate Phalanx"
      sceneProgress=50
  }
  lavaTop=32
  lavaAlpha=0.415
  lavaTopTimer=0
  lavaAlphaTimer=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=243 //intro to Shady Woods
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
    msgCreate("Oh I don't think so.#There's really a Muffin in here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I couldn't detect it till we got close, but yes.#The Artist was right.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Would it have anything to do with this haze?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It might have been, but more importantly; Watch your footing here,#the trees and this haze are going to distort your vision.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I remember the original had spikey weeds.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Yes, and if you're lucky, the forest won't catch fire.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I'm more worried about the unknown at this point.#The Darkness has no reason to use something we already know about.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("By the way, like the music?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It's not very fitting.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("At least it's a forest.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11
  {
    global.gameProgress=244
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Shady Woods"
    global.gamePaused=false
  }
}
else if room=rShadyWoods4 and (global.gameProgress=247 or global.gameProgress=249) //Boss Fight (Ultimate Phalanx)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=720
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
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Turn back.#I will give you this one chance to leave.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("We need the Muffin.#I'm not turning back... especially not through that forest.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Your decision is undesirable. I have been left with no choice.#Commencing attack on Abstracity.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Data extraction shall continue.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I understand what's going on now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Is it really able to get into Abstracity?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("It didn't have to, its been inside this whole time.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("We need to get back there!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
  {
    msgCreate("You will not interfere!",1,oMessageCutscene,global.mainCharacters[2])
    if global.gameProgress<248
      sceneProgress=14
  }
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Any reason you're doing this again?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Is boredom a good answer?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Not really, but I'll accept it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrier=instance_create(352,-128,oBossBarrier)
      newBarrier.image_yscale=7
      oPlayer1.raveTime=0
      sceneDelay=0
      if global.gameProgress<248
        global.gameProgress=248
      sceneProgress=20
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Ultimate Phalanx"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if room=rShadyWoods2 and global.gameProgress=249 //Into Distortion 4
{
  if sceneProgress=0
  {
    if oPlayer1.x<=2464
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      bossFinishFadeAlpha=1
      playSound(global.snd_Static,0,1)
      background_visible[6]=true
      stopAllMusic()
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if sceneDelay mod 15=0
      playSound(global.snd_Static,0,1)
    sceneDelay+=1
    staticAlpha+=0.01
    background_alpha[6]=staticAlpha
    if sceneDelay>=130
    {
      sound_stop_all()
      background_visible[6]=false
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=60
    {
      dataShow=1
      backrgb-=5
      fadeColor=make_color_rgb(backrgb,backrgb,backrgb)
      if backrgb<=0
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
    msgCreate("What's going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Damn it!#I don't know, but it isn't good!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I can't see anything, can you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Data, just endless amounts of incomprehensible data.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("See if you can find a way to get some light in here...#Where ever this is.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I'll try and see what I can do...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("That message is very unnerving.#I hope it doesn't mean what I think it does.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Well since I can't see anything and will most likely need to wait around till#I get thrown into Distortion AGAIN, what did The Darkness mean earlier#when it said it was attacking Abstracity?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("We screwed up big time.#Actually we screwed up twice.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
  {
    playSound(global.snd_Static,0,1)
    msgCreate("Th%t \/\/asn't tKe real S%#us.",1,oMessageCutscene,global.mainCharacters[1])
  }
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("What wasn't real?#You're cutting out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
  {
    playSound(global.snd_Static,0,1)
    msgCreate("T^e D45*n3ss t2I_k4d us 4ll.",1,oMessageCutscene,global.mainCharacters[1])
  }
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Dang it " +string(global.mainCharacters[1]) +string(", what's going on!?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18
  {
    if sceneDelay mod 15=0
      playSound(global.snd_Static,0,1)
    sceneDelay+=1
    if sceneDelay=1
    {
      staticAlpha=0
      background_visible[6]=true
    }
    staticAlpha+=0.02
    background_alpha[6]=staticAlpha
    if sceneDelay>=90
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=19
  {
    global.gameProgress=250
    writeToPlayerGlobals()
    global.newMapX=0
    global.newMapY=0
    room_goto(rDistortionW4_1)
  }
}
else if room=rShadyCaves1 and global.gameProgress=267 //intro to Shady Caves
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      stopAllMusic()
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
    msgCreate("What is this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It's a cave under the Shady Woods.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I seem to be stuck.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I noticed.#It's that unbeatable guy from before.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Any reason it was unbeatable?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It is using a Muffin which you will need to get before fighting it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Alright, I'll get the Muffin, kick this things ass, and get back to Abstracity.#Hey wait, can't you warp me back?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("It seems to be blocking that too, besides, we'll need this Muffin.#Might as well get it now. That leaves only one more,#and I have a feeling I know who has it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("The engineer right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Yep, I'm pretty sure I detected one on him.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("He's not going to give up that Muffin very easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("That is most likely the case.#We need to find out what he meant by coming to a#peaceful agreement with The Darkness.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13
  {
    global.gameProgress=268
    sceneProgress=0
    global.stockArmor+=1
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Shady Caves"
    global.gamePaused=false
  }
}
else if room=rShadyCaves3 and global.gameProgress=270 //bullet storm
{
  if sceneProgress=0
  {
    if oPlayer1.x>=256
    {
      newBarrier=instance_create(32,240,oBossBarrier)
      with oSaveDoor
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and global.gamePaused=false
  {
    sceneDelay+=1
    if sceneDelay mod bulFreq=0 //normal spiral
    {
      dir=0
      for(i=0;i<bulSpiral;i+=1)
      {
        newBullet=instance_create(bulPointX1,bulPointY1,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(255,190,190)
        newBullet.physicalPower=bulPower
        newBullet.bulletSpeed=6
        newBullet.direction=bulDir1+dir
        newBullet.image_angle=bulDir1+dir

        newBullet=instance_create(bulPointX2,bulPointY2,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(255,190,190)
        newBullet.physicalPower=bulPower
        newBullet.bulletSpeed=6
        newBullet.direction=bulDir2+dir
        newBullet.image_angle=bulDir2+dir

        dir+=360/bulSpiral
      }
      bulDir1+=8
      bulDir2-=8
    }
    if sceneDelay mod bigCircle=0 //big circle
    {
      dir=0
      for(i=0;i<30;i+=1)
      {
        newBullet=instance_create(bulPointX1,bulPointY1,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(190,255,190)
        newBullet.physicalPower=bulPower
        newBullet.bulletSpeed=2
        newBullet.direction=dir
        newBullet.image_angle=dir

        newBullet=instance_create(bulPointX2,bulPointY2,oMMeShot1)
        newBullet.sprite_index=sEbulletDiamond
        newBullet.image_blend=make_color_rgb(190,255,190)
        newBullet.physicalPower=bulPower
        newBullet.bulletSpeed=2
        newBullet.direction=dir
        newBullet.image_angle=dir

        if sceneDelay>=900
        {
          newBullet=instance_create(bulPointX1,bulPointY1,oMMeShot1)
          newBullet.sprite_index=sEbulletDiamond
          newBullet.image_blend=make_color_rgb(190,190,255)
          newBullet.physicalPower=bulPower
          newBullet.bulletSpeed=3.25
          newBullet.direction=dir
          newBullet.image_angle=dir

          newBullet=instance_create(bulPointX2,bulPointY2,oMMeShot1)
          newBullet.sprite_index=sEbulletDiamond
          newBullet.image_blend=make_color_rgb(190,190,255)
          newBullet.physicalPower=bulPower
          newBullet.bulletSpeed=3.25
          newBullet.direction=dir
          newBullet.image_angle=dir
        }
        dir+=360/30
      }
    }

    if sceneDelay>=1800
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=120
    {
      oPlayer1.x=256
      oPlayer1.y=272
      bossFinishFadeAlpha=1
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=150
    {
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
    if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(256,160,oMagicalMuffin)
      muffin.muffinType=5
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
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What flavor is that?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 //---------- Muffin Sequence ----------
    getMuffin(5)
  else if sceneProgress=8 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL REFRIED MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=9
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("That's... really...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Disgusting.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Yeah that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Alright, get up there and kick that guy's ass so we can check on Abstracity.#I'm worried.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I am too.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15
  {
    instance_create(80,272,oSaveDoor)
    with oBossBarrier
      instance_destroy()
    global.gameProgress=271
    sceneProgress=0
    global.gamePaused=false
  }
}
else if room=rShadyCaves5 and global.gameProgress<=273 //Boss Fight (Ultimate Phalanx)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=720
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
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  if global.gameProgress=273 //Muffin obtained
  {
    if sceneProgress=2 and bWaitForInput=false
      msgCreate("You can beat him this time.#He won't be invincible anymore.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=3 and bWaitForInput=false
      msgCreate("Defeating this means nothing.",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=4 and bWaitForInput=false
      msgCreate("I need to so I can leave this place.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=5 and bWaitForInput=false
      msgCreate("It is too late. Abstracity lost to you.",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=6 and bWaitForInput=false
      msgCreate("Dude, my friends were there?!#What did you do with them?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=7 and bWaitForInput=false
      msgCreate("Switching priority to Self Preservation...#Give me the Muffins.",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=8 and bWaitForInput=false
      msgCreate("Dude, I asked you a question!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=9 and bWaitForInput=false
      msgCreate("Shutting down the system will have adverse effects on those within it.",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=10 and bWaitForInput=false
      msgCreate("You're still not answering me!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=11 and bWaitForInput=false
      msgCreate("Wait a minute, hold up... What did it say?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=12 and bWaitForInput=false
      msgCreate("Hmm?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=13 and bWaitForInput=false
      msgCreate("It said there would be negative effects on everyone inside the system#if it were shut down. Explain yourself!",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=14 and bWaitForInput=false
      msgCreate("The system must be kept intact or all entities within it#will cease to exist.",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=15 and bWaitForInput=false
      msgCreate("That's complete bull... right?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=16 and bWaitForInput=false
      msgCreate("It has to be... It's lying and trying to get us to stop.#Beat this thing so we can get out of this cave.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=17 and bWaitForInput=false
      msgCreate("Hostility will be answered with hostility.#Is that what you wish?",1,oMessageCutscene,global.mainCharacters[2])
    else if sceneProgress=18 and bWaitForInput=false
      msgCreate("I'm tired of listening to you.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=19 and bWaitForInput=false
      msgCreate("You have made your choice.",1,oMessageCutscene,global.mainCharacters[2])
  }
  else //Muffin not obtained
  {
    if sceneProgress=2 and bWaitForInput=false
      msgCreate("You can't beat this thing, why are you fighting it?#You need that Muffin first.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=3 and bWaitForInput=false
      msgCreate("No worries, I'm just practicing.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=4 and bWaitForInput=false
      msgCreate("Have fun going through that lava passage two more times.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=5 and bWaitForInput=false
    {
      msgCreate("I hate it when you point out stuff like that!",1,oMessageCutscene,global.mainCharacters[0])
      sceneProgress=19
    }
  }
  if sceneProgress=20
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      newBarrier=instance_create(352,-128,oBossBarrier)
      newBarrier.image_yscale=7
      oPlayer1.raveTime=0
      sceneDelay=0
      if global.gameProgress=273
      {
        sceneProgress=0
        global.gameProgress=274
      }
      else
        sceneProgress=50
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Ultimate Phalanx"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=274 //boss fight ends (Ultimate Phalanx)
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
      oPlayer1.x=128
      oPlayer1.y=288
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
    msgCreate("Is this whole thing finally over?#Can I really leave now?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Yes, you can teleport out now and the Shrouds have backed off.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Forever right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Like that would happen.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Wishful thinking.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Alright, get over to Abstracity!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11
  {
    global.gameProgress=275
    global.shroudThreat=10
    global.teleportEnabled=0
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    oPlayer1.bCanTakeDamage=true
    sceneProgress=0
    global.gamePaused=false
  }
}

if (room=rShadyWoods2 or room=rShadyWoods3) and global.gameProgress=249 and global.gamePaused=false //Distortion Aura
{
  screenStaticTime+=1
  if screenStaticTime=180
  {
    playSound(global.snd_Static,0,1)
    background_visible[6]=true
  }
  else if screenStaticTime=215
  {
    background_visible[6]=false
    screenStaticTime=irandom(60)
  }
}
if room=rShadyCaves5 and global.gamePaused=false //Slightly boosted recovery
{
  if oPlayer1.spiritEnergy<oPlayer1.maxSpiritEnergy
    oPlayer1.spiritEnergy+=0.5
  if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
    oPlayer1.fireEnergy+=0.5
  if oPlayer1.waterEnergy<oPlayer1.maxWaterEnergy
    oPlayer1.waterEnergy+=0.5
  if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
    oPlayer1.windEnergy+=0.5
  if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
    oPlayer1.earthEnergy+=0.5
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
if dataShow=1
{
  draw_set_alpha(1)
  draw_set_color(make_color_rgb(0,255,0))
  draw_set_font(fnt_ScanData)
  draw_set_halign(fa_left)
  if data_Pos<string_length(data_Full)
  {
    draw_text(view_xview[0]+32,view_yview[0]+256,data_New)
    typingCount+=1
    if typingCount mod typingSpeed=0
    {
      data_Pos+=1
      data_New+=string_char_at(data_Full,data_Pos)
    }
  }
  else
  {
    draw_text(view_xview[0]+32,view_yview[0]+256,data_Full)
    resetCount+=1
    if resetCount>=60
      draw_text(view_xview[0]+32,view_yview[0]+304,">RESET . . .")
  }
}
if room=rShadyCaves3 and global.gameProgress=270 //bullet spawners
{
  if sceneProgress=1
  {
    draw_set_alpha(0.75)
    draw_set_color(make_color_rgb(200,100,50))
    draw_circle(bulPointX1,bulPointY1,8,0)
    draw_circle(bulPointX2,bulPointY2,8,0)
  }
}
else if room=rShadyCaves4
{
  draw_set_color(make_color_rgb(216,0,0))
  draw_set_alpha(0.3)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(1168,64,3472,384,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
else if room=rShadyCaves5
{
  lavaTopTimer+=1
  if lavaTopTimer>=1 and lavaTopTimer<=200
    lavaTop+=0.05
  else if lavaTopTimer>=201 and lavaTopTimer<=400
  {
    lavaTop-=0.05
    if lavaTopTimer=400
      lavaTopTimer=0
  }
  lavaAlphaTimer+=1
  if lavaAlphaTimer>=1 and lavaAlphaTimer<=300
    lavaAlpha-=0.0005
  else if lavaAlphaTimer>=301 and lavaAlphaTimer<=600
  {
    lavaAlpha+=0.0005
    if lavaAlphaTimer=600
      lavaAlphaTimer=0
  }

  draw_set_color(make_color_rgb(216,0,0))
  draw_set_alpha(lavaAlpha)
  draw_set_blend_mode(bm_add)
  draw_rectangle_color(0,lavaTop,1024,384,c_black,c_black,c_red,c_red,false)
  draw_set_blend_mode(bm_normal)
}
