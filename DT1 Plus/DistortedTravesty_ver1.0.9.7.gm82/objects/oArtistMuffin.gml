#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
image_speed=0
effectSize[0]=1
effectSize[1]=1.25
effectSize[2]=1.5
effectAlpha[0]=0.75
effectAlpha[1]=0.5
effectAlpha[2]=0.25
barrierSizeMod=0
barrierSizeTime=0

//Enemy base statistics
eName="Muffin"
maxLife=9000
life=maxLife
expWorth=0
physicalPower=550
physicalDefense=100
spiritPower=550
spiritDefense=150
bCanDealDamage=false
bCanTakeDamage=false
bActive=true
changeMuffin=0
if global.difficulty=1
{
  attack1Wait=570
}
else if global.difficulty=2
{
  attack1Wait=530
}
else if global.difficulty=3
{
  attack1Wait=610
}
else if global.difficulty=4
{
  attack1Wait=510
}
attack1Time=irandom(300)
restoreDelay=0

bossProgress=0
difficultyAdjustments(global.difficulty)
maxLife=9000
life=maxLife
combatText="Each of the Muffins have an attack, but you're gonna have to observe what they are yourself. They auto-recover life and when one is destroyed, the others recover some life from the energy given off. It's best if you take them down one at a time, that is, if you could remove the barriers on them."
sideText="Wow, who would've guessed that we would be trying to destroy these now. I know you wanted to eat them, and hey, maybe you'd become some super powerful awesome... thing if you did. It's best if they are destroyed though."
cripplePointText=">It's a Muffin, so None"

