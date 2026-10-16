global.location="Sky Base"

backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backWindySlopes
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=1
backFollowFore.depth=1499999

var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
