#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if room=rBulletBillFort1
  enemyCount=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.gameProgress=15 and room=rDonutPlains1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
      {
        if oPlayer1.x<=128
          charDialogue[i]=0
        else
          charDialogue[i]=100
      }
      sceneProgress+=1
      convo[0]=0
    }
    if charDialogue[0]=0 and oPlayer1.x>=1456 and oPlayer1.y>=176 and global.skillCapsules[4]=0
    {
      msgCreate("You gonna get that power up on the hill?",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("If I feel like it.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=15 and room=rDonutPlains2 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
      pingTest=0
    }
    if charDialogue[0]=0 and oPlayer1.x>=640
      charDialogue[0]+=1
    if charDialogue[0]=1
    {
      stringToShow="Ping test..."
      messageWidth=string_width(stringToShow)
      //pingTest+=1
      pingTest+=gDeltaTime //60fps change: counts 30fps ticks
      //if pingTest<=130
      if pingTest<=130 and scrModPass(pingTest,1) //60fps change: a message once per 30fps tick (each time the count reaches a whole number), as at 30fps
      {
        randomPosX=random(view_xview[0]+view_wview[0])
        randomPosY=random(view_yview[0]+view_hview[0])
        newMessage=instance_create(randomPosX,randomPosY,oMessagePerson)
        newMessage.message=stringToShow
        newMessage.talker=global.mainCharacters[1]
        newMessage.fadingTime=120
      }
      else if pingTest>=190
        charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      msgCreate("Dude, seriously...#What the heck are you doing?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]=0
      msgCreate("Sorry, I accidentally set up a loop.#I was testing some stuff.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("Yeah right man, this is totally you.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]=0
      msgCreate("Heh, you caught me. Was just bored.#I am trying to figure out some things here though.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if room=rRumpyMountains1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if global.skillCapsules[7]=0
    {
      if charDialogue[0]=0 and oPlayer1.x>=2576 and oPlayer1.y<=400
        charDialogue[0]+=1
      else if charDialogue[0]=1 and oPlayer1.x>=2576 and oPlayer1.y>=400
      {
        msgCreate("Hahahahaha.",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=120
        charDialogue[0]+=1
      }
      else if charDialogue[0]=2
      {
        //convo[0]+=1
        convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
        if convo[0]>=90 charDialogue[0]+=1
      }
      else if charDialogue[0]=3
      {
        convo[0]=0
        msgCreate("That is SO not funny.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        charDialogue[0]+=1
      }
      else if charDialogue[0]=4
      {
        //convo[0]+=1
        convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
        if convo[0]>=90 charDialogue[0]+=1
      }
      else if charDialogue[0]=5
      {
        convo[0]=0
        msgCreate("It is from this perspective.",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=120
        charDialogue[0]+=1
      }
      else if charDialogue[0]=6
      {
        //convo[0]+=1
        convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
        if convo[0]>=90 charDialogue[0]+=1
      }
      else if charDialogue[0]=7
      {
        convo[0]=0
        msgCreate("Glad someone got some enjoyment out of that.#It's just as frustrating as playing an actual game and falling.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        charDialogue[0]+=1
      }
    }
    if global.skillCapsules[8]=0
    {
      if charDialogue[1]=0 and oPlayer1.x<=576 and oPlayer1.y<=448
        charDialogue[1]+=1
      else if charDialogue[1]=1 and oPlayer1.y>=768
      {
        msgCreate("Just barely missed.",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=120
        charDialogue[1]+=1
      }
      else if charDialogue[1]=2
      {
        //convo[0]+=1
        convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
        if convo[0]>=90 charDialogue[1]+=1
      }
      else if charDialogue[1]=3
      {
        convo[0]=0
        msgCreate("Shut up.#Now that I know it's position set up with the background,#this will be easy.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=120
        charDialogue[1]+=1
      }
    }
  }
  else if room=rRumpyMountains1Secret //dialogue about skills being disabled
  {
    //disable skills
    oPlayer1.reAttackTime=10
    oPlayer1.spiritEnergy=0
    oPlayer1.fireEnergy=0
    oPlayer1.waterEnergy=0
    oPlayer1.windEnergy=0
    oPlayer1.earthEnergy=0
    //dialogue
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0
    {
      msgCreate("Your abilities don't work here.",0,oMessagePerson,global.mainCharacters[1],0,1)
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
      msgCreate("Any reason?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=70
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=70 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      msgCreate("Nothing you should concern yourself with.#The technicalities of it are boring.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=22 and room=rRumpyMountains2 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.x>=2176
    {
      msgCreate("These can lead to some frustrating platforming sections.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("I can't wait till these are used in more evil scenarios.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      msgCreate("You would.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=25 and room=rOldCastle1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=1;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=2240
    {
      msgCreate("Someone's a bit full of themselves.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("What do you mean?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]=0
      msgCreate("Look down.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }

    if charDialogue[1]=0 and oPlayer1.x>=1200 and oPlayer1.y>=288
    {
      msgCreate("You suck.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[1]+=1
    }
    else if charDialogue[1]=1
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=90 charDialogue[1]+=1
    }
    if charDialogue[1]=2
    {
      convo[1]=0
      msgCreate("This is a lot harder to do in person than it is with a#controller, be quiet.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[1]+=1
    }
  }
  else if global.gameProgress=26 and room=rOldCastle2 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.tookHitAmount>=6
    {
      msgCreate("You're sucking worse than usual.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("Dude, I'm THE Mario gamer.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]=0
      msgCreate("Sure isn't looking like it.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("I'm err...distracted.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=28 and room=rOldCastle3 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.x>=1888
    {
      msgCreate("Which path shall you take?",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("Nobody ever stops to think about that. They just act.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        if oPlayer1.x>=2000
          charDialogue[0]=10
        else
          charDialogue[0]=20
      }
    }
    else if charDialogue[0]=10
    {
      msgCreate("I see, that's typically true.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=20
    {
      convo[0]=0
      msgCreate("Well you did.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("That's because I stopped to read what you said.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=30 and room=rOldCastle4 //Shroud Crawler sight
  {
    if sceneProgress=0
    {
      SCrawler=instance_create(1968,288,oMisc)
      SCrawler.type=1
      SCrawler.sprite_index=sShroudCrawlerIdle
      SCrawler.image_speed=0.2
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.x>=1760
    {
      SCrawler.sprite_index=sShroudCrawlerWalk
      msgCreate("What the heck was that?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      msgCreate("Whoa!",0,oMessagePerson,global.mainCharacters[1],1,1,96)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //SCrawler.x+=12
      SCrawler.x+=12*gDeltaTime //60fps change: per 30fps tick
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        with SCrawler
          instance_destroy()
      }
    }
    else if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("It's got the same properties as that Darkness thing that#sent you through the portal.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      SCrawler.sprite_index=sShroudCrawlerWalk
      msgCreate("All I need to know.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=32 and room=rOldCastle5
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0 and oPlayer1.tookHitAmount>=6
    {
      msgCreate("Anomally's skills are not as expected.",0,oMessagePerson,"Dark Mind",2,1)
      newMessage.fadingTime=120
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
      msgCreate("In other words, he said you suck.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      msgCreate("What an ass.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  else if room=rBulletBillFort1 //remove barrier
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and enemyCount<=0
    {
      with oEventBarrier
        instance_destroy()
      playSound(global.snd_SwitchHit,0,1)
      charDialogue[0]+=1
    }
  }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rRumpyMountains1Secret
{
  oPlayer1.spiritEnergy=global.p1SpiritEnergy
  oPlayer1.fireEnergy=global.p1FireEnergy
  oPlayer1.waterEnergy=global.p1WaterEnergy
  oPlayer1.windEnergy=global.p1WindEnergy
  oPlayer1.earthEnergy=global.p1EarthEnergy
}
