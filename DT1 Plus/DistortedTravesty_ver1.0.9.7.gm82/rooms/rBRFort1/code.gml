backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backBRFort1
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=0.75
backFollowFore.depth=1499999

if global.gameProgress<=155
  global.gameProgress=156
mapShroudSpawn(1)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
