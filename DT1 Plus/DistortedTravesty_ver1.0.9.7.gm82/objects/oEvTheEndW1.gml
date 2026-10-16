#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=1
rgbValue=255
fadeColor=c_white
sceneProgress=0
sceneDelay=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=351 //The End
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      global.optIdentifier=0
      oHUD.visible=0
      oPlayer1.image_alpha=0
      oPlayer1.sprite_index=sPlayerIdle
      oPlayer1.y-=1
      stopAllMusic()
      stopPlayer()
    }
    else if sceneDelay>=40
    {
      rgbValue-=1
      fadeColor=make_color_rgb(rgbValue,rgbValue,rgbValue)
      if rgbValue=0
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1
  {
    sceneDelay+=1
    if sceneDelay=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Did Jerry make it out in time?#Was Hexor truly deleted?#Will The Darkness honor the agreement?#Find out in the sequel...",1,oMessageCutscene,"")
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("... Or just wait a moment to find out. The sequel sucks anyway.",1,oMessageCutscene,"")
  else if sceneProgress=4
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
    {
      sceneDelay+=1
      if sceneDelay=70
      {
        var tempMplay;
        tempMplay=global.msc_MarioOverworld
        playMusic(tempMplay,0)
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=5
  {
    if oPlayer1.image_alpha<1
      oPlayer1.image_alpha+=0.01
    else
    {
      sceneDelay+=1
      if sceneDelay=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That was just really close.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Heh, well you did say something about anti-climatic.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("... So did we actually win this time?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Yeah, we won't be seeing Hex ever again.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("Awesome! So I can finally rest.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("You know... Samus came and saved you at the last minute there.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Yeah, what of it?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Wasn't 'she' a fan of Samus?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("NO! I mean, yes she was, but no.#Besides, Samus would have dashed into me instead, if it was really her.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Yeah I guess...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("I hate it when you do that ellipsis thing, I can never tell#what you mean exactly.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Keeps you on your toes.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("So yeah...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=22 and bWaitForInput=false
    msgCreate("Is it really her?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("Dude, what really happened between you two that gets you#so worked up every time she's brought up?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Eh, I guess now is as good as any to tell you.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=25
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      npcX=instance_create(320,-16,oMisc)
      npcX.sprite_index=sPlayerDiscombobulate
      npcX.image_xscale=-1
      npcX.image_speed=0
      npcX.type=1
    }
    else if sceneDelay>=11 and sceneDelay<=80
    {
      npcX.y+=16
      if npcX.y>=336
      {
        npcX.sprite_index=sMegamanXIdle
        sceneDelay=100
      }
    }
    else if sceneDelay=130
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Whoa, hey X!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("You really did it this time...",1,oMessageCutscene,"X")
  else if sceneProgress=28 and bWaitForInput=false
    msgCreate("Yeah, we stopped the bad guys.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=29 and bWaitForInput=false
    msgCreate("And it seems The Darkness has kept its part of the agreement...",1,oMessageCutscene,"X")
  else if sceneProgress=30 and bWaitForInput=false
    msgCreate("Things turned out for the best then.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=31 and bWaitForInput=false
    msgCreate("Somehow, they did.#Anyway... I guess this is good bye for the time being.",1,oMessageCutscene,"X")
  else if sceneProgress=32 and bWaitForInput=false
    msgCreate("Where are you going?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=33 and bWaitForInput=false
    msgCreate("You'll know soon enough, but for now...",1,oMessageCutscene,"X")
  else if sceneProgress=34
  {
    sceneDelay+=1
    if sceneDelay=1
      npcX.sprite_index=sPlayerDiscombobulate
    else if sceneDelay>=2 and sceneDelay<=80
    {
      npcX.y-=16
      if npcX.y<=-16
      {
        with npcX
          instance_destroy()
        sceneDelay=100
      }
    }
    else if sceneDelay=130
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=35 and bWaitForInput=false
    msgCreate("In other words, he didn't feel like explaining...#Which works for me.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=36 and bWaitForInput=false
    msgCreate("Eh, so what will we do now?#We saved the world from enslavement, then saved it from ending.#I'm at a loss of what to do.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=37 and bWaitForInput=false
    msgCreate("Your people will need time to accept their new habitat.#It is logical to assist them during this transition.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=38 and bWaitForInput=false
    msgCreate("That sounds... rather boring and full of actual responsibility.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=39 and bWaitForInput=false
    msgCreate("...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=40 and bWaitForInput=false
    msgCreate("What, it does!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=41 and bWaitForInput=false
    msgCreate("No no, I agree.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=42 and bWaitForInput=false
    msgCreate("Anyway, I have an idea.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=43 and bWaitForInput=false
    msgCreate("I'm listening...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=44 and bWaitForInput=false
    msgCreate("I think you'll like this.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=45
  {
    sceneDelay+=1
    if sceneDelay=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=46
  {
    if bossFinishFadeAlpha>=0.7
    {
      sceneDelay+=1
      if sceneDelay=40
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else
      bossFinishFadeAlpha+=0.01
  }
  else if sceneProgress=47
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      textEvent[0]=instance_create(room_width/2,48,oEvTheEndText1)
      textEvent[0].text_Full="The Darkness agreed to keep itself out#of human affairs so long as we did not#interfere with the stability of the world.#With the deletion of the Primary Memory,#both The Darkness and Jeremy lost some#of the control they had, but it seems#that we have stopped all threats..."
      textEvent[0].type=0
    }
    else if sceneDelay=640
      textEvent[0].bFadeOut=1
    else if sceneDelay=760
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=48
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.01
    else
    {
      sceneDelay+=1
      if sceneDelay=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=49 and bWaitForInput=false
    msgCreate("So what's the idea? That was just a pointless monologue.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=50
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      npcX=instance_create(320,-16,oMisc)
      npcX.sprite_index=sPlayerDiscombobulate
      npcX.image_xscale=-1
      npcX.image_speed=0
      npcX.type=1
    }
    else if sceneDelay>=11 and sceneDelay<=80
    {
      npcX.y+=16
      if npcX.y>=336
      {
        npcX.sprite_index=sMegamanXIdle
        sceneDelay=100
      }
    }
    else if sceneDelay=115
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=51 and bWaitForInput=false
    msgCreate("Forgot something?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=52 and bWaitForInput=false
    msgCreate("It seems another 'world' requires your assistance.",1,oMessageCutscene,"X")
  else if sceneProgress=53 and bWaitForInput=false
    msgCreate("Already? Which one?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=54 and bWaitForInput=false
    msgCreate("A few, but I'll give you the details later.",1,oMessageCutscene,"X")
  else if sceneProgress=55 and bWaitForInput=false
    msgCreate("Looks like we've got our work cut out for us.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=56 and bWaitForInput=false
    msgCreate("Would it make you feel better if I told you I'm coming with you?",1,oMessageCutscene,"X")
  else if sceneProgress=57 and bWaitForInput=false
    msgCreate("That would be the most awesome thing EVER!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=58 and bWaitForInput=false
    msgCreate("What are you waiting for, let's go!",1,oMessageCutscene,"X")
  else if sceneProgress=59 and bWaitForInput=false
    msgCreate("Awesome!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=60
  {
    sceneDelay+=1
    if sceneDelay=31
    {
      oPlayer1.image_speed=0
      oPlayer1.sprite_index=sPlayerDiscombobulate
      npcX.sprite_index=sPlayerDiscombobulate
    }
    else if sceneDelay>=32 and sceneDelay<=80
    {
      oPlayer1.y-=16
      npcX.y-=16
      if npcX.y<=-16
        sceneDelay=100
    }
    else if sceneDelay=140
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=61
  {
    if bossFinishFadeAlpha>=0.7
    {
      sceneDelay+=1
      if sceneDelay=60
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else
      bossFinishFadeAlpha+=0.01
  }
  else if sceneProgress=62
  {
    sceneDelay+=1
    if sceneDelay=10
    {
      textEvent[1]=instance_create(room_width/2,48,oEvTheEndText1)
      textEvent[1].text_Full="Okay, so maybe not, but something#has become clear to us all..."
      textEvent[1].type=0
    }
    else if sceneDelay=200
      textEvent[1].bFadeOut=1
    else if sceneDelay=305
    {
      textEvent[2]=instance_create(room_width/2,48,oEvTheEndText1)
      textEvent[2].text_Full="That whenever trouble arises,#We'll be there to stop it.#                    #This is our new home now,#and no matter what, we're..."
      textEvent[2].type=0
    }
    else if sceneDelay=585
    {
      with oEvTheEndText1 {instance_destroy()}
    }
    else if sceneDelay=590
    {
      msgCreate("Had to cut you off, you suck at monologues.",0,oMessagePerson,global.mainCharacters[1],0,1)
      newMessage.fadingTime=120
    }
    else if sceneDelay=710
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=63
  {
    if bossFinishFadeAlpha>=1
    {
      sceneDelay+=1
      if sceneDelay=60
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else
      bossFinishFadeAlpha+=0.01
  }
  else if sceneProgress=64
  {
    sceneDelay+=1
    if sceneDelay=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=65
  {
    global.gameProgress=352
    sceneProgress=0
    room_goto(rCredits1)
  }
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
