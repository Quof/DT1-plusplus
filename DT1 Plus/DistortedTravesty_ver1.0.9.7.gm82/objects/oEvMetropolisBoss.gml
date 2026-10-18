#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sceneProgress=0
sceneDelay=0

if room=rNapalmL5 and global.MMnapalmProg<6
{
  indexCheck=0
  var yPos;
  yPos=160
  for(i=0;i<4;i+=1)
  {
    collisionBlock[i]=instance_create(496,yPos,oInvisibleSolid)
    bossDoor[i]=tile_add(tileMMnapalm,0,144,16,16,496,yPos,100000)
    yPos+=16
  }
}
else if room=rNapalmL5 and global.MMnapalmProg>=6
{
  view_object[0]=oPlayer1
  newExit=instance_create(736,304,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}

if room=rGyroL5 and global.MMgyroProg<6
{
  indexCheck=0
  var yPos;
  yPos=256
  for(i=0;i<4;i+=1)
  {
    collisionBlock[i]=instance_create(496,yPos,oInvisibleSolid)
    bossDoor[i]=tile_add(tileMMgyro,48,208,16,16,496,yPos,100000)
    yPos+=16
  }
}
else if room=rGyroL5 and global.MMgyroProg>=6
{
  view_object[0]=oPlayer1
  newExit=instance_create(736,288,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}

if room=rDiveL4 and global.MMdiveProg<6
{
  indexCheck=0
  var yPos;
  yPos=256
  for(i=0;i<4;i+=1)
  {
    collisionBlock[i]=instance_create(496,yPos,oInvisibleSolid)
    bossDoor[i]=tile_add(tileMMcentaur,32,272,16,16,496,yPos,100000)
    yPos+=16
  }
}
else if room=rDiveL4 and global.MMdiveProg>=6
{
  view_object[0]=oPlayer1
  newExit=instance_create(736,288,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}

if room=rMysteryL4 and global.MMmysteryProg<6
{
  indexCheck=0
  var yPos;
  yPos=160
  for(i=0;i<4;i+=1)
  {
    collisionBlock[i]=instance_create(496,yPos,oInvisibleSolid)
    bossDoor[i]=tile_add(tileMMbright,32,160,16,16,496,yPos,100000)
    yPos+=16
  }
  //spiked wall man
  var xPos,yPos;
  xPos=528
  yPos=64
  for(i=0;i<26;i+=1)
  {
    spikeTop[i]=instance_create(xPos,48,oSpikedWallMan)
    spikeTop[i].type=0
    spikeBottom[i]=instance_create(xPos,320,oSpikedWallMan)
    spikeBottom[i].type=1
    xPos+=16
  }
  for(i=0;i<16;i+=1)
  {
    spikeLeft[i]=instance_create(512,yPos,oSpikedWallMan)
    spikeLeft[i].type=2
    spikeRight[i]=instance_create(944,yPos,oSpikedWallMan)
    spikeRight[i].type=3
    yPos+=16
  }
  instance_deactivate_object(spikeLeft[5])
  instance_deactivate_object(spikeLeft[6])
  instance_deactivate_object(spikeLeft[7])
  instance_deactivate_object(spikeLeft[8])
  instance_deactivate_object(spikeLeft[9])
  instance_deactivate_object(spikeLeft[10])
}
else if room=rMysteryL4 and global.MMmysteryProg>=6
{
  view_object[0]=oPlayer1
  newExit=instance_create(736,304,oExit)
  newExit.sprite_index=sMapDoor
  newExit.bShowArrow=true
  newExit.exitType=0
  newExit.newMapX=0
  newExit.newMapY=0
  newExit.newTrans=21
  newExit.toRoom=rMetropolisStageSelect
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// -------------------- NAPALM MAN --------------------
if room=rNapalmL5 and global.MMnapalmProg<6
{
  if sceneProgress=0
  {
    if oPlayer1.x>=484
    {
      global.gamePaused=true
      indexCheck=3
      stopPlayer()
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],0)
      indexCheck-=1
      if indexCheck<0
      {
        oPlayer1.sprite_index=sPlayerJump
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
    {
      msgCreate("Awkward.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      //oPlayer1.x+=1
      oPlayer1.x+=gDeltaTime //60fps change: per 30fps tick
    if view_xview[0]<480
      //view_xview[0]+=8
      view_xview[0]+=8*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.x>=528 and view_xview[0]>=480
    {
      if sceneDelay>=80
      {
        indexCheck=0
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],1)
      indexCheck+=1
      if indexCheck>3
      {
        stopAllMusic()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    if oPlayer1.y<336
      //oPlayer1.y+=12
      oPlayer1.y+=12*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=336
      }
      //else if sceneDelay=15
      else if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      {
        var tempMplay;
        tempMplay=global.msc_MMrobotMaster
        playMusic(tempMplay,0)
      }
      else if sceneDelay>=45
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    //if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    //60fps change: the step's setup runs on its first frame, as 30fps runs it on its first step. Counted to 1 it came
    //half a tick late at 60fps (3/4 at 120), after the drop below had already moved newMiniboss on the first frame (a
    //GM error: it's only set here). The same for Gyro Man's and Dive Man's drops below
    if scrCountPass(sceneDelay,gDeltaTime) //60fps change: see above
    {
      newMiniboss=instance_create(912,-12,oNapalmMan)
      newMiniboss.bActive=true
      newMiniboss.image_xscale=-1
    }
    //newMiniboss.y+=6
    newMiniboss.y+=6*gDeltaTime //60fps change: per 30fps tick
    if newMiniboss.y>=336
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sNapalmManShootDiagonal
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sNapalmManIdle
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sNapalmManShootStraight
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sNapalmManIdle
    //else if sceneDelay=50
    else if scrCountPass(sceneDelay,50) //60fps change: once, when the count reaches it
    {
      newMiniboss2=instance_create(736,-12,oNapalmMan)
      newMiniboss2.bActive=true
      newMiniboss2.image_xscale=-1
    }
    //else if sceneDelay>=51
    else if sceneDelay>50 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //newMiniboss2.y+=12
      newMiniboss2.y+=12*gDeltaTime //60fps change: per 30fps tick
      if newMiniboss2.y>=336
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=7
  {
    msgCreate("Because that's definately fair.",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=60
    oPlayer1.raveTime=0
    sceneProgress=8
    global.gamePaused=false
  }
  else if sceneProgress=8 //win condition
  {
    global.p1RaveEnergy=oPlayer1.raveMax-500
    if !instance_exists(oNapalmMan)
    {
      stopAllMusic()
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=90
    if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
    {
      msgCreate("Anything going to happen?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=150
    else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
    {
      msgCreate("Yes, I was just messing with you.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=210
    else if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    //else if sceneDelay=2
    else if scrCountPass(sceneDelay,2) //60fps change: once, when the count reaches it
      discomFrame=0
    //else if sceneDelay>=3
    else if sceneDelay>2 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if discombobulateY<-16
      {
        if sceneDelay>=3
        {
          sceneDelay=0
          sceneProgress+=1
        }
      }
      else
        //discombobulateY-=16
        discombobulateY-=16*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if sceneProgress=11
  {
    global.newMapX=16
    global.newMapY=-32
    global.MMnapalmProg=6
    room_goto(rMetropolisGetWeapon)
  }
}
// -------------------- GYRO MAN --------------------
if room=rGyroL5 and global.MMgyroProg<5
{
  if sceneProgress=0
  {
    if oPlayer1.x>=484
    {
      global.gamePaused=true
      indexCheck=3
      stopPlayer()
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],0)
      indexCheck-=1
      if indexCheck<0
      {
        oPlayer1.sprite_index=sPlayerJump
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
    {
      msgCreate("Ass kicking time!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      //oPlayer1.x+=1
      oPlayer1.x+=gDeltaTime //60fps change: per 30fps tick
    if view_xview[0]<480
      //view_xview[0]+=8
      view_xview[0]+=8*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.x>=528 and view_xview[0]>=480
    {
      if sceneDelay>=80
      {
        indexCheck=0
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],1)
      indexCheck+=1
      if indexCheck>3
      {
        stopAllMusic()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    if oPlayer1.y<320
      //oPlayer1.y+=12
      oPlayer1.y+=12*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=320
      }
      //else if sceneDelay=15
      else if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      {
        var tempMplay;
        tempMplay=global.msc_MMrobotMaster
        playMusic(tempMplay,0)
      }
      else if sceneDelay>=45
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    //if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    if scrCountPass(sceneDelay,gDeltaTime) //60fps change: on the step's first frame, before the drop below moves newMiniboss (see Napalm Man's drop)
    {
      newMiniboss=instance_create(880,-12,oGyroMan)
      newMiniboss.bActive=true
      newMiniboss.sprite_index=sGyroManJump
      newMiniboss.image_xscale=-1
    }
    //newMiniboss.y+=6
    newMiniboss.y+=6*gDeltaTime //60fps change: per 30fps tick
    if newMiniboss.y>=320
    {
      newMiniboss.sprite_index=sGyroManIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sGyroManProp
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sGyroManIdle
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sGyroManProp
    //else if sceneDelay=60
    else if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sGyroManIdle
    else if sceneDelay>=80
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7
  {
    msgCreate("Nothing to worry about here.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=60
    oPlayer1.raveTime=0
    sceneProgress=8
    global.gamePaused=false
  }
  else if sceneProgress=8 //win condition
  {
    global.p1RaveEnergy=oPlayer1.raveMax-500
    if !instance_exists(oGyroMan)
    {
      stopAllMusic()
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if oPlayer1.tookHitAmount>=5
    {
      //if sceneDelay=90
      if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
      {
        msgCreate("Nothing to worry about he says.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      //else if sceneDelay=150
      else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
      {
        msgCreate("You just suck.",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=60
      }
    }
    else
    {
      //if sceneDelay=90
      if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
      {
        msgCreate("Yeah, that was pretty easy.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      //else if sceneDelay=150
      else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
      {
        msgCreate("What did I tell you?",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=60
      }
    }

    //if sceneDelay=210
    if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    //else if sceneDelay=2
    else if scrCountPass(sceneDelay,2) //60fps change: once, when the count reaches it
      discomFrame=0
    //else if sceneDelay>=3
    else if sceneDelay>2 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if discombobulateY<-16
      {
        if sceneDelay>=3
        {
          sceneDelay=0
          sceneProgress+=1
        }
      }
      else
        //discombobulateY-=16
        discombobulateY-=16*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if sceneProgress=11
  {
    global.newMapX=32
    global.newMapY=-32
    global.MMgyroProg=6
    room_goto(rMetropolisGetWeapon)
  }
}
// -------------------- DIVE MAN --------------------
if room=rDiveL4 and global.MMdiveProg<4
{
  if sceneProgress=0
  {
    if oPlayer1.x>=484
    {
      global.gamePaused=true
      indexCheck=3
      stopPlayer()
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],0)
      indexCheck-=1
      if indexCheck<0
      {
        oPlayer1.sprite_index=sPlayerJump
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
    {
      msgCreate("And here we go!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      //oPlayer1.x+=1
      oPlayer1.x+=gDeltaTime //60fps change: per 30fps tick
    if view_xview[0]<480
      //view_xview[0]+=8
      view_xview[0]+=8*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.x>=528 and view_xview[0]>=480
    {
      if sceneDelay>=80
      {
        indexCheck=0
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],1)
      indexCheck+=1
      if indexCheck>3
      {
        stopAllMusic()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    if oPlayer1.y<320
      //oPlayer1.y+=12
      oPlayer1.y+=12*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=320
      }
      //else if sceneDelay=15
      else if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      {
        var tempMplay;
        tempMplay=global.msc_MMrobotMaster
        playMusic(tempMplay,0)
      }
      else if sceneDelay>=45
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    //if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    if scrCountPass(sceneDelay,gDeltaTime) //60fps change: on the step's first frame, before the drop below moves newMiniboss (see Napalm Man's drop)
    {
      newMiniboss=instance_create(880,-12,oDiveMan)
      newMiniboss.bActive=true
      newMiniboss.image_xscale=-1
    }
    //newMiniboss.y+=6
    newMiniboss.y+=6*gDeltaTime //60fps change: per 30fps tick
    if newMiniboss.y>=320
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      image_speed=0
    //else if sceneDelay=20
    else if scrCountPass(sceneDelay,20) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sDiveManShoot
    //else if sceneDelay=30
    else if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      newMiniboss.image_index=1
    //else if sceneDelay=40
    else if scrCountPass(sceneDelay,40) //60fps change: once, when the count reaches it
      newMiniboss.image_index=0
    //else if sceneDelay=70
    else if scrCountPass(sceneDelay,70) //60fps change: once, when the count reaches it
      newMiniboss.sprite_index=sDiveManIdle
    //else if sceneDelay=80
    else if scrCountPass(sceneDelay,80) //60fps change: once, when the count reaches it
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7
  {
    msgCreate("Watch the ceiling.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=60
    oPlayer1.raveTime=0
    sceneProgress=8
    global.gamePaused=false
  }
  else if sceneProgress=8 //win condition
  {
    global.p1RaveEnergy=oPlayer1.raveMax-500
    if !instance_exists(oDiveMan)
    {
      with oSubMissile
        instance_destroy()
      stopAllMusic()
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=90
    if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
    {
      msgCreate("Beam me up!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=150
    else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
    {
      msgCreate("Ugh, lame.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=210
    else if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    //else if sceneDelay=2
    else if scrCountPass(sceneDelay,2) //60fps change: once, when the count reaches it
      discomFrame=0
    //else if sceneDelay>=3
    else if sceneDelay>2 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if discombobulateY<-16
      {
        if sceneDelay>=3
        {
          sceneDelay=0
          sceneProgress+=1
        }
      }
      else
        //discombobulateY-=16
        discombobulateY-=16*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if sceneProgress=11
  {
    global.newMapX=64
    global.newMapY=-32
    global.MMdiveProg=6
    room_goto(rMetropolisGetWeapon)
  }
}
// -------------------- MYSTERY MAN --------------------
if room=rMysteryL4 and global.MMmysteryProg<5
{
  if sceneProgress=0
  {
    if oPlayer1.x>=484
    {
      global.gamePaused=true
      indexCheck=3
      stopPlayer()
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],0)
      indexCheck-=1
      if indexCheck<0
      {
        oPlayer1.sprite_index=sPlayerJump
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=15
    if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
    {
      msgCreate("Something isn't right.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<608
      //oPlayer1.x+=2
      oPlayer1.x+=2*gDeltaTime //60fps change: per 30fps tick
    if view_xview[0]<480
      //view_xview[0]+=8
      view_xview[0]+=8*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.x>=608 and view_xview[0]>=480
    {
      if sceneDelay>=80
      {
        indexCheck=0
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay mod 4=0
    if scrModPass(sceneDelay,4) //60fps change: once each time the count reaches a multiple of it
    {
      tile_set_alpha(bossDoor[indexCheck],1)
      indexCheck+=1
      if indexCheck>3
      {
        instance_activate_object(spikeLeft[5])
        instance_activate_object(spikeLeft[6])
        instance_activate_object(spikeLeft[7])
        instance_activate_object(spikeLeft[8])
        instance_activate_object(spikeLeft[9])
        instance_activate_object(spikeLeft[10])
        stopAllMusic()
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=4
  {
    if oPlayer1.y<240
      //oPlayer1.y+=12
      oPlayer1.y+=12*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=240
      }
      //else if sceneDelay=15
      else if scrCountPass(sceneDelay,15) //60fps change: once, when the count reaches it
      {
        var tempMplay;
        tempMplay=global.msc_MMrobotMaster
        playMusic(tempMplay,0)
      }
      else if sceneDelay>=45
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    msgCreate("Just dodge them!",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=60
    oPlayer1.raveTime=0
    sceneProgress=7
    global.gamePaused=false
  }
  else if sceneProgress=7 and global.gamePaused=false //battle
  {
    global.p1RaveEnergy=oPlayer1.raveMax-500
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
    {
      spikeLeft[6].moving=true; spikeLeft[10].moving=true
    }
    //else if sceneDelay=60
    else if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
    {
      spikeTop[8].moving=true; spikeTop[9].moving=true; spikeTop[16].moving=true; spikeTop[17].moving=true
    }
    //else if sceneDelay=90
    else if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
      spikeRight[10].moving=true
    //else if sceneDelay=95
    else if scrCountPass(sceneDelay,95) //60fps change: once, when the count reaches it
      spikeRight[9].moving=true
    //else if sceneDelay=100
    else if scrCountPass(sceneDelay,100) //60fps change: once, when the count reaches it
      spikeRight[6].moving=true
    //else if sceneDelay=105
    else if scrCountPass(sceneDelay,105) //60fps change: once, when the count reaches it
      spikeRight[7].moving=true
    //else if sceneDelay=110
    else if scrCountPass(sceneDelay,110) //60fps change: once, when the count reaches it
      spikeLeft[0].moving=true
    //else if sceneDelay=115
    else if scrCountPass(sceneDelay,115) //60fps change: once, when the count reaches it
      spikeRight[0].moving=true
    //else if sceneDelay=120
    else if scrCountPass(sceneDelay,120) //60fps change: once, when the count reaches it
      spikeLeft[1].moving=true
    //else if sceneDelay=125
    else if scrCountPass(sceneDelay,125) //60fps change: once, when the count reaches it
      spikeRight[1].moving=true
    //else if sceneDelay=130
    else if scrCountPass(sceneDelay,130) //60fps change: once, when the count reaches it
    {
      spikeLeft[11].moving=true; spikeRight[11].moving=true
    }
    //else if sceneDelay=140
    else if scrCountPass(sceneDelay,140) //60fps change: once, when the count reaches it
      spikeBottom[4].moving=true
    //else if sceneDelay=145
    else if scrCountPass(sceneDelay,145) //60fps change: once, when the count reaches it
      spikeBottom[5].moving=true
    //else if sceneDelay=150
    else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
      spikeBottom[21].moving=true
    //else if sceneDelay=155
    else if scrCountPass(sceneDelay,155) //60fps change: once, when the count reaches it
      spikeBottom[20].moving=true
    //else if sceneDelay=165
    else if scrCountPass(sceneDelay,165) //60fps change: once, when the count reaches it
    {
      spikeTop[11].moving=true; spikeTop[14].moving=true
    }
    //else if sceneDelay=175
    else if scrCountPass(sceneDelay,175) //60fps change: once, when the count reaches it
    {
      spikeTop[12].moving=true; spikeTop[13].moving=true
    }
    //else if sceneDelay=185
    else if scrCountPass(sceneDelay,185) //60fps change: once, when the count reaches it
    {
      spikeLeft[2].moving=true; spikeRight[2].moving=true
    }
    //else if sceneDelay=195
    else if scrCountPass(sceneDelay,195) //60fps change: once, when the count reaches it
    {
      spikeLeft[3].moving=true; spikeRight[3].moving=true
    }
    //else if sceneDelay=205
    else if scrCountPass(sceneDelay,205) //60fps change: once, when the count reaches it
    {
      spikeTop[0].moving=true; spikeTop[1].moving=true; spikeTop[2].moving=true; spikeTop[3].moving=true
    }
    //else if sceneDelay=210
    else if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
      spikeTop[25].moving=true
    //else if sceneDelay=215
    else if scrCountPass(sceneDelay,215) //60fps change: once, when the count reaches it
      spikeTop[24].moving=true
    //else if sceneDelay=220
    else if scrCountPass(sceneDelay,220) //60fps change: once, when the count reaches it
      spikeTop[23].moving=true
    //else if sceneDelay=225
    else if scrCountPass(sceneDelay,225) //60fps change: once, when the count reaches it
      spikeTop[22].moving=true
    //else if sceneDelay=230
    else if scrCountPass(sceneDelay,230) //60fps change: once, when the count reaches it
      spikeBottom[2].moving=true
    //else if sceneDelay=235
    else if scrCountPass(sceneDelay,235) //60fps change: once, when the count reaches it
      spikeBottom[3].moving=true
    //else if sceneDelay=240
    else if scrCountPass(sceneDelay,240) //60fps change: once, when the count reaches it
      spikeTop[4].moving=true
    //else if sceneDelay=245
    else if scrCountPass(sceneDelay,245) //60fps change: once, when the count reaches it
      spikeTop[5].moving=true
    //else if sceneDelay=250
    else if scrCountPass(sceneDelay,250) //60fps change: once, when the count reaches it
      spikeBottom[23].moving=true
    //else if sceneDelay=255
    else if scrCountPass(sceneDelay,255) //60fps change: once, when the count reaches it
      spikeBottom[22].moving=true
    //else if sceneDelay=260
    else if scrCountPass(sceneDelay,260) //60fps change: once, when the count reaches it
      spikeTop[21].moving=true
    //else if sceneDelay=265
    else if scrCountPass(sceneDelay,265) //60fps change: once, when the count reaches it
      spikeTop[20].moving=true
    //else if sceneDelay=270
    else if scrCountPass(sceneDelay,270) //60fps change: once, when the count reaches it
      spikeBottom[19].moving=true
    //else if sceneDelay=275
    else if scrCountPass(sceneDelay,275) //60fps change: once, when the count reaches it
      spikeBottom[18].moving=true
    //else if sceneDelay=290
    else if scrCountPass(sceneDelay,290) //60fps change: once, when the count reaches it
    {
      spikeBottom[10].moving=true; spikeBottom[15].moving=true
    }
    //else if sceneDelay=295
    else if scrCountPass(sceneDelay,295) //60fps change: once, when the count reaches it
    {
      spikeBottom[11].moving=true; spikeBottom[14].moving=true
    }
    //else if sceneDelay=300
    else if scrCountPass(sceneDelay,300) //60fps change: once, when the count reaches it
    {
      spikeBottom[12].moving=true; spikeBottom[13].moving=true
    }
    //else if sceneDelay=310
    else if scrCountPass(sceneDelay,310) //60fps change: once, when the count reaches it
      spikeLeft[9].moving=true
    //else if sceneDelay=315
    else if scrCountPass(sceneDelay,315) //60fps change: once, when the count reaches it
      spikeRight[8].moving=true
    //else if sceneDelay=320
    else if scrCountPass(sceneDelay,320) //60fps change: once, when the count reaches it
      spikeLeft[7].moving=true
    //else if sceneDelay=330
    else if scrCountPass(sceneDelay,330) //60fps change: once, when the count reaches it
    {
      spikeTop[10].moving=true; spikeTop[15].moving=true
    }
    //else if sceneDelay=340
    else if scrCountPass(sceneDelay,340) //60fps change: once, when the count reaches it
      spikeLeft[8].moving=true
    //else if sceneDelay=350
    else if scrCountPass(sceneDelay,350) //60fps change: once, when the count reaches it
    {
      spikeLeft[4].moving=true; spikeLeft[5].moving=true; spikeRight[4].moving=true; spikeRight[5].moving=true
    }
    //else if sceneDelay=360
    else if scrCountPass(sceneDelay,360) //60fps change: once, when the count reaches it
    {
      spikeTop[6].moving=true; spikeTop[7].moving=true; spikeBottom[6].moving=true; spikeBottom[7].moving=true
    }
    //else if sceneDelay=370
    else if scrCountPass(sceneDelay,370) //60fps change: once, when the count reaches it
    {
      spikeTop[18].moving=true; spikeTop[19].moving=true
    }
    //else if sceneDelay=400
    else if scrCountPass(sceneDelay,400) //60fps change: once, when the count reaches it
    {
      spikeLeft[12].moving=true; spikeLeft[13].moving=true; spikeLeft[14].moving=true; spikeLeft[15].moving=true
    }
    //else if sceneDelay=405
    else if scrCountPass(sceneDelay,405) //60fps change: once, when the count reaches it
    {
      spikeRight[12].moving=true; spikeRight[13].moving=true; spikeRight[14].moving=true; spikeRight[15].moving=true
    }
    //else if sceneDelay=410
    else if scrCountPass(sceneDelay,410) //60fps change: once, when the count reaches it
    {
      spikeBottom[8].moving=true; spikeBottom[9].moving=true ;spikeBottom[16].moving=true; spikeBottom[17].moving=true
    }
    //else if sceneDelay=415
    else if scrCountPass(sceneDelay,415) //60fps change: once, when the count reaches it
    {
      spikeBottom[0].moving=true; spikeBottom[1].moving=true ;spikeBottom[24].moving=true; spikeBottom[25].moving=true
      sceneProgress=8
    }
  }
  else if sceneProgress=8 //win condition
  {
    if !instance_exists(oSpikedWallMan)
    {
      var expWorth;
      expWorth=10000
      oPlayer1.expTotal+=round(expWorth)
      oPlayer1.expCurrent+=round(expWorth)
      if global.optShowExpEarned=true
      {
        newAward=instance_create(oPlayer1.x,oPlayer1.y-26,oKillAward)
        newAward.expValue=expWorth
      }
      stopAllMusic()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=90
    if scrCountPass(sceneDelay,90) //60fps change: once, when the count reaches it
    {
      msgCreate("That was stressful.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=150
    else if scrCountPass(sceneDelay,150) //60fps change: once, when the count reaches it
    {
      msgCreate("Again, funny from my point of view.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    //else if sceneDelay=210
    else if scrCountPass(sceneDelay,210) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    //else if sceneDelay=2
    else if scrCountPass(sceneDelay,2) //60fps change: once, when the count reaches it
      discomFrame=0
    //else if sceneDelay>=3
    else if sceneDelay>2 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      if discombobulateY<-16
      {
        if sceneDelay>=3
        {
          sceneDelay=0
          sceneProgress+=1
        }
      }
      else
        //discombobulateY-=16
        discombobulateY-=16*gDeltaTime //60fps change: per 30fps tick
    }
  }
  else if sceneProgress=11
  {
    global.newMapX=128
    global.newMapY=-32
    global.MMmysteryProg=6
    room_goto(rMetropolisGetWeapon)
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rMetropolisStageSelect
{
  if global.skillCapsules[46]=1 and global.skillCapsules[47]=1 and global.skillCapsules[58]=1
    draw_sprite(sAllItemIcon,-1,72,331)

  if global.MMnapalmProg<6
    draw_sprite(sNapalmManMug,-1,136,88)
  else
    draw_sprite_ext(sNapalmManMug,-1,136,88,1,1,1,c_white,0.3)

  if global.skillCapsules[48]=1 and global.skillCapsules[49]=1 and global.itemChest[22]=1 and global.heartPiece[26]=1 and global.spiritAuras[10]=1
    draw_sprite(sAllItemIcon,-1,152,104)

  if global.MMgyroProg<6
    draw_sprite(sGyroManMug,-1,376,88)
  else
    draw_sprite_ext(sGyroManMug,-1,376,88,1,1,1,c_white,0.3)

  if global.skillCapsules[50]=1 and global.skillCapsules[51]=1 and global.itemChest[23]=1 and global.heartPiece[27]=1
    draw_sprite(sAllItemIcon,-1,392,104)

  if global.MMdiveProg<6
    draw_sprite(sDiveManMug,-1,136,216)
  else
    draw_sprite_ext(sDiveManMug,-1,136,216,1,1,1,c_white,0.3)

  if global.skillCapsules[52]=1 and global.skillCapsules[53]=1 and global.heartPiece[29]=1
    draw_sprite(sAllItemIcon,-1,152,232)

  if global.MMmysteryProg<6
    draw_sprite(sMysteryMan,-1,376,216)
  else
    draw_sprite_ext(sMysteryMan,-1,376,216,1,1,1,c_white,0.3)

  if global.skillCapsules[54]=1 and global.skillCapsules[55]=1 and global.heartPiece[28]=1
    draw_sprite(sAllItemIcon,-1,392,232)

  draw_sprite(sMrXMug,-1,256,280)

  if global.skillCapsules[56]=1 and global.skillCapsules[57]=1 and global.itemChest[24]=1 and global.heartPiece[30]=1
    draw_sprite(sAllItemIcon,-1,272,296)
}
else if room=rNapalmL5
{
  draw_sprite(sNapalmManMug,-1,448,112)
  if sceneProgress=10 and sceneDelay>=1
    draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
}
else if room=rGyroL5
{
  draw_sprite(sGyroManMug,-1,464,160)
  if sceneProgress=10 and sceneDelay>=1
    draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
}
else if room=rDiveL4
{
  draw_sprite(sDiveManMug,-1,400,208)
  if sceneProgress=10 and sceneDelay>=1
    draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
}
else if room=rMysteryL4
{
  draw_sprite(sMysteryMan,-1,416,96)
  if sceneProgress=10 and sceneDelay>=1
    draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
}
else if room=rFortL1_4
  draw_sprite(sMrXMug,-1,1488,160)
else if room=rFortL1_5
  draw_sprite(sMrXMug,-1,720,160)
