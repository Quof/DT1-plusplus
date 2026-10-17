#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
pointValue=160000
maxLife=45000
life=maxLife
bBoss=true

bossLives=5
livesLife[4]=58000
livesLife[3]=65000
livesLife[2]=64000
livesLife[1]=130000
lifeBar=instance_create(0,0,oShipBossLifeDisplay)
lifeBar.bossID=id

bossTime[4]=50
bossTime[3]=35
bossTime[2]=35
bossTime[1]=90
bossTimer=instance_create(0,0,oShipBossTimeDisplay)
bossTimer.bossID=id
bossTimer.timeLeft=35

pointItemAmt=12
sESpointValueArc(global.difficulty)
patProg=0
bulDir=0
tempDir=0

if global.difficulty=1 //**********************************************************************
{
  pat1_bullet_Delay=90
  pat1_cirAmt=24
  pat1_freq=5
  pat1_length=100

  pat2_homingBullet_Delay=135
  pat2_homingBullet_freq=6
  pat2_homingBullet_Amt=4

  pat3_bullet_Delay=100
  pat3_cirAmt=10
  pat3_freq=5
  pat3_length=70

  pat4_bullet_Delay=80
  pat4_cirAmt=18
  pat4_freq=24
  pat4_length=72

  pat5_cirAmt=26
  pat5_freq=33
}
else if global.difficulty=2 //**********************************************************************
{
  pat1_bullet_Delay=80
  pat1_cirAmt=28
  pat1_freq=4
  pat1_length=110

  pat2_homingBullet_Delay=130
  pat2_homingBullet_freq=5
  pat2_homingBullet_Amt=6

  pat3_bullet_Delay=90
  pat3_cirAmt=12
  pat3_freq=4
  pat3_length=80

  pat4_bullet_Delay=70
  pat4_cirAmt=22
  pat4_freq=20
  pat4_length=80

  pat5_cirAmt=28
  pat5_freq=30
}
else if global.difficulty=3 //**********************************************************************
{
  pat1_bullet_Delay=70
  pat1_cirAmt=32
  pat1_freq=4
  pat1_length=120

  pat2_homingBullet_Delay=125
  pat2_homingBullet_freq=4
  pat2_homingBullet_Amt=8

  pat3_bullet_Delay=80
  pat3_cirAmt=14
  pat3_freq=4
  pat3_length=90

  pat4_bullet_Delay=60
  pat4_cirAmt=24
  pat4_freq=16
  pat4_length=80

  pat5_cirAmt=31
  pat5_freq=27
}
else if global.difficulty=4 //**********************************************************************
{
  pat1_bullet_Delay=65
  pat1_cirAmt=36
  pat1_freq=4
  pat1_length=130

  pat2_homingBullet_Delay=120
  pat2_homingBullet_freq=4
  pat2_homingBullet_Amt=9

  pat3_bullet_Delay=70
  pat3_cirAmt=18
  pat3_freq=3
  pat3_length=100

  pat4_bullet_Delay=50
  pat4_cirAmt=28
  pat4_freq=12
  pat4_length=84

  pat5_cirAmt=33
  pat5_freq=24
}

