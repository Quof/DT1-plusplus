if global.gameProgress<=7
  global.gameProgress=8
if global.gameProgress<=9
{
  levelEvent=instance_create(0,0,oEvIEF)
  gameEvent=instance_create(0,0,oStartTutorial)
}

if global.currentBoss="DCyborg"
{
  barrier1=instance_create(112,240,oBossBarrier)
  barrier2=instance_create(576,240,oBossBarrier)
  oPlayer1.x=320
  storeStatus(1)
  boss=instance_create(496,240,oDCyborg)
  boss.sprite_index=sNeteryuIdle
  boss.activateBoss=1
}
mapShroudSpawn(1)
