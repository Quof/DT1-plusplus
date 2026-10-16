#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
setCollisionBounds(-12,-13,12,13)
image_speed=0.35

//Enemy base statistics
damageType="SPIRIT"
elementType=1
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
if room=rFrightTrain7
  fireSpeed=6.5
else
  fireSpeed=8
bSetArc=false
arcStart=0
arcAmount=0
decayTime=120
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  image_angle=direction
  speed=fireSpeed
  if type=2 //left
  {
    if bSetArc=false
    {
      bSetArc=true
      arcStart=round(random(7)+2)
      arcAmount=round(random(17)+3)
    }
    else
    {
      if arcStart>0
        arcStart-=1
      else
      {
        if direction>270
          direction=270
        else
          direction+=arcAmount
      }
    }
  }
  else if type=3 //right
  {
    if bSetArc=false
    {
      bSetArc=true
      arcStart=round(random(7)+2)
      arcAmount=round(random(17)+3)
    }
    else
    {
      if arcStart>0
        arcStart-=1
      else
      {
        if direction>180 and direction<360
        {
          if direction<270
            direction=270
          else
            direction-=arcAmount
        }
        else
          direction-=arcAmount
      }
    }
  }

  if isCollisionTop(1)
    instance_destroy()
  if isCollisionBottom(1)
    instance_destroy()
  if isCollisionLeft(1)
    instance_destroy()
  if isCollisionRight(1)
    instance_destroy()
  decayTime-=1
  if decayTime<=0
    instance_destroy()
}
else
  speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_sprite_ext(sKreFire,-1,x,y,image_xscale*1.15,image_yscale*1.15,image_angle,c_white,0.4)
draw_sprite_ext(sKreFire,-1,x,y,image_xscale*1.3,image_yscale*1.3,image_angle,c_white,0.2)
