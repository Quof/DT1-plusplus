#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rDistortionW4_3
{
  circleTrap1=(289722)
  circleTrap2=(289767)
  moveProg=0
}
else if room=rDistortionW4_4
{
  circleTrap1=(290480)
  circleTrap2A=(290684)
  circleTrap2B=(290685)
  circleTrap2C=(290686)
  moveProg=0
  moveProg2=0
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if room=rDistortionW4_3
  {
    moveProg+=1
    if moveProg>=1 and moveProg<=90
    {
      circleTrap1.x+=2
      circleTrap2.x-=2
    }
    else if moveProg>=91 and moveProg<=180
    {
      circleTrap1.x-=2
      circleTrap2.x+=2
      if moveProg>=180
        moveProg=0
    }
  }
  else if room=rDistortionW4_4
  {
    moveProg+=1
    if moveProg>=1 and moveProg<=90
    {
      circleTrap1.y+=2
      circleTrap2A.y-=1.5
      circleTrap2B.y+=1.5
      circleTrap2C.y-=1.5
    }
    else if moveProg>=91 and moveProg<=180
    {
      circleTrap1.y-=2
      circleTrap2A.y+=1.5
      circleTrap2B.y-=1.5
      circleTrap2C.y+=1.5
      if moveProg>=180
        moveProg=0
    }

    /*moveProg2+=1
    if moveProg2>=1 and moveProg2<=90
    {
      circleTrap2A.y-=1.5
      circleTrap2B.y+=1.5
      circleTrap2C.y-=1.5
    }
    else if moveProg2>=90 and moveProg2<=180
    {
      circleTrap2A.y+=1.5
      circleTrap2B.y-=1.5
      circleTrap2C.y+=1.5
      if moveProg2>=180
        moveProg2=0
    }*/
  }
}
