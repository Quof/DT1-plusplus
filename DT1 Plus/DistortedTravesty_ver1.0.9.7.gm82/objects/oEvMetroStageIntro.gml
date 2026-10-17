#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=0
fadeColor=c_white
sceneProgress=0
sceneDelay=0
recY=0
col_yellow=make_color_rgb(176,176,79)
col_orange=make_color_rgb(113,47,6)
clBlend=5
logo=sprite_add("Sprites\DT_StageIntroLogo.bmp",0,true,false,134,81)
oPlayer1.visible=false
oHUD.visible=false
oIdentifier.visible=false
image_speed=0.5
global.gamePaused=true
stopPlayer()
if oPlayer1.x=16
{
  toRoom=rNapalmL1
  bossShow=sNapalmManIdle
  bossName="NAPALM MAN"
  yPlacement=room_height/2+15
}
else if oPlayer1.x=32
{
  toRoom=rGyroL1
  bossShow=sGyroManIdle
  bossName="GYRO MAN"
  yPlacement=room_height/2+14
}
else if oPlayer1.x=64
{
  toRoom=rDiveL1
  bossShow=sDiveManIdle
  bossName="DIVE MAN"
  yPlacement=room_height/2+20
}
else if oPlayer1.x=128
{
  toRoom=rMysteryL1
  bossShow=sMysteryMan
  bossName="MYSTERY MAN"
  yPlacement=room_height/2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//stage intro
if sceneProgress=0 //start music
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=30
  if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
  {
    var tempMplay;
    tempMplay=global.msc_MMstageIntro
    playMusic(tempMplay,0,1)
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=1 //lightning crosses room
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=20
  if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
  {
    rLightning=instance_create(room_width+48,192,oMisc)
    rLightning.type=0
    rLightning.sprite_index=sMetallicLightning
    rLightning.image_angle=90
    lLightning=instance_create(-48,192,oMisc)
    lLightning.type=0
    lLightning.sprite_index=sMetallicLightning
    lLightning.image_angle=90
  }
  //else if sceneDelay>=31
  else if sceneDelay>30 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //rLightning.x-=10
    rLightning.x-=10*gDeltaTime //60fps change: per 30fps tick
    //lLightning.x+=10
    lLightning.x+=10*gDeltaTime //60fps change: per 30fps tick
    if rLightning.x<=room_width/2
    {
      with oMisc
        instance_destroy()
      for(i=0;i<4;i+=1)
      {
        lightning[i]=instance_create(room_width/2,room_height/2,oMisc)
        lightning[i].type=0
        lightning[i].sprite_index=sMetallicLightning
        lightning[i].image_angle=(i*90)+45
      }
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=2 //screen flash and lightning fly diagonal
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    bossFinishFadeAlpha=1
  //if sceneDelay>=2
  if sceneDelay>1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //bossFinishFadeAlpha-=0.1
    bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick

  //if sceneDelay>=1
  if sceneDelay>0 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //lightning[0].x+=10;lightning[0].y+=10 //down right
    lightning[0].x+=10*gDeltaTime; lightning[0].y+=10*gDeltaTime //down right //60fps change: per 30fps tick
    //lightning[1].x+=10;lightning[1].y-=10 //up right
    lightning[1].x+=10*gDeltaTime; lightning[1].y-=10*gDeltaTime //up right //60fps change: per 30fps tick
    //lightning[2].x-=10;lightning[2].y-=10 //up left
    lightning[2].x-=10*gDeltaTime; lightning[2].y-=10*gDeltaTime //up left //60fps change: per 30fps tick
    //lightning[3].x-=10;lightning[3].y+=10 //down left
    lightning[3].x-=10*gDeltaTime; lightning[3].y+=10*gDeltaTime //down left //60fps change: per 30fps tick
    if lightning[0].y>=room_height+48
    {
      bossFinishFadeAlpha=0
      with oMisc
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=3 //wait time
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=50
  if scrCountPass(sceneDelay,50) //60fps change: once, when the count reaches it
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=4 //logo appears
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    bossFinishFadeAlpha=1
  //if sceneDelay>=2
  if sceneDelay>1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //bossFinishFadeAlpha-=0.1
    bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=5 //wait time
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=60
  if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=6 //lightning comes down
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
  {
    for(i=0;i<15;i+=1)
    {
      lightning[i]=instance_create((room_width/2-12)+random(24),-20-random(40),oMisc)
      lightning[i].type=0
      lightning[i].sprite_index=sMetallicLightning
      lightning[i].depth=-250
    }
    lightning[0].x=room_width/2;lightning[0].y=-48
  }
  //else if sceneDelay>=1
  else if sceneDelay>0 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    for(i=0;i<15;i+=1)
    {
      //lightning[i].y+=10
      lightning[i].y+=10*gDeltaTime //60fps change: per 30fps tick
    }
    if lightning[0].y>=room_height/2
    {
      with oMisc
        instance_destroy()
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=7 //screen flash
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    bossFinishFadeAlpha=1
  //if sceneDelay>=2
  if sceneDelay>1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //bossFinishFadeAlpha-=0.1
    bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=8 //boss animate
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if bossName="NAPALM MAN"
  {
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
      bossShow=sNapalmManShootStraight
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
      bossShow=sNapalmManIdle
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      bossShow=sNapalmManShootStraight
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
      bossShow=sNapalmManIdle
    //else if sceneDelay=50
    else if scrCountPass(sceneDelay,50) //60fps change: once, when the count reaches it
    {
      image_xscale=-1
      bossShow=sNapalmManShootStraight
    }
    //else if sceneDelay=60
    else if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
      bossShow=sNapalmManIdle
    //else if sceneDelay=70
    else if scrCountPass(sceneDelay,70) //60fps change: once, when the count reaches it
      bossShow=sNapalmManShootStraight
    //else if sceneDelay=80
    else if scrCountPass(sceneDelay,80) //60fps change: once, when the count reaches it
      bossShow=sNapalmManIdle
    //else if sceneDelay=100
    else if scrCountPass(sceneDelay,100) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="GYRO MAN"
  {
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
      bossShow=sGyroManProp
    //else if sceneDelay=35
    else if scrCountPass(sceneDelay,35) //60fps change: once, when the count reaches it
      bossShow=sGyroManIdle
    //else if sceneDelay=45
    else if scrCountPass(sceneDelay,45) //60fps change: once, when the count reaches it
      bossShow=sGyroManProp
    //else if sceneDelay=70
    else if scrCountPass(sceneDelay,70) //60fps change: once, when the count reaches it
      bossShow=sGyroManIdle
    //else if sceneDelay=100
    else if scrCountPass(sceneDelay,100) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="DIVE MAN"
  {
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      image_speed=0
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
      bossShow=sDiveManShoot
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      image_index=1
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
      image_index=0
    //else if sceneDelay=70
    else if scrCountPass(sceneDelay,70) //60fps change: once, when the count reaches it
      bossShow=sDiveManIdle
    //else if sceneDelay=100
    else if scrCountPass(sceneDelay,100) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="MYSTERY MAN"
  {
    //if sceneDelay=100
    if scrCountPass(sceneDelay,100) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=9 //screen flash
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    bossFinishFadeAlpha=1
  //if sceneDelay>=2
  if sceneDelay>1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //bossFinishFadeAlpha-=0.1
    bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=10 //wait time
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=120
  if scrCountPass(sceneDelay,120) //60fps change: once, when the count reaches it
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=11
{
  stopAllMusic()
  global.gamePaused=false
  global.newMapX=0
  global.newMapY=0
  //transition_steps=30
  transition_steps=30/gDeltaTime //60fps change: transition_steps counts frames: the same time
  transition_kind=21
  room_goto(toRoom)
}

if sceneProgress>=2 and sceneProgress<=8 //yellow/orange gradient
{
  draw_set_alpha(1)
  draw_rectangle_color(0,room_height/2,room_width,(room_height/2)+recY,col_yellow,col_yellow,col_orange,col_orange,false)
  draw_rectangle_color(0,room_height/2,room_width,(room_height/2)-recY,col_orange,col_orange,col_yellow,col_yellow,false)
  if recY<24
    //recY+=1
    recY+=gDeltaTime //60fps change: counts 30fps ticks
}
if sceneProgress>=4 and sceneProgress<=8 //logo show
  draw_sprite(logo,-1,room_width/2,room_height/2)
if sceneProgress>=7 //boss show
{
  draw_sprite_ext(bossShow,image_index,room_width/2,yPlacement,image_xscale,1,0,make_color_rgb(clBlend,clBlend,clBlend),1)
  if clBlend<255
    //clBlend+=10
    clBlend+=10*gDeltaTime //60fps change: per 30fps tick
}
if sceneProgress>=9 //show boss name
{
  draw_set_alpha(1)
  draw_set_font(fnt_Continue)
  draw_set_halign(fa_center)
  draw_set_color(make_color_rgb(143,205,223))
  draw_text(room_width/2,room_height/2+72,bossName)
}

if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
