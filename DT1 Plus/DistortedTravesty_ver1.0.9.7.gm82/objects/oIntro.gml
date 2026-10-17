#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//global.msc_Intro=sound_add("music\DT_Intro.mp3",1,false)
//sound_loop(global.msc_Intro)
annoyAlpha=0
annoyTime=0
annoyString[0]="PRESENTED BY#ZEPHYRBURST PRODUCTIONS"
annoyString[1]="DISTORTED TRAVESTY"
annoyString[2]="A ZEPHYRBURST GAME"
annoyString[3]="Game Designed by ZEPHYRBURST#Written by ZEPHYRBURST / Mechanic Designer  ZEPHYRBURST#Sound Director  ZEPHYRBURST / Technical Producer  ZEPHYRBURST#Creative Producer  ZEPHYRBURST#Art Director  ZEPHYRBURST / Produced by  ZEPHYRBURST#Produced and Directed by  ZEPHYRBURST"
annoyString[4]="Its annoying isnt it?#No worries, it annoys me too when game designers do this.#Its simply to make a point."

for (i=0;i<5;i+=1)
  mainAlpha[i]=0
for (i=0;i<2;i+=1)
  helpAlpha[i]=0
textColor=c_white
allFadeTime=60
mainFadeInTimeTotal=100
mainFadeInTime=70

currentQuoteFade=0
mainString[0]="Distort: 1. to give a false or misleading account of;#2. to distort;"
mainString[1]="Travesty: 1. an absurd or grotesque imitation;#2. to make a travesty of;"
mainString[2]="Distorted Travesty: 1.to give misleading info on#an absurd idea;#2. to distort a travesty;"
mainString[3]="Warning:#This game makes excessive use of dry humor.#Do not try to comprehend it."
mainString[4]="Another Warning:#The game already has full control of your#computer and has injected roughly  27 1/2 bugs#into your system. Have a nice day."

helpString[0]="By the way, all of this pointlessness can be#skipped by just pressing the [J] key.#Just thought I'd point that out."
helpString[1]="An incredibly useful key is the [Esc] key, as it will close this game. However, closing#the game will have negative effects on both your computer and psyche."

bFadeInGlow=true
titleGlowAlpha=0
image_speed=0.1
sceneProgress=0
sBlackAlpha=1
titleAlpha=0
xText=256
yText=0

mmx_progress=0
mmx_timer=0
mmx_availMem=512
mmx_login_Full="Administrator"
mmx_login_New=""
mmx_login_Pos=0
mmx_code_Full="*******"
mmx_code_New=""
mmx_code_Pos=0

