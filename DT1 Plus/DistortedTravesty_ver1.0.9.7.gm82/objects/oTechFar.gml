#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)

init=0
image_speed=oPlayer1.attackAnimSpeed
damageType="SKILL"
physicalPower=oPlayer1.physicalPower
/*if global.p1CurrentElement=1 and oPlayer1.firePercent>0.3
{
  elementType=global.p1CurrentElement
  if global.SkFireAffinity=0
    oPlayer1.fireEnergy-=250
  else if global.SkFireAffinity=1
    oPlayer1.fireEnergy-=225
  else if global.SkFireAffinity=2
    oPlayer1.fireEnergy-=200
  else if global.SkFireAffinity=3
    oPlayer1.fireEnergy-=175
  image_blend=make_color_rgb(246,54,54)
}
else if global.p1CurrentElement=2 and oPlayer1.waterPercent>0.3
{
  elementType=global.p1CurrentElement
  if global.SkWaterAffinity=0
    oPlayer1.waterEnergy-=250
  else if global.SkWaterAffinity=1
    oPlayer1.waterEnergy-=225
  else if global.SkWaterAffinity=2
    oPlayer1.waterEnergy-=200
  else if global.SkWaterAffinity=3
    oPlayer1.waterEnergy-=175
  image_blend=make_color_rgb(51,117,201)
}
if global.p1CurrentElement=3 and oPlayer1.windPercent>0.3
{
  elementType=global.p1CurrentElement
  if global.SkWindAffinity=0
    oPlayer1.windEnergy-=250
  else if global.SkWindAffinity=1
    oPlayer1.windEnergy-=225
  else if global.SkWindAffinity=2
    oPlayer1.windEnergy-=200
  else if global.SkWindAffinity=3
    oPlayer1.windEnergy-=175
  image_blend=make_color_rgb(0,214,0)
}
if global.p1CurrentElement=4 and oPlayer1.earthPercent>0.3
{
  elementType=global.p1CurrentElement
  if global.SkEarthAffinity=0
    oPlayer1.earthEnergy-=250
  else if global.SkEarthAffinity=1
    oPlayer1.earthEnergy-=225
  else if global.SkEarthAffinity=2
    oPlayer1.earthEnergy-=200
  else if global.SkEarthAffinity=3
    oPlayer1.earthEnergy-=175
  image_blend=make_color_rgb(175,76,33)
}*/

if oPlayer1.image_xscale=-1
  image_xscale=-1

skillPower=10
var pwrDown;
pwrDown=instance_number(oTechFar)
skillPower-=pwrDown*2.5

