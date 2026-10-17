/*
60fps change (added): the player's movement code above 30fps (from DT3 60FPS; pMoveToWrapOrig is the 30fps version).
xAcc/yAcc stay in 30fps units (one tick's worth); this frame moves gDeltaTime of a tick:
- friction for part of a tick is xFric^gDeltaTime, and the acceleration is added to match, so at every 30fps tick
  boundary the velocity is what 30fps has, (velocity+acceleration)*friction per tick
- half of this frame's change in velocity is added before the move and half after it
- a velocity set directly this frame (xVelSetTick/yVelSetTick from the player's own code, xVelSetExt/yVelSetExt from
  other objects) uses the 30fps formula for the frame instead, so the acceleration on top of it isn't lost
*/

//limits the acceleration if it is too extreme
if xAcc>xAccLimit {xAcc=xAccLimit}
else if xAcc<-1*xAccLimit {xAcc=-1*xAccLimit}
if yAcc>yAccLimit {yAcc=yAccLimit}
else if yAcc<-1*yAccLimit {yAcc=-1*yAccLimit}

//remember whether anything is accelerating each axis this frame (see the approximatelyZero checks below)
var tXAccIn, tYAccIn;
tXAccIn = xAcc
tYAccIn = yAcc

//applies the acceleration
var xAccapply, yAccapply;
var xFricapply, yFricapply;
xFricapply = xFric
yFricapply = yFric
xAccapply = xAcc * gDeltaTime
yAccapply = yAcc * gDeltaTime
if (xFric > 0.0 and xFric < 1.0)
{
  xFricapply = exp(ln(xFric + 0.000001)*gDeltaTime)
  xAccapply = xAcc * xFric * (xFricapply - 1.0) / (xFric - 1.0 - 0.000001)
}
if (yFric > 0.0 and yFric < 1.0)
{
  yFricapply = exp(ln(yFric + 0.000001)*gDeltaTime)
  yAccapply = yAcc * yFric * (yFricapply - 1.0) / (yFric - 1.0 - 0.000001)
}

xAccapply-=xVel * (1.0 - xFricapply)
yAccapply-=yVel * (1.0 - yFricapply)

//a velocity set directly this frame: the original 30fps formula, (velocity + acceleration) * friction, and nothing more
//this frame. Otherwise the acceleration added on top of a velocity that is set every frame (air dash, hurricane dash)
//mostly gets lost. The same goes for one-off pushes put into xAcc/yAcc (they'd only count for this frame's share of a
//tick). A velocity set just once is then kept as it is until half a 30fps tick has passed (at 60fps that's only this
//frame; at 120fps also the next one), which lines it up with the 30fps ticks; a velocity set again on the next frame
//(air dash, knockback push) is set every frame anyway, so that cancels the hold
//DT1 addition: a velocity set every frame for at least a whole 30fps tick (the air dash, the large jumper, Blast Off) has
//had its last tick's value for that whole tick. From there the frames would move the average of the speed before and
//after each tick, while 30fps moves the speed after it, so when the setting stops it's moved on by half a tick first,
//which is what the hold above does for a velocity set just once (simulated: without it the air dash slid ~6px too far
//and the large jumper threw the player ~8px too high)
var tFh;
if xVelSetTick or xVelSetExt
{
  xVel=(xVel+xAcc)*xFric; xAccapply=0
  if xVelSetPrev=0 {xVelHold=0.5-gDeltaTime; xVelSetRun=gDeltaTime} else {xVelHold=0; xVelSetRun+=gDeltaTime}
  xVelSetPrev=1
}
else
{
  if xVelSetPrev=1 and xVelSetRun>=0.9999 //see above
  {
    if (xFric > 0.0 and xFric < 1.0)
    {
      tFh=sqrt(xFric)
      xVel=xVel*tFh+xAcc*xFric*(tFh-1.0)/(xFric-1.0)
      xAccapply=xAcc*xFric*(xFricapply-1.0)/(xFric-1.0-0.000001)-xVel*(1.0-xFricapply)
    }
    else
    {
      xVel+=xAcc*0.5
      xAccapply=xAcc*gDeltaTime-xVel*(1.0-xFricapply)
    }
  }
  xVelSetPrev=0
  if xVelHold>0.0001 {xAccapply=0; xVelHold-=gDeltaTime}
}
if yVelSetTick or yVelSetExt
{
  yVel=(yVel+yAcc)*yFric; yAccapply=0
  if yVelSetPrev=0 {yVelHold=0.5-gDeltaTime; yVelSetRun=gDeltaTime} else {yVelHold=0; yVelSetRun+=gDeltaTime}
  yVelSetPrev=1
}
else
{
  if yVelSetPrev=1 and yVelSetRun>=0.9999 //see above
  {
    if (yFric > 0.0 and yFric < 1.0)
    {
      tFh=sqrt(yFric)
      yVel=yVel*tFh+yAcc*yFric*(tFh-1.0)/(yFric-1.0)
      yAccapply=yAcc*yFric*(yFricapply-1.0)/(yFric-1.0-0.000001)-yVel*(1.0-yFricapply)
    }
    else
    {
      yVel+=yAcc*0.5
      yAccapply=yAcc*gDeltaTime-yVel*(1.0-yFricapply)
    }
  }
  yVelSetPrev=0
  if yVelHold>0.0001 {yAccapply=0; yVelHold-=gDeltaTime}
}
xVelSetExt=0
yVelSetExt=0

