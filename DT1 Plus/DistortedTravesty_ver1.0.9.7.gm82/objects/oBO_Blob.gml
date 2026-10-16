#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-6,-6,6,6)
image_speed=0.33

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
weight=50
grav=0.2
areaHit=0
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  yVel+=grav
  if y<160
    y+=yVel
  if y>=192
  {
    if isCollisionTop(1)
      areaHit=1
    if isCollisionBottom(1)
      areaHit=2
    if isCollisionLeft(1)
      areaHit=3
    if isCollisionRight(1)
      areaHit=4
    if areaHit>0
    {
      effect=instance_create(x,y+6,oEffect)
      effect.sprite_index=sMMacidBreak
      effect.image_speed=0.33
      if areaHit=1
      {
        effect.image_angle=180
        effect.x-=6
      }
      else if areaHit=3
      {
        effect.image_angle=270
        effect.x-=6
      }
      else if areaHit=4
      {
        effect.image_angle=90
        effect.x+=6
      }
      for(i=0;i<2;i+=1)
      {
        aBurst=instance_create(x,y,oCXacidBurst)
        aBurst.physicalPower=physicalPower
        if areaHit=1
        {
          aBurst.xVel=random_range(-4,4)
          aBurst.yVel=random(1)+1
          aBurst.y+=8
        }
        else if areaHit=2
        {
          aBurst.xVel=random_range(-3.5,3.5)
          aBurst.yVel=-random(3)-3
          aBurst.y-=8
        }
        else if areaHit=3
        {
          aBurst.xVel=random_range(2,6)
          aBurst.yVel=-random(2)-2
          aBurst.x+=8
        }
        else if areaHit=4
        {
          aBurst.xVel=random_range(-6,-2)
          aBurst.yVel=-random(2)-2
          aBurst.x-=8
        }
        aBurst.type=1
        aBurst.image_xscale=0.65
        aBurst.image_yscale=0.65
      }
      instance_destroy()
    }
  }
  moveTo(xVel,yVel)
}
