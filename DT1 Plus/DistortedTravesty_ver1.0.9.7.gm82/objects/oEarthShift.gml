#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
viscidTop=1
makeActive()
setCollisionBounds(-15,-15,15,15)
image_alpha=0
global.recSpellsConnected+=1
bDestroy=false
if oPlayer1.image_xscale=1
  x+=32
else
  x-=32
y-=17
weight=50
lifeTime=450
maxVel=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bDestroy=false
  {
    if image_alpha<1
      image_alpha+=0.1
    if image_alpha>=1
    {
      if xVel>maxVel
        xVel=maxVel
      else if xVel<-maxVel
        xVel=-maxVel
      if xVel>0
        xVel-=0.05
      else if xVel<0
        xVel+=0.05
      yVel+=0.2
      if isCollisionBottom(1)
        yVel=0
      if isCollisionLeft(1)
        xVel*=-1
      if isCollisionRight(1)
        xVel*=-1
      if lifeTime<=0
      {
        bDestroy=true
        image_alpha=1
      }
      else
        lifeTime-=1
      if y>room_height+24
        instance_destroy()
    }
  }
  else
  {
    image_alpha-=0.1
    if image_alpha<=0
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
