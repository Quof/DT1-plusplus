global.location="Integrated Electrical Factory"
if global.gameProgress=-10
  gameEvent=instance_create(0,0,oStart)
if global.gameProgress=-9
{
  tutorial=instance_create(0,0,oStartTutorial)
  levelEvent=instance_create(0,0,oEvIEF)
}
mapShroudSpawn(1)
if global.gameProgress>-10
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
