bShowArrow=true
exitType=1
newMapX=0
newMapY=0
toRoom=rBRFort1
newTrans=21
image_yscale=9
newArrowPosY=240

if global.gameProgress<=153
  //instance_deactivate_object(self)
  instance_destroy() //GM8.2 change: gone for this visit instead of deactivated. Deactivated here, while the room's instances were still being made, it stopped GM 8.2 with gm82core's "game_restart() is currently not supported" error (its helper object's Create event ran again). Nothing reactivates it and the room isn't persistent, so it's the same
else
{
  if oPlayer1.x>1024
  {
    oPlayer1.xVel=-16
    oPlayer1.xAcc=-16
    oPlayer1.facing=oPlayer1.LEFT
  }
}