bullet_Time=30
bulletPattern=0
bulletSequence=0
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
    if y<144
      //y+=8
      y+=8*gDeltaTime //60fps change: per 30fps tick
    else
      patProg=1
  }

  //---------- bullet pattern ----------
  if bossLives=5 and patProg=1 //**********************************************************************
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if bullet_Time>=pat1_bullet_Delay and bullet_Time mod pat1_freq=0
    if bullet_Time>=pat1_bullet_Delay and scrModPass(bullet_Time,pat1_freq) //60fps change: once each time the count reaches a multiple of it
    {
      tempDir=0
      for(i=0;i<pat1_cirAmt;i+=1)
      {
        newBullet=instance_create(x,y,oEnemyShipBulletNormal)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=6
        //newBullet.direction=bulDir+tempDir
        newBullet._direction=bulDir+tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        if bullet_Time-pat1_bullet_Delay<pat1_length/2
          newBullet.image_blend=make_color_rgb(255,150,150)
        else
          newBullet.image_blend=make_color_rgb(150,150,255)
        tempDir+=360/pat1_cirAmt
      }
      if bullet_Time-pat1_bullet_Delay<pat1_length/2
        bulDir+=3
      else
        bulDir-=3
    }
    if bullet_Time>=pat1_bullet_Delay+pat1_length
    {
      bullet_Time=0
      bulDir=0
    }
  }
  else if bossLives=4 //**********************************************************************
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if bullet_Time=pat2_homingBullet_Delay
    if scrCountPass(bullet_Time,pat2_homingBullet_Delay) //60fps change: once, when the count reaches it
    {
      bulDir=0
      if bulletPattern=0
        bulletPattern=130
      bullet_Time=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      for(i=0;i<pat2_homingBullet_Amt;i+=1)
      {
        newBullet=instance_create(x,y,oEnemyShipBulletNormal)
        newBullet.sprite_index=sEbulletLarge
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=2
        //newBullet.direction=bullet_Time
        newBullet._direction=bullet_Time //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        bullet_Time-=360/(pat2_homingBullet_Amt)
      }
      bullet_Time=pat2_homingBullet_Delay
    }
    //if bullet_Time>=pat2_homingBullet_Delay and bullet_Time mod pat2_homingBullet_freq=0
    if bullet_Time>=pat2_homingBullet_Delay and scrModPass(bullet_Time,pat2_homingBullet_freq) //60fps change: once each time the count reaches a multiple of it
    {
      bulDir+=5
      tempDir=bulletPattern
      for(i=0;i<pat2_homingBullet_Amt;i+=1)
      {
        newBullet=instance_create(x,y,oBoss2HomingBullet)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=8
        //newBullet.direction=tempDir
        newBullet._direction=tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.stopTime=45+bulDir+(i*3)
        tempDir-=90/pat2_homingBullet_Amt
      }
      if bulletSequence=1
        bulletPattern+=90
    }
    if bullet_Time>=pat2_homingBullet_Delay+60
    {
      bullet_Time=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
      for(i=0;i<pat2_homingBullet_Amt*2;i+=1)
      {
        newBullet=instance_create(x,y,oEnemyShipBulletNormal)
        newBullet.sprite_index=sEbulletLarge
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=3
        //newBullet.direction=bullet_Time
        newBullet._direction=bullet_Time //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        bullet_Time-=360/(pat2_homingBullet_Amt*2)
      }
      if life<maxLife/2 and bulletSequence=0
        bulletSequence=1
      bulletPattern+=90
      bullet_Time=0
    }
  }
  else if bossLives=3 //**********************************************************************
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if bullet_Time=pat3_bullet_Delay
    if scrCountPass(bullet_Time,pat3_bullet_Delay) //60fps change: once, when the count reaches it
      bulDir=random(360)
    //if bullet_Time>=pat3_bullet_Delay and bullet_Time mod pat3_freq=0
    if bullet_Time>=pat3_bullet_Delay and scrModPass(bullet_Time,pat3_freq) //60fps change: once each time the count reaches a multiple of it
    {
      tempDir=0
      for(i=0;i<pat3_cirAmt;i+=1)
      {
        newBullet=instance_create(x,y,oBoss2BulletLongArc)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=8
        //newBullet.direction=bulDir+tempDir
        newBullet._direction=bulDir+tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.changeDir=9.25
        newBullet.stopArc=35
        if bullet_Time-pat3_bullet_Delay<pat3_length/2+(pat3_length/10)
          newBullet.bOffset=0
        else
          newBullet.bOffset=1

        newBullet=instance_create(x,y,oBoss2BulletLongArc)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=8
        //newBullet.direction=bulDir+tempDir
        newBullet._direction=bulDir+tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.changeDir=-9.25
        newBullet.stopArc=35
        if bullet_Time-pat3_bullet_Delay<pat3_length/2+(pat3_length/4)
          newBullet.bOffset=0
        else
          newBullet.bOffset=1

        tempDir+=360/pat3_cirAmt
      }
    }
    if bullet_Time>=pat3_bullet_Delay+pat3_length
    {
      if life<maxLife/2
      {
        bullet_Time=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
        for(i=0;i<pat3_cirAmt*2;i+=1)
        {
          newBullet=instance_create(x,y,oEnemyShipBulletNormal)
          newBullet.bDestroyIfOffScreen=true
          newBullet.bulletSpeed=3.5
          //newBullet.direction=bullet_Time
          newBullet._direction=bullet_Time //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newBullet.image_blend=make_color_rgb(255,150,150)
          bullet_Time-=360/(pat3_cirAmt*2)
        }
      }
      bullet_Time=0
    }
  }
  else if bossLives=2 //**********************************************************************
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if bullet_Time>=pat4_bullet_Delay and bullet_Time mod pat4_freq=0
    if bullet_Time>=pat4_bullet_Delay and scrModPass(bullet_Time,pat4_freq) //60fps change: once each time the count reaches a multiple of it
    {
      tempDir=random(360)
      for(i=0;i<pat4_cirAmt;i+=1)
      {
        newBullet=instance_create(x,y,oBoss1SmallBullet)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=2
        //newBullet.direction=tempDir
        newBullet._direction=tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.bulletArc=1.5

        newBullet=instance_create(x,y,oBoss1SmallBullet)
        newBullet.bDestroyIfOffScreen=true
        newBullet.bulletSpeed=2
        //newBullet.direction=tempDir
        newBullet._direction=tempDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.bulletArc=-1.5

        tempDir+=360/pat4_cirAmt
      }
    }
    if bullet_Time>=pat4_bullet_Delay+pat4_length
    {
      bulDir=0
      bulletSequence=0
      bulletPattern=0
      bullet_Time=0
    }
  }
  else if bossLives=1 //**********************************************************************
  {
    //bullet_Time+=1
    bullet_Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if bullet_Time mod pat5_freq=0
    if scrModPass(bullet_Time,pat5_freq) //60fps change: once each time the count reaches a multiple of it
    {
      tempDir=0
      bulletSequence+=1
      if bulletSequence=5
      {
        bulDir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y)
        bulletSequence=0
      }
      bulletPattern+=1
      if bulletPattern=3
        pat5_cirAmt+=4
      else if bulletPattern=6
      {
        pat5_cirAmt-=4
        bulletPattern=0
      }
      for(i=0;i<pat5_cirAmt;i+=1)
      {
        newBullet=instance_create(x,y,oBoss2BulletIncoming)
        newBullet.x=x+lengthdir_x(320,bulDir+tempDir)
        newBullet.y=y+lengthdir_y(320,bulDir+tempDir)
        newBullet.bulletSpeed=2
        //newBullet.direction=bulDir+tempDir-180
        newBullet._direction=bulDir+tempDir-180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        newBullet.image_blend=make_color_rgb(255,150,150)
        if bulletPattern=3
        {
          newBullet=instance_create(x,y,oBoss2BulletIncoming)
          newBullet.x=x+lengthdir_x(320,bulDir+tempDir)
          newBullet.y=y+lengthdir_y(320,bulDir+tempDir)
          newBullet.bulletSpeed=3
          //newBullet.direction=bulDir+tempDir-180
          newBullet._direction=bulDir+tempDir-180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newBullet.image_blend=make_color_rgb(255,150,150)
        }
        tempDir+=360/pat5_cirAmt
      }
      bulDir+=16.36
    }
  }
}
else
  speed=0
