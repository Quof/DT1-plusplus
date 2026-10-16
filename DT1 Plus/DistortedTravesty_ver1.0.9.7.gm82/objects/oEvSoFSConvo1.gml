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
  if global.sofsMax=2 and room=rSoFS_Floor11 //*************** FLOOR 11 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=30
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("This is an odd looking room.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("Whoa, you talk here!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]+=1
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("I can do that anywhere.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=70
      charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]+=1
      if convo[0]>=70
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=7
    {
      msgCreate("I never said to keep on talking!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=8
    {
      convo[0]+=1
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=9
    {
      msgCreate("Oh right, text boxes.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=65
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=3 and room=rSoFS_Floor16 //*************** FLOOR 16 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=30
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("Oh look, the tiles changed!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("Text boxes " +string(global.mainCharacters[1]) +string("."),0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=65
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]+=1
      if convo[0]>=65
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("Yeah yeah, take away all my fun.#I may just do another ping test.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=95
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=4 and room=rSoFS_Floor21 //*************** FLOOR 21 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=30
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("You can't dash on this set of floors.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=75
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("Every time you talk, bad things happen.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=70
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=5 and room=rSoFS_Floor26 //*************** FLOOR 26 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=10
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("CAREFUL!!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=45
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("Dude, of what?#The bad usage of these tiles?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=80
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]+=1
      if convo[0]>=80
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("Actually yes.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=50
      charDialogue[0]+=1
    }
    else if charDialogue[0]=6
    {
      convo[0]+=1
      if convo[0]>=50
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=7
    {
      if oPlayer1.tookHitAmount>=1
        charDialogue[0]=100
      else
        charDialogue[0]=200
    }
    else if charDialogue[0]=100
    {
      msgCreate("Thanks for not telling me about#invisible damage zones sooner.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=100
      charDialogue[0]+=1
    }
    else if charDialogue[0]=101
    {
      convo[0]+=1
      if convo[0]>=100
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=102
    {
      msgCreate("Oh you'll be fine.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=50
      charDialogue[0]+=1
    }
    else if charDialogue[0]=200
    {
      msgCreate("It's a good thing I knew about the#invisible damage zones before hand.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=110
      charDialogue[0]+=1
    }
    else if charDialogue[0]=201
    {
      convo[0]+=1
      if convo[0]>=110
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=202
    {
      msgCreate("You either lost already,#left the room after#taking damage the first time,#or you've done this before.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=130
      charDialogue[0]+=1
    }
    else if charDialogue[0]=203
    {
      convo[0]+=1
      if convo[0]>=130
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=204
    {
      msgCreate("I was prepared.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=55
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=6 and room=rSoFS_Floor31 //*************** FLOOR 31 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=20
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("What's going on here?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("Think of it as if you are#spiraling up around the outer#part of the tower.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]+=1
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("Okay...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=7 and room=rSoFS_Floor36 //*************** FLOOR 36 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=20
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("How appropriate...",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=50
      charDialogue[0]+=1
    }
  }
  else if global.sofsMax=8 and room=rSoFS_Floor41 //*************** FLOOR 41 ***************
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
    if charDialogue[0]=0
    {
      convo[0]+=1
      if convo[0]>=30
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("Well now, isn't this convenient?#Why didn't we have this before?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=110
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      convo[0]+=1
      if convo[0]>=110
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("I can come up with a number of reasons,#but you don't want to hear them.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=110
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      convo[0]+=1
      if convo[0]>=110
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("You're probably right.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=50
      charDialogue[0]+=1
    }
  }
}
