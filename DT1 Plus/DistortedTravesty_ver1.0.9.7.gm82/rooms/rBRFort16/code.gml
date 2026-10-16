global.location="Black Rock Fortress Spire"
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backBRFort1
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=0.75
backFollowFore.depth=1499999

if global.gameProgress<=176
  global.gameProgress=177
enemyEvent=instance_create(0,0,oEvBRFW1)
stopAllMusic()