alarm[0]=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oMitra.life=oMitra.maxLife
if global.difficulty=1
{
  oMitra.physicalPower+=8
  oMitra.spiritPower+=8
  oMitra.setPDefense+=15
  oMitra.setSDefense+=15
}
else if global.difficulty=2
{
  oMitra.physicalPower+=10
  oMitra.spiritPower+=10
  oMitra.setPDefense+=12
  oMitra.setSDefense+=12
}
else if global.difficulty=3
{
  oMitra.physicalPower+=12
  oMitra.spiritPower+=12
  oMitra.setPDefense+=10
  oMitra.setSDefense+=10
}
else if global.difficulty=4
{
  oMitra.physicalPower+=15
  oMitra.spiritPower+=15
  oMitra.setPDefense+=11
  oMitra.setSDefense+=11
}
/*
----- Easy -----
150
15 * 7 = 105
255

----- Normal -----
200
12 * 7 = 84
284

----- Hard -----
250
10 * 7 = 70
320

----- Distorted -----
252
11 * 7 = 77
329
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
skillResist=100
if muffinType=0
{
  eName="Strawberry Muffin"
  FIREresist=100
  WATERresist=-75
  WINDresist=60
  EARTHresist=30
}
else if muffinType=1
{
  eName="Blueberry Muffin"
  FIREresist=30
  WATERresist=100
  WINDresist=-75
  EARTHresist=60
}
else if muffinType=2
{
  eName="Banana Nut Muffin"
  FIREresist=60
  WATERresist=30
  WINDresist=100
  EARTHresist=-75
}
else if muffinType=3
{
  eName="Coconut Muffin"
  FIREresist=-75
  WATERresist=60
  WINDresist=30
  EARTHresist=100
}
else if muffinType=4
{
  eName="Almond Muffin"
  FIREresist=75
  WATERresist=-50
  WINDresist=-50
  EARTHresist=75
}
else if muffinType=5
{
  eName="Refried Muffin"
  FIREresist=-50
  WATERresist=75
  WINDresist=75
  EARTHresist=-50
}
else if muffinType=6
{
  eName="Bacon Muffin"
  FIREresist=100
  WATERresist=100
  WINDresist=100
  EARTHresist=100
  skillResist=-100
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if bActive=true and dieFade=0
  {
    //change Muffin
    if changeMuffin=1
    {
      bCanTakeDamage=true
      linkLine=instance_create(x,y,oMisc)
      linkLine.sprite_index=sDTorsoLightning
      linkLine.image_speed=0.33
      linkLine.image_blend=c_purple
      linkLine.image_alpha=0.45
      linkLine.type=1
      linkLine.image_xscale=0.7
      linkLine.image_angle=point_direction(x,y,oMitra.x,oMitra.y)-90
      linkLine.image_yscale=point_distance(x,y,oMitra.x,oMitra.y)/64

      muffinLaser=instance_create(x,y,oMuffinLaser)
      muffinLaser.spiritPower=spiritPower
      var timeAdd,laserAng;
      timeAdd=0
      laserAng=point_direction(x,y,oPlayer1.x,oPlayer1.y)
      muffinLaser.image_angle=laserAng
      muffinCount=instance_number(oArtistMuffin)
      if muffinCount=6
        timeAdd=10
      else if muffinCount=5
        timeAdd=20
      else if muffinCount=4
        timeAdd=30
      else if muffinCount=3
        timeAdd=40
      else if muffinCount=2
        timeAdd=50
      else if muffinCount=1
        timeAdd=60
      muffinLaser.idleTime=60+timeAdd
      if muffinType=6
        muffinLaser.bShake=1
      else
        muffinLaser.bShake=0
      if muffinCount>=3 and muffinCount<=4
      {
        for(i=0;i<7;i+=1)
        {
          muffinLaser=instance_create(x,y,oMuffinLaser)
          muffinLaser.spiritPower=spiritPower
          muffinLaser.image_angle=laserAng+(i*45)+45
          muffinLaser.idleTime=60+timeAdd
          muffinLaser.bShake=0
          muffinLaser.effectStop=1
        }
      }
      else if muffinCount=2
      {
        for(i=0;i<15;i+=1)
        {
          muffinLaser=instance_create(x,y,oMuffinLaser)
          muffinLaser.spiritPower=spiritPower
          muffinLaser.image_angle=laserAng+(i*22.5)+22.5
          muffinLaser.idleTime=60+timeAdd
          muffinLaser.bShake=0
          muffinLaser.effectStop=1
        }
      }
      else if muffinCount=1
      {
        for(i=0;i<24;i+=1)
        {
          muffinLaser=instance_create(x,y,oMuffinLaser)
          muffinLaser.spiritPower=spiritPower
          muffinLaser.image_angle=laserAng+(i*15)+15
          muffinLaser.idleTime=60+timeAdd
          muffinLaser.bShake=0
          muffinLaser.effectStop=1
        }
      }
      changeMuffin=2
    }
    //attack1Time+=1
    attack1Time+=gDeltaTime //60fps change: counts 30fps ticks
    //if attack1Time=attack1Wait //attack warn
    if scrCountPass(attack1Time,attack1Wait) //attack warn //60fps change: once, when the count reaches it
    {
      afterImage=instance_create(x,y,oEnemyAfterImage)
      afterImage.sprite_index=sprite_index
      afterImage.image_index=image_index
      afterImage.imageFade=0.04
      afterImage.xScalingSet=0.2
      afterImage.yScalingSet=0.2
    }
    //else if attack1Time=attack1Wait+30 //attack execute
    else if scrCountPass(attack1Time,attack1Wait+30) //attack execute //60fps change: once, when the count reaches it
    {
      if muffinType=0 or muffinType=1 //Strawberry Muffin, Blueberry Muffin
      {
        var bulletDir;
        bulletDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        for(i=0;i<50;i+=1)
        {
          newBullet=instance_create(x,y,oMMeShot1)
          newBullet.sprite_index=sEbulletSmall
          newBullet.physicalPower=physicalPower
          newBullet.bulletSpeed=3
          //newBullet.direction=bulletDir
          newBullet._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          bulletDir+=360/50
        }
      }
      else if muffinType=2 or muffinType=3 //Banana Nut Muffin, Coconut Muffin
      {
        var bulletDir;
        bulletDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        for(i=0;i<50;i+=1)
        {
          newBullet=instance_create(x,y,oMMeShot1)
          newBullet.sprite_index=sEbulletSmall
          newBullet.physicalPower=physicalPower
          newBullet.bulletSpeed=6-(i/9)
          //newBullet.direction=bulletDir
          newBullet._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
        }
      }
      else if muffinType=4 or muffinType=5 //Almond Muffin, Refried Muffin
      {
        var bulletDir;
        bulletDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        for(i=0;i<40;i+=1)
        {
          newBullet=instance_create(x,y,oMMeShotArc)
          newBullet.sprite_index=sEbulletLong
          newBullet.physicalPower=physicalPower
          newBullet.bDestroyOnOutside=1
          newBullet.timeToDestroy=1000
          newBullet.bulletSpeed=4
          //newBullet.direction=bulletDir
          newBullet._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newBullet.arcTime=40+i
          if i mod 2=0
          {
            if muffinType=2
              newBullet.bulletArc=4
            else
              newBullet.bulletArc=-4
          }
          else
          {
            if muffinType=2
              newBullet.bulletArc=-4
            else
              newBullet.bulletArc=4
          }
          bulletDir+=360/40
        }
      }
      else if muffinType=6 //Bacon Muffin
      {
        var bulletDir;
        bulletDir=point_direction(x,y,oPlayer1.x,oPlayer1.y-26)
        for(i=0;i<42;i+=1)
        {
          newBullet=instance_create(x,y,oMMeShot1)
          newBullet.sprite_index=sLaserB
          newBullet.physicalPower=physicalPower
          newBullet.bulletSpeed=5
          //newBullet.direction=bulletDir
          newBullet._direction=bulletDir //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
          newBullet.image_angle=bulletDir+90
          bulletDir+=360/42
        }
      }
    }
    //else if attack1Time=attack1Wait+50 //attack end
    else if attack1Time>=attack1Wait+50 //attack end //60fps change: >= so it still happens if the frame rate changes mid-count (it resets)
    {
      var muffinCount,timeAdd;
      timeAdd=0
      muffinCount=instance_number(oArtistMuffin)
      if muffinCount=6
        timeAdd=45
      else if muffinCount=5
        timeAdd=90
      else if muffinCount=4
        timeAdd=135
      else if muffinCount=3
        timeAdd=180
      else if muffinCount=2
        timeAdd=225
      else if muffinCount=1
        timeAdd=270
      attack1Time=irandom(30)+timeAdd
    }
    if life<maxLife //auto-regen life
    {
      //restoreDelay-=1
      restoreDelay-=gDeltaTime //60fps change: counts 30fps ticks
      if restoreDelay<=0
      {
        life+=1
        restoreDelay=3
      }
    }
    if life>maxLife //keep life from going over max
      life=maxLife
  }
  enemyStepEvent()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<3;i+=1)
{
  if effectSize[i]<1.75
  {
    //effectSize[i]+=0.01
    effectSize[i]+=0.01*gDeltaTime //60fps change: per 30fps tick
    //effectAlpha[i]-=0.01
    effectAlpha[i]-=0.01*gDeltaTime //60fps change: per 30fps tick
  }
  else
  {
    effectSize[i]=1
    effectAlpha[i]=0.75
  }
}
draw_set_blend_mode(bm_add)
draw_set_alpha(0.75)
draw_circle_color(x,y,48,make_color_rgb(240,160,70),c_black,false)
draw_sprite_ext(sprite_index,muffinType,x,y,effectSize[0],effectSize[0],0,c_white,effectAlpha[0])
draw_sprite_ext(sprite_index,muffinType,x,y,effectSize[1],effectSize[1],0,c_white,effectAlpha[1])
draw_sprite_ext(sprite_index,muffinType,x,y,effectSize[2],effectSize[2],0,c_white,effectAlpha[2])
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprite_index,muffinType,x,y,1,1,0,image_blend,1)

if bCanTakeDamage=false //draw barrier
{
  //barrierSizeTime+=1
  barrierSizeTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if barrierSizeTime>=1 and barrierSizeTime<=60
  if barrierSizeTime>0 and barrierSizeTime<=60 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
    //barrierSizeMod+=0.1
    barrierSizeMod+=0.1*gDeltaTime //60fps change: per 30fps tick
  //else if barrierSizeTime>=61 and barrierSizeTime<=120
  else if barrierSizeTime>60 and barrierSizeTime<=120 //60fps change: the same 30fps ticks, counted in gDeltaTime steps
    //barrierSizeMod-=0.1
    barrierSizeMod-=0.1*gDeltaTime //60fps change: per 30fps tick
  else if barrierSizeTime>=121
    barrierSizeTime=0
  draw_set_alpha(0.3)
  draw_circle_color(x,y,32+barrierSizeMod,make_color_rgb(240,160,70),c_black,false)
}
