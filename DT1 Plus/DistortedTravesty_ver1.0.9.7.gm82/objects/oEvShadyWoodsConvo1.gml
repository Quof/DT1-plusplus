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
  if global.gameProgress=268 and room=rShadyCaves1 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=3712
    {
      msgCreate("Take the lower road first. It has the Muffin.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
}
