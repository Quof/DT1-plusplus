#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
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
dir=dirStart
dirChangeRate=changeRate
mSpeed=pSpeed
if variable_local_exists("spriteChange")
  newSprite=spriteChange
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.gamePaused=false
if global.gamePaused=false and gDeltaDoTicks //60fps change: its logic runs once per 30fps tick (every frame at 30fps), on the tick's last frame: the platform engine (gameStepEvent) reads xVel/yVel once a tick and makes the tick's move over the frames, so here it's where it is at 30fps
{
  dir+=dirChangeRate
  xVel=mSpeed*cos(degtorad(dir))
  yVel=mSpeed*sin(degtorad(dir))
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
  else if newSprite=1 //Gyro
  {
    draw_background_part(tileMMgyro,0,144,64,16,x,y)
    draw_background_part(tileMMgyro,0,160,32,16,x+16,y+16)
  }
  else if newSprite=2 //Black Rock
  {
    draw_background_part(tileBRFort1,0,160,32,16,x,y)
    draw_background_part(tileBRFort1,96,160,32,16,x+32,y)
  }
  else if newSprite=3 //Windy Slopes - 4x2
    draw_background_part(tileWindySlopes,64,0,64,32,x,y)
  else if newSprite=4 //Distortion 3
  {
    draw_background_part(tileDistortion3,0,0,16,8,x,y)
    draw_background_part(tileDistortion3,0,0,16,8,x+16,y)
  }
  else if newSprite=5 //Spire of Forgotten Souls 1
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
  else if newSprite=6 //Spire of Forgotten Souls 2
  {
    for(i=0;i<image_xscale;i+=2)
      draw_background_part(tileSoFSInterior,96,112,32,16,x+(i*16),y)
  }
  else if newSprite=7 //Data Segment 1
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
}