xAccapply *= 0.5
yAccapply *= 0.5

xVel+=xAccapply
yVel+=yAccapply

//friction bodge so that microadjusting is easier (from DT3): with no walking input, a low speed is slowed a little more
//(at 30fps it halves each tick and is dropped once under 0.1; between ticks it would keep creeping)
if xAccInputWalk == 0.0 && xFric > 0.2 && xFric < 0.8 && abs(xVel) < 3.0
{
  var xVelSign;
  xVelSign = sign(xVel)
  xVel -= xVelSign * 2.0 * gDeltaTime * (1.0 - xFric)
  if sign(xVel) != xVelSign
    xVel = 0.0
}

xAcc=0
yAcc=0

//apply the limits since the velocity may be too extreme
if xVel>xVelLimit {xVel=xVelLimit}
else if xVel<-1*xVelLimit {xVel=-1*xVelLimit}
if yVel>yVelLimit {yVel=yVelLimit}
else if yVel<-1*yVelLimit {yVel=-1*yVelLimit}
//approximates the "active" variables.
//Only snap a tiny velocity to 0 when nothing is accelerating that axis: above 30fps each frame only adds a fraction
//of a tick's acceleration, so a low acceleration (e.g. low gravity at the top of a jump) would otherwise be snapped
//back to 0 every frame and never build up
if approximatelyZero(xVel) and tXAccIn == 0 {xVel=0}
if approximatelyZero(yVel) and tYAccIn == 0 {yVel=0}
if approximatelyZero(xAcc) {xAcc=0}
if approximatelyZero(yAcc) {yAcc=0}

effectiveMaxSlope = floor(maxSlope*gDeltaTime+frac(ditherCounter * 0.618))

//maxSlope doesn't work as a speed penalty on upward slopes above 30fps (each frame climbs less), so slow the
//character down on them by how steep the ground is here
//DT1 change: no slowdown here. In DT1 what slows the player on a slope at 30fps is the wall stop (characterStepEvent:
//the ground ahead counts as a wall), which now works per 30fps tick above 30fps too, so this would slow 45 degree slopes
//a second time (simulated: they came out 29% slower than at 30fps). DT1's slopes are 45 degrees and 1:2, which every
//frame rate climbs with room to spare, so the extra climbing above 30fps this made up for doesn't come into it
speedmod = 1.0
/*
if platformCharacterIs(ON_GROUND) && abs(xVel)>0
{
  __xtemp=x;
  __ytemp=y;
  __ystart = __ytemp-3
  __yend = __ytemp+3
  d_slope = 0
  x = __xtemp-2
  y = __ytemp-3
  for (y = __ystart; y <= __yend; y += 1)
      if pCheckLandBelow() break;
  d_left = y - __ystart
  x = __xtemp
  y = __ytemp-3
  for (y = __ystart; y <= __yend; y += 1)
      if pCheckLandBelow() break;
  d_center = y - __ystart
  x = __xtemp+2
  y = __ytemp-3
  for (y = __ystart; y <= __yend; y += 1)
      if pCheckLandBelow() break;
  d_right = y - __ystart
  if d_left != 0 && d_left != 6 && d_right != 0 && d_right != 6
      { d_slope = (d_right-d_left)/4 }
  else if d_center != 0 && d_center != 6 && d_right != 0 && d_right != 6
      { d_slope = (d_right-d_center)/2 }
  else if d_left != 0 && d_left != 6 && d_center != 0 && d_center != 6
      { d_slope = (d_center-d_left)/2 }

  if sign(d_slope) != sign(xVel)
      speedmod = 1.0/(1.0+max(0.0, abs(d_slope)*0.8-0.4))

  x = __xtemp
  y = __ytemp
}
*/

