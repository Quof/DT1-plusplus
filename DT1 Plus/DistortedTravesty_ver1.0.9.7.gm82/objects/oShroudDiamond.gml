#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

//Enemy base statistics
bShowHealthBar=false
bShowDamage=false
bCanTakeDamage=false
spreadTime=30
size=2
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cSize=0
  size=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //speed=bulletSpeed
  _speed=bulletSpeed //60fps change: moved by correctSpeedDirection (end of the step)
  //image_angle=direction
  image_angle=_direction //60fps change: _direction stands in for direction (see correctSpeedDirection)
  if cSize>0
  {
    //spreadTime-=1
    spreadTime-=gDeltaTime //60fps change: counts 30fps ticks
    if spreadTime<=0
    {
      cSize-=1
      //dir=direction-15
      dir=_direction-15 //60fps change: see above
      for(i=0;i<3;i+=1)
      {
        sDiamond=instance_create(x,y,oShroudDiamond)
        sDiamond.damageType="SPIRIT"
        sDiamond.spiritPower=spiritPower
        sDiamond.cSize=cSize
        if cSize=1
        {
          sDiamond.image_xscale=0.66
          sDiamond.image_yscale=0.66
          sDiamond.bulletSpeed=bulletSpeed+1
        }
        else if cSize=0
        {
          sDiamond.image_xscale=0.33
          sDiamond.image_yscale=0.33
          sDiamond.bulletSpeed=bulletSpeed+3
        }
        //sDiamond.direction=dir
        sDiamond._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        dir+=15
        //sDiamond.sAmount=sAmount
      }
      instance_destroy()
    }
  }
}
else
  //speed=0
  _speed=0 //60fps change: see above
correctSpeedDirection(id) //60fps change (added): moves it by _speed in _direction, this frame's share of a 30fps tick
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
