#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if room=rVegetableGarden2
  enemyCount=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.gameProgress=52 and room=rVegetableGarden1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<=2;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=464
    {
      msgCreate("How cute...",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      msgCreate("Gonna kill it anyway.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }

    if charDialogue[1]=0 and oPlayer1.x>=1248
    {
      msgCreate("I'm detecting a Muffin.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=90
      charDialogue[1]+=1
    }
    else if charDialogue[1]=1
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=60 charDialogue[1]+=1
    }
    else if charDialogue[1]=2
    {
      convo[1]=0
      msgCreate("You serious?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[1]+=1
    }
    else if charDialogue[1]=3
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=60 charDialogue[1]+=1
    }
    else if charDialogue[1]=4
    {
      convo[1]=0
      msgCreate("Of course, why would I lie about anything having to do with a plot device?",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[1]+=1
    }
    else if charDialogue[1]=5
    {
      //convo[1]+=1
      convo[1]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[1]>=90 charDialogue[1]+=1
    }
    else if charDialogue[1]=6
    {
      msgCreate("Oh right, that makes it all believable.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[1]+=1
    }

    if charDialogue[2]=0 and oPlayer1.x>=4464
    {
      msgCreate("Does this ever end?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[2]+=1
    }
    else if charDialogue[2]=1
    {
      //convo[2]+=1
      convo[2]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[2]>=60 charDialogue[2]+=1
    }
    else if charDialogue[2]=2
    {
      msgCreate("In roughly 1000 pixels, yes.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=90
      charDialogue[2]+=1
    }
  }
  if global.gameProgress=53 and room=rVegetableGarden2 //random dialogue
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
      msgCreate("You're a sick twisted person.",0,oMessagePerson,global.mainCharacters[1],1)
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
      msgCreate("Killing a few baby chickens doesn't make me a horrible person.",0,oMessagePerson,global.mainCharacters[0])
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=54 and room=rVegetableGarden3 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=784
    {
      msgCreate("That Muffin is getting awfully close.",0,oMessagePerson,global.mainCharacters[1],1,1)
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
      msgCreate("Then I bet it's ass kicking time.",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      msgCreate("You might be on the receiving end of this one a few times.#These Muffins are serious business.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
}
