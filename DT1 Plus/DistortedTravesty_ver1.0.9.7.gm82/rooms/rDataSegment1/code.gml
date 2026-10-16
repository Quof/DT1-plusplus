global.location="Secured Data Segment"
background_hspeed[0]=-2
background_vspeed[0]=0.5
background_alpha[0]=0.2
background_xscale[0]=2
background_yscale[0]=2
background_hspeed[1]=-1
if global.gameProgress>=282
{
  if global.showArea=true
  {
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Secured Data Segment"
  }
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}

if global.gameProgress<=281
  global.gameProgress=282
gameEvent=instance_create(0,0,oEvDataSegmentW1)
