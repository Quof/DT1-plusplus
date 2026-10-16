if global.gameProgress<=54
  global.gameProgress=55

if global.gameProgress<=57
  convoEvent=instance_create(0,0,oEvDreamlandW1)

if global.gameProgress=57
{
  with oExit
    instance_destroy()
}

if global.gameProgress>=58
{
  endExit=instance_create(1136,256,oExit)
  endExit.bShowArrow=true
  endExit.exitType=1
  endExit.newMapX=1000304
  endExit.newMapY=1000144
  endExit.toRoom=rWorldMap
}
mapShroudSpawn(1)
if global.currentBoss="MetaKnight"
{
  barrier1=instance_create(160,0,oBossBarrier)
  barrier2=instance_create(160,64,oBossBarrier)
  barrier3=instance_create(160,128,oBossBarrier)
  barrier4=instance_create(160,192,oBossBarrier)
  barrier5=instance_create(160,256,oBossBarrier)
  barrier6=instance_create(560,0,oBossBarrier)
  barrier7=instance_create(560,64,oBossBarrier)
  barrier8=instance_create(560,128,oBossBarrier)
  barrier9=instance_create(560,192,oBossBarrier)
  oPlayer1.x=224
  oPlayer1.y=320
  storeStatus(1)
  boss=instance_create(416,320,oMetaKnight)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
