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
  if global.gameProgress=120 and room=rDistortionW2_2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=480
    {
      msgCreate("Liking this?",0,oMessagePerson,global.mainCharacters[3],4,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]+=1
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]=0
      msgCreate("Not really asshole.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      convo[0]+=1
      if convo[0]>=60 charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      msgCreate("I can make your life a living hell here.",0,oMessagePerson,global.mainCharacters[3],4,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      convo[0]+=1
      if convo[0]>=90 charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]=0
      msgCreate("I'll see if I can fix this, the rotation I think has#something to do with the window itself.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=180
      charDialogue[0]+=1
    }
  }
}
