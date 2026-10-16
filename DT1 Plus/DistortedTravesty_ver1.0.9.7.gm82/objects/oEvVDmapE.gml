#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rVeiledDetritus7
  bSpawn[0]=0
else if room=rVeiledDetritus8
{
  for(i=0;i<2;i+=1)
    bSpawn[i]=0
}
else if room=rVeiledDetritus9
{
  for(i=0;i<2;i+=1)
    bSpawn[i]=0
}
else if room=rVeiledDetritus14
  bSpawn[0]=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rVeiledDetritus7
{
  if oPlayer1.x>=1232 and oPlayer1.x<=1264 and bSpawn[0]=0
  {
    newTrap=instance_create(960,80,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    newTrap=instance_create(1536,80,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    bSpawn[0]=1
  }
}
else if room=rVeiledDetritus8
{
  if oPlayer1.x>=208 and oPlayer1.y<=1208 and bSpawn[0]=0
  {
    newTrap=instance_create(384,1056,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    bSpawn[0]=1
  }
  if oPlayer1.x<=288 and oPlayer1.y<=1112 and bSpawn[1]=0
  {
    newTrap=instance_create(128,960,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    bSpawn[1]=1
  }
}
else if room=rVeiledDetritus9
{
  if oPlayer1.x>=1024 and oPlayer1.x<=1056 and bSpawn[0]=0
  {
    newTrap=instance_create(1168,80,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    bSpawn[0]=1
  }
  if oPlayer1.x>=1280 and oPlayer1.x<=1312 and bSpawn[1]=0
  {
    newTrap=instance_create(1168,80,oBigBoulder)
    newTrap.bActive=true
    effect_create_above(ef_ring,newTrap.x,newTrap.y,1,c_black)
    bSpawn[1]=1
  }
}
else if room=rVeiledDetritus14
{
  if (274016).y>=208 and bSpawn[0]=0
  {
    newEnemy=instance_create(1752,308,oSandGhoul)
    newEnemy.bActive=true
    newEnemy=instance_create(1848,308,oSandGhoul)
    newEnemy.bActive=true
    newEnemy=instance_create(1944,308,oSandGhoul)
    newEnemy.bActive=true
    newEnemy=instance_create(2040,308,oSandGhoul)
    newEnemy.bActive=true
    newEnemy=instance_create(2136,308,oSandGhoul)
    newEnemy.bActive=true
    newEnemy=instance_create(2232,308,oSandGhoul)
    newEnemy.bActive=true
    bSpawn[0]=1
  }
}
