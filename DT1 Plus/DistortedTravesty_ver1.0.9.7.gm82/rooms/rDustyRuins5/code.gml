if global.gameProgress<=75
  global.gameProgress=76
if global.gameProgress<=77
{
  levelEvent=instance_create(0,0,oEvDustyRuinsW1)
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
}
if global.currentBoss="Flame Instigator"
{
  barrier1=instance_create(144,256,oBossBarrier)
  barrier2=instance_create(672,256,oBossBarrier)
  oPlayer1.x=336
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(496,320,oFlameInstigator)
  boss.image_xscale=-1
  boss.activateBoss=1
}
mapShroudSpawn(1)
