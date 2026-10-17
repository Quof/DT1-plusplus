#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(1,0,sprite_width,sprite_height)
moving=false
alarm[0]=1
newSprite=0

findTargetX=0
findTargetY=0
drawRangeX=512
drawRangeY=384
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_local_exists("spriteChange")
  newSprite=spriteChange
if newSprite=1
{
  cR=0
  cG=64
  cB=128
}
if newSprite=3 or newSprite=4
  bFilled=choose(0,1)
if newSprite=7 and variable_local_exists("xSize")
  image_xscale=1+(xSize*0.5)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the character stands on the platform, move the platform continuously
if global.gamePaused=false
{
  if isCollisionCharacterTop(1) and moving=false
  {
    xVel=moveSpeedX
    yVel=moveSpeedY
    moving=true
  }
  if x<-128
    instance_destroy()
  else if x>room_width+128
    instance_destroy()
  else if y<-128
    instance_destroy()
  else if y>room_height+128
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
findTargetX=point_distance(oCharacter.x,0,x,0)
findTargetY=point_distance(0,oCharacter.y,0,y)
if findTargetX<drawRangeX and findTargetY<drawRangeY
{
  if newSprite=0 //normal
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  else if newSprite=1 //lights
  {
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(x,y,x+64,y+7,false)
    //cR+=3
    cR+=3*gDeltaTime //60fps change: per 30fps tick
    //cG+=6
    cG+=6*gDeltaTime //60fps change: per 30fps tick
    //cB+=9
    cB+=9*gDeltaTime //60fps change: per 30fps tick
    for (i=0;i<64;i+=8)
    {
      draw_set_color(make_color_rgb(36,24,140))
      draw_rectangle(x+5+i,y+2,x+7+i,y+5,false)
      draw_set_color(make_color_rgb(cR,cG,cB))
      draw_rectangle(x+1+i,y+3,x+3+i,y+5,false)
    }
  }
  else if newSprite=2 //centaur
  {
    draw_background_part(tileMMcentaur,0,96,64,32,x,y)
    draw_background_part(tileMMcentaur,0,96,64,16,x,y+32)
  }
  else if newSprite=3 //wily fort square
  {
    draw_background_part(tileMMfort2,0,0,64,64,x,y)
    if bFilled=1
      draw_background_part(tileMMfort2,0,80,32,32,x+16,y+16)
  }
  else if newSprite=4 //wily fort rectangle
  {
    draw_background_part(tileMMfort2,0,0,48,64,x,y)
    draw_background_part(tileMMfort2,16,0,48,64,x+48,y)
    if bFilled=1
    {
      draw_background_part(tileMMfort2,0,64,32,32,x+16,y+16)
      draw_background_part(tileMMfort2,0,96,32,32,x+48,y+16)
    }
  }
  else if newSprite=5 //roof
  {
    draw_background_part(tileMMtitle,0,48,16,16,x,y)
    draw_background_part(tileMMtitle,0,48,16,16,x+16,y)
    draw_background_part(tileMMtitle,0,48,16,16,x+32,y)
    draw_background_part(tileMMtitle,0,48,16,16,x+48,y)
  }
  else if newSprite=6 //Black Rock 1
    draw_background_part(tileBRFort1,32,224,64,32,x,y)
  else if newSprite=7 //Black Rock 2
    platformDraw(2)
  else if newSprite=8 //Black Rock 3
    platformDraw(1)
  else if newSprite=9 //Windy Slopes - 4x2
    draw_background_part(tileWindySlopes,64,0,64,32,x,y)
  else if newSprite=10 //Stalagmite Ruins
  {
    for(i=0;i<4;i+=1) //block
    {
      draw_background_part(tileVeiledDetritus,96,48,32,16,x+(i*32),y)
    }
    for(i=0;i<18;i+=1) //chain
    {
      draw_background_part(tileVeiledDetritus,80,144,16,16,x,y-(i*16)-16)
      draw_background_part(tileVeiledDetritus,80,144,16,16,x+112,y-(i*16)-16)
    }
  }
  else if newSprite=11 //Data Segment 1
  {
    draw_background_part(tileDataSegment1,64,112,16,16,x,y)
    xSpace=16
    if image_xscale>2
    {
      for(i=0;i<image_xscale-2;i+=1)
      {
        draw_background_part(tileDataSegment1,80,112,16,16,x+xSpace,y)
        xSpace+=16
      }
    }
    draw_background_part(tileDataSegment1,96,112,16,16,x+xSpace,y)
  }
}