if oPlayer1.attackState=oPlayer1.TECH_WAVE_OF_AWESOME
{
  attackType=TECH_WAVE_OF_AWESOME_N
  sprite_index=sTechWoA_N
  setCollisionBounds(-16,-14,16,14)
  y-=24
  if image_xscale=1
  {
    xVel=10
    x+=12
  }
  else
  {
    xVel=-10
    x-=12
  }
  lifeTime=40
  image_speed=0.5

  if oPlayer1.kDown
  {
    attackType=TECH_WAVE_OF_AWESOME_D
    sprite_index=sTechWoA_D
    setCollisionBounds(-10,-10,10,10)
    if image_xscale=1
    {
      xVel=8
      x+=8
    }
    else
    {
      xVel=-8
      x-=8
    }
    lifeTime=100
  }
  else if oPlayer1.kUp
  {
    attackType=TECH_WAVE_OF_AWESOME_U
    sprite_index=sTechWoA_U
    image_xscale=1
    //direction=0
    _direction=0 //60fps change: _speed/_direction instead of GM's speed/direction (see correctSpeedDirection)
    _speed=0 //60fps change (added)
    flySpeed=8
    returnTime=30
  }
  else if oPlayer1.kLeft or oPlayer1.kRight
  {
    attackType=TECH_WAVE_OF_AWESOME_F
    sprite_index=sTechWoA_F1
    setCollisionBounds(-7,-7,7,7)
    if image_xscale=1
    {
      xVel=4
      x+=8
    }
    else
    {
      xVel=-4
      x-=8
    }
    lifeTime=60
  }
  //alarm[0]=3
  alarm[0]=3/gDeltaTime //60fps change: alarms count frames; 3 30fps ticks as before
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//return the character to a non-attack state
oPlayer1.reAttackTime=oPlayer1.attackSpeed //delay after attack
oPlayer1.attackState=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//60fps change: moves, turns and counts down per 30fps tick (moveTo takes this frame's share: *gDeltaTime)
if global.gamePaused=false
{
  if attackType=TECH_WAVE_OF_AWESOME_N
  {
    if oPlayer1.bUseBusterShot=1
      //x+=xVel
      x+=xVel*gDeltaTime //60fps change: see above
    else
    {
      //moveTo(xVel,yVel)
      moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: see above
      if isCollisionLeft(1)
      {
        oPlayer1.attackState=0
        instance_destroy()
      }
      if isCollisionRight(1)
      {
        oPlayer1.attackState=0
        instance_destroy()
      }
    }
    if lifeTime<=0
      instance_destroy()
    else
      //lifeTime-=1
      lifeTime-=gDeltaTime //60fps change: see above
  }
  else if attackType=TECH_WAVE_OF_AWESOME_D
  {
    //yVel+=0.5
    yVel+=0.5*gDeltaTime //60fps change: see above
    if image_xscale=1
    {
      //image_angle-=10
      image_angle-=10*gDeltaTime //60fps change: see above
      xVel=8
    }
    else
    {
      //image_angle+=10
      image_angle+=10*gDeltaTime //60fps change: see above
      xVel=-8
    }
    if isCollisionBottom(1)
      yVel=0
    if isCollisionTop(1)
    {
      oPlayer1.attackState=0
      instance_destroy()
    }
    if isCollisionLeft(1)
    {
      xVel=0
      yVel=-4
    }
    if isCollisionRight(1)
    {
      xVel=0
      yVel=-4
    }
  }
  else if attackType=TECH_WAVE_OF_AWESOME_U
  {
    //60fps change: _speed/_direction instead of GM's speed/direction, which GM applies in full every frame; moved by
    //correctSpeedDirection below
    if eType<=1
    {
      if eType=1
      {
        //direction=180
        _direction=180 //60fps change: see above
        image_xscale=-1
      }
      eType=2
    }
    //speed=flySpeed
    //returnTime-=1
    _speed=flySpeed //60fps change: see above
    returnTime-=gDeltaTime //60fps change: counts 30fps ticks
    if image_xscale=1
    {
      //image_angle+=25
      //direction+=5
      image_angle+=25*gDeltaTime //60fps change: per 30fps tick
      _direction+=5*gDeltaTime //60fps change: see above
    }
    else
    {
      //image_angle-=25
      //direction-=5
      image_angle-=25*gDeltaTime //60fps change: per 30fps tick
      _direction-=5*gDeltaTime //60fps change: see above
    }
    if returnTime<=0
    {
      //direction=point_direction(x,y,oCharacter.x,oCharacter.y-22)
      _direction=point_direction(x,y,oCharacter.x,oCharacter.y-22) //60fps change: see above
      dist=point_distance(x,y,oCharacter.x,oCharacter.y-22)
      if dist<24
        //instance_destroy()
        {instance_destroy(); exit} //60fps change: (exit: don't move it below once it's gone)
    }
    correctSpeedDirection(id) //60fps change (added): the move GM's speed/direction made (this frame's share of it)
  }
  else if attackType=TECH_WAVE_OF_AWESOME_F
  {
    if isCollisionLeft(1)
    {
      oPlayer1.attackState=0
      techAttack=instance_create(x,y,oTechBattack)
      instance_destroy()
    }
    if isCollisionRight(1)
    {
      oPlayer1.attackState=0
      techAttack=instance_create(x,y,oTechBattack)
      instance_destroy()
    }
  }

  if attackType!=TECH_WAVE_OF_AWESOME_U and attackType!=TECH_WAVE_OF_AWESOME_N
  {
    if lifeTime<=0
    {
      if attackType=TECH_WAVE_OF_AWESOME_F
        techAttack=instance_create(x,y,oTechBattack)
      instance_destroy()
    }
    else
      //lifeTime-=1
      lifeTime-=gDeltaTime //60fps change: see above
    //moveTo(xVel,yVel)
    moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: see above
  }
}
else
  if attackType=TECH_WAVE_OF_AWESOME_U
    //speed=0
    _speed=0 //60fps change: (it doesn't move while paused anyway: correctSpeedDirection only runs above)
#define Collision_oEnemyBase
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if attackType=TECH_WAVE_OF_AWESOME_F and other.dieFade=0
{
  oPlayer1.attackState=0
  techAttack=instance_create(x,y,oTechBattack)
  instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,image_angle,image_blend,image_alpha)
