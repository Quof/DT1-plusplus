#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
y+=16

//Enemy base statistics
if global.difficulty=1
  shootWait=40
else if global.difficulty=2
  shootWait=30
else if global.difficulty=3
  shootWait=25
else if global.difficulty=4
  shootWait=20
shootTime=0
detectDistX=160
riseTime=0
bCanDealDamage=false
bCanTakeDamage=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  makeEnemyActive()
  if bActive=true and stunnedTime=0 and dieFade=0
  {
    //60fps change: riseTime and shootTime count 30fps ticks in fractions; tick n's frames have values above n-1 up to n,
    //so ">=n" lower bounds of the ranges are ">n-1" (each range covers the same ticks as at 30fps), and the rise/sink
    //is per 30fps tick
    //riseTime+=1
    riseTime+=gDeltaTime
    //if riseTime>=1 and riseTime<=8
    //  y-=2
    //else if riseTime>=9 and riseTime<=999
    if riseTime>0 and riseTime<=8
      y-=2*gDeltaTime
    else if riseTime>8 and riseTime<=999
    {
      //shootTime+=1
      shootTime+=gDeltaTime
      if shootTime>=shootWait
      {
        playSound(global.snd_BulletBillShot,0,0.9)
        var xOffset;
        if x>=oPlayer1.x
          xOffset=-2
        else
          xOffset=2
        bBill=instance_create(x+xOffset,y+2,oGira)
        bBill.bActive=true
        shootTime=0
        riseTime=1000
      }
    }
    //else if riseTime>=1031 and riseTime<=1038
    //  y+=2
    else if riseTime>1030 and riseTime<=1038 //60fps change: see above
      y+=2*gDeltaTime
    else if riseTime>=1078
    {
      riseTime=0
      bActive=false
    }
  }
  enemyStepEvent()
}
