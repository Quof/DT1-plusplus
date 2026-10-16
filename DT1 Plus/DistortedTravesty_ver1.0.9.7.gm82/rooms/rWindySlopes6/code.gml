backFollowFore=instance_create(0,0,oBackgroundFollow)
backFollowFore.type=2
backFollowFore.backSet=backWindySlopes
backFollowFore.xMoveScale=0.75
backFollowFore.yMoveScale=1
backFollowFore.depth=1499999

if global.gameProgress<=217
  global.gameProgress=218
gameEvent=instance_create(0,0,oEvWindySlopesW1)
levelEvent=instance_create(0,0,oEvWindySlopesConvo1)
