#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-5,-5,5,5)

//Enemy base statistics
damageType="SPIRIT"
elementType=2
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
areaHit=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if direction=0
    image_angle-=12
  else if direction=180
    image_angle+=12
  if isCollisionLeft(1)
    areaHit=1
  if isCollisionRight(1)
    areaHit=2
  if areaHit>0
  {
    if areaHit=1
      dir=45
    else
      dir=225
    for(i=0;i<3;i+=1)
    {
      shotIce=instance_create(x,y,oMMeShot1)
      shotIce.damageType="SPIRIT"
      shotIce.spiritPower=spiritPower
      shotIce.elementType=2
      shotIce.sprite_index=sCXshotgunIce
      shotIce.image_xscale=0.65
      shotIce.image_yscale=0.65
      shotIce.bulletSpeed=9
      shotIce.direction=dir
      if areaHit=1
        shotIce.x+=8
      else
        shotIce.x-=8
      dir-=45
    }
    instance_destroy()
  }
  moveTo(xVel,yVel)
}