//prepares the character to move up a hill
//we need to use the "slopeYPrev" variable later to know the "true" y previous value
//keep this condition the same
if effectiveMaxSlope>0 and platformCharacterIs(ON_GROUND) and xVel!=0
{
  slopeYPrev=y
  for(y=y;y>=slopeYPrev-effectiveMaxSlope;y-=1)
    if isCollisionTop(1)
      break
  slopeChangeInY=slopeYPrev-y
}
else {slopeChangeInY=0}

//moves the character, and balances out the effects caused by other processes
//keep this condition the same
if effectiveMaxSlope*abs(xVel)>0 and platformCharacterIs(ON_GROUND)
{
  //we need to check if we should dampen out the speed as the character runs on upward slopes
  xPrev=x
  yPrev=slopeYPrev      //we don't want to use y, because y is too high
  yPrevHigh=y          //we'll use the higher previous variable later
  var tXSub; tXSub=xSubPx //stutter fix (added): the pixel leftover from before this move, for the redo below (pMoveTo)
  pMoveTo(xVel*gDeltaTime*speedmod,yVel*gDeltaTime*speedmod+slopeChangeInY)
  dist=point_distance(xPrev,yPrev,x,y) //overall distance that has been traveled
  //we should have only ran at xVel
  if dist>abs(xVelInteger)
  {
    //move back since the character moved too far
    x=xPrev
    y=yPrevHigh  //we need the character to be high so the character can move down
    //this time we'll move the correct distance, but we need to shorten out the xVel a little
    ratio=1.075
    //pMoveTo((xVel*gDeltaTime*ratio*speedmod),(yVel*gDeltaTime*ratio*speedmod+slopeChangeInY))
    //DT1 change: 30fps moves round(xVelInteger*ratio) for its tick, xVelInteger being floor(abs(xVel)) plus a pixel
    //every round(1/frac) ticks (moveTo30): this frame moves its share of that tick's average. xVel*ratio straight through
    //pMoveTo rounds differently (fptoif): 7.5px a tick at full speed up a 1:2 slope instead of 30fps's 8
    var tSlA, tSlI, tSlF;
    tSlA=fptoif(abs(xVel))
    tSlI=floor(tSlA)
    tSlF=tSlA-tSlI
    xSubPx=tXSub //stutter fix (added): the move above is undone, so is what it did to the pixel leftover
    pMoveTo(sign(xVel)*((1-tSlF)*round(tSlI*ratio)+tSlF*round((tSlI+1)*ratio))*gDeltaTime,(yVel*gDeltaTime*ratio*speedmod+slopeChangeInY))
  }
}
else
{
  //we simply move xVel and yVel while in the air or on a ladder
  pMoveTo(xVel*gDeltaTime,yVel*gDeltaTime)
}

xVel+=xAccapply
yVel+=yAccapply

//apply the limits since the velocity may be too extreme
if xVel>xVelLimit {xVel=xVelLimit}
else if xVel<-1*xVelLimit {xVel=-1*xVelLimit}
if yVel>yVelLimit {yVel=yVelLimit}
else if yVel<-1*yVelLimit {yVel=-1*yVelLimit}
//approximates the "active" variables (same rule as above: don't snap to 0 while that axis is being accelerated)
if approximatelyZero(xVel) and tXAccIn == 0 {xVel=0}
if approximatelyZero(yVel) and tYAccIn == 0 {yVel=0}
if approximatelyZero(xAcc) {xAcc=0}
if approximatelyZero(yAcc) {yAcc=0}
