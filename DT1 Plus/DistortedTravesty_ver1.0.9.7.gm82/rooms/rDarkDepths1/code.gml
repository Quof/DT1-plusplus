global.location="Dark Depths"
if global.showArea=true and global.gameProgress>=36
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Dark Depths"
}
if global.gameProgress<=35
  global.gameProgress=36
if global.gameProgress=36
  levelEvent=instance_create(0,0,oEvTransylvaniaW1)
if global.gameProgress=36 or global.gameProgress=37
  convoEvent=instance_create(0,0,oEvTransylvaniaConvo1)
mapShroudSpawn(1)

if SS_IsSoundLooping(global.msc_DilutedMansion)
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Dark Depths"
  stopAllMusic()
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
