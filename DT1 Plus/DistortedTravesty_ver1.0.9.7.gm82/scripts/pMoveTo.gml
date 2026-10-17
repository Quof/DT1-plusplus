/*
60fps change (added): the player's moveTo (from DT3 60FPS). The same as moveTo, but the leftover part of a pixel is
dithered with the player's own ditherCounter (oPlayer1's Step counts it up; jumps reset it), so a jump moves the
same way every time instead of depending on oGame.time. At 30fps it runs the original code (moveTo30).

0: x distance to move (this frame's share of a 30fps tick)
1: y distance to move
*/
if gDeltaTime==1 { return moveTo30(argument0, argument1); }

mtXPrev=x
mtYPrev=y
//change the decimal arguments to integer variables with relation to time
var a0mod, a1mod;
a0mod = fptoif(argument0/gDeltaTime)*gDeltaTime
a1mod = fptoif(argument1/gDeltaTime)*gDeltaTime
//xVelInteger=sign(a0mod) * floor(abs(a0mod) + frac(ditherCounter * 0.618))
//stutter fix: x carries the leftover part of a pixel over to the next frame (xSubPx) instead of the golden-ratio dither.
//Running at 60fps is 3.525px a frame: carried over it moves 3,4,3,4... (7px a 30fps tick, as at 30fps); the dither gave
//an uneven 3,4,3,3,4,4... that strayed up to 2px from a steady line, and as the view follows the player the whole
//screen jittered with it. The leftover is dropped when the player stops or turns. y keeps the dither (the jump
//corrections, pJumpCorrection, are fitted to it)
if a0mod=0 or sign(a0mod)!=sign(xSubPx) {xSubPx=0} //stutter fix
xSubPx+=a0mod //stutter fix
xVelInteger=sign(xSubPx)*floor(abs(xSubPx)+0.000001) //stutter fix
xSubPx-=xVelInteger //stutter fix
yVelInteger=sign(a1mod) * floor(abs(a1mod) + frac(ditherCounter * 0.618))
//object is moving to the right
if xVelInteger>0
  for(x=x;x<mtXPrev+xVelInteger;x+=1)
  {
    solidId=getIdCollisionRight(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x+1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x+=1             //we're free to move the moveable solid
          }
        }
      }
      else
        break
    }
  }
//object is moving to the left
if xVelInteger<0
  for(x=x;x>mtXPrev+xVelInteger;x-=1)
  {
    solidId=getIdCollisionLeft(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x-1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x-=1             //we're free to move the moveable solid
          }
        }
      }
      else
        break
    }
  }
//object is moving down
if yVelInteger>0
  for(y=y;y<mtYPrev+yVelInteger;y+=1)
  {
    if isCollisionBottom(1)
      break
    if canLandOnPlatforms()
      if isCollisionPlatform()=0 and isCollisionPlatformBottom(1) and kDown=0
        break
  }
//object is moving up
if yVelInteger<0
  for(y=y;y>mtYPrev+yVelInteger;y-=1)
  {
    if isCollisionTop(1)
      break
  }
