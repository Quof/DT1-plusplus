if global.gameProgress<=206
  global.gameProgress=207
gameEvent=instance_create(0,0,oEvDistortionW3)
if global.gameProgress<=208
  levelEvent=instance_create(0,0,oEvDistortionConvo3)

if global.currentBoss="Breakout Mystery"
{
  var xSpawn,ySpawn;
  xSpawn=592
  ySpawn=96
  for(i=0;i<7;i+=1)
  {
    for(ii=0;ii<14;ii+=1)
    {
      newBlock=instance_create(xSpawn,ySpawn,oBreakoutBlock)
      if ySpawn>=96 and ySpawn<=104
        newBlock.pointValue=3
      if ySpawn>=112 and ySpawn<=120
        newBlock.pointValue=2
      if ySpawn>=128 and ySpawn<=144
        newBlock.pointValue=1
      xSpawn+=16
    }
    xSpawn=592
    ySpawn+=8
  }
  oBreakoutBlock.useColor=1
  view_xview[0]=512
  oPlayer1.x=704
  oPlayer1.y=320
  storeStatus(1)
  oBreakoutPaddle.activateBoss=1
}
var tempMplay;
tempMplay=findMusic()
playMusic(tempMplay,0)
