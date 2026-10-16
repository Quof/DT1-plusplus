global.location="Distortion Windows"

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

levelEvent=instance_create(0,0,oEvDistortionW2)
windowsEvent=instance_create(0,0,oEvDistortionWindows2)
cursor=instance_create(oPlayer1.x,oPlayer1.y-256,oWinCursor)
mapShroudSpawn(1)
if global.gameProgress>=128
{
  if global.showArea=true
  {
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Distortion Windows"
  }
  exitPortal=instance_create(96,448,oDungeonPortal)
  exitPortal.toRoom=rWorldMap
  exitPortal.newMapX=16
  exitPortal.newMapY=128
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
