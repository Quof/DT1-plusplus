#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-4,-5,4,5)

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
weight=50
bBlownUp=false
grav=0.25
blowUpTime=irandom_range(30,50)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{

  yVel+=grav
  if isCollisionTop(1)
    bBlownUp=true
  if isCollisionBottom(1)
    bBlownUp=true
  if isCollisionLeft(1)
    bBlownUp=true
  if isCollisionRight(1)
    bBlownUp=true
  blowUpTime-=1
  if blowUpTime<=0
    bBlownUp=true
  if bBlownUp=true
  {
    var dir;
    dir=0
    for (i=0;i<5;i+=1)
    {
      newBullet=instance_create(x,y,oMMeShot1)
      if damageType="PHYSICAL"
        newBullet.physicalPower=physicalPower
      else if damageType="SPIRIT"
      {
        newBullet.spiritPower=spiritPower
        newBullet.damageType="SPIRIT"
      }
      newBullet.direction=dir
      newBullet.bulletSpeed=6
      dir-=45
    }
    instance_destroy()
  }
  moveTo(xVel,yVel)

  if y>room_height+32
    instance_destroy()
}
