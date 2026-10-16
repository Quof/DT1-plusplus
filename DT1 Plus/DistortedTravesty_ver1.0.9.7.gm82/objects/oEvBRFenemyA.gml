#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rBRFort7
{
  for(i=0;i<4;i+=1)
  {
    bSpawn[i]=false
  }
}
else if room=rBRFort8
{
  for(i=0;i<2;i+=1)
  {
    bSpawn[i]=false
  }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rBRFort7
{
  if oPlayer1.x>=3440 and bSpawn[0]=false
  {
    newEnemy=instance_create(3504,112,oBergrift)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[0]=true
  }
  if oPlayer1.x>=4768 and bSpawn[1]=false
  {
    newEnemy=instance_create(4832,80,oNyarlathotep)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[1]=true
  }
  if oPlayer1.x>=4864 and bSpawn[2]=false
  {
    newEnemy=instance_create(4928,80,oNyarlathotep)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[2]=true
  }
  if oPlayer1.x>=5008 and bSpawn[3]=false
  {
    newEnemy=instance_create(5072,80,oNyarlathotep)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[3]=true
  }
}
else if room=rBRFort8
{
  if oPlayer1.x>=2480 and bSpawn[0]=false
  {
    newEnemy=instance_create(2448,128,oNyarlathotep)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[0]=true
  }
  if oPlayer1.x>=2832 and bSpawn[1]=false
  {
    newEnemy=instance_create(2784,144,oSagym)
    newEnemy.bActive=true
    effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
    bSpawn[1]=true
  }
}
