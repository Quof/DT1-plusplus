/*
This script is used when the player obtains a new muffin.
argument0: which muffin sequence to use
*/

var tempMuffin;
tempMuffin=argument0

muffinSeqTime+=1
if muffinSequence=0 //grab up animation
{
  if muffinSeqTime=15
  {
    oPlayer1.image_speed=0
    oPlayer1.sprite_index=sPlayerGrabUp
    oPlayer1.image_index=0
  }
  else if muffinSeqTime=25
    oPlayer1.image_index=1
  else if muffinSeqTime=40
  {
    muffinSeqTime=0
    muffinSequence+=1
  }
}
else if muffinSequence=1 //muffin comes down
{
  if muffinSeqTime>=1 and muffinSeqTime<=87
    muffin.y+=1
  else if muffinSeqTime=150
  {
    flashScreen=instance_create(0,0,oScreenFlash)
    flashScreen.image_alpha=0.7
    flashScreen.image_blend=c_white
    flashScreen.fadeSpeed=0.1
    with muffin
      instance_destroy()
    oPlayer1.sprite_index=sPlayerChestHit
  }
  else if muffinSeqTime=180
  {
    muffinSeqTime=0
    muffinSequence+=1
  }
}
else if muffinSequence=2 //muffin animation sequence
{
  if muffinSeqTime=1
  {
    valueSat=255
    muffinDist=0
    muffinDir=0
    muffinSpd=1.5
    muffinX=oPlayer1.x
    muffinY=oPlayer1.y-26
    for(i=0;i<12;i+=1)
    {
      muffin[i]=instance_create(muffinX,muffinY,oMagicalMuffin)
      muffin[i].muffinType=tempMuffin
    }
  }
  else if muffinSeqTime>=2 and muffinSeqTime<=249
  {
    var muffinAng;
    muffinAng=0

    if muffinSeqTime<=80 //separate muffins
      muffinDist+=1.1
    else if muffinSeqTime>=111 and muffinSeqTime<=154 //move muffins origin
    {
      if muffinSeqTime<115
        muffinX-=1
      muffinY-=1
    }
    else if muffinSeqTime>=170 and muffinSeqTime<=248 //bring muffins back in
      muffinDist-=1.1

    muffinDir+=muffinSpd
    for(i=0;i<12;i+=1) //circle muffins
    {
      muffin[i].x=muffinX+lengthdir_x(muffinDist,muffinAng+muffinDir)
      muffin[i].y=muffinY+lengthdir_y(muffinDist,muffinAng+muffinDir)
      muffinAng+=360/12
    }
  }
  else if muffinSeqTime=250 //remove muffins
  {
    playSound(global.snd_SkillCapsule,0,1)
    flashScreen=instance_create(0,0,oScreenFlash)
    flashScreen.image_alpha=0.3
    flashScreen.image_blend=c_white
    flashScreen.fadeSpeed=0.1
    for(i=0;i<12;i+=1)
      with muffin[i]
        instance_destroy()
    oPlayer1.sprite_index=sPlayerIdle
    oPlayer1.image_speed=0.1
    sceneProgress+=1
  }

  if muffinSeqTime=110 //character animation sequence
  {
    oPlayer1.sprite_index=sPlayerIdle
    oPlayer1.image_speed=0.1
  }
  else if muffinSeqTime=160
    oPlayer1.sprite_index=sPlayerArmUp
  else if muffinSeqTime=170
  {
    oPlayer1.image_speed=0
    oPlayer1.image_index=0
    oPlayer1.sprite_index=sPlayerMuffinGet
  }
  else if muffinSeqTime=180
  {
    oPlayer1.image_index=1
    flashScreen=instance_create(0,0,oScreenFlash)
    flashScreen.image_alpha=0.7
    flashScreen.image_blend=c_yellow
    flashScreen.fadeSpeed=0.1
  }

  if muffinSeqTime>=171 and muffinSeqTime<=247 //muffin size change
  {
    for(i=0;i<12;i+=1)
    {
      muffin[i].image_xscale-=0.012
      muffin[i].image_yscale-=0.012
      muffin[i].glowSize-=0.55
    }
  }

  if muffinSeqTime>=171 and muffinSeqTime<=220 //muffin saturation change
  {
    valueSat=5.1
    for(i=0;i<12;i+=1)
      muffin[i].image_blend=make_color_hsv(255,valueSat,255)
  }

  if muffinSeqTime>=151 and muffinSeqTime<=240 //muffin speed change
    muffinSpd+=0.1
}
