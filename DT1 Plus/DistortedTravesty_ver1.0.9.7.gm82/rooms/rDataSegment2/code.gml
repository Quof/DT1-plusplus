background_hspeed[0]=-2
background_vspeed[0]=0.5
background_alpha[0]=0.2
background_xscale[0]=2
background_yscale[0]=2
background_hspeed[1]=-1

colorControl=instance_create(0,0,oColorIndControl)
colorControl.warnDelay=280
if global.gameProgress<=283
  global.gameProgress=284
gameEvent=instance_create(0,0,oEvDataSegmentW1)
