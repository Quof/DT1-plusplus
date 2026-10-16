#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
makeActive()
setCollisionBounds(-13,-32,13,-1)
image_speed=0

waitTime=0
chargeTime=0
chargeFrame=0
chargeAmt=1
assistProgress=0

messageChoose=irandom_range(1,6)
switch(messageChoose)
{
  case 1: xMessage="How about some help?!"; break;
  case 2: xMessage="Can't let you take all the credit!"; break;
  case 3: xMessage="I picked up a new move!"; break;
  case 4: xMessage="I'd like to show you a neat attack I learned!"; break;
  case 5: xMessage="I should have used this in my games!"; break;
  case 6: xMessage="Want some back up?"; break;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if assistProgress=0 //---------- teleport down ----------
  {
    yVel=14
    if isCollisionBottom(1)
    {
      yVel=0
      sprite_index=sMegamanXIdle
      assistProgress=1
    }
    moveTo(xVel,yVel)
  }
  else if assistProgress=1 //---------- wait/charge shot ----------
  {
    waitTime+=1
    if waitTime>=15
    {
      if chargeTime=0
      {
        eDistCheck=instance_nearest(oPlayer1.x,oPlayer1.y,oEnemyBase)
        if instance_exists(eDistCheck)
        {
          if x>eDistCheck.x
            image_xscale=-1
        }
        sprite_index=sMegamanXAim
        if random(10)>6 //random message from X
        {
          msgCreate(xMessage,0,oMessagePerson,"X",0,1)
          newMessage.fadingTime=70
        }
      }

      chargeTime+=1
      if chargeTime mod 7=0
        chargeAmt+=1

      if chargeTime>=60
      {
        waitTime=0
        chargeTime=0
        chargeAmt=1
        assistProgress=2
      }
    }
  }
  else if assistProgress=2 //---------- fire shot ----------
  {
    if image_xscale=1
      shotDir=-25
    else
      shotDir=155
    for(i=0;i<3;i+=1)
    {
      newAttack=instance_create(x,y-17,oEvPMNpcXattack)
      newAttack.direction=shotDir
      newAttack.fireSpeed=9.5
      shotDir+=25
    }
    assistProgress=3
  }
  else if assistProgress=3 //---------- wait ----------
  {
    waitTime+=1
    if waitTime=20
      sprite_index=sMegamanXIdle
    else if waitTime>=40
    {
      attackChoice=0
      eDistCheck=instance_nearest(oPlayer1.x,oPlayer1.y,oEnemyBase) //check if an enemy is close
      if instance_exists(eDistCheck)
      {
        if point_distance(x,y,eDistCheck.x,eDistCheck.y)<128 //if enemy is close, check to jump
        {
          if random(10)>4
          {
            if x>eDistCheck.x
              image_xscale=-1
            else
              image_xscale=1
            attackChoice=1
          }
        }
      }
      if attackChoice=0
        assistProgress=10
      else
      {
        if image_xscale=1
          xVel=5
        else
          xVel=-5
        y-=4
        yVel=-6
        sprite_index=sMegamanXJump
        chargeTime=1
        chargeAmt=3
        assistProgress=4
      }
    }
  }
  else if assistProgress=4 //---------- jump and attack again ----------
  {
    waitTime+=1
    if waitTime=45
    {
      sprite_index=sMegamanXJumpAim
      chargeTime=0
      chargeAmt=0
      eDistCheck=instance_nearest(oPlayer1.x,oPlayer1.y,oEnemyBase) //check if an enemy is close
      if instance_exists(eDistCheck)
      {
        if point_distance(x,y,eDistCheck.x,eDistCheck.y)<128
        {
          if random(10)>4
          {
            if x>eDistCheck.x
              image_xscale=-1
            else
              image_xscale=1
            attackChoice=1
          }
        }
      }
      if image_xscale=1
        shotDir=-25
      else
        shotDir=155
      for(i=0;i<3;i+=1)
      {
        newAttack=instance_create(x,y-17,oEvPMNpcXattack)
        newAttack.direction=shotDir
        newAttack.fireSpeed=8
        shotDir+=25
      }
      waitTime=0
      assistProgress=5
    }

    yVel+=0.4
    if isCollisionLeft(1)
      xVel=5
    if isCollisionRight(1)
      xVel=-5
    if isCollisionBottom(1)
    {
      xVel=0
      yVel=0
      sprite_index=sMegamanXIdle
    }
    moveTo(xVel,yVel)
  }
  else if assistProgress=5 //---------- wait ----------
  {
    waitTime+=1
    if waitTime=35
      assistProgress=10
    yVel+=0.4
    if isCollisionLeft(1)
      xVel=5
    if isCollisionRight(1)
      xVel=-5
    if isCollisionBottom(1)
    {
      xVel=0
      yVel=0
      sprite_index=sMegamanXIdle
    }
    moveTo(xVel,yVel)
  }
  else if assistProgress=10 //---------- teleport ----------
  {
    sprite_index=sPlayerDiscombobulate
    y-=14
    if y<-8
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
//charging
if chargeTime>0
{
  for(i=0;i<chargeAmt;i+=1)
  {
    draw_sprite_ext(sMMcharging,chargeFrame+(i*2),x,y-17,1+(i*0.5),1+(i*0.5),0,c_white,1)
  }
  chargeFrame+=1
  if chargeFrame>=11
    chargeFrame=0
}
