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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
    sceneDelay+=1
    if sceneDelay=15
    {
      msgCreate("Awkward.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      oPlayer1.x+=1
    if view_xview[0]<480
      view_xview[0]+=8
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
      oPlayer1.y+=12
    else
    {
      sceneDelay+=1
      if sceneDelay=1
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=336
      }
      else if sceneDelay=15
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
    sceneDelay+=1
    if sceneDelay=1
    {
      newMiniboss=instance_create(912,-12,oNapalmMan)
      newMiniboss.bActive=true
      newMiniboss.image_xscale=-1
    }
    newMiniboss.y+=6
    if newMiniboss.y>=336
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=10
      newMiniboss.sprite_index=sNapalmManShootDiagonal
    else if sceneDelay=20
      newMiniboss.sprite_index=sNapalmManIdle
    else if sceneDelay=30
      newMiniboss.sprite_index=sNapalmManShootStraight
    else if sceneDelay=40
      newMiniboss.sprite_index=sNapalmManIdle
    else if sceneDelay=50
    {
      newMiniboss2=instance_create(736,-12,oNapalmMan)
      newMiniboss2.bActive=true
      newMiniboss2.image_xscale=-1
    }
    else if sceneDelay>=51
    {
      newMiniboss2.y+=12
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
    sceneDelay+=1
    if sceneDelay=90
    {
      msgCreate("Anything going to happen?",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=150
    {
      msgCreate("Yes, I was just messing with you.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=210
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    else if sceneDelay=2
      discomFrame=0
    else if sceneDelay>=3
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
        discombobulateY-=16
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
    sceneDelay+=1
    if sceneDelay=15
    {
      msgCreate("Ass kicking time!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      oPlayer1.x+=1
    if view_xview[0]<480
      view_xview[0]+=8
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
      oPlayer1.y+=12
    else
    {
      sceneDelay+=1
      if sceneDelay=1
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=320
      }
      else if sceneDelay=15
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
    sceneDelay+=1
    if sceneDelay=1
    {
      newMiniboss=instance_create(880,-12,oGyroMan)
      newMiniboss.bActive=true
      newMiniboss.sprite_index=sGyroManJump
      newMiniboss.image_xscale=-1
    }
    newMiniboss.y+=6
    if newMiniboss.y>=320
    {
      newMiniboss.sprite_index=sGyroManIdle
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=10
      newMiniboss.sprite_index=sGyroManProp
    else if sceneDelay=30
      newMiniboss.sprite_index=sGyroManIdle
    else if sceneDelay=40
      newMiniboss.sprite_index=sGyroManProp
    else if sceneDelay=60
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
    sceneDelay+=1
    if oPlayer1.tookHitAmount>=5
    {
      if sceneDelay=90
      {
        msgCreate("Nothing to worry about he says.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      else if sceneDelay=150
      {
        msgCreate("You just suck.",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=60
      }
    }
    else
    {
      if sceneDelay=90
      {
        msgCreate("Yeah, that was pretty easy.",0,oMessagePerson,global.mainCharacters[0],0,1)
        newMessage.fadingTime=60
      }
      else if sceneDelay=150
      {
        msgCreate("What did I tell you?",0,oMessagePerson,global.mainCharacters[1],1,1)
        newMessage.fadingTime=60
      }
    }

    if sceneDelay=210
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    else if sceneDelay=2
      discomFrame=0
    else if sceneDelay>=3
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
        discombobulateY-=16
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
    sceneDelay+=1
    if sceneDelay=15
    {
      msgCreate("And here we go!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<528
      oPlayer1.x+=1
    if view_xview[0]<480
      view_xview[0]+=8
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
      oPlayer1.y+=12
    else
    {
      sceneDelay+=1
      if sceneDelay=1
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=320
      }
      else if sceneDelay=15
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
    sceneDelay+=1
    if sceneDelay=1
    {
      newMiniboss=instance_create(880,-12,oDiveMan)
      newMiniboss.bActive=true
      newMiniboss.image_xscale=-1
    }
    newMiniboss.y+=6
    if newMiniboss.y>=320
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6
  {
    sceneDelay+=1
    if sceneDelay=1
      image_speed=0
    else if sceneDelay=20
      newMiniboss.sprite_index=sDiveManShoot
    else if sceneDelay=30
      newMiniboss.image_index=1
    else if sceneDelay=40
      newMiniboss.image_index=0
    else if sceneDelay=70
      newMiniboss.sprite_index=sDiveManIdle
    else if sceneDelay=80
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
    sceneDelay+=1
    if sceneDelay=90
    {
      msgCreate("Beam me up!",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=150
    {
      msgCreate("Ugh, lame.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=210
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    else if sceneDelay=2
      discomFrame=0
    else if sceneDelay>=3
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
        discombobulateY-=16
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
    sceneDelay+=1
    if sceneDelay=15
    {
      msgCreate("Something isn't right.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    if oPlayer1.x<608
      oPlayer1.x+=2
    if view_xview[0]<480
      view_xview[0]+=8
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
    sceneDelay+=1
    if sceneDelay mod 4=0
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
      oPlayer1.y+=12
    else
    {
      sceneDelay+=1
      if sceneDelay=1
      {
        oPlayer1.sprite_index=sPlayerIdle
        oPlayer1.y=240
      }
      else if sceneDelay=15
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
    sceneDelay+=1
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
    sceneDelay+=1
    if sceneDelay=30
    {
      spikeLeft[6].moving=true; spikeLeft[10].moving=true
    }
    else if sceneDelay=60
    {
      spikeTop[8].moving=true; spikeTop[9].moving=true; spikeTop[16].moving=true; spikeTop[17].moving=true
    }
    else if sceneDelay=90
      spikeRight[10].moving=true
    else if sceneDelay=95
      spikeRight[9].moving=true
    else if sceneDelay=100
      spikeRight[6].moving=true
    else if sceneDelay=105
      spikeRight[7].moving=true
    else if sceneDelay=110
      spikeLeft[0].moving=true
    else if sceneDelay=115
      spikeRight[0].moving=true
    else if sceneDelay=120
      spikeLeft[1].moving=true
    else if sceneDelay=125
      spikeRight[1].moving=true
    else if sceneDelay=130
    {
      spikeLeft[11].moving=true; spikeRight[11].moving=true
    }
    else if sceneDelay=140
      spikeBottom[4].moving=true
    else if sceneDelay=145
      spikeBottom[5].moving=true
    else if sceneDelay=150
      spikeBottom[21].moving=true
    else if sceneDelay=155
      spikeBottom[20].moving=true
    else if sceneDelay=165
    {
      spikeTop[11].moving=true; spikeTop[14].moving=true
    }
    else if sceneDelay=175
    {
      spikeTop[12].moving=true; spikeTop[13].moving=true
    }
    else if sceneDelay=185
    {
      spikeLeft[2].moving=true; spikeRight[2].moving=true
    }
    else if sceneDelay=195
    {
      spikeLeft[3].moving=true; spikeRight[3].moving=true
    }
    else if sceneDelay=205
    {
      spikeTop[0].moving=true; spikeTop[1].moving=true; spikeTop[2].moving=true; spikeTop[3].moving=true
    }
    else if sceneDelay=210
      spikeTop[25].moving=true
    else if sceneDelay=215
      spikeTop[24].moving=true
    else if sceneDelay=220
      spikeTop[23].moving=true
    else if sceneDelay=225
      spikeTop[22].moving=true
    else if sceneDelay=230
      spikeBottom[2].moving=true
    else if sceneDelay=235
      spikeBottom[3].moving=true
    else if sceneDelay=240
      spikeTop[4].moving=true
    else if sceneDelay=245
      spikeTop[5].moving=true
    else if sceneDelay=250
      spikeBottom[23].moving=true
    else if sceneDelay=255
      spikeBottom[22].moving=true
    else if sceneDelay=260
      spikeTop[21].moving=true
    else if sceneDelay=265
      spikeTop[20].moving=true
    else if sceneDelay=270
      spikeBottom[19].moving=true
    else if sceneDelay=275
      spikeBottom[18].moving=true
    else if sceneDelay=290
    {
      spikeBottom[10].moving=true; spikeBottom[15].moving=true
    }
    else if sceneDelay=295
    {
      spikeBottom[11].moving=true; spikeBottom[14].moving=true
    }
    else if sceneDelay=300
    {
      spikeBottom[12].moving=true; spikeBottom[13].moving=true
    }
    else if sceneDelay=310
      spikeLeft[9].moving=true
    else if sceneDelay=315
      spikeRight[8].moving=true
    else if sceneDelay=320
      spikeLeft[7].moving=true
    else if sceneDelay=330
    {
      spikeTop[10].moving=true; spikeTop[15].moving=true
    }
    else if sceneDelay=340
      spikeLeft[8].moving=true
    else if sceneDelay=350
    {
      spikeLeft[4].moving=true; spikeLeft[5].moving=true; spikeRight[4].moving=true; spikeRight[5].moving=true
    }
    else if sceneDelay=360
    {
      spikeTop[6].moving=true; spikeTop[7].moving=true; spikeBottom[6].moving=true; spikeBottom[7].moving=true
    }
    else if sceneDelay=370
    {
      spikeTop[18].moving=true; spikeTop[19].moving=true
    }
    else if sceneDelay=400
    {
      spikeLeft[12].moving=true; spikeLeft[13].moving=true; spikeLeft[14].moving=true; spikeLeft[15].moving=true
    }
    else if sceneDelay=405
    {
      spikeRight[12].moving=true; spikeRight[13].moving=true; spikeRight[14].moving=true; spikeRight[15].moving=true
    }
    else if sceneDelay=410
    {
      spikeBottom[8].moving=true; spikeBottom[9].moving=true ;spikeBottom[16].moving=true; spikeBottom[17].moving=true
    }
    else if sceneDelay=415
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
    sceneDelay+=1
    if sceneDelay=90
    {
      msgCreate("That was stressful.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=150
    {
      msgCreate("Again, funny from my point of view.",0,oMessagePerson,global.mainCharacters[1],1,1)
      newMessage.fadingTime=60
    }
    else if sceneDelay=210
    {
      global.gamePaused=true
      stopPlayer()
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=10
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      discombobulateY=oPlayer1.y
      discomFrame=1
      oPlayer1.visible=false
      oPlayer1.image_speed=0.1
    }
    else if sceneDelay=2
      discomFrame=0
    else if sceneDelay>=3
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
        discombobulateY-=16
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
