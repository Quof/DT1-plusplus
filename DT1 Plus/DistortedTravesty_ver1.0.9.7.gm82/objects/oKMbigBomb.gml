#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
progress=0
waitTime=30
size=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if progress=0 //rise up
  {
    y-=12
    if y<-16
      progress=1
  }
  else if progress=1 //wait
  {
    waitTime-=1
    if waitTime<=0
    {
      x=(oKingMech.xCenter-oKingMech.roomSpan)+random(oKingMech.roomSpan)
      progress=2
    }
  }
  else if progress=2 //come down
  {
    y+=8
    if y>=oKingMech.yGround
    {
      explosion=instance_create(x,oKingMech.yGround,oGASGExplosion)
      explosion.physicalPower=physicalPower
      explosion.sprite_index=sKMfirePillar
      explosion.image_speed=0.8
      visible=false
      y=room_height+64
      progress=3
    }
  }
  else if progress=3 //spread
  {
    waitTime+=1
    if waitTime=5
    {
      explosion=instance_create(x+20,oKingMech.yGround,oGASGExplosion)
      explosion.physicalPower=physicalPower
      explosion.sprite_index=sKMfirePillar
      explosion.image_speed=0.8
      explosion=instance_create(x-20,oKingMech.yGround,oGASGExplosion)
      explosion.physicalPower=physicalPower
      explosion.sprite_index=sKMfirePillar
      explosion.image_speed=0.8
    }
    else if waitTime=10
    {
      explosion=instance_create(x+40,oKingMech.yGround,oGASGExplosion)
      explosion.physicalPower=physicalPower
      explosion.sprite_index=sKMfirePillar
      explosion.image_speed=0.8
      explosion=instance_create(x-40,oKingMech.yGround,oGASGExplosion)
      explosion.physicalPower=physicalPower
      explosion.sprite_index=sKMfirePillar
      explosion.image_speed=0.8
      instance_destroy()
    }
  }
}
