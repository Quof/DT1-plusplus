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
    //image_alpha+=0.05
    image_alpha+=0.05*gDeltaTime //60fps change: per 30fps tick
  else
  {
    //laserDelay-=1
    laserDelay-=gDeltaTime //60fps change: counts 30fps ticks
    if laserDelay<=0
    {
      if init=0
      {
        headLaser=instance_create(x,y,oSLHeadLaser)
        headLaser.spiritPower=spiritPower/1.1
        init=1
      }
      //effectDelay-=1
      effectDelay-=gDeltaTime //60fps change: counts 30fps ticks
      if effectDelay<=0
      {
        effect_create_above(ef_firework,x,y,0,make_color_rgb(155+random(100),155+random(100),155+random(100)))
        effectDelay=7
      }
      //attackProgress+=1
      attackProgress+=gDeltaTime //60fps change: counts 30fps ticks
      if type=1 //----- RIGHT -----
      {
        headLaser.image_angle=image_angle-30
        //if attackProgress>=1 and attackProgress<=150
        if attackProgress>0 and attackProgress<=150 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle-=1
          image_angle-=1*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=151 and attackProgress<=300
        else if attackProgress>150 and attackProgress<=300 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle+=1
          image_angle+=1*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=301 and attackProgress<=390
        else if attackProgress>300 and attackProgress<=390 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle-=2
          image_angle-=2*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=391 and attackProgress<=480
        else if attackProgress>390 and attackProgress<=480 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle+=2
          image_angle+=2*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=481 and attackProgress<=660
        else if attackProgress>480 and attackProgress<=660 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle-=3
          image_angle-=3*gDeltaTime //60fps change: per 30fps tick
      }
      else if type=2 //----- LEFT -----
      {
        headLaser.image_angle=image_angle+210
        //if attackProgress>=1 and attackProgress<=150
        if attackProgress>0 and attackProgress<=150 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle+=1
          image_angle+=1*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=151 and attackProgress<=300
        else if attackProgress>150 and attackProgress<=300 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle-=1
          image_angle-=1*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=301 and attackProgress<=390
        else if attackProgress>300 and attackProgress<=390 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle+=2
          image_angle+=2*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=391 and attackProgress<=480
        else if attackProgress>390 and attackProgress<=480 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle-=2
          image_angle-=2*gDeltaTime //60fps change: per 30fps tick
        //else if attackProgress>=481 and attackProgress<=660
        else if attackProgress>480 and attackProgress<=660 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
          //image_angle+=3
          image_angle+=3*gDeltaTime //60fps change: per 30fps tick
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
