background_hspeed[0]=-2
background_vspeed[0]=0.5
background_alpha[0]=0.2
background_xscale[0]=2
background_yscale[0]=2
background_visible[1]=1
background_alpha[1]=0.7
background_xscale[1]=0.5
background_yscale[1]=0.5

if global.gameProgress<=296
{
  for(i=0;i<4;i+=1)
    global.VDportals[i]=100
  global.gameProgress=297
}
gameEvent=instance_create(0,0,oEvDataSegmentW1)
