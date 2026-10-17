#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-1,-1,1,1)
//find the correct sprite for effect and collision
currentSpell=oPlayer1.spellCasting
damageType="SPIRIT"
spiritPower=oPlayer1.spiritPower
elementType=global.p1CurrentElement

if oPlayer1.image_xscale=-1
  image_xscale=-1

if currentSpell="FIREBALL"
{
  sprite_index=sSpellFireball
  setCollisionBounds(-7,-6,7,6)
  y-=24
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
  skillPower=100
  image_speed=0.5
  lifeTime=45
}
else if currentSpell="FLAME PILLAR"
{
  sprite_index=sSpellFlamePillar
  image_xscale=1
  setCollisionBounds(-31,68,31,-1)
  skillPower=70
  image_speed=0.3
  lifeTime=35
}
else if currentSpell="INFERNO"
{
  sprite_index=sSpellInferno
  image_xscale=1
  setCollisionBounds(-1,-1,1,1)
  skillPower=150
  image_speed=0.4
  lifeTime=50
}
else if currentSpell="WATER BLAST"
{
  sprite_index=sSpellWaterBlast
  image_xscale=1.35
  image_yscale=1.2
  image_alpha=0.5
  skillPower=100
  image_speed=0.2
  lifeTime=15
}
else if currentSpell="FLOOD"
{
  sprite_index=sSpellFloodWave
  image_alpha=0.75
  if image_xscale=1
    x=view_xview[0]-16
  else
    x=view_xview[0]+view_wport+16
  skillPower=250
  lifeTime=45
}
else if currentSpell="PIERCING STREAM"
{
  sprite_index=sSpellPiercingStream
  image_alpha=0.8
  image_speed=0.4
  xMove=0.25
  if image_xscale=-1
    xMove*=-1
  skillPower=110
  lifeTime=45
}
else if currentSpell="WIND BURST"
{
  sprite_index=sSpellWindStorm
  setCollisionBounds(-17,-28,17,-5)
  y-=2
  image_alpha=0.75
  skillPower=100
  image_speed=0.33
  lifeTime=21
}
else if currentSpell="CYCLONE"
{
  sprite_index=sSpellCyclone
  image_xscale=1
  setCollisionBounds(-28,-54,28,-1)
  image_alpha=0.9
  skillPower=120
  image_speed=0.5
  lifeTime=32
}
else if currentSpell="ROCK SMASH"
{
  sprite_index=sSpellRockSmash
  setCollisionBounds(-11,-11,11,11)
  y-=72
  if image_xscale=1
    xVel=1
  else
    xVel=-1
  skillPower=100
  weight=100
  lifeTime=90
}
else if currentSpell="EARTH SHIFT"
{
  bCanDealDamage=false
  sprite_index=sSpellEarthShift
  setCollisionBounds(-15,-15,15,15)
  if image_xscale=1
    x+=32
  else
    x-=32
  y-=1
  skillPower=0
  lifeTime=300
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if currentSpell="FIREBALL"
  {
    //if oGame.time mod 2=0
    if gDeltaDoTicks and oGame.time30 mod 2=0 //60fps change: every other 30fps tick (oGame.time counts frames, time30 counts ticks; the same at 30fps)
    {
      var tEffect;
      tEffect=instance_create(x-4+random(8),y-4+random(8),oEffect)
      tEffect.sprite_index=sXshotEffect1; tEffect.image_speed=0.2+random(0.1)
      tEffect.image_xscale=0.4; tEffect.image_yscale=0.4
      tEffect.image_alpha=0.6
    }

    if isCollisionLeft(1)
      instance_destroy()
    if isCollisionRight(1)
      instance_destroy()
  }
  else if currentSpell="FLAME PILLAR"
  {
    if lifeTime<=25
    {
      //image_xscale-=0.02
      image_xscale-=0.02*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.05
      image_yscale+=0.05*gDeltaTime //60fps change: per 30fps tick
    }
    else
    {
      //image_xscale-=0.005
      image_xscale-=0.005*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.01
      image_yscale+=0.01*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if currentSpell="INFERNO"
  {

    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    { //60fps change (added)
    var tEffect;
    tEffect=instance_create(x-16+random(32),y-32-random(8),oEffect)
    tEffect.sprite_index=sXshotEffect1; tEffect.image_speed=0.2+random(0.1)
    tEffect.image_xscale=0.6; tEffect.image_yscale=0.6
    tEffect.image_alpha=0.5
    } //60fps change (added)

    //y+=13
    y+=13*gDeltaTime //60fps change: per 30fps tick
  }
  else if currentSpell="WATER BLAST"
  {
    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    for(i=0;i<2;i+=1)
    {
      var tEffect;
      tEffect=instance_create(x-18+random(36),y-4-random(46),oEffect)
      tEffect.sprite_index=sWaterEffect; tEffect.image_speed=0.2+random(0.1); tEffect.image_angle=random(360)
      tEffect.image_alpha=0.45; tEffect.xSpd=random_range(-2,2); tEffect.ySpd=-2-random(3)
    }
  }
  else if currentSpell="FLOOD"
  {
    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    for(i=0;i<4;i+=1)
    {
      var tEffect;
      tEffect=instance_create(x+(random(48)*image_xscale),y-4-random(44),oEffect)
      tEffect.sprite_index=sWaterEffect; tEffect.image_speed=0.2+random(0.1); tEffect.image_angle=random(360)
      tEffect.image_alpha=0.6; tEffect.xSpd=random(2)*image_xscale
    }

    if image_xscale=1
      //x+=12
      x+=12*gDeltaTime //60fps change: per 30fps tick
    else
      //x-=12
      x-=12*gDeltaTime //60fps change: per 30fps tick
  }
  else if currentSpell="PIERCING STREAM"
  {
    //x+=xMove
    x+=xMove*gDeltaTime //60fps change: per 30fps tick
    //if lifeTime mod 5=0
    if scrModPassDown(lifeTime,5) //60fps change: once each time the count (down) reaches a multiple of 5
      effect_create_above(ef_flare,x,y,1,c_blue)
    //if lifeTime>=30
    if lifeTime>29 //60fps change: the same 30fps ticks (it counts down in gDeltaTime steps after this check)
    {
      if image_xscale>0
        //image_xscale+=0.2
        image_xscale+=0.2*gDeltaTime //60fps change: per 30fps tick
      else
        //image_xscale-=0.2
        image_xscale-=0.2*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.015
      image_yscale+=0.015*gDeltaTime //60fps change: per 30fps tick
    }
    else
    {
      if image_xscale>0
        //image_xscale+=0.05
        image_xscale+=0.05*gDeltaTime //60fps change: per 30fps tick
      else
        //image_xscale-=0.05
        image_xscale-=0.05*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.004
      image_yscale+=0.004*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if currentSpell="WIND BURST"
  {
    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    { //60fps change (added)
    var tEffect;
    tEffect=instance_create(x-14+random(28),y-2-random(16),oEffect)
    tEffect.sprite_index=sWindEffect; tEffect.image_speed=0.2+random(0.1)
    tEffect.image_alpha=0.2; tEffect.xSpd=random_range(-2,2); tEffect.ySpd=-2-random(3)
    } //60fps change (added)

    if isCollisionLeft(1)
      instance_destroy()
    if isCollisionRight(1)
      instance_destroy()
    if xVel>0 and xVel<8
      //xVel+=0.1
      xVel=scrGravAccX(xVel,0.1,1) //60fps change: speeds up per 30fps tick, following the 30fps path
    if xVel<0 and xVel>-8
      //xVel-=0.1
      xVel=scrGravAccX(xVel,-0.1,1) //60fps change: see above
  }
  else if currentSpell="CYCLONE"
  {
    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    { //60fps change (added)
    var tEffect;
    tEffect=instance_create(x-16+random(32),y-2-random(sprite_height*0.75),oEffect)
    tEffect.sprite_index=sWindEffect; tEffect.image_speed=0.2+random(0.1)
    tEffect.image_alpha=0.2; tEffect.xSpd=random_range(-2,2); tEffect.ySpd=-2-random(3)
    } //60fps change (added)

    //if lifeTime>=8
    if lifeTime>7 //60fps change: see above
    {
      //image_xscale+=0.015
      image_xscale+=0.015*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.015
      image_yscale+=0.015*gDeltaTime //60fps change: per 30fps tick
    }
    else
    {
      //image_xscale+=0.3
      image_xscale+=0.3*gDeltaTime //60fps change: per 30fps tick
      //image_yscale+=0.3
      image_yscale+=0.3*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if currentSpell="ROCK SMASH"
  {
    if gDeltaDoTicks //60fps change (added): the effect once per 30fps tick
    { //60fps change (added)
    var tEffect,tScale;
    tScale=1+((91-lifeTime)/40)
    tEffect=instance_create(x,y,oEffect)
    tEffect.sprite_index=sXshotEffect2; tEffect.image_speed=0.2; tEffect.image_alpha=0.35
    tEffect.image_xscale=tScale; tEffect.image_yscale=tScale
    } //60fps change (added)

    if isCollisionBottom(1)
    {
      playSound(global.snd_BoulderHit,0,1)
      var tEffect;
      tEffect=instance_create(x,y,oEffect)
      tEffect.sprite_index=sBomberExplosion; tEffect.image_xscale=0.5; tEffect.image_yscale=0.5
      instance_destroy()
    }
    if isCollisionLeft(1)
    {
      playSound(global.snd_BoulderHit,0,1)
      var tEffect;
      tEffect=instance_create(x,y,oEffect)
      tEffect.sprite_index=sBomberExplosion; tEffect.image_xscale=0.5; tEffect.image_yscale=0.5
      instance_destroy()
    }
    if isCollisionRight(1)
    {
      playSound(global.snd_BoulderHit,0,1)
      var tEffect;
      tEffect=instance_create(x,y,oEffect)
      tEffect.sprite_index=sBomberExplosion; tEffect.image_xscale=0.5; tEffect.image_yscale=0.5
      instance_destroy()
    }
    if yVel<12
      //yVel+=0.2
      yVel=scrGravAcc(yVel,0.2,1) //60fps change: gravity per 30fps tick, following the 30fps arc
    if image_xscale=1
    {
      if xVel<16
        //xVel+=0.4
        xVel=scrGravAccX(xVel,0.4,1) //60fps change: speeds up per 30fps tick, following the 30fps path
    }
    else
    {
      if xVel>-16
        //xVel-=0.4
        xVel=scrGravAccX(xVel,-0.4,1) //60fps change: see above
    }
  }

  if lifeTime<=0
    instance_destroy()
  else
    //lifeTime-=1
    lifeTime-=gDeltaTime //60fps change: counts 30fps ticks
  //moveTo(xVel,yVel)
  moveTo(xVel*gDeltaTime,yVel*gDeltaTime) //60fps change: this frame's share of a 30fps tick
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if currentSpell="CYCLONE"
  draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if currentSpell="CYCLONE"
  draw_set_blend_mode(bm_normal)
if currentSpell="FIREBALL"
{
  draw_sprite_ext(sSpellFireball,-1,x,y,image_xscale*1.15,image_yscale*1.15,image_angle,c_white,0.4)
  draw_sprite_ext(sSpellFireball,-1,x,y,image_xscale*1.3,image_yscale*1.3,image_angle,c_white,0.2)
}
