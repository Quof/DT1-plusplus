global.location="Donut Plains"
if global.showArea=true and global.gameProgress>=14
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Donut Plains"
}
if global.gameProgress<=13
  global.gameProgress=14
if global.gameProgress=14
  levelEvent=instance_create(0,0,oEvMarioW1)
if global.gameProgress=14 or global.gameProgress=15
  convoEvent=instance_create(0,0,oEvMarioConvo1)
mapShroudSpawn(1)

if !SS_IsSoundLooping(global.msc_MarioOverworld)
  stopAllMusic()

if global.gameProgress>=15
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
