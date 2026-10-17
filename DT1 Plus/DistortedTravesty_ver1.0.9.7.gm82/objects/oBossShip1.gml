#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=150000
maxLife=55000
life=maxLife
bBoss=true

bossLives=3
livesLife[2]=60000
livesLife[1]=75000
lifeBar=instance_create(0,0,oShipBossLifeDisplay)
lifeBar.bossID=id

bossTime[2]=35
bossTime[1]=50
bossTimer=instance_create(0,0,oShipBossTimeDisplay)
bossTimer.bossID=id
bossTimer.timeLeft=30

pointItemAmt=12
sESpointValueArc(global.difficulty)
patProg=0

if global.difficulty=1
{
  pat1_bullet_Delay=85
  pat1_cirAmt=4

  pat2_bullet_Delay=70
  pat2_cirAmt=24
  pat2_bulletFreq=18

  pat3_bullet_Delay=55
  pat3_cirAmt=27
}
else if global.difficulty=2
{
  pat1_bullet_Delay=80
  pat1_cirAmt=5

  pat2_bullet_Delay=65
  pat2_cirAmt=28
  pat2_bulletFreq=15

  pat3_bullet_Delay=50
  pat3_cirAmt=30
}
else if global.difficulty=3
{
  pat1_bullet_Delay=75
  pat1_cirAmt=6

  pat2_bullet_Delay=60
  pat2_cirAmt=32
  pat2_bulletFreq=11

  pat3_bullet_Delay=45
  pat3_cirAmt=36
}
else if global.difficulty=4
{
  pat1_bullet_Delay=65
  pat1_cirAmt=8

  pat2_bullet_Delay=45
  pat2_cirAmt=35
  pat2_bulletFreq=8

  pat3_bullet_Delay=35
  pat3_cirAmt=42
}
bullet_Time=30
bulletPattern=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  //---------- move pattern ----------
  if patProg=0
  {
    //if y<128
    //  y+=6
    //60fps change: 6 per 30fps tick. At 30fps it stopped on the first step at or past 128, which from y=-32 (where
    //oEvSkyBaseW1 creates it) is 130; this stops there at any frame rate (smaller steps would stop sooner)
    if y<130
      y=min(130,y+6*gDeltaTime)
    else
      patProg=1
  }

  //---------- bullet pattern ----------
  if bossLives=3 and patProg=1
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    if bullet_Time>=pat1_bullet_Delay
    {
      boss1Pat1(bulletPattern,pat1_cirAmt)
      if bulletPattern=0
        bulletPattern=1
      else
        bulletPattern=0
      bullet_Time=0
    }
  }
  else if bossLives=2
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    if bullet_Time>=pat2_bullet_Delay
    {
      //if bullet_Time mod pat2_bulletFreq=0
      if scrModPass(bullet_Time,pat2_bulletFreq) //60fps change: once each time the count reaches a multiple of it
      {
        boss1Pat2(bulletPattern,pat2_cirAmt)
        if bulletPattern=0
          bulletPattern=1
        else
          bulletPattern=0
      }
      if bullet_Time>=pat2_bullet_Delay+60
      {
        var dir;
        dir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
        for(i=0;i<pat2_cirAmt;i+=1)
        {
          newBullet=instance_create(x,y,oEnemyShipBulletNormal)
          newBullet.bDestroyIfOffScreen=true
          newBullet.bulletSpeed=3.5
          //newBullet.direction=dir
          newBullet._direction=dir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          dir+=360/pat2_cirAmt
        }
        bullet_Time=0
      }
    }
  }
  else if bossLives=1
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    if bullet_Time>=pat3_bullet_Delay
    {
      boss1Pat3(bulletPattern,pat3_cirAmt)
      if bulletPattern=0
        bulletPattern=1
      else
        bulletPattern=0
      bullet_Time=0
    }
  }
}
else
  speed=0
