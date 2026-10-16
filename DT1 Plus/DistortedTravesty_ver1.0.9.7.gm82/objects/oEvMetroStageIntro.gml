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
  sceneDelay+=1
  if sceneDelay=30
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
  sceneDelay+=1
  if sceneDelay=20
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
  else if sceneDelay>=31
  {
    rLightning.x-=10
    lLightning.x+=10
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
  sceneDelay+=1
  if sceneDelay=1
    bossFinishFadeAlpha=1
  if sceneDelay>=2
    bossFinishFadeAlpha-=0.1

  if sceneDelay>=1
  {
    lightning[0].x+=10;lightning[0].y+=10 //down right
    lightning[1].x+=10;lightning[1].y-=10 //up right
    lightning[2].x-=10;lightning[2].y-=10 //up left
    lightning[3].x-=10;lightning[3].y+=10 //down left
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
  sceneDelay+=1
  if sceneDelay=50
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=4 //logo appears
{
  sceneDelay+=1
  if sceneDelay=1
    bossFinishFadeAlpha=1
  if sceneDelay>=2
  {
    bossFinishFadeAlpha-=0.1
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=5 //wait time
{
  sceneDelay+=1
  if sceneDelay=60
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=6 //lightning comes down
{
  sceneDelay+=1
  if sceneDelay=1
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
  else if sceneDelay>=1
  {
    for(i=0;i<15;i+=1)
    {
      lightning[i].y+=10
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
  sceneDelay+=1
  if sceneDelay=1
    bossFinishFadeAlpha=1
  if sceneDelay>=2
  {
    bossFinishFadeAlpha-=0.1
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=8 //boss animate
{
  sceneDelay+=1
  if bossName="NAPALM MAN"
  {
    if sceneDelay=10
      bossShow=sNapalmManShootStraight
    else if sceneDelay=20
      bossShow=sNapalmManIdle
    else if sceneDelay=30
      bossShow=sNapalmManShootStraight
    else if sceneDelay=40
      bossShow=sNapalmManIdle
    else if sceneDelay=50
    {
      image_xscale=-1
      bossShow=sNapalmManShootStraight
    }
    else if sceneDelay=60
      bossShow=sNapalmManIdle
    else if sceneDelay=70
      bossShow=sNapalmManShootStraight
    else if sceneDelay=80
      bossShow=sNapalmManIdle
    else if sceneDelay=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="GYRO MAN"
  {
    if sceneDelay=10
      bossShow=sGyroManProp
    else if sceneDelay=35
      bossShow=sGyroManIdle
    else if sceneDelay=45
      bossShow=sGyroManProp
    else if sceneDelay=70
      bossShow=sGyroManIdle
    else if sceneDelay=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="DIVE MAN"
  {
    if sceneDelay=1
      image_speed=0
    else if sceneDelay=20
      bossShow=sDiveManShoot
    else if sceneDelay=30
      image_index=1
    else if sceneDelay=40
      image_index=0
    else if sceneDelay=70
      bossShow=sDiveManIdle
    else if sceneDelay=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if bossName="MYSTERY MAN"
  {
    if sceneDelay=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=9 //screen flash
{
  sceneDelay+=1
  if sceneDelay=1
    bossFinishFadeAlpha=1
  if sceneDelay>=2
  {
    bossFinishFadeAlpha-=0.1
    if bossFinishFadeAlpha<=0
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
else if sceneProgress=10 //wait time
{
  sceneDelay+=1
  if sceneDelay=120
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
  transition_steps=30
  transition_kind=21
  room_goto(toRoom)
}

if sceneProgress>=2 and sceneProgress<=8 //yellow/orange gradient
{
  draw_set_alpha(1)
  draw_rectangle_color(0,room_height/2,room_width,(room_height/2)+recY,col_yellow,col_yellow,col_orange,col_orange,false)
  draw_rectangle_color(0,room_height/2,room_width,(room_height/2)-recY,col_orange,col_orange,col_yellow,col_yellow,false)
  if recY<24
    recY+=1
}
if sceneProgress>=4 and sceneProgress<=8 //logo show
  draw_sprite(logo,-1,room_width/2,room_height/2)
if sceneProgress>=7 //boss show
{
  draw_sprite_ext(bossShow,image_index,room_width/2,yPlacement,image_xscale,1,0,make_color_rgb(clBlend,clBlend,clBlend),1)
  if clBlend<255
    clBlend+=10
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
