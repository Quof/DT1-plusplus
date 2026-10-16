bShowArrow=true
exitType=1
newMapX=0
newMapY=0
toRoom=rBRFort1
newTrans=21
image_yscale=9
newArrowPosY=240

if global.gameProgress<=153
  instance_deactivate_object(self)
else
{
  if oPlayer1.x>1024
  {
    oPlayer1.xVel=-16
    oPlayer1.xAcc=-16
    oPlayer1.facing=oPlayer1.LEFT
  }
}
