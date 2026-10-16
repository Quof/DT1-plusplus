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
if global.gameProgress=14
  bossFinishFadeAlpha=1
if global.gameProgress=31 and room=rOldCastle5
  screenFlash=0

if room=rDonutPlains1Secret or room=rRumpyMountains2Secret
{
  autoScroll=instance_create(view_wview[0]/2-64,0,oMisc)
  autoScroll.type=0
  autoScroll.sprite_index=sNull
  view_object[0]=autoScroll
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=14 //intro to Mario World
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      oPlayer1.image_speed=0.1
      oPlayer1.sprite_index=sPlayerLayDown
    }
    else if sceneDelay>=90 and sceneDelay<=130
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.04
    }
    else if sceneDelay=180
      oPlayer1.sprite_index=sPlayerGetUp1
    else if sceneDelay=195
      oPlayer1.sprite_index=sPlayerGetUp2
    else if sceneDelay>=250
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
  {
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    msgCreate("I half expected to be dead and somewhat disappointed I'm not.",1,oMessageCutscene,global.mainCharacters[0])
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Well that thing sent you through some portal, so that would explain why#you're still alive.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Are you saying we're in a parallel world?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("More like a perpendicular world since the two meet at some point.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("That makes sense...#Now to figure out where we are.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("For a guy who plays games all the time, I'd think that you would be able#to figure that one out easy.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Eh...?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay=10
      oPlayer1.sprite_index=sPlayerGetUp3
    else if sceneDelay=25
      oPlayer1.sprite_index=sPlayerGetUp4
    else if sceneDelay=40
      oPlayer1.sprite_index=sPlayerIdle
    else if sceneDelay>=80
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Whoa! How is this even possible?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I'm sure there is a perfect explanation of why we're here.#Perhaps we should look around.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Wait, where are you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I think I'm on the fourth wall...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("How do you figure that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Well I'm sitting on a wall and it has the number four on it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("How did you end up there?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("My assumption is that I was linked closely to you already.#Meaning I was sent through the portal myself, but due to#where I was, it sent me to a place much like where I already was.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Thats... cool... I suppose.#What can you see from there?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Only what you can, I can see you through my laptop,#I'm sure we'll figure out some nifty uses and ways to#take advantage of this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("That would be great... oh yeah, I seemed to have picked up a new ability.#Apparently that portal infused more Awesome into me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("It must be a Physical Technique then. To use it, press the [L] key.#They consume some Spirit Energy, but no Elemental Energy.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Sounds good, time to look around.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Just a quick reminder:#You can open your menu with [P]. [WASD] for cursor movement. [J] for confirm.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23
  {
    global.gameProgress=15
    sceneProgress=0
    global.techLv=1
    global.p1TechniqueEquip="MENTAL INSURRECTION"
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Donut Plains"
    stringToShow=global.mainCharacters[0] +string(" learned:#Physical Technique: Mental Insurrection")
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),144,oMessageSign)
    newMessage.message=stringToShow
    newMessage.fadingTime=90
    global.gamePaused=false
    instance_destroy()
  }
}
else if global.gameProgress=17 //Toad Town intro
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
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
    msgCreate("This...is...AWESOME!!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("This is definitely pretty cool. Never thought I'd see this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I've always wanted to touch their heads.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You may not want to piss anyone off just yet. Maybe you should#see if you can find out any info on our current situation.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I suppose you're right. I'll try to find whoever's in charge here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Just don't be an ass to anyone.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Dude, this is me were talking about here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Exactly...#Oh yeah, you can interact with people by standing next to them#and pressing up: [" +string(global.ctrlUp) +string("]"),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9
  {
    global.gameProgress=18
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Toad Town"
    global.gamePaused=false
  }
}
else if global.gameProgress=19 //talk to Toad Mayor (first time)
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      fadeColor=c_black
    }
    if sceneDelay>=3
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.04
    else
    {
      stopPlayer()
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_xscale=1
      oPlayer1.x=336
      oPlayer1.y=304
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.04
      else
        sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Oh, you are a visitor from a strange land I see.#What brings you to these parts?",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'm kinda wondering the same thing. I was sent through a strange portal#of some kind, and ended up here.#I was hoping you could tell me where this is.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("A portal you say? That is strange indeed, but not uncommon these days.#You are not the first to have this strange occurance happen to.#Where are you from?",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What is it called again " +string(global.mainCharacters[1]) +string("?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("It is called the Unknown Region. Known for its technological advances#as well as economic vantage over the world. Its downfall is its rise#to corporate powers which now run it without any regards to creativity or#any real advancement that doesn't bring them more monetary value.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That is a land I have not heard of.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Do you know anything that could help my situation?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Hmm, I may know of one thing.#The others who shared a tale similar to yours were drawn to an#old castle to the east. I do not know why, but I know that I have not#seen any of them after their departure.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Then that's where I'll go, better than nothing.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("And could you also put an end to the horrific thing within,#that would be greatly helpful as well.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Hell yeah I'll do that!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I seriously just facepalm'd at that. I'm doubting that place will#help us, it sounds more like he justs to use you to help himself.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("How dare you!#I would never stoop so low as to do that to someone!",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Like it matters, we have no other leads, and besides,#we get to help the Mushroom Kingdom, how awesome is that!?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Great, they ARE going to help.#For a moment there, I thought we'd never get rid of that thing.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Way to speak out loud.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Oops! But you will still offer your assistance won't you?",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Yeah, but one question.#Why don't you just get Mario to help, doesn't he usually do this?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Normally yes, Mario springs into action, but he has disappeared.#I'd say Bowser has something to do with it, but he has disappeared as#well and there are no signs of activity from his castle.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Odd, but whatever, it's none of our business, we just want to get home.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Well the way will be open to you now.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=24
  {
    oToadMayor.stringToShow="Head east to the Old Castle."
    global.gameProgress=20
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=21 //intro to Rumpy Mountains
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("The consistency errors are amazing here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Like you could do any better.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I never said I could, I just like pointing it out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Well anyway, just get to this Old Castle quickly, the stretched#background here is annoying.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Whine whine.#This place should be a piece of cake anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    global.gameProgress=22
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Rumpy Mountains"
    global.gamePaused=false
  }
}
else if global.gameProgress=24 //intro to Old Castle
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=60
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("This should be awesome!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I guess.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You guess?... No way, this is the best thing ever!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I was honestly partial to the Mario series.#Never had a big interest for them. They don't suck,#I just couldn't get into them.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Regardless, this is still gonna rock ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6
  {
    global.gameProgress=25
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Old Castle"
    global.gamePaused=false
  }
}
else if global.gameProgress=27 //Old Castle change
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("What the heck just happened?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I don't know, but I'm checking it out.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("What do you mean you are checking it out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I have my laptop with me here. I've basically been logged into this#weird system the moment we got in this strange place.#I'm still learning the ins and outs of this system.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("So your laptop is linked to this world?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("In a sense, yes.#It is as if me being on the fourth wall here has allowed me#to basically hack into the world and view its contents.#Typically of the location you are at. When you came into this place,#it started going nuts.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("In what way?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("It's as if parts of the world have collided.#Like pieces of it have been spliced together.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Well then, let's keep on going.#Maybe we can get to the bottom of this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Indeed, it looks like that Toad actually did provide some help.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11
  {
    global.gameProgress=28
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=29 //Old Castle Distortion
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("This is even weirder.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("The whole area is going nuts and there is a strange presence around.#I will try to find out what it is.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Sounds like I might be doing some more ass kicking then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=30
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=31 and room=rOldCastle5 //boss fight (Dark Mind)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=368
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
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      screenFlash=1
      oPlayer1.sprite_index=sPlayerGuard
      boss=instance_create(544,240,oDarkMind)
      playSound(global.snd_BreakOut,0,1)
    }
    else if sceneDelay>=9 and sceneDelay<=109
      screenFlash-=0.01
    else if sceneDelay=120
      oPlayer1.sprite_index=sPlayerIdle
    else if sceneDelay>=140
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("That was never in any Mario game.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You are correct.#Regardless if you've figured out where this thing came from, it is not the same.#It has been infused with some sort of energy.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
  {
    boss.sprite_index=sDarkMindArmsUp
    msgCreate("Conform to us.",1,oMessageCutscene,global.mainCharacters[2])
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("The hell?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I don't know what it means, but it is giving off the same signals I mentioned before.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Conform or perish.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("No way I'm conforming to whatever it is you want.#This is cool and all that I'm here, but I missed a new#episode of my favorite TV show.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
  {
    boss.sprite_index=sDarkMindIdle
    msgCreate("Anomally detected.#Destruction of the anomally shall commence.#No mistakes, destroy the anomally.",1,oMessageCutscene,global.mainCharacters[2],2)
  }
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("It's going to attack!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Gonna have to stomp its ass into the ground then!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      barrier1=instance_create(176,240,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=32
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="DarkMind"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=32 //boss fight ends (Dark Mind)
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
      oPlayer1.x=408
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
    msgCreate("Wow, what was up with that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("The data I recieved is interesting.#Whatever is going on is definitely not normal.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Considering we saw two things that aren't supposed to be here, yeah I'd say#this isn't normal.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("The two previous areas have me confused as well.#The whole place became suddenly distorted.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("What do you suggest we do?#This didn't help us figure out how to get home.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Hold on, I'm picking up a MASSIVE amount of energy in the area.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Hmm?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(408,192,oMagicalMuffin)
      muffin.muffinType=0
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
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("What...the...hell?#Is that...a muffin?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("It certainly is, it's a strawberry muffin.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I don't care if it appeared out of thin air, I'm eating it!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("I advise against that.#This muffin is giving off an immense amount of energy.#I think it may serve a higher purpose.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Then I'm going to at least take it with me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I was going to suggest that.#I'm very sure that dark creature was guarding this thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("So what should we do then?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Let's ask that Toad if he knows anything about this muffin.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Sounds like a plan.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Any idea on how you're going to get that muffin?#Or even hold onto it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("It's a magical item left behind by a boss, it'll float down to me.#As far as holding it, it will go in my quest inventory screen.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Oh right, of course.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=25 //---------- Muffin Sequence ----------
    getMuffin(0)
  else if sceneProgress=26 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL STRAWBERRY MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=27 and bWaitForInput=false
  {
    msgCreate(global.mainCharacters[0] +string(" learned:#Fire Technique: Flame Pillar#Water Technique: Water Barrier"),1,oMessageCutscene,"")
    global.fireLv=2
    global.waterLv=2
  }
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Awesome, this muffin just brought out hidden powers in me!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("Awesome indeed.#Let's see what the Toad Mayor has to say about this thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=30
  {
    msgCreate("You can use the portal to quickly exit the dungeon.#Just hold up for 1 second while standing over it.",1,oMessagePerson,"")
    newMessage.fadingTime=300
    exitPortal=instance_create(552,272,oDungeonPortal)
    exitPortal.toRoom=rWorldMap
    exitPortal.newMapX=480
    exitPortal.newMapY=112
    global.stockWeaponGem+=1
    global.stockArmor+=1
    global.stockRing+=1
    global.gameProgress=33
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=34 //talk to Toad Mayor (second time)
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      fadeColor=c_black
    }
    if sceneDelay>=3
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.04
    else
    {
      stopPlayer()
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.image_xscale=1
      oPlayer1.x=336
      oPlayer1.y=304
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.04
      else
      {
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("You returned!#What did you find?",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Nothing but some stereotypical dark creature and a muffin which#is giving off a lot of power.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("A muffin giving off power?!#You can't mean...",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("One of the seven Magical Flavored Muffins?!",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Umm... sure.#If that's what it's called then yes, I have a Magical Flavored Muffin#of the strawberry variety no less.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("If it was held by a creature of darkness, then the world is in grave danger.#You must protect that muffin at all cost!",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("And what if I decide I don't care and eat it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Then I fear the world is doomed.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Well I really don't care about any of this.#I just want to get home.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I agree, I don't want to get involved with this world's dilemmas.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("But you have one of the Magical Flavored Muffins!",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I don't handle responsibility well.#Here, you can have it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I can't protect the Muffin from evil like you two can.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("We aren't going to get involved with this world.#Do you know of any way at all that we can leave?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("This situation is far more grave than you two think, but I suppose I should help#in return for what you did at the Old Castle.#Travel to the lands south-west from the Donut Plains, there you may find#the answers to your questions.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("We appreciate it.#Sorry we can't do anything for you, but we really just want to get home.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Good luck.",1,oMessageCutscene,"Mayor of Toad Town")
  else if sceneProgress=20
  {
    oToadMayor.stringToShow="Go to the lands south-west from the Donut Plains.#You may find what you seek there."
    global.gameProgress=35
    sceneProgress=0
    global.gamePaused=false
  }
}

if room=rDonutPlains1Secret and global.gamePaused=false //autoscroll right
{
  if autoScroll.x<2816
    autoScroll.x+=2.25
  if autoScroll.x-(view_wview[0]/2)-20>oPlayer1.x
    oPlayer1.life-=oPlayer1.maxLife
}
else if room=rRumpyMountains2Secret and global.gamePaused=false //autoscroll right
{
  if autoScroll.x<2816
    autoScroll.x+=2.25
  if autoScroll.x-(view_wview[0]/2)-20>oPlayer1.x
    oPlayer1.life-=oPlayer1.maxLife
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=31
{
  draw_set_alpha(screenFlash)
  draw_set_color(c_white)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
else if global.gameProgress=14 or global.gameProgress=19 or global.gameProgress=32 or global.gameProgress=34
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
