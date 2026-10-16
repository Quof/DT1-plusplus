#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=1
fadeColor=c_black
sceneProgress=0
sceneDelay=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=353 //What now
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      global.optIdentifier=0
      oHUD.visible=0
      oPlayer1.image_speed=0
      oPlayer1.sprite_index=sPlayerLayDown
      oPlayer1.y-=2
      stopPlayer()
      stopAllMusic()
      sceneDelay=0
      sceneProgress+=1
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
  else if sceneProgress=2
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
  else if sceneProgress=3
  {
    if oPlayer1.image_alpha<1
      oPlayer1.image_alpha+=0.01
    else
    {
      sceneDelay+=1
      if sceneDelay=60
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("What are you doing now?#I thought you were going to help all the worlds that need help.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I am, I'm just taking a break for a moment.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("As long as you don't monologue, rest as long as you like.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I plan to.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8
  {
    sceneDelay+=1
    if sceneDelay=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Are you still stuck on the fourth wall?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Yeah, I'm still stuck here, not sure how to get off this thing.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("But if we could figure it out then...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12
  {
    sceneDelay+=1
    if sceneDelay=15
      oPlayer1.sprite_index=sPlayerGetUp1
    else if sceneDelay=20
      oPlayer1.sprite_index=sPlayerGetUp2
    else if sceneDelay=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Holy snap!!#We would get to see what you look like!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("You mean what I choose to look like?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Yeah, but still!#I'm curious what you would choose.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("If you ranked high enough, sure.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("Bull, you wouldn't do that...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("Yeah you would...#You suck.",1,oMessageCutscene,global.mainCharacters[0])

  if global.finalRankCheck>=3 //C rank or higher
  {
    if sceneProgress=20 and bWaitForInput=false
      msgCreate("You at least got a C rank though, so I'll show you.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=21 and bWaitForInput=false
      msgCreate("You know you're just going to piss off the people who#didn't get a decent rank right?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=22 and bWaitForInput=false
      msgCreate("I'm very aware of that.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=23 and bWaitForInput=false
      msgCreate("So is there anything extra for getting the highest rank?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=24 and bWaitForInput=false
      msgCreate("Just bragging rights, all you need is a C rank to get this.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=25 and bWaitForInput=false
      msgCreate("No secret rank?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=26 and bWaitForInput=false
      msgCreate("If you got an A rank on every category on the hardest setting,#then yeah, there's a secret S rank.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=27 and bWaitForInput=false
      msgCreate("Awesome, what's it unlock?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=28 and bWaitForInput=false
      msgCreate("I don't know.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=29 and bWaitForInput=false
      msgCreate("Bull, you so do!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=30 and bWaitForInput=false
      msgCreate("... I'm not giving that away.#If someone was able to do that, they wouldn't need the reward anyway.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=31 and bWaitForInput=false
      msgCreate("I suppose not.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=32 and bWaitForInput=false
      msgCreate("Why are you asking all these fourth wall shattering questions anyway?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=33 and bWaitForInput=false
      msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=34 and bWaitForInput=false
      msgCreate("Oh nevermind, I get it.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=35 and bWaitForInput=false
      msgCreate("Just show me what you chose to look like here already!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=36 and bWaitForInput=false
      msgCreate("Alright, I'll do it, but you may be disappointed.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=37 and bWaitForInput=false
      msgCreate("I'm not already?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=38 and bWaitForInput=false
      msgCreate("Alright, here we go...",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=39
    {
      sceneDelay+=1
      if sceneDelay=15
      {
        propBomb=instance_create(384,-32,oMisc)
        propBomb.sprite_index=sB2Bomb
        propBomb.image_angle=270
        propBomb.image_speed=0
        propBomb.type=1
      }
      else if sceneDelay>=16 and sceneDelay<=99
      {
        propBomb.y+=6
        if propBomb.y+(propBomb.sprite_height/2)>=306
        {
          with propBomb
            instance_destroy()
          effect=instance_create(384,306,oEffect)
          effect.sprite_index=sBombExplosion
          effect.image_speed=0.8
          effect.image_xscale=2.25
          effect.image_yscale=2.25
          sceneDelay=100
        }
      }
      else if sceneDelay=104
      {
        friendJeremy=instance_create(384,306,oMisc)
        friendJeremy.sprite_index=sJeremyMWIdle
        friendJeremy.image_xscale=-2
        friendJeremy.image_yscale=2
        friendJeremy.image_speed=0
        friendJeremy.type=1
      }
      else if sceneDelay=150
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=40 and bWaitForInput=false
      msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=41 and bWaitForInput=false
      msgCreate("Speechless? I know, it's awesome isn't it?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=42
    {
      sceneDelay+=1
      if sceneDelay=15
        oPlayer1.sprite_index=sPlayerGetUp1
      else if sceneDelay=20
        oPlayer1.sprite_index=sPlayerLayDown
      else if sceneDelay=35
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=43 and bWaitForInput=false
      msgCreate("You are such an ass sometimes.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=44 and bWaitForInput=false
      msgCreate("We've been friends forever, you already know what I really chose.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=45 and bWaitForInput=false
      msgCreate("Pretty much. You only chose that because you want to come along#with me and blow things up.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=46 and bWaitForInput=false
      msgCreate("That's really all there is to it.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=47 and bWaitForInput=false
      msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=48 and bWaitForInput=false
      msgCreate("Think there would be any chance at a multiplayer sequel?#You know... with this thing involved or anything I imagine.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=49 and bWaitForInput=false
      msgCreate("You wish.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=50 and bWaitForInput=false
      msgCreate("You really know how to kill the mood.#Maybe one day... in the future it will happen.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=51 and bWaitForInput=false
      msgCreate("I suppose.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=52 and bWaitForInput=false
      msgCreate("Imagine it.#A side scrolling platformer shooter adventure game with rpg elements#referencing only the most epic of gaming moments.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=53 and bWaitForInput=false
      msgCreate("It would work I guess.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=54 and bWaitForInput=false
      msgCreate("Dude, what is wrong with you?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=55 and bWaitForInput=false
      msgCreate("Just a bit depressed.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=56 and bWaitForInput=false
      msgCreate("Why? This isn't the kind of content promised with this game.#We don't ever convey emotion, it kinda slows down the ass kicking.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=57 and bWaitForInput=false
      msgCreate("Just depressed that it's all over.#I was sorta hoping it would continue.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=58 and bWaitForInput=false
      msgCreate("But those other worlds are out there and they need our help.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=59 and bWaitForInput=false
      msgCreate("You know what I mean.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=60 and bWaitForInput=false
      msgCreate("Yeah I do, I was just trying to brighten the mood.#If it makes you feel better, we got some awesome memories out of all this.#Besides, it will never truly be over. Gaming will go on forever.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=61
    {
      sceneDelay+=1
      if sceneDelay=15
        oPlayer1.sprite_index=sPlayerGetUp1
      else if sceneDelay=20
        oPlayer1.sprite_index=sPlayerGetUp2
      else if sceneDelay=35
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=61 and bWaitForInput=false
      msgCreate("I suppose you're right. I shouldn't bring the mood down over this.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=62 and bWaitForInput=false
      msgCreate("Ready to kick some ass?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=63 and bWaitForInput=false
      msgCreate("Yeah.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=64 and bWaitForInput=false
      msgCreate("Awesome!",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=65
    {
      sceneDelay+=1
      if sceneDelay=15
        oPlayer1.sprite_index=sPlayerGetUp1
      else if sceneDelay=20
        oPlayer1.sprite_index=sPlayerLayDown
      else if sceneDelay=35
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=66 and bWaitForInput=false
      msgCreate("Right after I rest.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=67 and bWaitForInput=false
      msgCreate("Damn it!#Can we even get tired in this world?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=68 and bWaitForInput=false
      msgCreate("I've never felt fatigue here, I'm just being lazy right now.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=69 and bWaitForInput=false
      msgCreate("Figures...#You know... something I was thinking about...",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=70 and bWaitForInput=false
      msgCreate("What?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=71 and bWaitForInput=false
      msgCreate("There were no female characters ever introduced.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=72 and bWaitForInput=false
      msgCreate("You know...",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=73
    {
      sceneDelay+=1
      if sceneDelay=15
        oPlayer1.sprite_index=sPlayerGetUp1
      else if sceneDelay=20
        oPlayer1.sprite_index=sPlayerGetUp2
      else if sceneDelay=35
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=74 and bWaitForInput=false
      msgCreate("You're right!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=75 and bWaitForInput=false
      msgCreate("Think someone will make questionable fanart?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=76 and bWaitForInput=false
      msgCreate("What kind of question is THAT?!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=77 and bWaitForInput=false
      msgCreate("I was just asking.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=78 and bWaitForInput=false
      msgCreate("Are you hoping it happens?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=79 and bWaitForInput=false
      msgCreate("It's weird, but it's like free advertising and it means#someone liked this enough to put that much time into it.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=80 and bWaitForInput=false
      msgCreate("You have a weird way of thinking about things.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=81 and bWaitForInput=false
      msgCreate("You ready to go kick ass yet?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=82 and bWaitForInput=false
      msgCreate("Yep.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=83
    {
      sceneDelay+=1
      if sceneDelay=10
        oPlayer1.sprite_index=sPlayerGetUp3
      else if sceneDelay=25
        oPlayer1.sprite_index=sPlayerGetUp4
      else if sceneDelay=40
      {
        oPlayer1.y+=1
        oPlayer1.sprite_index=sPlayerIdle
      }
      else if sceneDelay>=80
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else if sceneProgress=84 and bWaitForInput=false
      msgCreate("Time to kick ass and take names!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=85
      sceneProgress=1000
  }
  else //D rank or lower
  {
    if sceneProgress=20 and bWaitForInput=false
      msgCreate("It looks like you didn't even get up to C rank,#which is all that was required.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=21 and bWaitForInput=false
      msgCreate("You're really going to do this aren't you?",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=22 and bWaitForInput=false
      msgCreate("Well yeah, you aren't worthy.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=23 and bWaitForInput=false
      msgCreate("After everything we've been through, you would actually do this...#You are such an ass.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=24 and bWaitForInput=false
      msgCreate("You could always try doing better at some of the ranking categories that#aren't irreversable.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=25 and bWaitForInput=false
      msgCreate("I think I'm just going to shut this off and never play it again...#I'm sure that's what the player is thinking right now.",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=26 and bWaitForInput=false
      msgCreate("You think so?",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=27 and bWaitForInput=false
      msgCreate("It's what I'm thinking, so YES!!",1,oMessageCutscene,global.mainCharacters[0])
    else if sceneProgress=28 and bWaitForInput=false
      msgCreate("Might as well just bring you back to the title screen.",1,oMessageCutscene,global.mainCharacters[1])
    else if sceneProgress=29 and bWaitForInput=false
      msgCreate("You must get a C rank or higher to see the real ending.",1,oMessageCutscene,"")
    else if sceneProgress=30
      sceneProgress=1000
  }

  if sceneProgress=1000
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.05
    else if bossFinishFadeAlpha>=1
    {
      sceneDelay+=1
      if sceneDelay=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=1001 and bWaitForInput=false
    msgCreate("CONGRATULATIONS!!#You have completed the game!",1,oMessageCutscene,"")
  else if sceneProgress=1002
  {
    sound_stop_all()
    ini_open("GameDetails.ini")
    var sectionWrite,rankUpdate;
    if global.currentQuestLog=1
      sectionWrite="ALPHA"
    else if global.currentQuestLog=2
      sectionWrite="BETA"
    else if global.currentQuestLog=3
      sectionWrite="OMEGA"
    rankUpdate=ini_read_real(sectionWrite,"204",0)
    if global.finalRankCheck>rankUpdate
      ini_write_real(sectionWrite,"204",global.finalRankCheck)
    ini_close()
    stopAllMusic()
    room_goto(rIntro)
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
