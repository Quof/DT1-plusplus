global.location="Old Castle"
if global.showArea=true and global.gameProgress>=24
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Old Castle"
}
if global.gameProgress<=23
  global.gameProgress=24
if global.gameProgress=24
  levelEvent=instance_create(0,0,oEvMarioW1)
if global.gameProgress=24 or global.gameProgress=25
  convoEvent=instance_create(0,0,oEvMarioConvo1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
