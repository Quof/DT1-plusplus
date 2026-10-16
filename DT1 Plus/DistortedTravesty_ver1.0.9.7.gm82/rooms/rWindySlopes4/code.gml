global.location="Windy Slopes"
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backWindySlopes
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=1
backFollowFore.depth=1499999

B2Spawner=instance_create(0,0,oB2PlaneSpawner)
B2Spawner.reSpawnSpeed=210
B2Spawner.spawnRanRange=45
B2Spawner.y1=-16
B2Spawner.y2=16
B2Spawner.reversePlane=1

if global.gameProgress=214
{
  global.teleportEnabled=0
  global.gameProgress=215
}
gameEvent=instance_create(0,0,oEvWindySlopesW1)
levelEvent=instance_create(0,0,oEvWindySlopesConvo1)
if global.gameProgress>=196
  mapShroudSpawn(1)

var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
