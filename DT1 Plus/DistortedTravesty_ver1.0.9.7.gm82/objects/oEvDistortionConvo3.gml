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
  if global.gameProgress=197 and room=rDistortionW3_1 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1616
    {
      msgCreate("Oh come on! I really have to jump on these?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
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
      msgCreate("You can do it!#Believe in the heart of the cards!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=105
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
      msgCreate("Look how small that is!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
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
      msgCreate("That's what she said.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  if global.gameProgress=202 and room=rDistortionW3_5 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=352
    {
      msgCreate("Spike wall of death! Run!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
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
      msgCreate("I really hate this place.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
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
      convo[0]=0
      msgCreate("I'm sure you remember the third level of Castlevania Adventure.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=105
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
      msgCreate("It took me so long to finally get past that level.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=105
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
      msgCreate("Yeah that's great and all, but your text boxes are distacting.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=9
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=105 charDialogue[0]+=1
    }
    else if charDialogue[0]=10
    {
      convo[0]=0
      msgCreate("Everytime you talk, you make one too you know.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=105
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
      msgCreate("SPIKE WALL " +string(global.mainCharacters[1]) +string("! Spike... friggin... WALL!#Shut up!"),0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
  }
}