loadingBar=0
loadingType=""
loadImage=false
loadState=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//loadState+=1
loadState+=gDeltaTime //60fps change: counts 30fps ticks
//if loadState=2
if scrCountPass(loadState,2) //60fps change: once, when the count reaches it
{
  //load external files
  if !variable_global_exists("gamePriority")
  {
    global.gamePriority=0
    SS_Init()
    loadExtFiles()
  }
  loadImage=true
}
else if loadState>=12
{
  if !instance_exists(oInitializeGame)
  {
    if keyboard_check_pressed(ord("J"))
    {
      init=instance_create(0,0,oInitializeGame)
      titleAlpha=1
      sBlackAlpha=0
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sSunBeams,-1,0,0,1,1,0,c_white,titleGlowAlpha+0.1)
//black back
draw_set_blend_mode(bm_normal)
draw_set_alpha(sBlackAlpha)
draw_set_color(c_black)
draw_rectangle(0,0,view_wview,view_hview,false)
draw_set_font(fnt_AreaName)
draw_set_halign(fa_center)

if !instance_exists(oInitializeGame)
{
  if annoyTime<300 //annoy text
  {
    //annoyTime+=1
    annoyTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if annoyTime>=11 and annoyTime<=20
    if annoyTime>10 and annoyTime<=20 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //annoyAlpha+=0.1
      annoyAlpha+=0.1*gDeltaTime //60fps change: per 30fps tick
    //else if annoyTime>=181 and annoyTime<=190
    else if annoyTime>180 and annoyTime<=190 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //annoyAlpha-=0.1
      annoyAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    else if annoyTime>=195
      annoyTime=500
    draw_text_color(256,16,annoyString[0],textColor,textColor,textColor,textColor,annoyAlpha)
    draw_set_font(fnt_GameOver)
    draw_text_color(256,72,annoyString[1],textColor,textColor,textColor,textColor,annoyAlpha)
    draw_set_font(fnt_AreaName)
    draw_text_color(256,110,annoyString[2],textColor,textColor,textColor,textColor,annoyAlpha)
    draw_set_font(fnt_showMessage)
    draw_text_color(256,160,annoyString[3],textColor,textColor,textColor,textColor,annoyAlpha)
    //draw_set_font(fnt_AreaName)
    draw_text_color(256,284,annoyString[4],textColor,textColor,textColor,textColor,annoyAlpha)
  }
  else
  {
  //data load text
  draw_set_halign(fa_left)
  draw_set_font(fnt_CombatData)
  draw_set_color(make_color_rgb(20,230,60))
  //mmx_timer+=1
  mmx_timer+=gDeltaTime //60fps change: counts 30fps ticks
  if mmx_timer>=round(random(4)+8)
  {
    mmx_timer=0
    mmx_progress+=1
    if mmx_progress>=6 and mmx_progress<=9
      mmx_availMem*=2
  }
  if mmx_progress>=1
    draw_text(14,280,"Copyright (c) 20XX")
  if mmx_progress>=2
    draw_text(14,291,"Random Intertainment")
  if mmx_progress>=3
    draw_text(14,302,"All Rights Reserved")
  if mmx_progress>=5
    draw_text(14,313,string("avail mem = ") +string(mmx_availMem) +string(" TB"))
  if mmx_progress>=12
  {
    if mmx_login_Pos<=string_length(mmx_login_Full)
    {
      for(mmx_login_Pos=1;mmx_login_Pos<=string_length(mmx_login_Full);mmx_login_Pos+=1;)
      {
        mmx_login_New+=string_char_at(mmx_login_Full,mmx_login_Pos)
        draw_text(14,324,string("login: ") +string(mmx_login_New))
        screen_refresh()
        sleep(round(random(120))+100)
      }
      mmx_login_Pos+=100
    }
    else
      draw_text(14,324,string("login: ") +string(mmx_login_Full))
  }
  if mmx_progress>=14
  {
    if mmx_code_Pos<=string_length(mmx_code_Full)
    {
      for(mmx_code_Pos=1;mmx_code_Pos<=string_length(mmx_code_Full);mmx_code_Pos+=1;)
      {
        mmx_code_New+=string_char_at(mmx_code_Full,mmx_code_Pos)
        draw_text(14,335,string("code: ") +string(mmx_code_New))
        screen_refresh()
        sleep(round(random(120))+100)
      }
      mmx_code_Pos+=100
    }
    else
      draw_text(14,335,string("code: ") +string(mmx_code_Full))
  }
  if mmx_progress>=16
    draw_text(14,346,">device -dvl -a")
  if mmx_progress>=18
    draw_text(14,357,"reading 'World Data'")

  draw_set_color(c_black)
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_center)
  if sceneProgress=0 //definition 1
  {
    if mainFadeInTime>=mainFadeInTimeTotal
    {
      //mainAlpha[0]+=0.02
      mainAlpha[0]+=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[0]>=1
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=1 //definition 2
  {
    if mainFadeInTime>=mainFadeInTimeTotal
    {
      //mainAlpha[1]+=0.02
      mainAlpha[1]+=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[1]>=1
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=2 //definition 3
  {
    if mainFadeInTime>=mainFadeInTimeTotal
    {
      //mainAlpha[2]+=0.02
      mainAlpha[2]+=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[2]>=1
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=3 //fade out definitions
  {
    if mainFadeInTime>=mainFadeInTimeTotal+10
    {
      for (i=0;i<3;i+=1)
        //mainAlpha[i]-=0.02
        mainAlpha[i]-=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[0]<=0
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=4 //warning 1
  {
    if mainFadeInTime>=mainFadeInTimeTotal-60
    {
      //mainAlpha[3]+=0.02
      mainAlpha[3]+=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[3]>=1
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=5 //warning 2
  {
    if mainFadeInTime>=mainFadeInTimeTotal
    {
      //mainAlpha[4]+=0.02
      mainAlpha[4]+=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[4]>=1
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=6 //fade out warnings
  {
    if mainFadeInTime>=mainFadeInTimeTotal
    {
      for (i=3;i<5;i+=1)
        //mainAlpha[i]-=0.02
        mainAlpha[i]-=0.02*gDeltaTime //60fps change: per 30fps tick
      //helpAlpha[0]-=0.02
      helpAlpha[0]-=0.02*gDeltaTime //60fps change: per 30fps tick
      //helpAlpha[1]-=0.02
      helpAlpha[1]-=0.02*gDeltaTime //60fps change: per 30fps tick
      if mainAlpha[3]<=0
      {
        //mainFadeInTime=0
        mainFadeInTime=gDeltaTime-1 //60fps change: the next part's wait counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
        sceneProgress+=1
      }
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  else if sceneProgress=7 //title show
  {
    if mainFadeInTime>=mainFadeInTimeTotal-60
    {
      if sBlackAlpha<=0
      {
        //titleAlpha+=0.01
        titleAlpha+=0.01*gDeltaTime //60fps change: per 30fps tick
        if titleAlpha>=1
          init=instance_create(0,0,oInitializeGame)
      }
      else
        //sBlackAlpha-=0.01
        sBlackAlpha-=0.01*gDeltaTime //60fps change: per 30fps tick
    }
    else
      //mainFadeInTime+=1
      mainFadeInTime+=gDeltaTime //60fps change: counts 30fps ticks
  }
  xText=256
  yText=90
  for (i=0;i<3;i+=1)
  {
    draw_text_color(xText,yText,mainString[i],textColor,textColor,textColor,textColor,mainAlpha[i])
    yText+=64
  }
  xText=256
  yText=80
  for (i=3;i<5;i+=1)
  {
    draw_text_color(xText,yText,mainString[i],textColor,textColor,textColor,textColor,mainAlpha[i])
    yText+=88
  }
  if mainAlpha[1]>=0.40 and helpAlpha[0]<1
    //helpAlpha[0]+=0.02
    helpAlpha[0]+=0.02*gDeltaTime //60fps change: per 30fps tick
  if sceneProgress>=3 and sceneProgress<=5 and mainAlpha[0]<=0.60 and helpAlpha[1]<1
    //helpAlpha[1]+=0.02
    helpAlpha[1]+=0.02*gDeltaTime //60fps change: per 30fps tick

  draw_set_font(fnt_MessageMenu)
  draw_set_halign(fa_right)
  draw_text_color(504,332,helpString[0],textColor,textColor,textColor,textColor,helpAlpha[0])
  draw_set_halign(fa_left)
  draw_text_color(8,8,helpString[1],textColor,textColor,textColor,textColor,helpAlpha[1])
  }

  if loadImage=false
  {
    //loadingBar=96
    draw_set_alpha(1)
    draw_set_font(fnt_MenuText)
    draw_set_halign(fa_center)
    draw_set_color(c_ltgray)
    draw_rectangle(162,346,301,352,false)
    draw_set_color(c_white)
    draw_rectangle(162,346,301,352,true)
    draw_set_color(c_green)
    draw_text(244,322,"Loading External Files")
    draw_rectangle(163,347,163+loadingBar,351,false)
    draw_text(244,360,"Loading: " +string(loadingType))
  }
}
//title text
draw_sprite_ext(sTitleText,-1,xText,84,1,1,0,c_white,titleAlpha)
if titleAlpha>=1
{
  draw_set_blend_mode(bm_add)
  if bFadeInGlow=true
  {
    //titleGlowAlpha+=0.002
    titleGlowAlpha+=0.002*gDeltaTime //60fps change: per 30fps tick
    if titleGlowAlpha>=0.3
      bFadeInGlow=false
  }
  else
  {
    //titleGlowAlpha-=0.002
    titleGlowAlpha-=0.002*gDeltaTime //60fps change: per 30fps tick
    if titleGlowAlpha<=0
      bFadeInGlow=true
  }
  draw_sprite_ext(sTitleText,-1,xText,84,1,1,0,c_white,titleGlowAlpha)
  draw_set_blend_mode(bm_normal)
}
