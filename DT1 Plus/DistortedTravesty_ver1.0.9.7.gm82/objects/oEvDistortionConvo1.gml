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
  if global.gameProgress=61 and room=rDistortionW1_3 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1408
    {
      msgCreate("Oh yeah, THAT'S completely fair!",0,oMessagePerson,global.mainCharacters[0],0,1)
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
      convo[0]=0
      msgCreate("Did you know that Water Barrier provides a bit of a defense boost?",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=90
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
      msgCreate("What's that have to do with this!?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("It doesn't, I just wanted to point that fact out.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
}
