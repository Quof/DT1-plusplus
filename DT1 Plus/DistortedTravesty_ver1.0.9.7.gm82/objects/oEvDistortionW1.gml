#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
if global.gameProgress=58
  bossFinishFadeAlpha=1
else
  bossFinishFadeAlpha=0
fadeColor=c_white

if (global.gameProgress=64 or global.gameProgress=65) and room=rDistortionW1_5
{
  deathLineX=-16
  if global.difficulty=1
    deathLineSpeed=6.6
  else if global.difficulty=2
    deathLineSpeed=6.9
  else if global.difficulty=3
    deathLineSpeed=6.96
  else if global.difficulty=4
    deathLineSpeed=7.05
  deathExplosionDelayFront=0
  deathExplosionDelayBack=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=58 //intro to Distortion
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      oPlayer1.image_speed=0.1
      oPlayer1.sprite_index=sPlayerIdle
    }
    //else if sceneDelay>=90 and sceneDelay<=130
    else if sceneDelay>89 and sceneDelay<=130 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if bossFinishFadeAlpha>0
        //bossFinishFadeAlpha-=0.04
        bossFinishFadeAlpha-=0.04*gDeltaTime //60fps change: per 30fps tick
    }
    else if sceneDelay>=150
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("What... is this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I have no idea. I'll scan around and do some stuff here.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Then I'll look around. There has to be an exit or a clue to what this is.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=59
    global.stockWeaponGem+=1
    global.stockArmor+=1
    global.stockRing+=1
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Distortion"
    global.gamePaused=false
  }
}
else if global.gameProgress=62 and room=rDistortionW1_4 //Boss Fight (Abyss Lord)
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
    if oPlayer1.y<288
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
    //if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    //60fps change: the step's setup runs on its first frame, as 30fps runs it on its first step. Counted to 1 it came
    //half a tick late at 60fps (3/4 at 120), after the with oTempEffect below had already run on the first frame (a GM
    //error: oTempEffect is the object this setup makes with object_add)
    if scrCountPass(sceneDelay,gDeltaTime) //60fps change: see above
    {
      oTempEffect=object_add()
      oE1=instance_create(432,160,oTempEffect)
      //oE1.direction=90
      oE1._direction=90 //60fps change: _speed/_direction (it's made at run time with object_add, so the with oTempEffect below moves it)
      oE1._speed=0 //60fps change (added)
      oE2=instance_create(176,160,oTempEffect)
      //oE2.direction=270
      oE2._direction=270 //60fps change: see above
      oE2._speed=0 //60fps change (added)
    }
    with oTempEffect
    {
      //if speed=0
      if _speed=0 //60fps change: see above
      {
        //speed=8
        _speed=8 //60fps change: see above
        dirChange=4
      }
      //effect_create_above(ef_smoke,x,y,0,c_black)
      if gDeltaDoTicks effect_create_above(ef_smoke,x,y,0,c_black) //60fps change: once per 30fps tick
      //direction+=dirChange
      _direction+=dirChange*gDeltaTime //60fps change: turns per 30fps tick
      //dirChange+=0.05
      dirChange+=0.05*gDeltaTime //60fps change: per 30fps tick
      correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
    }

    //if sceneDelay=60
    if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
    {
      bossFinishFadeAlpha=1
      with oTempEffect
        instance_destroy()
      object_delete(oTempEffect)
      boss=instance_create(304,160,oAbyssLordBody)
    }
    //else if sceneDelay>=61 and sceneDelay<=90
    else if sceneDelay>60 and sceneDelay<=90 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if bossFinishFadeAlpha>0
        //bossFinishFadeAlpha-=0.04
        bossFinishFadeAlpha-=0.04*gDeltaTime //60fps change: per 30fps tick
    }
    else if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Destruction is immenent!#Deliver the Muffins!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Is the same voice constantly talking to us?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("That would appear to be the case.#So what are you going to do here?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Well it's not getting the Muffins, I have a feeling we're going to need them#to get home. Besides, if we don't, I'll share them with you.#I bet they taste like pure awesome.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Commence destruction of the anomally.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Stop calling me that!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      barrier1=instance_create(48,224,oBossBarrier)
      barrier2=instance_create(544,224,oBossBarrier)
      oPlayer1.raveTime=0
      global.gameProgress=63
      sceneDelay=0
      sceneProgress=0
      with oMisc
        instance_destroy()
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Abyss Lord"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=63 //boss fight ends (Abyss Lord)
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
      oPlayer1.x=304
      oPlayer1.y=289
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
    msgCreate("Easy ass kickings are easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("He pushed you around a bit.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("HEY! Who's the one standing right now? ... ME! ...#By the way, do you know of a way out of this place?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Nope.#I've been trying to find one, but I'm being blocked.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("YOU are being blocked?#By what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I'm assuming another hacker, but I'm not certain.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I'll just keep going, we're sure to find something.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12
  {
    global.gameProgress=64
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=64 and room=rDistortionW1_5 //Fire Tunnel Escape
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
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=15
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Whoa, something is wrong here?#What's happening?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("A major disturbance.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("That's far enough.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Who the hell?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("No need for introductions. I just want those Muffins!#I shall have them!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Just run!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Why?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Don't question me, just do it!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    global.gamePaused=false
    sceneProgress=0
    global.gameProgress=65
  }
}
else if global.gameProgress=65 and room=rDistortionW1_5 //Explosion start
{
  if sceneProgress=0
  {
    if oPlayer1.x>=240
      sceneProgress+=1
  }
  else if sceneProgress>=1 and global.gamePaused=false
  {
    if deathLineX>=oPlayer1.x
      oPlayer1.life-=oPlayer1.maxLife
    //deathLineX+=deathLineSpeed
    deathLineX+=deathLineSpeed*gDeltaTime //60fps change: per 30fps tick
    if deathExplosionDelayFront>=3
    {
      explosion=instance_create(deathLineX-random(32),random(160)+160,oEffect)
      explosion.sprite_index=sBomberExplosion
      explosion.image_speed=0.5
      //deathExplosionDelayFront=0
      deathExplosionDelayFront=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    }
    else
      //deathExplosionDelayFront+=1
      deathExplosionDelayFront+=gDeltaTime //60fps change: counts 30fps ticks

    if deathExplosionDelayBack>=5
    {
      playSound(global.snd_CASdie,0,1)
      explosion=instance_create(deathLineX-16-random(240),random(160)+160,oEffect)
      explosion.sprite_index=sBomberExplosion
      explosion.image_speed=0.5
      //deathExplosionDelayBack=0
      deathExplosionDelayBack=gDeltaTime-1 //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    }
    else
      //deathExplosionDelayBack+=1
      deathExplosionDelayBack+=gDeltaTime //60fps change: counts 30fps ticks

    if oPlayer1.x>=3952
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    if oPlayer1.y<288
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
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("It seems that since you got to the end of the tunnel#the wall of explosions arbitrarily stopped.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It got scared of my Aura of Awesome.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("We'll just say that's what it was.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Ugh, fine, you win this time.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Who are you anyway?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate(string("That is ") +string(global.mainCharacters[3]) +string(", he seems to be with the enemy."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("So it appears you too are on the fourth wall.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I am, I'm not sure why, I just know that I am.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Yeah you tell'em... or something.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Why do you want the Muffins?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("A plan far greater than you could imagine!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Does it in even the slightest bit involve taking over the world?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Yeah... so?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Laaaaame!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Can you two take this to IM or something?#I just want to keep going.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Sure, whatever.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19
  {
    global.gameProgress=66
    global.currentBoss=""
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=68 and room=rDistortionW1_7 //End of Distortion 1
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      fadeColor=c_black
      stopPlayer()
      oPlayer1.depth=-150
      bSizeUp=false
      sizeMod=0
      lightSize=0
    }
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Dude!!#It's a portal!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Finally.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You have arrived.",1,oMessageCutscene,"Daunting Voice")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.01
      bossFinishFadeAlpha+=0.01*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=7
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("What is going on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=1 and sceneDelay<=64
    if sceneDelay>0 and sceneDelay<=64 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //lightSize+=0.5
      lightSize+=0.5*gDeltaTime //60fps change: per 30fps tick
    else if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I am the Guiding Voice.",1,oMessageCutscene,"Daunting Voice")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Umm... hi there.#Jeremy it lies, it says Guiding Voice, yet was called... nevermind.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I do not have much time.#The Darkness will soon find this void and shatter our connection.#I must deliver a message to you before that happens!",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("I guess that would be fine. Let's hear it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("The Unknown entity known as The Darkness, has created a Phase Distortion,#which has merged all of the worlds together.#By doing this, it has brought all of the Muffins into one world. The worlds are#in mass confusion and chaos and do not have the means to fight back.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("You need us to get these Muffins before it does then?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Correct, no one knows what The Darkness will do once it has all the Muffins,#but we know it can't be good.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What makes you think we can stop this... Darkness?#We are not from any of these worlds.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Your ability to battle the dark entities such as this has#been proven countless times. We have been watching you.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("So we're like... the chosen ones, or twos, or whatever?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Until you screw up or we find someone better, yes.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("That's pretty bad ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("You hold 2 Muffins. The Darkness will stop at nothing to get those from you.#Be on your guard.#And Jeremy, you have the ability to change the worlds which are currently viewed.#Remember this fact, you can undo anything.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("I've kinda figured some of this out, but undo?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("When the time comes, you will know what to do.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Oh great. Prophecies.#By the way, where are the world's heroes?#They should be more than adaquete for this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("They have all disappeared, I am sure The Darkness has something to do with that.#But enough, you must travel south, there you will find a great city.#You will find all the answers to your questions there.",1,oMessageCutscene,"Guiding Voice")
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Sounds good, let's do this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=1 and sceneDelay<=64
    if sceneDelay>0 and sceneDelay<=64 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //lightSize-=0.5
      lightSize-=0.5*gDeltaTime //60fps change: per 30fps tick
    else if sceneDelay>=80
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=29
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.01
      bossFinishFadeAlpha-=0.01*gDeltaTime //60fps change: per 30fps tick
    if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("This whole thing is odd.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("I agree, and what is this place?#Have you figured it out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("I am not positive, but I believe we are caught in the Phase Distortion itself.#To put it plainly, we are caught between worlds.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("I'm just gonna leave then, I don't really like the sound of that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=34
  {
    global.gameProgress=69
    oPlayer1.depth=20
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
if global.gameProgress=68 and room=rDistortionW1_7
{
  if sceneProgress>=9 and sceneProgress<=28
  {
    draw_set_alpha(random(0.05)+0.3)
    if bSizeUp=false
    {
      //sizeMod-=0.1
      sizeMod-=0.1*gDeltaTime //60fps change: per 30fps tick
      if sizeMod<=-2
        bSizeUp=true
    }
    else
    {
      //sizeMod+=0.1
      sizeMod+=0.1*gDeltaTime //60fps change: per 30fps tick
      if sizeMod>=4
        bSizeUp=false
    }
    draw_set_blend_mode(bm_add)
    draw_circle_color(272,160,lightSize+sizeMod,make_color_rgb(240,193,64),c_black,false)
    draw_set_blend_mode(bm_normal)
  }
}
