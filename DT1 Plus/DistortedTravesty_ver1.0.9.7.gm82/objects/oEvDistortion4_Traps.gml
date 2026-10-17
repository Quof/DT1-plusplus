#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//GM8.2 change: the traps are looked up by their old GM8.1 ids (see GID); again in the Step, in case they weren't
//registered yet when this was made
if room=rDistortionW4_3
{
  circleTrap1=(GID(289722))
  circleTrap2=(GID(289767))
  moveProg=0
}
else if room=rDistortionW4_4
{
  circleTrap1=(GID(290480))
  circleTrap2A=(GID(290684))
  circleTrap2B=(GID(290685))
  circleTrap2C=(GID(290686))
  moveProg=0
  moveProg2=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//GM8.2 change (added): see the Create event
if room=rDistortionW4_3
{
  if !instance_exists(circleTrap1) {circleTrap1=(GID(289722))}
  if !instance_exists(circleTrap2) {circleTrap2=(GID(289767))}
}
else if room=rDistortionW4_4
{
  if !instance_exists(circleTrap1) {circleTrap1=(GID(290480))}
  if !instance_exists(circleTrap2A) {circleTrap2A=(GID(290684))}
  if !instance_exists(circleTrap2B) {circleTrap2B=(GID(290685))}
  if !instance_exists(circleTrap2C) {circleTrap2C=(GID(290686))}
}
if global.gamePaused=false
{
  if room=rDistortionW4_3
  {
    //moveProg+=1
    moveProg+=gDeltaTime //60fps change: counts 30fps ticks
    //if moveProg>=1 and moveProg<=90
    if moveProg>0 and moveProg<=90 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //circleTrap1.x+=2
      circleTrap1.x+=2*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2.x-=2
      circleTrap2.x-=2*gDeltaTime //60fps change: per 30fps tick
    }
    //else if moveProg>=91 and moveProg<=180
    else if moveProg>90 and moveProg<=180 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //circleTrap1.x-=2
      circleTrap1.x-=2*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2.x+=2
      circleTrap2.x+=2*gDeltaTime //60fps change: per 30fps tick
      if moveProg>=180
        moveProg=0
    }
  }
  else if room=rDistortionW4_4
  {
    //moveProg+=1
    moveProg+=gDeltaTime //60fps change: counts 30fps ticks
    //if moveProg>=1 and moveProg<=90
    if moveProg>0 and moveProg<=90 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //circleTrap1.y+=2
      circleTrap1.y+=2*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2A.y-=1.5
      circleTrap2A.y-=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2B.y+=1.5
      circleTrap2B.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2C.y-=1.5
      circleTrap2C.y-=1.5*gDeltaTime //60fps change: per 30fps tick
    }
    //else if moveProg>=91 and moveProg<=180
    else if moveProg>90 and moveProg<=180 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //circleTrap1.y-=2
      circleTrap1.y-=2*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2A.y+=1.5
      circleTrap2A.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2B.y-=1.5
      circleTrap2B.y-=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2C.y+=1.5
      circleTrap2C.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      if moveProg>=180
        moveProg=0
    }

    /*moveProg2+=1
    if moveProg2>=1 and moveProg2<=90
    {
      //circleTrap2A.y-=1.5
      circleTrap2A.y-=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2B.y+=1.5
      circleTrap2B.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2C.y-=1.5
      circleTrap2C.y-=1.5*gDeltaTime //60fps change: per 30fps tick
    }
    else if moveProg2>=90 and moveProg2<=180
    {
      //circleTrap2A.y+=1.5
      circleTrap2A.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2B.y-=1.5
      circleTrap2B.y-=1.5*gDeltaTime //60fps change: per 30fps tick
      //circleTrap2C.y+=1.5
      circleTrap2C.y+=1.5*gDeltaTime //60fps change: per 30fps tick
      if moveProg2>=180
        moveProg2=0
    }*/
  }
}
