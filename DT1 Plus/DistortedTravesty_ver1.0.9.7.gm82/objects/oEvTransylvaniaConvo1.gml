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
  if global.gameProgress=37 and room=rDarkDepths1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=1;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    if charDialogue[0]=0 and oPlayer1.x>=800
    {
      msgCreate("Castlevania 2 sucked by the way.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("No it didn't, that game rocked ass.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("No, it blew ass.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=40 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("No, it rocked ass.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=40 charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]=0
      msgCreate("Blew ass.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=40 charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      convo[0]=0
      msgCreate("ROCKED ASS, SHUT UP!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=40 charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      convo[0]=0
      msgCreate("Whatever helps you sleep at night.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("I think it would be best if we never spoke of this again.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=15
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=16
    {
      convo[0]=0
      msgCreate("I agree.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    if charDialogue[1]=0 and oPlayer1.x<=528 and oPlayer1.y<=192
    {
      msgCreate("That thing requires a key to open.#Think Zelda style.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[1]+=1
    }
  }
  if global.gameProgress=38 and room=rDarkDepths2 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    if charDialogue[0]=0 and oPlayer1.x>=240
    {
      msgCreate("That's really out of place and it looks bad.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("Who cares? It's not like it actually detracts from the fun.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("This kind of stuff matters to me.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("It could be that thing you were talking about in the Old Castle.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("Oh right...Now that I'm looking at my laptop again, I can see#that there is a distortion in the area.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
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
      msgCreate("See, just get off your graphics matter cherade for a second#and look at the big picture.#By the way, I like how you call it a distortion.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=11
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=12
    {
      msgCreate("It's the only thing I can think to call them.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=39 and room=rDarkDepths3 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    if charDialogue[0]=0 and oPlayer1.tookHitAmount>=6
    {
      msgCreate("Medusa Heads aren't THAT hard to dodge.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("I really don't need any of YOUR words of encouragement,#or your backseat gaming advice.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("Didn't know these piss you off that much.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("Who don't they piss off?#Also it's hard to do this and talk to you at the same time.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=48 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]=0
      msgCreate("Eww, I know what this is going to be.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("Like it matters, this area isn't that big and there's plenty#of stuff to get.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("I've just never been a fan of these types of areas.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=49 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=0;i+=1)
        charDialogue[i]=0
      sceneProgress+=1
      convo[0]=0
    }
    else if charDialogue[0]=0
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=40 charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]=0
      msgCreate("That's the exit to this area, I'm going to see if I can open#a route to the west. It's really the only lead#we have right now.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("Sounds good, I just hope I don't have to go through any#sewers or waterway. I've never liked those areas in games.#And...the idea of walking through...yeah.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
}
