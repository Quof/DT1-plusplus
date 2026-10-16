global.location="Bullet Bill Fort"
if global.showArea=true
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Extra - Bullet Bill Fort"
}
if oPlayer1.x<512
{
  convoEvent=instance_create(0,0,oEvMarioConvo1)
  gKoopaEnemy=instance_create(3568,128,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3584,176,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3600,224,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3616,272,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3648,128,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3664,176,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3680,224,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3696,272,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3728,128,oGreenParatroopa)
  gKoopaEnemy.questType=1
  gKoopaEnemy=instance_create(3744,176,oGreenParatroopa)
  gKoopaEnemy.questType=1
}
else
{
  with oEventBarrier
    instance_destroy()
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
