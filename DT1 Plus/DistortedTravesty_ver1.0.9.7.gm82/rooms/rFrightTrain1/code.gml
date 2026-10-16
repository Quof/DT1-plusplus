global.location="Fright Train"
if global.showArea=true and global.gameProgress>=87
{
  areaDisplay=instance_create(0,0,oAreaDisplay)
  areaDisplay.areaString="Fright Train"
}

if global.gameProgress<=86
  global.gameProgress=87
if global.gameProgress=87 or global.gameProgress=88
{
  levelEvent=instance_create(0,0,oEvFTrainW1)
  convoEvent=instance_create(0,0,oEvFTrainConvo1)
}
trainNumbers=instance_create(0,0,oEvFTrainNumbers)
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
