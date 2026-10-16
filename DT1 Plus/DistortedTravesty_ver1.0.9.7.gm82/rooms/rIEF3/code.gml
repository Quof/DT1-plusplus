if global.gameProgress<=2
  global.gameProgress=3
if global.gameProgress=3 or global.gameProgress=4
{
  gameEvent=instance_create(0,0,oStartTutorial)
  levelEvent=instance_create(0,0,oEvIEF)
}
if global.gameProgress>=5
{
  levelEnemy=instance_create(1504,160,oSineFaller)
  levelEnemy=instance_create(1392,304,oCrabWalker)
}

mmHead=instance_create(1152,256,oMisc)
mmHead.sprite_index=sMegamanHead
mmHead.type=1
mapShroudSpawn(1)
