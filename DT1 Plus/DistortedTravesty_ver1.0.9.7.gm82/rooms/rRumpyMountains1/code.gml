global.location="Rumpy Mountains"
if global.showArea=true and global.gameProgress>=21
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Rumpy Mountains"
}
if global.gameProgress<=20
  global.gameProgress=21
if global.gameProgress=21
  levelEvent=instance_create(0,0,oEvMarioW1)
convoEvent=instance_create(0,0,oEvMarioConvo1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
