global.location="Vegetable Garden"
parasolSpawner=instance_create(0,0,oParasolSpawner)
parasolSpawner.reSpawnSpeed=100
if global.showArea=true and global.gameProgress>=51
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Vegetable Garden"
}
if global.gameProgress<=50
  global.gameProgress=51
if global.gameProgress=51
  levelEvent=instance_create(0,0,oEvDreamlandW1)
if global.gameProgress=51 or global.gameProgress=52
  convoEvent=instance_create(0,0,oEvDreamlandConvo1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
