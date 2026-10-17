#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=0.4
laserDelay=40
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
  if init=0
  {
    if type=1 //----- LEFT -----
      image_angle+=30
    else if type=2 //----- RIGHT -----
      image_angle-=30
    init=1
  }

  if image_alpha<1
    //image_alpha+=0.02
    image_alpha+=0.02*gDeltaTime //60fps change: per 30fps tick
  else
  {
    //laserDelay-=1
    laserDelay-=gDeltaTime //60fps change: counts 30fps ticks
    if laserDelay<=0
    {
      if init=1
      {
        headLaser=instance_create(x,y,oSLHeadLaser)
        headLaser.spiritPower=spiritPower/1.1
        init=2
      }
      //effectDelay-=1
      effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
      if effectDelay<=0
      {
        effect_create_above(ef_firework,x,y,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
        effectDelay=7
      }
      if type=1 //----- LEFT -----
        headLaser.image_angle=image_angle-30
      if type=2 //----- RIGHT -----
        headLaser.image_angle=image_angle+30

      if idleTime<5000
        //idleTime-=1
        idleTime-=gDeltaTime //60fps change: counts 30fps ticks
      //if idleTime=0
      if idleTime<=0 //60fps change: <= so it still ends if the frame rate changes mid-count
      {
        with headLaser
          instance_destroy()
        instance_destroy()
      }
    }
  }
}
