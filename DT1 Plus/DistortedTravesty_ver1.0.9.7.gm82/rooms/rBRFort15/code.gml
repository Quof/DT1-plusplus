global.location="Black Rock Fortress"
backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backBRFort1
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=0.75
backFollowFore.depth=1499999

if global.gameProgress<=175
  global.gameProgress=176
enemyEvent=instance_create(0,0,oEvBRFW1)
mapShroudSpawn(2)
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
