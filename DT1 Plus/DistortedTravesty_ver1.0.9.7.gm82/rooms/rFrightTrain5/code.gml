background_index[0]=backSewerPanUp
background_visible[0]=true

if global.gameProgress<=93
  global.gameProgress=94
if global.gameProgress<=95
{
  levelEvent=instance_create(0,0,oEvFTrainW1)
  convoEvent=instance_create(0,0,oEvFTrainConvo1)
}
if global.gameProgress>=95
{
  background_vspeed[0]=4
  global.teleportEnabled=1
}
stopAllMusic()
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
