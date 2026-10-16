/*
Follow another moving instance
*/
if global.gamePaused=false
{
  if bFollow=true
  {
    //GM8.2 change (added): a room instance gives the old GM8.1 id of the instance to follow (idFollowCache); look it up
    //once that instance exists (see GID)
    if variable_local_exists("idFollowCache")
      if !instance_exists(idFollow) {idFollow=GID(idFollowCache)}
    if instance_exists(idFollow)
    {
      x=idFollow.x+xFollow
      y=idFollow.y+yFollow
    }
    else
      instance_destroy()
  }
}
