#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=0.4
laserDelay=25
attackProgress=0
effectDelay=0
init=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if image_alpha<1
    image_alpha+=0.05
  else
  {
    laserDelay-=1
    if laserDelay<=0
    {
      if init=0
      {
        headLaser=instance_create(x,y,oSLHeadLaser)
        headLaser.spiritPower=spiritPower/1.1
        init=1
      }
      effectDelay-=1
      if effectDelay<=0
      {
        effect_create_above(ef_firework,x,y,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
        effectDelay=7
      }
      attackProgress+=1
      if type=1 //----- RIGHT -----
      {
        headLaser.image_angle=image_angle-30
        if attackProgress>=1 and attackProgress<=150
          image_angle-=1
        else if attackProgress>=151 and attackProgress<=300
          image_angle+=1
        else if attackProgress>=301 and attackProgress<=390
          image_angle-=2
        else if attackProgress>=391 and attackProgress<=480
          image_angle+=2
        else if attackProgress>=481 and attackProgress<=660
          image_angle-=3
      }
      else if type=2 //----- LEFT -----
      {
        headLaser.image_angle=image_angle+210
        if attackProgress>=1 and attackProgress<=150
          image_angle+=1
        else if attackProgress>=151 and attackProgress<=300
          image_angle-=1
        else if attackProgress>=301 and attackProgress<=390
          image_angle+=2
        else if attackProgress>=391 and attackProgress<=480
          image_angle-=2
        else if attackProgress>=481 and attackProgress<=660
          image_angle+=3
      }

      if attackProgress>=661
      {
        flashScreen=instance_create(0,0,oScreenFlash)
        flashScreen.image_alpha=1
        flashScreen.image_blend=c_red
        flashScreen.fadeSpeed=0.2
        with headLaser
          instance_destroy()
        instance_destroy()
      }
    }
  }
}
