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
  if global.VDportals[2]=102 and room=rDS_3_2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=2960
    {
      msgCreate("Stay off that thing.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
}
