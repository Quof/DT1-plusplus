oPlayer1.bUseBusterShot=1

if global.gameProgress<=147
  global.gameProgress=148
gameEvent=instance_create(0,0,oEvMetropolisW1)

if global.gameProgress>=151
{
  exitPortal=instance_create(608,288,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=320
  exitPortal.newMapY=272
}

if global.currentBoss="Copy X"
{
  newBarrier=instance_create(240,256,oBossBarrier)
  oPlayer1.x=384
  oPlayer1.y=320
  view_object[0]=noone
  view_xview[0]=208
  storeStatus(1)
  boss=instance_create(592,320,oCopyX)
  boss.image_xscale=-1
  boss.activateBoss=1
  npcX=instance_create(416,320,oMisc)
  npcX.sprite_index=sMegamanXKneel
  npcX.image_speed=0
  npcX.type=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
