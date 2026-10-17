#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=0
fadeColor=c_black
sceneProgress=0
sceneDelay=0

if room!=rDistortionW4_6
  tile_layer_depth(100,10)

if global.gameProgress=250
{
  staticAlpha=1
  background_index[6]=backStatic
  background_visible[6]=true
  background_foreground[6]=true
  background_alpha[6]=staticAlpha
  background_hspeed[6]=31
  background_vspeed[6]=21
}
tile_layer_hide(11)
if room=rDistortionW4_1
{
  background_visible[1]=1
  background_alpha[1]=0.2
  background_visible[2]=1
  background_alpha[2]=0.15
  background_xscale[2]=2
  background_yscale[2]=2

  bBackScroll=1
}
else
  bBackScroll=0

if room=rDistortionW4_2
  blurShift=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=250 //intro to Distortion Reckoning
{
  if sceneProgress=0
  {
    //if sceneDelay mod 15=0 and sceneDelay<50
    if scrModPass(sceneDelay,15) and sceneDelay<50 //60fps change: once each time the count reaches a multiple of it
      playSound(global.snd_Static,0,1)
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //staticAlpha-=0.02
    staticAlpha-=0.02*gDeltaTime //60fps change: per 30fps tick
    background_alpha[6]=staticAlpha
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      oPlayer1.image_speed=0.1
    if sceneDelay>=70
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Is this really Distortion?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Your friend can't help you now.#You're in my territory and soon this entire network will be.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("What's going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("The Darkness is beginning to override the control priority.#It now has The Artist.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("How is this possible?#The Darkness can't get into Abstracity.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It didn't have to get in. It was already there.#You brought The Artist straight to us.#It was troublesome finding him, if I hadn't been restrained to this garbage#collection, I would have been able to track him easily alongside The Darkness.#Not to mention counteracting " +string(global.mainCharacters[1]) +string("'s protection on you."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Guess you're not going to tell me, then who are you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I can't believe you haven't figured it out yet.#" +string(global.mainCharacters[1]) +string(" in particular should know by now.#It doesn't matter, he can't help you, and now that we no longer have#use of you, I'm going to get rid of you."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("I have a few secrets of my own.#I can get out of this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I know everything " +string(global.mainCharacters[1]) +string(" knows about you."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("What's that supposed to mean?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Good luck, not like it will help you here.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("I don't need luck.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    global.gameProgress=251
    global.stockWeaponGem+=1
    global.stockArmor+=1
    global.stockRing+=1
    sceneProgress=0
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Distortion Reckoning"
    global.gamePaused=false
  }
}
else if global.gameProgress=252 and room=rDistortionW4_2 //chat with Hexor
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("What is all this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Your personal hell.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You know, that's something she would say and put me through...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You're really dense if you haven't figured it out yet.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate(". . .#Oh by the way, bullet hell games are my hell, not this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("This will be close enough.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7
  {
    global.gameProgress=253
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=255 and room=rDistortionW4_4 //chat with Hexor
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("You know, I was thinking about it...#You can't be her, she was never any good with computers or games.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Even I knew that one, and you told " +string(global.mainCharacters[1]) +string(" about it."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate(". . .#What's with the limited view here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Why don't you find out for yourself.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5
  {
    global.gameProgress=256
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=257 and room=rDistortionW4_5 //chat with Hexor
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
  {
    playSound(global.snd_Static,0,1)
    msgCreate("Break $^# de*#c3 in *$3 n3*t ro08",1,oMessageCutscene,global.mainCharacters[1])
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Ugh, " +string(global.mainCharacters[1]) +string(" is really troublesome.#How is he able to break through like that? ...#I know why now, this won't be a problem once I get out of Distortion."),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3
  {
    global.gameProgress=258
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=259 and room=rDistortionW4_6 //Boss Fight (Fourth Wall Crusher)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=512
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
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      boss=instance_create(512,160,oFourthWallCrusher)
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("That was a bland entrance.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I will control this...",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Urgh, why did I eat that?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What the hell?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That thing can handle you for a moment while I'm...",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I better take advantage of this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Give up.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Gamers never give up!#We trust our instincts!...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I'm so glad " +string(global.mainCharacters[1]) +string(" can't respond right now.#I know he would make fun of that cheesy reference."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      barrier1=instance_create(304,256,oBossBarrier)
      barrier2=instance_create(704,256,oBossBarrier)
      oPlayer1.raveTime=0
      global.gameProgress=260
      sceneDelay=0
      sceneProgress=0
      with oMisc
        instance_destroy()
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Fourth Wall Crusher"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=260 //boss fight ends (Fourth Wall Crusher)
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
      oPlayer1.x=512
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
    msgCreate("I can't understand this!#How did you win?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Power of friendship?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Why are you being so cheesy?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("It's fun!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Well stop, you're making me AND The Darkness nauseated.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("You're both so damn annoying!#It's aggravating that you two keep overcoming all this.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("We're the two best gamers to ever exist.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("That's impossible, The Darkness got rid of every hardcore gamer!#It would have found you!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("We're... under the radar these days.#We got some corporate jobs and that sucked up most of our time;#we couldn't attend any tournaments.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("You must've competed or at least posted scores somewhere.#If you're the best, you would have appeared SOMEWHERE!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("We had no Internet.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Look, that wasn't my fault.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I blame you for that catastrope.#You're the one who pissed her off.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("How was I supposed to know she would go off the deep end like that?#I thought she was mad at me, not the router!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Enough! I understand that now, but how did I not know this?#I should know everything " +string(global.mainCharacters[1]) +string(" knows!"),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Yeah, that's really creepy when you say that.#Do you know him " +string(global.mainCharacters[1]) +string("?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("You could say that...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Mind not being cryptic?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("He is me... well sort of.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("So you did figure it out.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("I don't... wait a minute, he's a copy of you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Yes, since I'm almost a part of the system already,#it could replicate me easy.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("This actually makes some sense, wait!#That must be how The Darkness got into Abstracity!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Of course, did you really think The Darkness would let you#rescue " +string(global.mainCharacters[5]) +string(" that easy?"),1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("Was that the real Gene then?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Of course not, though The Darkness did try to coax him.#That is when it decided to use copies of you all.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Where are all the originals?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Same place The Artist was taken, but you will never find its location.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("Ignore " +string(global.mainCharacters[3]) +string(", I'm going to find you an exit.#We need to check on Abstracity."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Abstracity is lost.#Even if you do manage to find a way out, you have nothing left.#We have The Artist now, it is only a matter of time before The Darkness has#complete control of its systems again.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("Ignore him now, remember I know everything about him too.#There's no need to fear him anymore, I can counter anything he throws at you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=36
  {
    global.gameProgress=261
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=262 and room=rDistortionW4_7 //don't touch the red
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Let me guess, don't touch the red?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Genius.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3
  {
    global.gameProgress=263
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=263 and room=rDistortionW4_7 and global.gamePaused=false //enemy trap event
{
  if sceneProgress=0
  {
    if oPlayer1.x>=2912
    {
      newBarrierL=instance_create(2704,64,oEventBarrier)
      newBarrierL.image_yscale=2
      newBarrierR=instance_create(3104,64,oEventBarrier)
      newBarrierR.image_yscale=2
      enemyCount=16
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
    newEnemy=instance_create(2736,48,oDistortedWisp) //1
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3072,48,oDistortedWisp) //2
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=180
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4
  {
    newEnemy=instance_create(2736,320,oDistortedWisp) //3
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3072,320,oDistortedWisp) //4
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=210
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    newEnemy=instance_create(2736,48,oDistortedWisp) //5
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3072,48,oDistortedWisp) //6
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(2736,320,oDistortedWisp) //7
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    newEnemy=instance_create(3072,320,oDistortedWisp) //8
    newEnemy.bActive=true
    newEnemy.questType=1
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    sceneProgress+=1
  }
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=240
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(2736,48,oDistortedWisp) //9
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(3072,48,oDistortedWisp) //10
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(2736,320,oDistortedWisp) //11
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(3072,320,oDistortedWisp) //12
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=160
    else if scrCountPass(sceneDelay,160) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(2736,48,oDistortedWisp) //13
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=170
    else if scrCountPass(sceneDelay,170) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(3072,48,oDistortedWisp) //14
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=180
    else if scrCountPass(sceneDelay,180) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(2736,320,oDistortedWisp) //15
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    }
    //else if sceneDelay=190
    else if scrCountPass(sceneDelay,190) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(3072,320,oDistortedWisp) //16
      newEnemy.bActive=true
      newEnemy.questType=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9 and enemyCount=0
  {
    playSound(global.snd_SwitchHit,0,1)
    with oEventBarrier
      instance_destroy()
    global.gameProgress=264
  }
}
else if global.gameProgress=265 and room=rDistortionW4_8 //exit found
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      global.gamePaused=true
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Yes, finally.#I hated this place.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("We'll meet again soon.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Yeah that's cool.#Bye!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=266
    sceneProgress=0
    global.gamePaused=false
  }
}

//---------- move background ----------
if bBackScroll=1
{
  background_x[2]=oEvDistortion4_BackDummy.x
  background_y[2]=oEvDistortion4_BackDummy.y
}
//---------- hide/show tile layer 11 ----------
if oPlayer1.attackState=oPlayer1.TECH_MENTAL_INSURRECTION
  tile_layer_show(11)
else
  tile_layer_hide(11)
//---------- blur effect ----------
if room=rDistortionW4_2
{
  //blurShift+=1
  blurShift+=gDeltaTime //60fps change: counts 30fps ticks
  //if blurShift mod 3=0
  if scrModPass(blurShift,3) //60fps change: once each time the count reaches a multiple of it
    if instance_exists(oPlayerAfterImage)
      instance_create(0,0,oScreenEffect)
}
//---------- disable dash ----------
if room=rDistortionW4_3
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
