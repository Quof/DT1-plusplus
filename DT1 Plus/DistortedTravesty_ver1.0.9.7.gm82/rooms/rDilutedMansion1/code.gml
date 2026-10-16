global.location="Diluted Mansion"
if global.showArea=true and global.gameProgress>=42
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Diluted Mansion"
}
if global.gameProgress<=42
  global.gameProgress=43
if global.gameProgress=43
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
mapShroudSpawn(1)

if SS_IsSoundLooping(global.msc_DarkDepths)
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Diluted Mansion"
  stopAllMusic()
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
