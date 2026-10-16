/*
This script is called in the enemy step event.
*/
lifePercent=life/maxLife
//stun time
if stunnedTime>0
{
  stunnedTime-=1
  //if stunnedTime=0
  //  image_blend=baseColor
}
//status effects time
if statusCripple>0
{
  statusCripple-=1
  if statusCripple=0
  {
    newDamage=instance_create(x,y-(sprite_height/2),oStatusAlert);
    newDamage.statusEffect="Cripple#Recovered"
    newDamage.statusColor=make_color_rgb(78,192,34)
  }
}
if statusPoison>0
{
  statusPoison-=1
  if statusPoison mod 2=0
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
  cripplePointPTime-=1
  if cripplePointPTime<=0
    cripplePointProgress=0
}
//damage time
if bTakingDamage=true and dieFade=0
{
  damageTime-=1
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
      image_alpha-=0.05
      dieFade+=1
      if dieFade>=20
        instance_destroy()
    }
    else
      instance_destroy()
  }
}
