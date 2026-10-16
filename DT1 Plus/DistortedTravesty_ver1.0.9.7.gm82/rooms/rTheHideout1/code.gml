global.location="The Hideout"
background_index[0]=backHideout
background_visible[0]=true

if global.showArea=true and global.gameProgress>=109
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="The Hideout"
}
if global.gameProgress<=108
  global.gameProgress=109
if global.gameProgress=109
  levelEvent=instance_create(0,0,oEvTheHideoutW1)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
