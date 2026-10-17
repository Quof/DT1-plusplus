/*
This script is used when the player obtains a new muffin.
argument0: which muffin sequence to use
*/

var tempMuffin;
tempMuffin=argument0

//muffinSeqTime+=1
muffinSeqTime+=gDeltaTime //60fps change: counts 30fps ticks
if muffinSequence=0 //grab up animation
{
  //if muffinSeqTime=15
  if scrCountPass(muffinSeqTime,15) //60fps change: once, when the count reaches it
  {
    oPlayer1.image_speed=0
    oPlayer1.sprite_index=sPlayerGrabUp
    oPlayer1.image_index=0
  }
  //else if muffinSeqTime=25
  else if scrCountPass(muffinSeqTime,25) //60fps change: once, when the count reaches it
    oPlayer1.image_index=1
  //else if muffinSeqTime=40
  else if scrCountPass(muffinSeqTime,40) //60fps change: once, when the count reaches it
  {
    muffinSeqTime=0
    muffinSequence+=1
  }
}
else if muffinSequence=1 //muffin comes down
{
  //if muffinSeqTime>=1 and muffinSeqTime<=87
  if muffinSeqTime>0 and muffinSeqTime<=87 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //muffin.y+=1
    muffin.y+=gDeltaTime //60fps change: per 30fps tick
  //else if muffinSeqTime=150
  else if scrCountPass(muffinSeqTime,150) //60fps change: once, when the count reaches it
  {
    flashScreen=instance_create(0,0,oScreenFlash)
    flashScreen.image_alpha=0.7
    flashScreen.image_blend=c_white
    flashScreen.fadeSpeed=0.1
    with muffin
      instance_destroy()
    oPlayer1.sprite_index=sPlayerChestHit
  }
  //else if muffinSeqTime=180
  else if scrCountPass(muffinSeqTime,180) //60fps change: once, when the count reaches it
  {
    muffinSeqTime=0
    muffinSequence+=1
  }
}
else if muffinSequence=2 //muffin animation sequence
{
  //if muffinSeqTime=1
  if scrCountPass(muffinSeqTime,1) //60fps change: once, when the count reaches it
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
  //else if muffinSeqTime>=2 and muffinSeqTime<=249
  else if muffinSeqTime>1 and muffinSeqTime<=249 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    var muffinAng;
    muffinAng=0

    if muffinSeqTime<=80 //separate muffins
      //muffinDist+=1.1
      muffinDist+=1.1*gDeltaTime //60fps change: per 30fps tick
    //else if muffinSeqTime>=111 and muffinSeqTime<=154 //move muffins origin
    else if muffinSeqTime>110 and muffinSeqTime<=154 //move muffins origin //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //if muffinSeqTime<115
      if muffinSeqTime<=114 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
        //muffinX-=1
        muffinX-=gDeltaTime //60fps change: counts 30fps ticks
      //muffinY-=1
      muffinY-=gDeltaTime //60fps change: counts 30fps ticks
    }
    //else if muffinSeqTime>=170 and muffinSeqTime<=248 //bring muffins back in
    else if muffinSeqTime>169 and muffinSeqTime<=248 //bring muffins back in //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //muffinDist-=1.1
      muffinDist-=1.1*gDeltaTime //60fps change: per 30fps tick

    //muffinDir+=muffinSpd
    muffinDir+=muffinSpd*gDeltaTime //60fps change: per 30fps tick
    for(i=0;i<12;i+=1) //circle muffins
    {
      muffin[i].x=muffinX+lengthdir_x(muffinDist,muffinAng+muffinDir)
      muffin[i].y=muffinY+lengthdir_y(muffinDist,muffinAng+muffinDir)
      muffinAng+=360/12
    }
  }
  //else if muffinSeqTime=250 //remove muffins
  else if scrCountPass(muffinSeqTime,250) //remove muffins //60fps change: once, when the count reaches it
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

  //if muffinSeqTime=110 //character animation sequence
  if scrCountPass(muffinSeqTime,110) //character animation sequence //60fps change: once, when the count reaches it
  {
    oPlayer1.sprite_index=sPlayerIdle
    oPlayer1.image_speed=0.1
  }
  //else if muffinSeqTime=160
  else if scrCountPass(muffinSeqTime,160) //60fps change: once, when the count reaches it
    oPlayer1.sprite_index=sPlayerArmUp
  //else if muffinSeqTime=170
  else if scrCountPass(muffinSeqTime,170) //60fps change: once, when the count reaches it
  {
    oPlayer1.image_speed=0
    oPlayer1.image_index=0
    oPlayer1.sprite_index=sPlayerMuffinGet
  }
  //else if muffinSeqTime=180
  else if scrCountPass(muffinSeqTime,180) //60fps change: once, when the count reaches it
  {
    oPlayer1.image_index=1
    flashScreen=instance_create(0,0,oScreenFlash)
    flashScreen.image_alpha=0.7
    flashScreen.image_blend=c_yellow
    flashScreen.fadeSpeed=0.1
  }

  //if muffinSeqTime>=171 and muffinSeqTime<=247 //muffin size change
  if muffinSeqTime>170 and muffinSeqTime<=247 //muffin size change //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    for(i=0;i<12;i+=1)
    {
      //muffin[i].image_xscale-=0.012
      muffin[i].image_xscale-=0.012*gDeltaTime //60fps change: per 30fps tick
      //muffin[i].image_yscale-=0.012
      muffin[i].image_yscale-=0.012*gDeltaTime //60fps change: per 30fps tick
      //muffin[i].glowSize-=0.55
      muffin[i].glowSize-=0.55*gDeltaTime //60fps change: per 30fps tick
    }
  }

  if muffinSeqTime>=171 and muffinSeqTime<=220 //muffin saturation change
  {
    valueSat=5.1
    for(i=0;i<12;i+=1)
      muffin[i].image_blend=make_color_hsv(255,valueSat,255)
  }

  //if muffinSeqTime>=151 and muffinSeqTime<=240 //muffin speed change
  if muffinSeqTime>150 and muffinSeqTime<=240 //muffin speed change //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //muffinSpd+=0.1
    muffinSpd+=0.1*gDeltaTime //60fps change: per 30fps tick
}
