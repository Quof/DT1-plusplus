background_alpha[0]=0.9
global.location="Primary Memory"
if global.gameProgress>=325
{
  if global.showArea=true
  {
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Primary Memory"
  }
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}

if global.gameProgress<=324
  global.gameProgress=325
gameEvent=instance_create(0,0,oEvPrimaryMemoryW1)
levelEvent=instance_create(0,0,oEvPrimaryMemoryConvo1)
