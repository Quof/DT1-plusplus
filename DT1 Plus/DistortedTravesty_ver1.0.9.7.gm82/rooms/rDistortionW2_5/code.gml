background_index[1]=backWindowsCurve
background_visible[1]=true
background_y[1]=192
background_vtiled[1]=false
background_hspeed[1]=-12
background_alpha[1]=0.5
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=1
backFollowFore.backSet=backWindowsCurve
backFollowFore.xScrollSpeed=-4.17
backFollowFore.bgAlpha=0.15
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=1
backFollowFore.backSet=backWindowsCurve
backFollowFore.xx=64
backFollowFore.yy=31
backFollowFore.xScrollSpeed=-2.31
backFollowFore.bgAlpha=0.15
backFollowFore.depth=1499999
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=1
backFollowFore.backSet=backWindowsCurve
backFollowFore.yy=4
backFollowFore.xScrollSpeed=-8.03
backFollowFore.bgAlpha=0.08
backFollowFore.depth=1499998

if global.gameProgress<=124
  global.gameProgress=125

if global.gameProgress>=126
{
  with oSwitchBarrier
    instance_destroy()
}
gameEvent=instance_create(0,0,oEvDistortionW2)
windowsEvent=instance_create(0,0,oEvDistortionWindows2)

cursor1=instance_create(oPlayer1.x+256,oPlayer1.y-256,oWinCursor)
cursor2=instance_create(oPlayer1.x,oPlayer1.y-128,oWinCursor)
