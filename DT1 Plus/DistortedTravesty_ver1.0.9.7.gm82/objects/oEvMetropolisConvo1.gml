#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if room=rDiveL1 or room=rDiveL2 or room=rDiveL3 or room=rDiveL4
{
  bubbleTime=irandom_range(10,70)
  bubbleCount=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if global.MMnapalmProg=1 and room=rNapalmL2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x<=176 and oPlayer1.y>=416
    {
      msgCreate("Watch out.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
  else if global.MMnapalmProg=4 and room=rNapalmL4 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x<=1856
    {
      msgCreate("What an asshole move.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=2
    {
      msgCreate("Come on now, you have plenty of methods for easily#getting through this.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.MMgyroProg=1 and room=rGyroL2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1472
    {
      msgCreate("I sense an ass-ish move coming up.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  else if global.MMgyroProg=3 and room=rGyroL4 //random dialogue
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
      msgCreate("Lame, no elevator section.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
  else if global.MMmysteryProg=0 and room=rMysteryL1 //random dialogue
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
    if charDialogue[0]=0 and oWattLight.fadeAlpha>=1
    {
      msgCreate("Oh hell no, you have got to be kidding.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  else if global.MMmysteryProg=1 and room=rMysteryL2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1760
    {
      msgCreate("I've marked a platform for you.#You should thank me, it's normally hard to see.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.MMmysteryProg=2 and room=rMysteryL3 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=560
    {
      msgCreate("Small moving platforms?#This is going to suck.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=136 and room=rFortL1_1 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=2752
    {
      msgCreate("Where are all the spikes?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    if charDialogue[0]=2
    {
      msgCreate("I'm pretty sure they're coming up soon.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=137 and room=rFortL1_2 //random dialogue
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
    if charDialogue[0]=0
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=30
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=1
    {
      msgCreate("Okay, that is just a dick move there.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=75
      charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=60
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=3
    {
      msgCreate("You wanted spikes.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
    else if charDialogue[0]=4
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=5
    {
      msgCreate("Not this bad.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }

  if room=rDiveL1 or room=rDiveL2 or room=rDiveL3 or room=rDiveL4
  {
    //bubbleTime-=1
    bubbleTime-=gDeltaTime //60fps change: counts 30fps ticks
    if bubbleTime<=0
    {
      newBubble=instance_create(oPlayer1.x,oPlayer1.y-36,oPlayerAirBubble)
      bubbleTime=irandom_range(10,70)
    }
    bubbleCount=instance_number(oPlayerAirBubble)
    if bubbleCount>global.recMaxBubbles
      global.recMaxBubbles=bubbleCount
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.MMmysteryProg=1 and room=rMysteryL2 //random dialogue
{
  if sceneProgress=1
  {
    if charDialogue[0]=1
    {
      //convo[0]+=1
      convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
      if convo[0]>=45
      {
        charDialogue[0]+=1
        convo[0]=0
      }
    }
    else if charDialogue[0]=2
    {
      if instance_exists(oPlatformTouch)
      {
        if oPlatformTouch.x<2196
        {
          draw_set_alpha(1)
          draw_set_color(make_color_rgb(0,255,0))
          draw_set_font(fnt_ScanData)
          draw_text(oPlatformTouch.x-8,oPlatformTouch.y-20,"Platform Analysis...")
          draw_set_halign(fa_left)
          draw_rectangle(oPlatformTouch.x-8,oPlatformTouch.y-8,oPlatformTouch.x+72,oPlatformTouch.y+16,true)
        }
      }
    }
  }
}
