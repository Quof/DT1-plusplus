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
  if global.gameProgress<=185 and room=rWindySlopes1 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=816
    {
      msgCreate("What's a Kirby enemy type doing h... nevermind.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    if charDialogue[1]=0 and oPlayer1.x>=2464
    {
      msgCreate("Oh I don't want to fight these anymore.#This is just plain wrong!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[1]+=1
    }
  }
  else if global.gameProgress<=186 and room=rWindySlopes2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1376
    {
      msgCreate("That bridge makes me nervous.#I feel like it's going to fall apart the moment I step on it.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=105
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=2
    {
      msgCreate("Why would you think that?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    else if charDialogue[0]=3
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=90
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=4
    {
      msgCreate("When isn't EVERYTHING out to get me?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }

    if charDialogue[1]=0 and oPlayer1.x>=3040
    {
      b2Plane=instance_create(2784,48,oB2SpiritPlane)
      b2Plane.bActive=true
      b2Plane.runAcc=13
      b2Plane.bombWait=6-global.difficulty
      charDialogue[1]+=1
    }
    if charDialogue[2]=0 and oPlayer1.x>=4112
    {
      b2Plane=instance_create(3856,48,oB2SpiritPlane)
      b2Plane.bActive=true
      b2Plane.runAcc=13
      b2Plane.bombWait=6-global.difficulty
      charDialogue[2]+=1
    }
  }
  else if global.gameProgress=195 and room=rWindySlopes4 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=420
    {
      msgCreate("Just a heads up, something is about to happen.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
}
