#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=0
fadeColor=c_white
sceneProgress=0
sceneDelay=0
platformCreateDelay=0
boostedRecovery=0
lifeRecovery=0
backScrollType=0
backgroundSpin=0
floaterAmount=0
floaterRangeMin=1
floaterRangeMax=31

if room=rPrimaryMemory1 //***************************************************************
{
  platformProgress=0
  backgroundSpin=1
  floaterAmount=83

  if global.difficulty=1
    spiritPower=500
  else if global.difficulty=2
    spiritPower=550
  else if global.difficulty=3
    spiritPower=600
  else if global.difficulty=4
    spiritPower=700
}
else if room=rPrimaryMemory2 //***************************************************************
{
  boostedRecovery=1
  invertColorBlockTime=1000
  floaterAmount=56
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(1168,96,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=160
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(1392,208,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=176
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(1968,224,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=160
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(2672,304,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=176
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(3152,144,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=192
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(4000,192,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=192
  }
  for(i=0;i<8;i+=1)
  {
    newTrap[i]=instance_create(4560,144,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*45
    newTrap[i].spinDist=176
  }
  for(i=0;i<32;i+=1)
  {
    newTrap[i]=instance_create(5376,320,oRotoDisc)
    newTrap[i].swingSpeed=2
    newTrap[i].dir=i*11.25
    newTrap[i].spinDist=224
  }
}
else if room=rPrimaryMemory3 //***************************************************************
{
  boostedRecovery=1
  lifeRecovery=1
  backgroundSpin=1
  floaterAmount=102

  var xRock;
  xRock=512
  for(i=0;i<24;i+=1)
  {
    newRock=instance_create(xRock,-32,oBigBoulder)
    xRock+=384
  }
}
else if room=rPrimaryMemory4 //***************************************************************
{
  boostedRecovery=2
  lifeRecovery=1
  backgroundSpin=1
  floaterAmount=40
  enemyProgress=0
  enemyProgTime=0
  xShowTime=0
}
else if room=rPrimaryMemory5 //***************************************************************
{
  boostedRecovery=1
  lifeRecovery=1
  backgroundSpin=1
  floaterAmount=87
  floaterRangeMin=32
  floaterRangeMax=45
  laserBeamTime=0
  laserBeamMax=20
}
else if room=rPrimaryMemory6 or room=rBR_MechaGuardian //***************************************************************
{
  if global.gameProgress<=336 and room!=rBR_MechaGuardian
  {
    npcArtist=instance_create(1840,224,oMisc)
    npcArtist.sprite_index=sTheArtistIdle
    npcArtist.image_xscale=1
    npcArtist.image_speed=0
    npcArtist.image_blend=c_green
    npcArtist.image_alpha=0.8
    npcArtist.type=1
  }

  boostedRecovery=2
  lifeRecovery=1
  backgroundSpin=1
  backScrollType=1
  backScrollTime=0
  backIndex=1
  floaterAmount=16
  floaterRangeMin=32
  floaterRangeMax=45
  xShowTime=-1
  enemySpawnTime=150
  enemySpawnType=0
}
else if room=rPrimaryMemory6Secret //***************************************************************
{
  floaterAmount=40
  floaterRangeMin=1
  floaterRangeMax=45
}
else if room=rPrimaryMemory7 or room=rBR_TheArtist //***************************************************************
{
  boostedRecovery=2
  lifeRecovery=1
  backgroundSpin=1

  bossMuffin[0]=instance_create(80,256,oArtistMuffin)
  bossMuffin[1]=instance_create(816,256,oArtistMuffin)
  bossMuffin[2]=instance_create(240,192,oArtistMuffin)
  bossMuffin[3]=instance_create(656,192,oArtistMuffin)
  bossMuffin[4]=instance_create(272,448,oArtistMuffin)
  bossMuffin[5]=instance_create(624,448,oArtistMuffin)
  bossMuffin[6]=instance_create(448,128,oArtistMuffin)
  for(i=0;i<7;i+=1)
  {
    bossMuffin[i].muffinType=i
  }

  bossPlat[0]=instance_create(32,176,oBossMovingPlat)
  bossPlat[0].image_xscale=6
  bossPlat[1]=instance_create(32,304,oBossMovingPlat)
  bossPlat[1].image_xscale=8
  bossPlat[2]=instance_create(224,240,oBossMovingPlat)
  bossPlat[2].image_xscale=4
  bossPlat[3]=instance_create(208,368,oBossMovingPlat)
  bossPlat[3].image_xscale=6
  bossPlat[4]=instance_create(416,176,oBossMovingPlat)
  bossPlat[4].image_xscale=4
  bossPlat[5]=instance_create(400,304,oBossMovingPlat)
  bossPlat[5].image_xscale=6
  bossPlat[6]=instance_create(384,432,oBossMovingPlat)
  bossPlat[6].image_xscale=8
  bossPlat[7]=instance_create(608,240,oBossMovingPlat)
  bossPlat[7].image_xscale=4
  bossPlat[8]=instance_create(592,368,oBossMovingPlat)
  bossPlat[8].image_xscale=6
  bossPlat[9]=instance_create(768,176,oBossMovingPlat)
  bossPlat[9].image_xscale=6
  bossPlat[10]=instance_create(736,304,oBossMovingPlat)
  bossPlat[10].image_xscale=8
  for(i=0;i<11;i+=1)
  {
    bossPlat[i].tileDraw=0
  }
  bossPlat[11]=instance_create(16,32,oBossMovingPlat)
  bossPlat[11].image_yscale=30
  bossPlat[11].tileDraw=1
  bossPlat[12]=instance_create(864,32,oBossMovingPlat)
  bossPlat[12].image_yscale=30
  bossPlat[12].tileDraw=1
}
else if room=rPrimaryMemoryEscape1 //***************************************************************
{
  if global.gameProgress=341
    bossFinishFadeAlpha=1
}
else if room=rPrimaryMemoryEscape2 //***************************************************************
{
  for(i=0;i<7;i+=1)
  {
    newTrap[i]=instance_create(4080,336,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=192

    newTrap[i]=instance_create(4656,160,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=176

    newTrap[i]=instance_create(5168,336,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=192

    newTrap[i]=instance_create(5680,48,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=176

    newTrap[i]=instance_create(6256,160,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=176
    newTrap[i]=instance_create(6256,336,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=192
  }
}
else if room=rPrimaryMemoryEscape3 //***************************************************************
{
  for(i=0;i<7;i+=1)
  {
    newTrap[i]=instance_create(864,256,oRotoDisc)
    newTrap[i].swingSpeed=-1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=144
    newTrap[i]=instance_create(1120,256,oRotoDisc)
    newTrap[i].swingSpeed=1.5
    newTrap[i].dir=i*51
    newTrap[i].spinDist=144
    newTrap[i]=instance_create(1632,256,oRotoDisc)
    newTrap[i].swingSpeed=-2
    newTrap[i].dir=i*51
    newTrap[i].spinDist=144
  }
  for(i=0;i<5;i+=1)
  {
    newTrap[i]=instance_create(808,520,oRotoDisc)
    newTrap[i].swingSpeed=-1
    newTrap[i].dir=i*72
    newTrap[i].spinDist=160
    newTrap[i]=instance_create(1224,552,oRotoDisc)
    newTrap[i].swingSpeed=1
    newTrap[i].dir=i*72
    newTrap[i].spinDist=160
  }
}
else if room=rPrimaryMemoryEscape5 //***************************************************************
{
  hexComp=instance_create(4704,304,oMisc)
  hexComp.sprite_index=sHexComputer
  hexComp.image_speed=0.16
  hexComp.type=1

  var trapDist;
  for(i=0;i<6;i+=1)
  {
    trapDist=128
    for(ii=0;ii<2;ii+=1)
    {
      newTrap=instance_create(1376,16,oRotoDisc)
      newTrap.swingSpeed=1.5
      newTrap.dir=i*60
      newTrap.spinDist=trapDist
      newTrap=instance_create(2272,16,oRotoDisc)
      newTrap.swingSpeed=1.5
      newTrap.dir=i*60
      newTrap.spinDist=trapDist
      newTrap=instance_create(2912,16,oRotoDisc)
      newTrap.swingSpeed=2
      newTrap.dir=i*60
      newTrap.spinDist=trapDist
      trapDist+=128
    }
  }
}

//----------------------------------- BACKGROUND SPIN -----------------------------------
if backgroundSpin=1
{
  backFollow[0]=instance_create(0,0,oEvBackFollow)
  backFollow[0].backSet=sBackPrimaryMemory2
  backFollow[0].image_xscale=1.7
  backFollow[0].image_yscale=1.7
  if room=rPrimaryMemory7
    backFollow[0].image_alpha=0.125
  else
    backFollow[0].image_alpha=0.25
  backFollow[0].drawType=1
  backFollow[0].actorType=0
  backFollow[0].rotateSpeed=0.5
  backFollow[0].xx=256
  backFollow[0].yy=192
  backFollow[1]=instance_create(0,0,oEvBackFollow)
  backFollow[1].backSet=sBackPrimaryMemory2
  backFollow[1].image_xscale=1.7
  backFollow[1].image_yscale=1.7
  if room=rPrimaryMemory7
    backFollow[1].image_alpha=0.125
  else
    backFollow[1].image_alpha=0.25
  backFollow[1].drawType=1
  backFollow[1].actorType=0
  backFollow[1].rotateSpeed=-0.5
  backFollow[1].xx=256
  backFollow[1].yy=192
}
//----------------------------------- FLOATERS -----------------------------------
for(i=0;i<floaterAmount;i+=1)
{
  newFloater=instance_create(random(room_width),random(room_height),oEvBackFloatingPiece)
  newFloater.image_alpha=random_range(0.1,0.4)
  newFloater.drawType=1
  newFloater.actorType=0
  //newFloater.direction=random(360)
  newFloater._direction=random(360) //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
  newFloater.image_angle=random(360)
  //newFloater.speed=random_range(-1.5,1.5)
  newFloater._speed=random_range(-1.5,1.5) //60fps change: _speed (it moves by _speed/_direction, see correctSpeedDirection)
  newFloater.rotateSpeed=random_range(-4,4)
  newFloater.dirChange=random_range(-4,4)
  var spriteUse;
  spriteUse=irandom_range(floaterRangeMin,floaterRangeMax)
  switch(spriteUse)
  {
    case 1: newFloater.sprite_index=sGoomba; break;
    case 2: newFloater.sprite_index=sGreenParatroopa; break;
    case 3: newFloater.sprite_index=sDryBonesWalk; break;
    case 4: newFloater.sprite_index=sBoo; break;
    case 5: newFloater.sprite_index=sBulletBill; break;
    case 6: newFloater.sprite_index=sBoneSkeletonWalk; break;
    case 7: newFloater.sprite_index=sSkeledragon; break;
    case 8: newFloater.sprite_index=sScarfy; break;
    case 9: newFloater.sprite_index=sTwizzy; break;
    case 10: newFloater.sprite_index=sIEIcon; break;
    case 11: newFloater.sprite_index=sPunaguchi; break;
    case 12: newFloater.sprite_index=sDustReaperFly; break;
    case 13: newFloater.sprite_index=sTSentinelStand; break;
    case 14: newFloater.sprite_index=sWeirdAssElectricThing; break;
    case 15: newFloater.sprite_index=sBalboa; break;
    case 16: newFloater.sprite_index=sFreakedOutFish; break;
    case 17: newFloater.sprite_index=sTreeTorchWalk; break;
    case 18: newFloater.sprite_index=sGunTurtle; break;
    case 19: newFloater.sprite_index=sMet; break;
    case 20: newFloater.sprite_index=sKoukerQ; break;
    case 21: newFloater.sprite_index=sHotDog; break;
    case 22: newFloater.sprite_index=sNapalmManIdle; break;
    case 23: newFloater.sprite_index=sGyroManIdle; break;
    case 24: newFloater.sprite_index=sDiveManIdle; break;
    case 25: newFloater.sprite_index=sSagymWalk; break;
    case 26: newFloater.sprite_index=sBergriftStand; break;
    case 27: newFloater.sprite_index=sDarkVariantIdle; break;
    case 28: newFloater.sprite_index=sLostSoul; break;
    case 29: newFloater.sprite_index=sWisp; break;
    case 30: newFloater.sprite_index=sZSkullHead; break;
    case 31: newFloater.sprite_index=sFlyingDemonFly; break;
    case 32: newFloater.sprite_index=sNeteryuIdle; break;
    case 33: newFloater.sprite_index=sDarkMindIdle; break;
    case 34: newFloater.sprite_index=sMetaKnightIdle; break;
    case 35: newFloater.sprite_index=sQTDistorterMain; break;
    case 36: newFloater.sprite_index=sDragonrootIdle; break;
    case 37: newFloater.sprite_index=sMetallicardianIdle; break;
    case 38: newFloater.sprite_index=sDemonCursorDefault; break;
    case 39: newFloater.sprite_index=sKingMech; break;
    case 40: newFloater.sprite_index=sNeoGuardianBody; break;
    case 41: newFloater.sprite_index=sNecrobaneIdle; break;
    case 42: newFloater.sprite_index=sDarkGear; break;
    case 43: newFloater.sprite_index=sArrghus; break;
    case 44: newFloater.sprite_index=sFourthWallCrusher; break;
    case 45: newFloater.sprite_index=sDataCollector; break;
  }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=325 //intro to Primary Memory
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("So this is the place? It's a bit messed up.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("The center holds all the main functions in memory.#However, this outer section distorts the memory,#much like the garbage collections.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("There's no main pathway, but I can make one.#I... I didn't realize I could do so much.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("What do you mean?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I will be making changes to get you to the center where#The Artist is going to cause the program to crash.#For example, I've hacked your running speed. If you want to run at your normal#speed, you can toggle it with Mental Insurrection.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Bitchin! And wow, it's messed up that dividing by zero#really WILL end the world... at least in this case.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7
  {
    global.gameProgress=326
    sceneProgress=0
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Primary Memory"
    global.gamePaused=false
  }
}
else if global.gameProgress=327 //Hexor interferes
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("I've disabled your fast movement.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I kept him from disabling your dash though and I'll try to#get that speed hack back.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("How about I disable your abilities?",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("How about I speed up the recovery rate?#... Done.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Owned.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Yeah well I've blocked your pitfall blockers.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("We're used to pitfalls by now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Tell me about it.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    global.gameProgress=328
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=329 //Jeremy gets control
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Alright, I got your speed hack back up.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("How?!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I'm awesome.#I've also hacked the life count to auto recover as well.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You shouldn't be able to do any of this.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("I've actually been able to hack and change these this whole time,#I just didn't know. Wait till I find out more.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("It doesn't matter, The Artist has more control than even The Darkness had.#You won't stop this from coming down.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("No, I'm fairly confident we got this.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You're such a troll " +string(global.mainCharacters[1]) +string("."),1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9
  {
    global.gameProgress=330
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=331 //The Darkness is helping us
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Even with your speed and recovery,#I have an army that will break through that.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("No worries, The Darkness is backing us up and#has located someone to help us.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Who?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I'll keep it a surprise.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    global.gameProgress=332
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=333 //Getting close
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("WHAT?!?!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Thanks to X and those Shrouds, that was easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("This is irritating, and you're almost there too.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Hey thanks for letting us know, though I knew that already.#Keep going, nothing can stop you now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Planned on it!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Oh yeah, don't worry about bottomless pits anymore either.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7
  {
    global.gameProgress=334
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=335 //The outer core
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("The Artist is just up ahead.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Awesome, time to beat some sense into him.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I sped up your Spirit Recovery by the way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4
  {
    global.gameProgress=336
    sceneProgress=0
    global.gamePaused=false
  }
}
else if global.gameProgress=336 and room=rPrimaryMemory6 //Boss Fight (Mecha Guardian)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=1744
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<320
      //oPlayer1.y+=4
      oPlayer1.y+=4*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=30
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=30
    if scrCountPass(sceneDelay,30) //60fps change: once, when the count reaches it
      npcArtist.image_xscale=-1
    else if sceneDelay>=45
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I don't know how you made it here, but I will not be stopped.#Once I pass through this, it is only a short time before I am able#to rewrite the fail safe.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Yeah yeah, skip the exposition, we've heard it a million times.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("As you wish.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=6
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay>=30 and sceneDelay<=99
    if sceneDelay>29 and sceneDelay<=99 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    {
      //npcArtist.x+=3
      npcArtist.x+=3*gDeltaTime //60fps change: per 30fps tick
      //npcArtist.image_alpha-=0.04
      npcArtist.image_alpha-=0.04*gDeltaTime //60fps change: per 30fps tick
      if npcArtist.image_alpha<=0
      {
        sceneDelay=100
      }
    }
    else if sceneDelay>=130
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Well at least he actually didn't talk anymore.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I've enabled your buster shot,#just blast this thing out of your way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      with oMisc
        instance_destroy()
      bulletBarrier=instance_create(1344,320,oMisc)
      bulletBarrier.sprite_index=sDTorsoLightning
      bulletBarrier.image_xscale=0.75
      bulletBarrier.image_yscale=5
      bulletBarrier.image_speed=0.33
      bulletBarrier.image_blend=c_green
      bulletBarrier.image_alpha=0.4
      bulletBarrier.type=1
      boss=instance_create(1950,246,oMechaGuardian)
      barrier=instance_create(512,0,oBossBarrier)
      barrier.image_yscale=5
      barrierTop=instance_create(1648,-320,oBossBarrier)
      barrierTop.image_yscale=5
      oPlayer1.bUseBusterShot=1
      oPlayer1.raveTime=0
      global.gameProgress=337
      sceneDelay=0
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Mecha Guardian"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=337 //boss fight ends (Mecha Guardian)
{
  if sceneProgress=0 and enemyCount=0
  {
    global.gamePaused=true
    oPlayer1.bUseBusterShot=0
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.05
      bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      endBoss()
      xShowTime=-1
      with oEvNpcX1
        instance_destroy()
      with oEnemyBase
        instance_destroy()
      oPlayer1.x=1776
      oPlayer1.y=321
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.05
      bossFinishFadeAlpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("X and the Shrouds save the day again... wait, I hate the Shrouds.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Those entities are under my control,#they will not direct attacks at you.#Fearing them any longer is unnecessary.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Glad you're backing us up.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("It is the optimal choice.",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Its got a point.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Well anyway, I've created a doorway at the entrance to this point.#If you need to go back for anything, now is the time.#Once you step through the portal to the inner core,#there is no turning back. Save or do whatever you need to do.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I can't help but feel this whole end area is a jab at something.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You have a nice habit of shattering the fourth wall.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Like there was one to begin with... oh wait...",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    exitMidDoor=instance_create(1616,288,oExit)
    exitMidDoor.sprite_index=sMidLevelDoor
    exitMidDoor.bShowArrow=false
    exitMidDoor.exitType=0
    exitMidDoor.newMapX=160
    exitMidDoor.newMapY=256
    exitMidDoor.toRoom=rPrimaryMemory1

    exitToCore=instance_create(1840,288,oExit)
    exitToCore.sprite_index=sDataPortal
    exitToCore.image_yscale=1.5
    exitToCore.bShowArrow=false
    exitToCore.exitType=0
    exitToCore.newMapX=0
    exitToCore.newMapY=0
    exitToCore.toRoom=rPrimaryMemory7
    exitToCore.newStep=60
    exitToCore.newTrans=20

    oPlayer1.bCanTakeDamage=true
    global.gameProgress=338
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=339 //The Artist and Final Boss fight (Mitra)
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Where is he?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("I'm right here.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=3
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      boss=instance_create(544,240,oMitra)
      boss.image_xscale=-1
      boss.image_alpha=0
    }
    //else if sceneDelay>=21 and sceneDelay<=70
    else if sceneDelay>20 and sceneDelay<=70 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //boss.image_alpha+=0.02
      boss.image_alpha+=0.02*gDeltaTime //60fps change: per 30fps tick
    else if sceneDelay>=100
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("I will just have to do things myself.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("What is that from?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I recognize it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("I like this particular one, it suits me.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Yeah, it's ugly.#Dr. Light doesn't fit you anyway.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate(global.mainCharacters[0] +string(", just destroy the Muffins, he can't use them then.#They are in this area to begin the data modification."),1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("You can't destroy them. I have made sure of that.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("We'll figure out a way.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I will assist you in this.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("You're helping us too?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Who said I was helping you?#I will be sure The Artist succeeds.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("I don't think so.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16 and bWaitForInput=false
    msgCreate("You have no idea the kind of control I have in here.#You won't even scratch the Muffins!",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("That's great coming from someone with a losing streak like yours.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("This has gone on long enough. I only need to be rid of you.",1,oMessageCutscene,"The Artist")
  else if sceneProgress=19 and bWaitForInput=false
    msgCreate("With my help, they won't last long.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("Ignore them, I will do everything I can to help you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=21 and bWaitForInput=false
    msgCreate("Okay, let's do this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=22
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      oPlayer1.raveTime=0
      global.gameProgress=340
      sceneDelay=0
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="Mitra"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=340 //boss fight ends (Mitra)
{
  if sceneProgress=0 and enemyCount=0
  {
    global.gamePaused=true
    global.teleportEnabled=2
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      //bossFinishFadeAlpha+=0.05
      bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      endBoss()
      oPlayer1.x=1776
      oPlayer1.y=321
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    global.currentBoss=""
    global.gameProgress=341
    writeToPlayerGlobals()
    room_goto(rPrimaryMemoryEscape1)
  }
}
else if global.gameProgress=341 //time to escape from Primary Memory
{
  if sceneProgress=0
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=20
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha>0
      //bossFinishFadeAlpha-=0.05
      bossFinishFadeAlpha-=0.05*gDeltaTime //60fps change: per 30fps tick
    else if bossFinishFadeAlpha<=0
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=60
      if scrCountPass(sceneDelay,60) //60fps change: once, when the count reaches it
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=10
    if scrCountPass(sceneDelay,10) //60fps change: once, when the count reaches it
    {
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      escapeEvent=instance_create(0,0,oEvEscapeEffects)
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Now what's happening?!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("It seems destroying the Muffins really did make this place unstable.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Can't you teleport me out?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Not with me here.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Damn.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("I can delete him, but there's a piece of data that I need.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("What data is this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("For plot convienience, it's in this place, but you don't have much time#before this whole thing completely deletes itself.#You need to get this, otherwise I don't see a way to get rid of Hex.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Okay, though I was more wanting to get to it so I can be teleported out#before I'm caught in whatever is about to happen here.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("You don't have your auto recovery anymore. Regardless, hurry!!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      global.cTimerMinute=4
      global.cTimerSecond=5
      global.cTimerHundred=0
      global.gameProgress=342
      sceneDelay=0
      sceneProgress=0
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=348 and room=rPrimaryMemoryEscape5 //Omega Metroid drops in
{
  if oPlayer1.x>=768
  {
    omega=instance_create(640,-16,oOmegaMetroid)
    barrier=instance_create(512,32,oBossBarrier)
    barrier.image_yscale=4.25
    global.gameProgress=349
  }
}
else if global.gameProgress=349 and room=rPrimaryMemoryEscape5 //the player wins
{
  if sceneProgress=0
  {
    if oPlayer1.x>=4704
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<304
      //oPlayer1.y+=4
      oPlayer1.y+=4*gDeltaTime //60fps change: per 30fps tick
    else
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
        oPlayer1.sprite_index=sPlayerIdle
      else if sceneDelay>=20
      {
        sceneDelay=0
        sceneProgress+=1
      }
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("You made it!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I won't let this happen.",1,oMessageCutscene,global.mainCharacters[3])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Too late, you're gone.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=1
    if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
    {
      flashScreen=instance_create(0,0,oScreenFlash)
      flashScreen.image_alpha=1
      flashScreen.image_blend=c_red
      flashScreen.fadeSpeed=0.2
    }
    else if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Did you actually delete him just now?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yeah.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("That was anti-climatic.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Just need to get you to a safe area now.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=10
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=30
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate(". . .",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("What?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("I can't get you out!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=14 and bWaitForInput=false
    msgCreate("Oh who would've guessed!?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("Damn, let me try a few things...",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=16
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    //if sceneDelay=3
    if scrCountPass(sceneDelay,3) //60fps change: once, when the count reaches it
    {
      barrierL=instance_create(4560,112,oEventBarrier)
      barrierL.image_yscale=3
      barrierR=instance_create(4832,112,oEventBarrier)
      barrierR.image_yscale=3
      global.cTimerMinute=0
      global.cTimerSecond=20
      global.cTimerHundred=0
      global.gameProgress=350
      sceneDelay=0
      sceneProgress=0
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=350 and room=rPrimaryMemoryEscape5 //the last few seconds
{
  if sceneProgress=0
  {
    if global.cTimerSecond<=2
    {
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      //if sceneDelay=1
      if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
      {
        global.gamePaused=true
        stopPlayer()
      }
      if bossFinishFadeAlpha<1
        //bossFinishFadeAlpha+=0.05
        bossFinishFadeAlpha+=0.05*gDeltaTime //60fps change: per 30fps tick
      else if bossFinishFadeAlpha>=1
      {
        global.gameProgress=351
        writeToPlayerGlobals()
        room_goto(rTheEnd1)
      }
    }
  }
}

//---------------------------------------- room specific events ----------------------------------------
if room=rPrimaryMemory1 //************************************************************
{
  //platformCreateDelay-=1
  platformCreateDelay-=gDeltaTime //60fps change: counts 30fps ticks
  if platformCreateDelay<=0
  {
    if oPlayer1.y>=room_height-12
    {
      newPlatform=instance_create(oPlayer1.x-48,room_height,oSpecialMovePlatform)
      newPlatform.image_xscale=6
      newPlatform.newSprite=0
      newPlatform.xMove=0
      newPlatform.yMove=-6
      newPlatform.moveTime=20
      newPlatform.decayTime=90
      platformCreateDelay=5
    }
  }
  if oPlayer1.x>=2768+(platformProgress*96) and platformProgress<14
  {
    newPlatform=instance_create(2864+(platformProgress*96),room_height,oSpecialMovePlatform) //240
    newPlatform.image_xscale=6
    newPlatform.newSprite=0
    newPlatform.xMove=0
    newPlatform.yMove=-27.5
    newPlatform.moveTime=8
    newPlatform.decayTime=10000
    platformProgress+=1
  }
  if global.gameProgress=326
  {
    if oPlayer1.x>=6352 and platformProgress<15
    {
      var xLaser;
      xLaser=6112
      for(i=0;i<8;i+=1)
      {
        newLaser=instance_create(xLaser,320,oSLLaser)
        newLaser.spiritPower=spiritPower
        newLaser.idleTime=150
        if i=0
          newLaser.bShake=1
        else
          newLaser.bShake=0
        xLaser+=64
      }
      platformProgress+=1
    }
    if oPlayer1.x>=6640
    {
      if backFollow[0].image_yscale<6
      {
        //backFollow[0].image_xscale+=0.015
        backFollow[0].image_xscale+=0.015*gDeltaTime //60fps change: per 30fps tick
        //backFollow[0].image_yscale+=0.015
        backFollow[0].image_yscale+=0.015*gDeltaTime //60fps change: per 30fps tick
        //backFollow[1].image_xscale+=0.015
        backFollow[1].image_xscale+=0.015*gDeltaTime //60fps change: per 30fps tick
        //backFollow[1].image_yscale+=0.015
        backFollow[1].image_yscale+=0.015*gDeltaTime //60fps change: per 30fps tick
      }
    }
  }
}
else if room=rPrimaryMemory2 //************************************************************
{
  //invertColorBlockTime+=1
  invertColorBlockTime+=gDeltaTime //60fps change: counts 30fps ticks
  if invertColorBlockTime>=50
  {
    newInverter=instance_create(view_xview[0]+view_wview+16,0,oEvPrimColorInvert)
    //newInverter.direction=180
    newInverter._direction=180 //60fps change: _direction (it moves by _speed/_direction, see correctSpeedDirection)
    //newInverter.speed=random_range(0.5,2.5)
    newInverter._speed=random_range(0.5,2.5) //60fps change: _speed (it moves by _speed/_direction, see correctSpeedDirection)
    newInverter.xSize=irandom_range(64,144)
    newInverter.ySize=room_height
    invertColorBlockTime=irandom(30)
  }
}
else if room=rPrimaryMemory4 //************************************************************
{
  if global.gamePaused=false //spawn X to assist
  {
    if !instance_exists(oEvNpcX1)
      //xShowTime+=1
      xShowTime+=gDeltaTime //60fps change: counts 30fps ticks

    eDistCheck=instance_nearest(oPlayer1.x,oPlayer1.y,oEnemyBase)
    if instance_exists(eDistCheck)
    {
      if xShowTime>=50 and point_distance(oPlayer1.x,oPlayer1.y,eDistCheck.x,eDistCheck.y)<240
      {
        var npcXxPos;
          npcXxPos=oPlayer1.x+random_range(-64,64)
        if npcXxPos<176
          npcXxPos=176
        else if npcXxPos>3968
          npcXxPos=3968
        npcXassist=instance_create(npcXxPos,-8,oEvNpcX1)
        xShowTime=0
      }
    }
  }

  if enemyProgress=0 //Shrouds come to help
  {
    if instance_number(oEnemyBase)<45
    {
      shroudAssist=instance_create(oPlayer1.x+32,oPlayer1.y-128,oNpcShroud)
      shroudAssist.bActive=true
      shroudAssist.spawnCount=1
      enemyProgress+=1
    }
  }
  else if enemyProgress=1 //short talk
  {
    //enemyProgTime+=1
    enemyProgTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if enemyProgTime=10
    if scrCountPass(enemyProgTime,10) //60fps change: once, when the count reaches it
    {
      msgCreate("Damn it, not the Shrouds.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=100
    }
    //else if enemyProgTime=110
    else if scrCountPass(enemyProgTime,110) //60fps change: once, when the count reaches it
    {
      msgCreate("They have come to help.",0,oMessagePerson,global.mainCharacters[2],0,1)
      newMessage.fadingTime=100
    }
    //else if enemyProgTime=210
    else if scrCountPass(enemyProgTime,210) //60fps change: once, when the count reaches it
    {
      msgCreate("Awesome.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=100
      enemyProgTime=0
      enemyProgress+=1
    }
  }
  else if enemyProgress=2 //spawn more enemies
  {
    //enemyProgTime+=1
    enemyProgTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if enemyProgTime=50
    if scrCountPass(enemyProgTime,50) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=2560
      eYplacer=160
      for(i=0;i<6;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oThunderDragon)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=96
        eYplacer+=12
      }
      eXplacer=1616
      eYplacer=176
      for(i=0;i<4;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oTTurret)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=32
      }
    }
    //else if enemyProgTime=180
    else if scrCountPass(enemyProgTime,180) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=640
      eYplacer=80
      for(i=0;i<24;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oPaletteSwapSentinel)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=96
        eYplacer+=1
      }
      enemyProgTime=0
      enemyProgress+=1
    }
  }
  else if enemyProgress=3 //check enemy count
  {
    if instance_number(oEnemyBase)<40
      enemyProgress+=1
  }
  else if enemyProgress=4 //spawn more enemies
  {
    //enemyProgTime+=1
    enemyProgTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if enemyProgTime=50
    if scrCountPass(enemyProgTime,50) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=2192
      eYplacer=176
      for(i=0;i<4;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oBroccoliHolder)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=32
      }
    }
    //else if enemyProgTime=200
    else if scrCountPass(enemyProgTime,200) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=768
      eYplacer=320
      for(i=0;i<16;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oSludgeCreature)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=32
      }
    }
    //else if enemyProgTime=350
    else if scrCountPass(enemyProgTime,350) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=3888
      eYplacer=96
      for(i=0;i<13;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oLaserBall)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eYplacer+=17
      }
      enemyProgTime=0
      enemyProgress+=1
    }
  }
  else if enemyProgress=5 //check enemy count
  {
    if instance_number(oEnemyBase)<35
      enemyProgress+=1
  }
  else if enemyProgress=6 //spawn more enemies
  {
    //enemyProgTime+=1
    enemyProgTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if enemyProgTime=30
    if scrCountPass(enemyProgTime,30) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=3408
      eYplacer=112
      for(i=0;i<6;i+=1)
      {
        for(ii=0;ii<6;ii+=1)
        {
          newEnemy=instance_create(eXplacer,eYplacer,oGreenParatroopa)
          newEnemy.bActive=1
          effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
          eXplacer+=irandom(6)+32
        }
        eXplacer=3408
        eYplacer+=32
      }
    }
    //else if enemyProgTime=240
    else if scrCountPass(enemyProgTime,240) //60fps change: once, when the count reaches it
    {
      newEnemy=instance_create(2288,160,oDataBombLauncher)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(2608,272,oDataBombLauncher)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(2960,272,oDataBombLauncher)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(3200,288,oDataBombLauncher)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)

      var eXplacer,eYplacer;
      eXplacer=2672
      eYplacer=272
      for(i=0;i<4;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oMobileSentry)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=64
      }
      eXplacer=2512
      eYplacer=176
      for(i=0;i<6;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oAerialSentry)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=128
        eYplacer+=random_range(-8,8)
      }
      eXplacer=2352
      eYplacer=320
      for(i=0;i<5;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oStaticSentry)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=56
      }
      newEnemy=instance_create(3008,320,oStaticSentry)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      newEnemy=instance_create(3072,320,oStaticSentry)
      newEnemy.bActive=1
      effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
      enemyProgTime=0
      enemyProgress+=1
    }
  }
  else if enemyProgress=7 //check enemy count
  {
    if instance_number(oEnemyBase)<30
      enemyProgress+=1
  }
  else if enemyProgress=8 //spawn more enemies
  {
    //enemyProgTime+=1
    enemyProgTime+=gDeltaTime //60fps change: counts 30fps ticks
    //if enemyProgTime=30
    if scrCountPass(enemyProgTime,30) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=1344
      eYplacer=288
      for(i=0;i<8;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oTreeTorch)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=64
      }
    }
    //else if enemyProgTime=150
    else if scrCountPass(enemyProgTime,150) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=1328
      eYplacer=64
      for(i=0;i<20;i+=1)
      {
        newEnemy=instance_create(eXplacer,eYplacer,oGoomba)
        newEnemy.bActive=1
        effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
        eXplacer+=random_range(56,72)
      }
    }
    //else if enemyProgTime=300
    else if scrCountPass(enemyProgTime,300) //60fps change: once, when the count reaches it
    {
      var eXplacer,eYplacer;
      eXplacer=1824
      eYplacer=80
      for(i=0;i<2;i+=1)
      {
        for(ii=0;ii<5;ii+=1)
        {
          newEnemy=instance_create(eXplacer,eYplacer,oIEIcon)
          newEnemy.bActive=1
          effect_create_above(ef_ring,newEnemy.x,newEnemy.y,0,c_black)
          eXplacer+=random_range(52,56)
        }
        eXplacer=1808
        eYplacer+=49
      }
      enemyProgress+=1
    }
  }
  else if enemyProgress=9 //check if all enemies are defeated
  {
    if !instance_exists(oEnemyBase)
    {
      msgCreate("I never thought I would be fighting alongside the Shrouds.",0,oMessagePerson,global.mainCharacters[0],0,1)
      newMessage.fadingTime=120
      with oEventBarrier
        instance_destroy()
      enemyProgress+=1
    }
  }
}
else if room=rPrimaryMemory5 //************************************************************
{
  //platformCreateDelay-=1
  platformCreateDelay-=gDeltaTime //60fps change: counts 30fps ticks
  if platformCreateDelay<=0
  {
    if oPlayer1.x>10000
    {
      if oPlayer1.y>=336
      {
        newPlatform=instance_create(oPlayer1.x-40,room_height,oSpecialMovePlatform)
        newPlatform.image_xscale=5
        newPlatform.newSprite=1
        newPlatform.drawType=choose(0,16,32,48,64)
        newPlatform.xMove=0
        newPlatform.yMove=-32
        newPlatform.moveTime=2
        newPlatform.decayTime=7
        platformCreateDelay=3
      }
    }
    else
    {
      if oPlayer1.y>=room_height-12
      {
        newPlatform=instance_create(oPlayer1.x-48,room_height,oSpecialMovePlatform)
        newPlatform.image_xscale=6
        newPlatform.newSprite=1
        newPlatform.drawType=choose(0,16,32,48,64)
        newPlatform.xMove=0
        newPlatform.yMove=-6
        newPlatform.moveTime=20
        newPlatform.decayTime=90
        platformCreateDelay=5
      }
    }
  }

  if oPlayer1.x>12000 and oPlayer1.x<16512 and oPlayer1.image_xscale=1
  {
    //laserBeamTime-=1
    laserBeamTime-=gDeltaTime //60fps change: counts 30fps ticks
    if laserBeamTime<=0
    {
      newLaser=instance_create(oPlayer1.x+100,room_height,oEvSkyLaser)
      newLaser.spiritPower=1000
      newLaser.idleTime=20
      newLaser.bShake=1
      laserBeamTime=laserBeamMax
      if laserBeamMax>3
        laserBeamMax-=1
    }
  }
}
else if room=rPrimaryMemory6 or room=rBR_MechaGuardian //************************************************************
{
  if global.gamePaused=false //spawn X to assist
  {
    //if !instance_exists(oEvNpcX1) and xShowTime>-1
    if !instance_exists(oEvNpcX1) and xShowTime>=0 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
      //xShowTime+=1
      xShowTime+=gDeltaTime //60fps change: counts 30fps ticks

    eDistCheck=instance_nearest(oPlayer1.x,oPlayer1.y,oEnemyBase)
    if instance_exists(eDistCheck)
    {
      if xShowTime>=50 and point_distance(oPlayer1.x,oPlayer1.y,eDistCheck.x,eDistCheck.y)<240
      {
        var npcXxPos;
          npcXxPos=oPlayer1.x+random_range(-64,64)
        if npcXxPos<544
          npcXxPos=544
        else if npcXxPos>1616
          npcXxPos=1616
        npcXassist=instance_create(npcXxPos,-8,oEvNpcX1)
        xShowTime=0
      }
    }
  }

  if xShowTime>-1 //enemy spawning
  {
    if instance_number(oEnemyBase)<7
    {
      //enemySpawnTime+=1
      enemySpawnTime+=gDeltaTime //60fps change: counts 30fps ticks
      if enemySpawnTime>=330
      {
        enemySpawnType+=1
        if enemySpawnType=1
        {
          var eXplacer,eYplacer;
          eXplacer=896+random(64)
          eYplacer=96
          for(i=0;i<6;i+=1)
          {
            newEnemy=instance_create(eXplacer,eYplacer,oPaletteSwapSentinel)
            newEnemy.bActive=1
            eXplacer+=80+random(16)
            eYplacer+=1
          }
          eXplacer=928+random(128)
          eYplacer=320
          for(i=0;i<2;i+=1)
          {
            newEnemy=instance_create(eXplacer,eYplacer,oMobileSentry)
            newEnemy.bActive=1
            eXplacer+=64+random(128)
          }
          eXplacer=768+random(384)
          newEnemy=instance_create(eXplacer,eYplacer,oStaticSentry)
          newEnemy.bActive=1
          eXplacer=1280+random(384)
          newEnemy=instance_create(eXplacer,eYplacer,oStaticSentry)
          newEnemy.bActive=1
          eXplacer=800+random(384)
          eYplacer=208+random(32)
          for(i=0;i<2;i+=1)
          {
            newEnemy=instance_create(eXplacer,eYplacer,oAerialSentry)
            newEnemy.bActive=1
            eXplacer+=64+random(256)
          }
        }
        else if enemySpawnType=2
        {
          var eXplacer,eYplacer;
          eXplacer=800+random(336)
          eYplacer=208+random(32)
          for(i=0;i<5;i+=1)
          {
            newEnemy=instance_create(eXplacer,eYplacer,oThunderDragon)
            newEnemy.bActive=1
            eXplacer+=96+random(32)
            eYplacer+=12
          }
          eXplacer=768+random(384)
          newEnemy=instance_create(eXplacer,eYplacer,oDataBombLauncher)
          newEnemy.bActive=1
          eXplacer=1280+random(384)
          newEnemy=instance_create(eXplacer,eYplacer,oDataBombLauncher)
          newEnemy.bActive=1
          var eXplacer,eYplacer;
          eXplacer=832+random(128)
          eYplacer=320
          for(i=0;i<4;i+=1)
          {
            newEnemy=instance_create(eXplacer,eYplacer,oSludgeCreature)
            newEnemy.bActive=1
            eXplacer+=64+random(32)
          }
          enemySpawnType=0
        }
        enemySpawnTime=0
      }
    }
  }
}

//---------- boosted recovery ----------
if global.gamePaused=false
{
  if boostedRecovery>0
  {
    if oPlayer1.spiritEnergy<oPlayer1.maxSpiritEnergy
      //oPlayer1.spiritEnergy+=boostedRecovery
      oPlayer1.spiritEnergy+=boostedRecovery*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.fireEnergy<oPlayer1.maxFireEnergy
      //oPlayer1.fireEnergy+=boostedRecovery
      oPlayer1.fireEnergy+=boostedRecovery*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.waterEnergy<oPlayer1.maxWaterEnergy
      //oPlayer1.waterEnergy+=boostedRecovery
      oPlayer1.waterEnergy+=boostedRecovery*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.windEnergy<oPlayer1.maxWindEnergy
      //oPlayer1.windEnergy+=boostedRecovery
      oPlayer1.windEnergy+=boostedRecovery*gDeltaTime //60fps change: per 30fps tick
    if oPlayer1.earthEnergy<oPlayer1.maxEarthEnergy
      //oPlayer1.earthEnergy+=boostedRecovery
      oPlayer1.earthEnergy+=boostedRecovery*gDeltaTime //60fps change: per 30fps tick
  }
  if lifeRecovery>0
  {
    if oPlayer1.life<oPlayer1.maxLife
      //oPlayer1.life+=lifeRecovery
      oPlayer1.life+=lifeRecovery*gDeltaTime //60fps change: per 30fps tick
  }
}

//---------- scroll data background ----------
if backScrollType=1
{
  //backScrollTime+=1
  backScrollTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if backScrollTime>=211 and backScrollTime<=260
  if backScrollTime>210 and backScrollTime<=260 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //background_alpha[backIndex]+=0.002
    background_alpha[backIndex]+=0.002*gDeltaTime //60fps change: per 30fps tick
  //else if backScrollTime>=361 and backScrollTime<=410
  else if backScrollTime>360 and backScrollTime<=410 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //background_alpha[backIndex]-=0.002
    background_alpha[backIndex]-=0.002*gDeltaTime //60fps change: per 30fps tick
  else if backScrollTime>=411
    backScrollTime=0
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
if room=rPrimaryMemory1
{
  draw_set_font(fnt_MSWBar)
  draw_set_halign(fa_left)
  draw_set_color(c_white)
  draw_set_alpha(1)
  draw_text(7146,229,oPlayer1.x)
  draw_text(7562,229,fps)
  draw_text(7978,229,current_time)
  draw_set_font(fnt_MSWorld)
  draw_set_color(c_black)
  draw_text(7197,309,"C:\Program Files")
  draw_text(7613,309,"Searching...")
  draw_text(8029,309,"Deleting...")
}
else if room=rPrimaryMemory4
{
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fnt_GoToMenu)
  draw_set_halign(fa_left)
  draw_text(view_xview[0]+340,view_yview[0]+68,"Enemies Left:")
  draw_text(view_xview[0]+472,view_yview[0]+68,instance_number(oEnemyBase))
}
else if room=rPrimaryMemoryEscape1 or room=rPrimaryMemoryEscape2 or room=rPrimaryMemoryEscape3 or room=rPrimaryMemoryEscape4 or room=rPrimaryMemoryEscape5
  countdownTimer(1,c_white)
