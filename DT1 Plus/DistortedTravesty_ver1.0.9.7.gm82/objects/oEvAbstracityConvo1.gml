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
  if global.gameProgress=83 and room=rAbstracityApartment //random dialogue
  {
    if sceneProgress=0
    {
      charDialogue[0]=0
      convo[0]=0
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.y<=768
    {
      msgCreate("What is up with this? Why can't anything be built for NORMAL people!#And why not have an elevator?! GAH!!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]+=1
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=2
    {
      msgCreate("Frustrated?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      convo[0]+=1
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=4
    {
      msgCreate("I'm just wondering if everyone can jump like this.#Shouldn't there be stairs placed normally?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=5
    {
      convo[0]+=1
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=6
    {
      msgCreate("Does make you wonder, but then again,#it doesn't help that you're stuck on a 2D plane.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
    else if charDialogue[0]=7
    {
      convo[0]+=1
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=8
    {
      msgCreate("Oh right, that COMPLETELY justifies it!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      charDialogue[0]+=1
    }
  }
}
