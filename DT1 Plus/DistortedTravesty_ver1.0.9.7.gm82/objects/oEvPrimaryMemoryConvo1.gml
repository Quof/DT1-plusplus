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
  if global.gameProgress=326 and room=rPrimaryMemory1 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<3;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=448
    {
      msgCreate("Keep going, just trust me on this.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
    //----- Mario enemy mass spawn -----
    if charDialogue[1]=0 and oPlayer1.x>=2400
    {
      var xPos,yPos;
      xPos=2192
      for(i=0;i<22;i+=1)
      {
        newEnemy=instance_create(xPos,32,oGoomba)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        xPos+=18
      }
      xPos=2844
      yPos=224
      for(i=0;i<4;i+=1)
      {
        for(ii=0;ii<4;ii+=1)
        {
          newEnemy=instance_create(xPos,yPos,oBulletBill)
          newEnemy.bActive=1
          xPos+=18
        }
        xPos-=72
        yPos+=18
      }
      playSound(global.snd_BulletBillShot,0,1)
      charDialogue[1]+=1
    }
    else if charDialogue[1]=1
    {
      convo[1]+=1
      if convo[1]>=20 charDialogue[1]+=1
    }
    else if charDialogue[1]=2
    {
      convo[1]=0
      msgCreate("You didn't forget about me did you?",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=80
      charDialogue[1]+=1
    }
    else if charDialogue[1]=3
    {
      convo[1]+=1
      if convo[1]>=80 charDialogue[1]+=1
    }
    else if charDialogue[1]=4
    {
      convo[1]=0
      msgCreate("What do you want?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=60
      charDialogue[1]+=1
    }
    else if charDialogue[1]=5
    {
      convo[1]+=1
      if convo[1]>=60 charDialogue[1]+=1
    }
    else if charDialogue[1]=6
    {
      convo[1]=0
      msgCreate("To not exist.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=50
      charDialogue[1]+=1
    }
    else if charDialogue[1]=7
    {
      convo[1]+=1
      if convo[1]>=50 charDialogue[1]+=1
    }
    else if charDialogue[1]=8
    {
      convo[1]=0
      msgCreate("Why? What's your problem with us now?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=70
      charDialogue[1]+=1
    }
    else if charDialogue[1]=9
    {
      convo[1]+=1
      if convo[1]>=70 charDialogue[1]+=1
    }
    else if charDialogue[1]=10
    {
      convo[1]=0
      msgCreate("I am part of a computer program, merely a piece of code.#I don't exist anyway.",0,oMessagePerson,global.mainCharacters[3],0,1)
      newMessage.fadingTime=130
      charDialogue[1]+=1
    }
    else if charDialogue[1]=11
    {
      convo[1]+=1
      if convo[1]>=130 charDialogue[1]+=1
    }
    else if charDialogue[1]=12
    {
      msgCreate("Sad, though I don't understand.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=50
      charDialogue[1]+=1
    }
    //----- Mario enemy mass spawn -----
    if charDialogue[2]=0 and oPlayer1.x>=5184
    {
      for(i=0;i<18;i+=1)
      {
        newEnemy=instance_create(random_range(4816,4944),random_range(128,224),oVampireBat)
        newEnemy.bActive=1
        newEnemy=instance_create(random_range(5488,5616),random_range(128,224),oVampireBat)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      }
      charDialogue[2]+=1
    }
  }
  else if global.gameProgress=334 and room=rPrimaryMemory5 //random dialogue
  {
    if sceneProgress=0
    {
      for (i=0;i<3;i+=1)
      {
        charDialogue[i]=0
        convo[i]=0
      }
      sceneProgress+=1
    }
    if charDialogue[0]=0 and oPlayer1.x>=11120
    {
      msgCreate("Don't stop, just keep running!",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=344 and room=rPrimaryMemoryEscape2 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=3424
    {
      msgCreate("Middle, top, middle, bottom, top.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=90
      charDialogue[0]+=1
    }
  }
  else if global.gameProgress=349 and room=rPrimaryMemoryEscape5 //random dialogue
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
    if charDialogue[0]=0 and oPlayer1.x>=1226 and !instance_exists(oOmegaMetroid)
    {
      msgCreate("Did Samus just epicly#shine spark into that thing?",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=100
      charDialogue[0]+=1
    }
    else if charDialogue[0]=1
    {
      convo[0]+=1
      if convo[0]>=130 charDialogue[0]+=1
    }
    else if charDialogue[0]=2
    {
      msgCreate("Yeah, it was pretty awesome.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
      charDialogue[0]+=1
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rPrimaryMemory6Secret
{
  draw_set_font(fnt_MSWBar)
  draw_set_halign(fa_middle)
  draw_set_alpha(1)
  draw_set_color(c_black)
  draw_text(room_width/2-1,64,"Congratulations, you're in a place you're not#supposed to be, now leave!")
  draw_text(room_width/2+1,64,"Congratulations, you're in a place you're not#supposed to be, now leave!")
  draw_text(room_width/2,63,"Congratulations, you're in a place you're not#supposed to be, now leave!")
  draw_text(room_width/2,65,"Congratulations, you're in a place you're not#supposed to be, now leave!")
  draw_set_color(c_white)
  draw_text(room_width/2,64,"Congratulations, you're in a place you're not#supposed to be, now leave!")
}
