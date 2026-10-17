#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
shiftTime=0
shiftTimeMax=96
newSprite=0

findTargetX=0
findTargetY=0
drawRangeX=512
drawRangeY=384
bCanMove=true

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xVel=xDir
yVel=yDir
shiftTimeMax=shiftChange
if variable_local_exists("spriteChange")
  newSprite=spriteChange
if newSprite=4 and variable_local_exists("xSize")
  image_xscale=1+(xSize*0.5)
if variable_local_exists("newRangeX")
  drawRangeX=newRangeX
if variable_local_exists("newRangeY")
  drawRangeY=newRangeY
if variable_local_exists("doNotMove")
{
  bCanMove=false
  xVel=0
  yVel=0
}
if variable_local_exists("newStartTime")
  shiftTime=newStartTime
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.gamePaused=false
if global.gamePaused=false and gDeltaDoTicks //60fps change: its logic runs once per 30fps tick (every frame at 30fps), on the tick's last frame: the platform engine (gameStepEvent) reads xVel/yVel once a tick and makes the tick's move over the frames, so here it's where it is at 30fps
{
  if bCanMove=true
  {
    if shiftTime>=shiftTimeMax
    {
      shiftTime=0
      xVel*=-1
      yVel*=-1
    }
    else
      shiftTime+=1
  }
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
  if newSprite=0
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
  else if newSprite=1 //MM Gyro
  {
    draw_background_part(tileMMgyro,0,144,64,16,x,y)
    draw_background_part(tileMMgyro,0,160,32,16,x+16,y+16)
  }
  else if newSprite=2 //Black Rock 1
    platformDraw(0)
  else if newSprite=3 //Black Rock 2
    platformDraw(1)
  else if newSprite=4 //Black Rock 3
    platformDraw(2)
  else if newSprite=5 //Black Rock 4
    platformDraw(3)
  else if newSprite=6 //Spire of Forgotten Souls 1
  {
    draw_background_part(tileSoFSInterior,80,240,16,16,x,y)
    xSpace=16
    if image_xscale>2
    {
      for(i=0;i<image_xscale-2;i+=1)
      {
        draw_background_part(tileSoFSInterior,96,240,16,16,x+xSpace,y)
        xSpace+=16
      }
    }
    draw_background_part(tileSoFSInterior,112,240,16,16,x+xSpace,y)
  }
  else if newSprite=7 //Distortion 3
  {
    draw_background_part(tileDistortion3,0,0,16,8,x,y)
    draw_background_part(tileDistortion3,0,0,16,8,x+16,y)
  }
  else if newSprite=8 //Spire of Forgotten Souls 2
    draw_background_part(tileSoFSInterior,0,0,64,64,x,y)
  else if newSprite=9 //black
  {
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(x,y,x+(image_xscale*16),y+(image_yscale*16),0)
  }
  else if newSprite=10 //Vegetable Garden
    draw_background_part(tileVegetableValley,96,80,48,16,x,y)
  else if newSprite=11 //Spire of Forgotten Souls 3
    draw_background_part(tileDustyRuins,128,0,32,16,x,y)
  else if newSprite=12 //MM Centaur
  {
    if bBottomPlat=0 //top
    {
      for(i=0;i<image_yscale-1;i+=1)
        draw_background_part(tileMMcentaur,0,128,64,16,x,y+(i*16))
      draw_background_part(tileMMcentaur,0,96,64,16,x,y+(i*16))
    }
    else if bBottomPlat=1 //bottom
    {
      draw_background_part(tileMMcentaur,0,96,64,48,x,y)
      for(i=0;i<image_yscale-2;i+=1)
        draw_background_part(tileMMcentaur,0,128,64,16,x,y+48+(i*16))
    }
  }
  else if newSprite=13 //Data Segment 1
  {
    draw_background_part(tileDataSegment1,32,64,16,16,x,y)
    xSpace=16
    if image_xscale>2
    {
      for(i=0;i<image_xscale-2;i+=1)
      {
        draw_background_part(tileDataSegment1,48,64,16,16,x+xSpace,y)
        xSpace+=16
      }
    }
    draw_background_part(tileDataSegment1,64,64,16,16,x+xSpace,y)
  }
  else if newSprite=14 //Color Invert Platform
    colorInverter(0,image_xscale*16,image_yscale*16)
}
