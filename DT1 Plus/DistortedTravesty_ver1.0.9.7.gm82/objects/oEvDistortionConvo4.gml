#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.gameProgress<=251 and room=rDistortionW4_1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=1072
    {
      msgCreate("Those diamonds hold some importance.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("Shut it.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]=0
      msgCreate("Oh are dialogue boxes annoying to you?#I think I'll tell a story.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("I won't pay attention.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]=0
      msgCreate("You won't have much.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      convo[0]=0
      msgCreate("I think I'd prefer listening to my ex nag at me#than listen to you.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      convo[0]=0
      msgCreate("Have you ever thought about how I know so much about you?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=13
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=14
    {
      convo[0]=0
      msgCreate("I will permanently Game Over myself if you are her!#I swear it!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=15
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=16
    {
      convo[0]=0
      msgCreate("There sure is a lot of tension between you two.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=17
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=18
    {
      convo[0]=0
      msgCreate("Oh my God, please don't be her.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=19
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=20
    {
      convo[0]=0
      msgCreate("Something you need to talk to her about?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=21
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=22
    {
      convo[0]=0
      msgCreate("Seriously, are you her?!#This is getting creepy!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=23
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=24
    {
      convo[0]=0
      msgCreate("If tension rose between you two, shouldn't you have just talked about it?#Maybe work something out?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=25
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=26
    {
      convo[0]=0
      msgCreate("No, this is NOT happening!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=27
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=28
    {
      convo[0]=0
      msgCreate("Do you secretly wish you could speak to her again?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=29
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=30
    {
      convo[0]=0
      msgCreate(". . .",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=31
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=32
    {
      convo[0]=0
      msgCreate("She wants to speak to you too!#Maybe in hopes of getting another chance and giving your#dumb ass another chance as well.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=135
      charDialogue[0]+=1
    }
    else if charDialogue[0]=33
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=135 charDialogue[0]+=1
    }
    else if charDialogue[0]=34
    {
      convo[0]=0
      msgCreate("... Only her and " +string(global.mainCharacters[1]) +string(" know the reason for the break up.#You're really her?!"),0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=35
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=36
    {
      convo[0]=0
      msgCreate("No, but damn was that hilarious.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=37
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=38
    {
      convo[0]=0
      msgCreate("You're an ass!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress<=254 and room=rDistortionW4_3 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=144
    {
      msgCreate("Watch it!",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=45
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("What?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=45
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]=0
      msgCreate("Your dash is disabled here.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("Oh balls.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]=0
      msgCreate("It wouldn't matter, you can't dash through the spike wheels anyway.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      convo[0]=0
      msgCreate("Isn't that breaking the game mechanics?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      convo[0]=0
      msgCreate("Whine whine, so one rule is changed.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  if global.gameProgress<=258 and room=rDistortionW4_5 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=176
    {
      msgCreate("What is this place?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("It was the team's testing levels for project Dark.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      msgCreate("Pretty sadistic level design don't you think?#Was the team gaming legends or something?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("No one on the team could ever beat the final build of it actually.#The lead engineer got closest to finishing it without cheating.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=135
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=135 charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]=0
      msgCreate("Wow, did he get this far?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      convo[0]=0
      msgCreate("A little bit past this, but not much further according to the records.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      convo[0]=0
      msgCreate("You would think that The Darkness would understand what it was#and get rid of all the top game players around the world.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=135
      charDialogue[0]+=1
    }
    else if charDialogue[0]=13
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=135 charDialogue[0]+=1
    }
    else if charDialogue[0]=14
    {
      convo[0]=0
      msgCreate("It did, why don't you think you've seen any of them?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=15
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=16
    {
      convo[0]=0
      msgCreate("Guess it forgot about me and Jeremy.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=17
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=18
    {
      convo[0]=0
      msgCreate("Even understanding everything about Jeremy, I still don't understand#how you two didn't get purged with the initial Phase Distortion.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=150
      charDialogue[0]+=1
    }
    else if charDialogue[0]=19
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=150 charDialogue[0]+=1
    }
    else if charDialogue[0]=20
    {
      convo[0]=0
      msgCreate(". . .#I just figured it out!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=21
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=75 charDialogue[0]+=1
    }
    else if charDialogue[0]=22
    {
      convo[0]=0
      msgCreate("Care to share?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=23
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=24
    {
      convo[0]=0
      msgCreate("Piss off, I'm not talking to you anymore.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=260 and room=rDistortionW4_6 //boss dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]=0
      msgCreate("It's attacking with oddly scaled screenshots...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=95
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=95 charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      convo[0]=0
      msgCreate("While " +string(global.mainCharacters[3]) +string(" is gone, I'll try to get the scan info ready for you."),0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=130
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=130 charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      convo[0]=0
      msgCreate("Dude, you're back!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=70
      charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=70 charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      convo[0]=0
      msgCreate("Not for long.#You need to bring that thing down.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=110
      charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=110 charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      convo[0]=0
      msgCreate("Alright, I'll try what I can till you get the scan ready.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=130
      charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=300 charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      convo[0]=0
      msgCreate("Almost got it.#It's taking some time with the block this thing has.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=140
      charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=140 charDialogue[0]+=1
    }
    else if charDialogue[0]=13
    {
      convo[0]=0
      msgCreate("Take your time.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=70
      charDialogue[0]+=1
    }
    else if charDialogue[0]=14
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=70 charDialogue[0]+=1
    }
    else if charDialogue[0]=15
    {
      convo[0]=0
      msgCreate("I figured I would get a different and much more rude response.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=150
      charDialogue[0]+=1
    }
    else if charDialogue[0]=16
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=150 charDialogue[0]+=1
    }
    else if charDialogue[0]=17
    {
      convo[0]=0
      msgCreate("I'm too concerned with NOT BEING HIT BY THE BULLETS!#SEND ME THE DAMN SCAN ALREADY!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=200
      charDialogue[0]+=1
    }
    else if charDialogue[0]=18
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=200 charDialogue[0]+=1
    }
    else if charDialogue[0]=19
    {
      convo[0]=0
      msgCreate("Figured as much.#There, the scan is ready.",0,oMessagePerson,global.mainCharacters[1],0,1)
      oFourthWallCrusher.combatText="As long as you are careful about where you are standing, this thing should go down fairly easy. As you have probably noticed, when it creates an image of itself, it will shoot the spiral of bullets. These aren't too big a deal on their own, but the oddly scaled screenshots can make them troublesome. I would advise that you stay on the upper level as much as possible. If you can, don't break your combo so you can consistently keep your damage output higher. When it creates the large black blur, it is going to create those spiral spikes, which will shrink inward. A tip for those, you will need to go counter-clockwise."
      oFourthWallCrusher.sideText="This is what has been blocking me. If you can beat this thing, I'll be able to fully help you again."
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=20
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=80 charDialogue[0]+=1
    }
    else if charDialogue[0]=21
    {
      convo[0]=0
      msgCreate("Yay!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=40
      charDialogue[0]+=1
    }
    else if charDialogue[0]=22
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=400 charDialogue[0]+=1
    }
    else if charDialogue[0]=23
    {
      convo[0]=0
      msgCreate("What the hell!?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=24
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=25
    {
      oPlayer1.spiritEnergy=oPlayer1.maxSpiritEnergy
      convo[0]=0
      msgCreate("Surprise bitch!#Also, here's full Spirit Energy for you " +string(global.mainCharacters[0]) +string("."),0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=26
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=27
    {
      convo[0]=0
      msgCreate("No more of this.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=28
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=29
    {
      convo[0]=0
      msgCreate("You may have blocked " +string(global.mainCharacters[1]) +string(", but he already gave me everything#I need to beat this thing."),0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=30
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=120 charDialogue[0]+=1
    }
    else if charDialogue[0]=31
    {
      convo[0]=0
      msgCreate(". . .",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
}
