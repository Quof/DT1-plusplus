/**
 * The game's step event.
 */
oGame.players[0] = noone     //players (used when "with( )" structures will not work)
oGame.players_length = 0
with oCharacter
{
  //necessary to reset the "viscid" movement from a moving solid
  viscidMovementOk=1
  //store the characters in the oGame.players variable
  oGame.players[oGame.players_length] = id
  oGame.players_length+=1
}

//since we are not using GM's hspeed and vspeed variables, we need to add in decimal support ourselves (so 0.25 will only move 1 pixel every 4 steps, for example)
oGame.time+=1
//we don't want the time to grow too large
if oGame.time>100000000
  oGame.time=0
//60fps change (added): oGame.time counts frames; oGame.time30 counts 30fps ticks (moveTo30, the 30fps moveTo)
if gDeltaDoTicks != 0
{
  oGame.time30+=1
  if oGame.time30>100000000
    oGame.time30=0
}

//moves all of the solids so that none of them collide with the character
//60fps change (added): at 30fps this runs the original code. Above 30fps a solid's velocity and acceleration (xVel/yVel,
//xAcc/yAcc, still in 30fps units) are read once per 30fps tick, on the tick's first frame: that tick's whole-pixel move is
//worked out as at 30fps (the same dither, from the tick's number) and made over the tick's frames, so the solid is exactly
//where 30fps puts it by the tick's last frame (gDeltaDoTicks), which is when the solids' own Step logic runs (it's gated
//to that frame). Pushing and carrying the players work as before, a pixel at a time
var tTickStart,tTickNum;
tTickStart=(gDeltaTime==1 or abs(gDeltaTick-gDeltaTime)<0.0001) //(gDeltaTick: how far into the tick this frame ends)
if gDeltaTime==1 {tTickNum=oGame.time} else {tTickNum=oGame.time30+1} //(time30 counts finished ticks)
with oMovingSolid
{
  if !variable_local_exists("mstFramesLeft") {mstXLeft=0; mstYLeft=0; mstFramesLeft=0; mstEndX=x; mstEndY=y} //60fps change (added)
  if tTickStart //60fps change (added): see above
  {
  //applies the acceleration
  xVel+=xAcc
  yVel+=yAcc
  //approximates the "active" variables
  if approximatelyZero(xVel)
    xVel=0
  if approximatelyZero(yVel)
    yVel=0
  if approximatelyZero(xAcc)
    xAcc=0
  if approximatelyZero(yAcc)
    yAcc=0
  } //60fps change (added)
  //moves the solid, pushes the character, carries the character, and stops if the character will be crushed by another solid
  mstXPrev=x
  mstYPrev=y
  if tTickStart //60fps change (added): see above
  {
  //change the decimal arguments to integer variables with relation to time
  xVelFrac=frac(abs(xVel))
  yVelFrac=frac(abs(yVel))
  xVelInteger=0
  yVelInteger=0
  if xVelFrac!=0
    if round(1/xVelFrac)!=0
       //xVelInteger=(oGame.time mod round(1/xVelFrac)=0)
       xVelInteger=(tTickNum mod round(1/xVelFrac)=0) //60fps change: the tick's number (oGame.time at 30fps)
  if yVelFrac!=0
    if round(1/yVelFrac)!=0
      //yVelInteger=(oGame.time mod round(1/yVelFrac)=0)
      yVelInteger=(tTickNum mod round(1/yVelFrac)=0) //60fps change: see above
  xVelInteger+=floor(abs(xVel))
  yVelInteger+=floor(abs(yVel))
  if xVel<0
    xVelInteger*=-1
  if yVel<0
    yVelInteger*=-1
  xVelInteger=round(xVelInteger)
  yVelInteger=round(yVelInteger)
  } //60fps change (added)
  var tSkip;
  tSkip=0
  if gDeltaTime!=1 //60fps change (added): above 30fps, this frame's part of the tick's move (see above), front-loaded
  {
    if tTickStart {mstXLeft=xVelInteger; mstYLeft=yVelInteger; mstFramesLeft=round(1/gDeltaTime)}
    else
    {
      //put somewhere new since the last frame (snapped into place): the rest of this tick's move is dropped
      if x!=mstEndX {mstXLeft=0}
      if y!=mstEndY {mstYLeft=0}
    }
    if mstFramesLeft>0
    {
      xVelInteger=sign(mstXLeft)*ceil(abs(mstXLeft)/mstFramesLeft)
      yVelInteger=sign(mstYLeft)*ceil(abs(mstYLeft)/mstFramesLeft)
      mstXLeft-=xVelInteger
      mstYLeft-=yVelInteger
      mstFramesLeft-=1
    }
    else
    {
      xVelInteger=0
      yVelInteger=0
    }
    //nothing to move this frame: the rest would do nothing (it only pushes or carries the players when the solid moves)
    tSkip=(xVelInteger=0 and yVelInteger=0)
  }
  if tSkip=0 //60fps change (added): see above
  {
  //calculate the collision bounds of the character -- we'll need it later
  with oCharacter
    calculateCollisionBounds()
  solidIsNearPlayers = 0    //whether the solid is near either of the players
  //determine if the solid is close to a player
  for(i=0;i<oGame.players_length;i+=1)
  {
    if isCollisionRectangle(x-abs(xVelInteger)-sprite_xoffset-2,y-abs(yVelInteger)-sprite_yoffset-2,x+sprite_width+abs(xVelInteger)-sprite_xoffset+2,y+sprite_height+abs(yVelInteger)-sprite_yoffset+2,oGame.players[i].lb,oGame.players[i].tb,oGame.players[i].rb,oGame.players[i].bb)
    {
      solidIsNearPlayers = 1
      break
    }
  }
  if(solidIsNearPlayers)
  {
    //solid is moving to the right
    if xVelInteger>0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(x=x;x<mstXPrev+xVelInteger;x+=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          if(viscidTop and isCollisionCharacterTop(1,oGame.players[i]) and ((oGame.players[i]).viscidMovementOk=1 or (oGame.players[i]).viscidMovementOk=2))
          {
            with oGame.players[i]
              if isCollisionRight(1)=0
              {
                x+=1
                viscidMovementOk=2
              }
          }
          else if isCollisionCharacterRight(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionRight(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].x+=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving to the left
    if xVelInteger<0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(x=x;x>mstXPrev+xVelInteger;x-=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          if viscidTop and isCollisionCharacterTop(1,oGame.players[i]) and (oGame.players[i].viscidMovementOk=1 or oGame.players[i].viscidMovementOk=2)
          {
            with oGame.players[i]
              if isCollisionLeft(1)=0
              {
                x-=1
                viscidMovementOk=2
              }
          }
          else if isCollisionCharacterLeft(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionLeft(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].x-=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving down
    if yVelInteger>0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(y=y;y<mstYPrev+yVelInteger;y+=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          if viscidTop and isCollisionCharacterTop(2,oGame.players[i])
          {
            //since we do not want to include the solid that is pulling the character down,
            //we must alter the position of the solid to get around this dilemma
            y+=5
            with oGame.players[i]
              if isCollisionBottom(1)=0
                y+=1
            y-=5
          }
          else if isCollisionCharacterBottom(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionBottom(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].y+=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving up
    if yVelInteger<0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(y=y;y>mstYPrev+yVelInteger;y-=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          //push the character up regardless of the viscid properties of the solid top
          if isCollisionCharacterTop(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionTop(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].y-=1
          }
          if isCollisionCharacterBottom(1,oGame.players[i])
          {
            //variable jumping causes the character to get stuck to the bottom of a moving solid
            //that is moving faster than 1 pixel per step upwards, so we need this code
            if oGame.players[i].jumpTime<oGame.players[i].jumpTimeTotal
            {
              oGame.players[i].yVel=-2
              oGame.players[i].jumpTime=oGame.players[i].jumpTimeTotal
            }
          }
        }
        if breakNow
          break
      }
    }
    with oCharacter
    {
      if viscidMovementOk=2
        viscidMovementOk=0
    }
  }
  else
  {
    x+=xVelInteger
    y+=yVelInteger
  }
  } //60fps change (added): see tSkip above
  mstEndX=x //60fps change (added): where this frame left it (see "snapped into place" above)
  mstEndY=y //60fps change (added)
}
//finished oMovingSolid code
//accelerates the oMoveableSolid objects downwards
with oMoveableSolid
{
  yMPrev=y
  if gDeltaTime==1 //60fps change (added): the original code at 30fps
  {
  yVel+=oGame.moveableSolidGrav
  //moves the moveable solid down
  for(y=y;y<yMPrev+yVel;y+=1)
  {
    //if there is a collision with a solid or the character one pixel below the moveable solid, we want it to stop
    //is there a (precise) collision
    if place_meeting(x,y+1,oSolid) or isCollisionCharacterBottom(1)
    {
      yVel=0
      break
    }
  }
  }
  else
  {
    //60fps change (added): above 30fps gravity is added once per 30fps tick (its first frame, as for the moving solids) and
    //the pixels the 30fps loop would try to fall that tick are made over the tick's frames, checked a pixel at a time as before
    if !variable_local_exists("mstFramesLeftM") {mstYLeftM=0; mstFramesLeftM=0}
    if tTickStart
    {
      yVel+=oGame.moveableSolidGrav
      mstYLeftM=max(0,ceil(yVel))
      mstFramesLeftM=round(1/gDeltaTime)
    }
    var tMStep;
    tMStep=0
    if mstFramesLeftM>0
    {
      tMStep=ceil(mstYLeftM/mstFramesLeftM)
      mstYLeftM-=tMStep
      mstFramesLeftM-=1
    }
    for(y=y;y<yMPrev+tMStep;y+=1)
    {
      if place_meeting(x,y+1,oSolid) or isCollisionCharacterBottom(1)
      {
        yVel=0
        mstYLeftM=0
        break
      }
    }
  }
}
