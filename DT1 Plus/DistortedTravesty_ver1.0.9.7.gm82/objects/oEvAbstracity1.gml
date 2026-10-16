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

if global.gameProgress=181
  bossFinishFadeAlpha=1
else if global.gameProgress=241
  bossFinishFadeAlpha=1
else if global.gameProgress=278
{
  fadeColor=c_black
  bossFinishFadeAlpha=1
  npcFI=instance_create(304,336,oMisc)
  npcFI.sprite_index=sKredaeusIdle
  npcFI.image_xscale=-1
  npcFI.type=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=82 //intro to Abstracity
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("So...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("It's a city, no need to comment.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Yeah yeah and... hey!#That guy looks very familiar.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Yeah, that's our poorly and lazily named friend, Hyoga.#Might as well say hi to him.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Only if it isn't a burden on me.#Also... doesn't this place seem familiar to you?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("A little too familiar, but let's just focus on what we came to do.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Sounds good... but DAMN this is kinda creepy though.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    global.gameProgress=83
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Abstracity"
    global.gamePaused=false
  }
}
else if global.gameProgress=85 //talk to Syrus (first time)
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
      oPlayer1.x=368
      oPlayer1.y=336
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
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate(string(global.mainCharacters[0]) +string("! I didn't think I'd ever see you again.#How did you end up here?"),1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("To make a long story short, I was sent through a portal by some weird#and very typical dark creature. You won't believe the things I've seen here!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("At this point, I'll believe anything.#Before we catch up, I must ask... do you know where we are?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Not at all, this place just seems to be a mix of virtual worlds.#I can't make sense of it, it's as if the worlds themselves have been#molded together.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Then you've seen it all...#You see, at first I thought it was just us that got thrown#into that portal, but...",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("But what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("All of us here in this city were all together when that portal appeared.#I didn't think anything of it at first, I figured we were the only ones, but...damn.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("What man?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Our home... is here, all of it... Well some of it.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Say what? That's a joke right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("No, I thought we could find a way to return home.#All of us here tried to find our way home.#We found it, but not in the way we had thought.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("So... none of us can return home?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("That is correct.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("That's total bull!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("I have a theory on that portal too.#I don't think it's a portal at all. More of a way to compress everything together,#like a huge interdimensional gravitation device.#I've over-heard it being called the Phase Distortion.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("We're stuck here then?#Guess I'll continue what I was doing in the first place.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Hmm?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("The Darkness seems to be after these Flavored Muffins.#I'm not sure why it is, but I have 2 of them.#I was told that if The Darkness gets all 7 that the world will be in danger.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Muffins! We've seen one!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Really?! Where?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("To the east, is a train carrying a device holding a Muffin shaped object.#It gives off a particularly awe-inspiring glow. Sounds like it would be what you#are looking for.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("That would be it.#What was that device you just mentioned?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("I'd like to know this one as well.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Wait! I know that voice... " +string(global.mainCharacters[1]) +string("!"),1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Yeah, I got pulled through as well.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Where are you?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("The 4th Wall. I know it sounds crazy, but that's where I am.#I can see anything that " +string(global.mainCharacters[0]) +string(" can."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("I talked to a Yoshi the other day, I'll believe just about anything.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Nice, but anyway,#what is that device you saw?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("I don't know for certain what it is, but ever since it showed up,#strange things have been happening... Like... do you remember those#annoying button sequence things in games, what were they called again?",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("So THAT'S what caused that! You know what this means right " +string(global.mainCharacters[1]) +string("?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Yes, The Darkness has a Quick Time Machine. This is bad.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("Quick Time Events, that's what it was!#That machine needs to be stopped!#Do you have any idea what would happen if it's not stopped?!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("If not, God help us all.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("Seriously, what would happen if this Quick Time Machine is not stopped?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("Then the world will be plagued with non-stop Quick Time Events,#which will lead to one thing...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("And what is that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("More Quick Time Events.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("Dear God, this thing NEEDS to be stopped now.#Where is this train again?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("To the east, I've marked it on your map.#Don't ask how, just accept that I have.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("Thanks, we'll put a stop to these.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("Before leaving, I do suggest looking around the city a bit.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("I'll do that... maybe.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("OH, before you go. I have something I want to give you.#It's a technique that's been hidden for ages.#I want you to have it.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate("Cool, what is it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("The positive energy of Kudeku!",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=49 and bWaitForInput=false
    msgCreate("Kudeku? What is that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=50 and bWaitForInput=false
    msgCreate("Wait, you know of Kudeku?!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=51 and bWaitForInput=false
    msgCreate("My best friend and I have known it for years.#In fact, now that I think about it, I can't give this technique to you.#There's only one person who can.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=52 and bWaitForInput=false
    msgCreate("Who?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=53 and bWaitForInput=false
    msgCreate("Me.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=54 and bWaitForInput=false
    msgCreate("You " +string(global.mainCharacters[1]) +string("?#Why is that?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=55 and bWaitForInput=false
    msgCreate("It's symbolism for everything that is positive.#The word itself is derived from the very concept of positive energy.#Only very close friends can imbue it upon each other.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=56 and bWaitForInput=false
    msgCreate("So like... through the power of friendship and all that...#is how this is learned?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=57 and bWaitForInput=false
    msgCreate("You can't learn it, you... no we, have always had it.#We just didn't know it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=58 and bWaitForInput=false
    msgCreate("That... is both cheesy and awesome at the same time.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=59 and bWaitForInput=false
    msgCreate("What are you waiting for? Show us the power of Kudeku!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=60
  {
    sceneDelay+=1
    if sceneDelay=20
      oPlayer1.sprite_index=sPlayerKneel
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=61
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      for (i=0;i<10;i+=1) //create images
      {
        newImage[i]=instance_create(oPlayer1.x,oPlayer1.y,oMisc)
        newImage[i].type=0
        newImage[i].sprite_index=sPlayerKneel
        newImage[i].delay=i*5
        newImage[i].depth=0
      }
    }
    if sceneDelay>=2 and sceneDelay<=200
    {
      for (i=0;i<10;i+=1) //move images
      {
        newImage[i].delay-=1
        if newImage[i].delay<=0
        {
          newImage[i].image_alpha-=0.09
          newImage[i].image_xscale+=0.1
          newImage[i].image_yscale+=0.1
          if newImage[i].image_alpha<0.1
          {
            newImage[i].image_alpha=1
            newImage[i].image_xscale=1
            newImage[i].image_yscale=1
          }
        }
      }
    }
    if sceneDelay>=60 and sceneDelay mod 5=0 //side effects
    {
      newEffect=instance_create(oPlayer1.x-26,oPlayer1.y,oEffect)
      newEffect.sprite_index=sAirDashWave
      newEffect=instance_create(oPlayer1.x+26,oPlayer1.y,oEffect)
      newEffect.sprite_index=sAirDashWave
      newEffect.image_xscale=-1
    }
    if sceneDelay>=140 //fade to white
    {
      fadeColor=c_white
      if bossFinishFadeAlpha<1
        bossFinishFadeAlpha+=0.04
      else if bossFinishFadeAlpha>=1
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=62
  {
    sceneDelay+=1
    if sceneDelay>=40
    {
      sceneDelay=0
      sceneProgress+=1
      with oMisc
        instance_destroy()
      oPlayer1.sprite_index=sPlayerIdle
    }
  }
  else if sceneProgress=63
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.04
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=64
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=65 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    global.techLv=3
    msgCreate("You obtained:#The Power of KUDEKU!#With this Technique, you can crush your enemies with#a concentrated, high-powered blast of positive energy!#Your active element will even be imbued upon it!",1,oMessageCutscene,"")
  }
  else if sceneProgress=66 and bWaitForInput=false
    msgCreate("I feel awesome!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=67 and bWaitForInput=false
    msgCreate("Sweet! Now let's get out there and kick some Darkness ass!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=68 and bWaitForInput=false
    msgCreate("We can also teleport now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=69 and bWaitForInput=false
    msgCreate("Say what?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=70 and bWaitForInput=false
    msgCreate("When you open your menu, look at the bottom-right, it will show you#how you can teleport. Which is just pressing the [M] Key#by the way. This can be used to teleport back to the world map.#There may be times when it is disabled. It's highlighted when it can be used.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=71 and bWaitForInput=false
    msgCreate("Awesome! NOW let's go kick some ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=72
  {
    oNPC_Syrus.stringToShow="The train is to the east, I've marked it on your map."
    global.gameProgress=86
    global.teleportEnabled=0
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=181 //teleported to Abstracity Top Apt - from Black Rock
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
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
      oPlayer1.x=368
      oPlayer1.y=336
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.02
      else
      {
        global.location="Abstracity"
        var tempMplay;
        tempMplay=findMusic()
        playMusic(tempMplay,0)
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Booya!#Owned in the FACE!!#Kicked ass AND got out safely!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'd high-five you, but... yeah.#So I'll wii-five you instead.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What's next?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Back to the Black Rock Fortress.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("NO, I'm not EVER going back there!#Why would I ever want to go there again?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("X is there.#He sent me a message, says he wants to speak with us both there.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("On that entrance mountain right?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("I doubt X would go in that place.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Eh, fine.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Then I will stay here.#I will get our friends together and we will discuss#a way to strike back at The Darkness.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("That sounds like a plan.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I wish you two luck.#With me freed, The Darkness stands no chance now.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Well obviously, we're going to kick that things ass!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("... Hmm.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What " +string(global.mainCharacters[1]) +string("?"),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Nothing, was just thinking something odd.#Probably just me being paranoid. I'll tell you later.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Alright, back to the Black Rock pain in my ass.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Good luck.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=21
  {
    global.gameProgress=182
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Abstracity"
    global.gamePaused=false
  }
}
else if global.gameProgress=241 //teleported to Abstracity Top Apt - from Veiled Detritus
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
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
      oNPC_TheArtist.x-=64
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.x=368
      oPlayer1.y=336
      sceneProgress+=1
    }
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
    msgCreate("For your convenience, the situation was explained to " +string(global.mainCharacters[5]) +string(".#I mean really, would you want to sit through that exposition again?"),1,oMessageCutscene,"")
  else if sceneProgress=4
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
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.02
      else
      {
        global.location="Abstracity"
        var tempMplay;
        tempMplay=findMusic()
        playMusic(tempMplay,0)
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("And that's it...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Wow... I don't know what to say.#This is all quite shocking to hear.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("But we'll get these Muffins.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Happy to hear that there is some hope and maybe you should head out now.#We can't afford to wait, The Darkness continues to learn.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Eh... yeah that's probably a good idea.#Besides I'm sure you and The Artist have a lot to talk about.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Just a question before we go...#Why is it called The Darkness?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("We were very secretive about this project and intended to leave it#in the dark for as long as possible.#It eventually picked up the code name 'Project Dark'.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("That's... a rather boring explanation, but acceptable.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("I must also warn you about someone.#The Lead Engineer and I disagreed on many choices.#Even how to handle this situation. He always came up with#crazy theories. I advise that you stay away from him.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Like myself, he was able to avoid being fully taken into the system.#He is very intelligent and crafty. Keep on your guard around him#and take what he says with a grain of salt.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("Yeah, he didn't want me to use the Muffins to shut down The Darkness.#He said he wanted to come to a peaceful agreement with The Darkness.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Bah, he should know by now that is impossible.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("You... you should be on your way.",1,oMessageCutscene,global.mainCharacters[5])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Alright, take care.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Good luck out there.#Oh and before you go, take this.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=22 and bWaitForInput=false
  {
    playSound(global.snd_SkillCapsule,0,1)
    global.p1MoneyMax+=1500
    msgCreate("You have more bandwidth and can now hold " +string(global.p1MoneyMax) +string(" Internetz. Yay!!"),1,oMessageCutscene,"")
  }
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Awesome.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=24
  {
    global.gameProgress=242
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Abstracity"
    global.gamePaused=false
  }
}
else if global.gameProgress=276 //what happened to Abstracity
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
    msgCreate("There's no one here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Look around, we need a clue on where they were taken.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3
  {
    global.gameProgress=277
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=278 //chat with Flame Instigator
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
      global.gamePaused=true
    if sceneDelay>=15
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
      oPlayer1.x=176
      oPlayer1.y=336
      sceneProgress+=1
    }
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay>=30
    {
      if bossFinishFadeAlpha>0
        bossFinishFadeAlpha-=0.02
      else
      {
        fadeColor=c_white
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("What are you doing here?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Hello to you too.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Do you know what happened here?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("What's it look like?#The Darkness has taken everyone, including The Artist.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Do you know where it took them?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("It needs The Artist where it can best replicate everything.#Which means it took him to a very specialized data segment.#This is a very secure area. That... no, there's no going in there.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Why not?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Consider it the headquarters. You don't just walk in.#And it wouldn't matter, as you can see, the program has changed.#It has already begun its control.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("But we have all the Muffins here. We know you have one.#We could stop it now.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("It isn't as easy as just having them.#We would need to get into the core code and override its fail safety.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("So we would force the entire program to crash then.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("That's exactly what you would be able to do.#Nothing The Darkness could do about it either.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("How exactly would you cause it to crash?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("We would simply force an error, one which stops any program.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Which would be?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Force it to divide by zero.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("That's it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Yes, that's all it would take.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Screw saving The Artist, let's get into that system and force it to crash.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("It's not that easy.#The Darkness would know what we were doing, it would guard that even#more than The Artist and...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("And that is not the answer.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("The Darkness said everything within its system would be deleted along with it.#Is that true?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("It is, which is why we can't do that.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Then what are we supposed to do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("The only choice we have is to come to an agreement with it.#Its top priority now is to keep itself running.#We can use that to our advantage.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Could we ask it to let everyone go in exchange for the Muffins?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("Possibly, but it would wonder if we would shut it down from outside then.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Isn't that what we would do?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Something else needs to be put in its favor.#It needs to know we would keep it running.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Someone has to stay within it then.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("That is what it would want.#I'm honestly unsure if we even can get out of this thing.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=34 and bWaitForInput=false
    msgCreate("Well damn it!#What now?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate(". . . I'll stay behind.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("No way man. Think of what it would do to you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("If you make a peaceful agreement with it, nothing.#The Darkness is neither good nor evil.#It merely sees all of us as a threat.#All we have to do is remove that thought from it.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("It's possible.#Look at X.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("Is this really what we're deciding on?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("There's no other choice. We can't shut it down with how it is now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("I'm glad you two finally see this.#How would we go about doing this though?",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("We go where it will hear us.#Right where it has The Artist.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("While that would definitely work, remember, we're still a threat in its eyes.#That is no playground there.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("I'm going to do it.#Where I go, " +string(global.mainCharacters[1]) +string(" is also able to go.#He can convince it."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=45 and bWaitForInput=false
    msgCreate("I'm in, what will you do?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=46 and bWaitForInput=false
    msgCreate("I can't do it. Only a true hardcore gamer would be able to get through that.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=47 and bWaitForInput=false
    msgCreate(global.mainCharacters[0] +string(" just so happens to be the best gamer in the world.#He can do it."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=48 and bWaitForInput=false
    msgCreate("From what I have seen from you, I have to agree.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=49 and bWaitForInput=false
    msgCreate("Awesome! Then let's do this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=50 and bWaitForInput=false
    msgCreate("I've given the coordinates to "+string(global.mainCharacters[1]) +string("."),1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=51 and bWaitForInput=false
    msgCreate("Alright then, let's not waste anymore time.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=52 and bWaitForInput=false
    msgCreate("Take this last Muffin. It will give you some help in there.#There's no point in me holding onto it now.#I will trust that you won't do anything stupid with it.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=53
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      bossFinishFadeAlpha=1
      oPlayer1.sprite_index=sPlayerLookUp
      muffin=instance_create(176,224,oMagicalMuffin)
      muffin.muffinType=6
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
  else if sceneProgress=54 and bWaitForInput=false
    msgCreate("That aroma... could it be?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=55 //---------- Muffin Sequence ----------
    getMuffin(6)
  else if sceneProgress=56 and bWaitForInput=false
  {
    oPlayer1.sprite_index=sPlayerIdle
    global.muffins+=1
    msgCreate("You obtained:#MAGICAL BACON MUFFIN",1,oMessageCutscene,"")
  }
  else if sceneProgress=57
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=58 and bWaitForInput=false
    msgCreate("A Bacon Muffin!#This is the best Muffin to ever exist!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=59 and bWaitForInput=false
    msgCreate("Why did you give that to us?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=60 and bWaitForInput=false
    msgCreate("Not much else I can do. This is the best we have going for us.#We have to do this now, The Darkness will have full control soon.#Once that happens, I fear that negotiations would be pointless.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=61 and bWaitForInput=false
    msgCreate("Then thanks.#Sorry we screwed up.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=62 and bWaitForInput=false
    msgCreate("If you do this, then all that doesn't matter.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=63 and bWaitForInput=false
    msgCreate("Alright, time to do this then.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=64 and bWaitForInput=false
    msgCreate("I can't believe gamers are going to save the world.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=65 and bWaitForInput=false
    msgCreate("Awesome isn't it?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=66 and bWaitForInput=false
    msgCreate("It's... something.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=67 and bWaitForInput=false
    msgCreate("One more thing.#You should prepare, this is not going to be easy.#It shouldn't be able to block out your teleport function anymore.#Still, prepare for the worst, you can also get a fourth slot on your bracelet now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=68 and bWaitForInput=false
    msgCreate("It would be a lot easier for you to fly there.",1,oMessageCutscene,"Flame Instigator")
  else if sceneProgress=69 and bWaitForInput=false
    msgCreate("We have a ship so we can do that.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=70 and bWaitForInput=false
    msgCreate("I don't want to do that.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=71 and bWaitForInput=false
    msgCreate("I'll fly it then, just like last time.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=72 and bWaitForInput=false
    msgCreate("Bleh, fine. I'll head over to the Sky Base.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=73
  {
    effect_create_above(ef_smoke,npcFI.x,npcFI.y-22,2,c_gray)
    with npcFI
      instance_destroy()
    global.gameProgress=279
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
