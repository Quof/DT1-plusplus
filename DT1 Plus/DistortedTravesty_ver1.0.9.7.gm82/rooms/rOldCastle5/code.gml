if global.gameProgress<=30
  global.gameProgress=31
if global.gameProgress<=32
{
  levelEvent=instance_create(0,0,oEvMarioW1)
  convoEvent=instance_create(0,0,oEvMarioConvo1)
}
if global.gameProgress>=33
{
  exitPortal=instance_create(552,272,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=480
  exitPortal.newMapY=112
}
mapShroudSpawn(1)
if global.currentBoss="DarkMind"
{
  barrier1=instance_create(176,240,oBossBarrier)
  oPlayer1.x=368
  storeStatus(1)
  boss=instance_create(544,240,oDarkMind)
  boss.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
