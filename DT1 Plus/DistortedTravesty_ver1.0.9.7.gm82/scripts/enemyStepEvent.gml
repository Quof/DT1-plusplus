/*
This script is called in the enemy step event.
*/
lifePercent=life/maxLife
//60fps change: the timers below count 30fps ticks (-=gDeltaTime). The ones checked for =0 stop at 0 (max), so they
//still reach it exactly if the frame rate is changed while they count
//stun time
if stunnedTime>0
{
  //stunnedTime-=1
  stunnedTime=max(0,stunnedTime-gDeltaTime) //60fps change: see above (enemies check stunnedTime=0)
  //if stunnedTime=0
  //  image_blend=baseColor
}
//status effects time
if statusCripple>0
{
  //statusCripple-=1
  statusCripple=max(0,statusCripple-gDeltaTime) //60fps change: see above
  if statusCripple=0
  {
    newDamage=instance_create(x,y-(sprite_height/2),oStatusAlert);
    newDamage.statusEffect="Cripple#Recovered"
    newDamage.statusColor=make_color_rgb(78,192,34)
  }
}
if statusPoison>0
{
  //statusPoison-=1
  var tPoisonPrev; tPoisonPrev=statusPoison //60fps change (added): for the check below
  statusPoison=max(0,statusPoison-gDeltaTime) //60fps change: see above
  //if statusPoison mod 2=0
  //60fps change: -1 life each time it counts down onto (or past) an even number, so the damage per second is the same.
  //(GM8's mod rounds fractions to whole numbers, so "mod 2=0" also passed at x.5 values above 30fps)
  if ceil(statusPoison/2)!=ceil(tPoisonPrev/2)
    life-=1
  if statusPoison=0
  {
    newDamage=instance_create(x,y-sprite_height,oStatusAlert);
    newDamage.statusEffect="Poison#Recovered"
    newDamage.statusColor=make_color_rgb(78,192,34)
  }
}
//cripple progress recovery
if cripplePointProgress>0
{
  //cripplePointPTime-=1
  cripplePointPTime-=gDeltaTime //60fps change: see above
  if cripplePointPTime<=0
    cripplePointProgress=0
}
//damage time
if bTakingDamage=true and dieFade=0
{
  //damageTime-=1
  damageTime-=gDeltaTime //60fps change: see above
  if damageTime<=0
  {
    image_blend=baseColor
    bTakingDamage=false
  }
}
if dieFade>0
{
  if bIsBoss=false
  {
    if dieEffect=0
    {
      //image_alpha-=0.05
      //dieFade+=1
      image_alpha-=0.05*gDeltaTime //60fps change: fades out over 19 30fps ticks, as before
      dieFade+=gDeltaTime //60fps change: see above
      if dieFade>=20
        instance_destroy()
    }
    else
      instance_destroy()
  }
}
