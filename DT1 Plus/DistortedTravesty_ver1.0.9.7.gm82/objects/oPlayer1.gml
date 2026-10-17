#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1
y+=1
//set character in proper position on new map
if global.newMapX!=0 and global.newMapY!=0
{
  x=global.newMapX
  y=global.newMapY
}
if global.resetNewMapXY=true
{
  global.newMapX=0
  global.newMapY=0
  global.resetNewMapXY=false
}
//set initial values
bPlayable=true //whether the character is playable
parent="player"
charEnemyCreateEvent()
characterCreateEvent()
image_speed=attackAnimSpeed
weight=130
//init run
canRun=0
runSwap=0 //0:no swap, 1:run is on, 2:run is off
if room=rPrimaryMemory1 or room=rPrimaryMemory3 or room=rPrimaryMemory4 or room=rPrimaryMemory5 or room=rPrimaryMemory6
  runSwap=1

//check equipment
gemBonusP=100
gemBonusS=100
for (i=0;i<=10;i+=1)
{
  if global.p1WeaponGem=global.invWeaponGems[i]
    break;
  gemBonusP+=10
  gemBonusS+=6
}
armorBonus=10
for (i=0;i<=9;i+=1)
{
  if global.p1Armor=global.invArmor[i]
    break;
  armorBonus+=10
}
ringBonus=7
for (i=0;i<=11;i+=1)
{
  if global.p1Ring=global.invRing[i]
    break;
  ringBonus+=7
}

//variables pertaining to the character's status and inventory
level=global.p1Level
maxLife=global.p1MaxLife
life=global.p1Life
expTotal=global.p1TotalExp
expCurrent=global.p1CurrentExp
expNext=global.p1ExpNext
physicalPower=global.p1PhysicalPower+gemBonusP
physicalDefense=global.p1PhysicalDefense+armorBonus
spiritPower=global.p1SpiritPower+gemBonusS
spiritDefense=global.p1SpiritDefense+ringBonus
moneyTotal=global.p1MoneyTotal
awesomePoints=global.p1Awesome

maxSpiritEnergy=global.p1MaxSpiritEnergy
maxFireEnergy=global.p1MaxFireEnergy
maxWaterEnergy=global.p1MaxWaterEnergy
maxWindEnergy=global.p1MaxWindEnergy
maxEarthEnergy=global.p1MaxEarthEnergy
spiritEnergy=global.p1SpiritEnergy
fireEnergy=global.p1FireEnergy
waterEnergy=global.p1WaterEnergy
windEnergy=global.p1WindEnergy
earthEnergy=global.p1EarthEnergy

conSkittles=global.p1Skittles
conSmoothie=global.p1Smoothie
conStarburst=global.p1Starburst
conGummyBears=global.p1GummyBears

if SS_IsSoundPlaying(global.msc_YouSpinMeRound)
{
  SS_StopSound(global.msc_YouSpinMeRound)
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
}
if global.gameOver=true
{
  var tempMplay;
  tempMplay=findMusic()
  playMusic(tempMplay,0)
  global.gameOver=false
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ditherCounter+=1 //60fps change (added): see pMoveTo
if global.cutscene=true
  characterStepEvent()
//health and spirit percent
lifePercent=life/maxLife
spiritPercent=spiritEnergy/maxSpiritEnergy
firePercent=fireEnergy/maxFireEnergy
waterPercent=waterEnergy/maxWaterEnergy
windPercent=windEnergy/maxWindEnergy
earthPercent=earthEnergy/maxEarthEnergy
castPercent=castingTime/castingTimeTotal

if global.p1RaveEnergy>raveMax
  global.p1RaveEnergy=raveMax
//check max life
if life>maxLife
  life=maxLife

//level up
if expCurrent>=expNext and level<64
{
  expCurrent-=expNext
  //exp chart
  level+=1
  expNext=round((level+0.9)*(level+0.8)*(level+0.7)*(7-(level/20)))
  //level awards
  //life
  if level>=60
  {
    maxLife+=10
    life+=10
  }
  else if level>=25 and level<=59
  {
    if level mod 2=0
    {
      maxLife+=5
      life+=5
    }
    else
    {
      maxLife+=8
      life+=8
    }
  }
  else
  {
    if level mod 2=0
    {
      maxLife+=2
      life+=2
    }
    else
    {
      maxLife+=3
      life+=3
    }
  }
  //spirit energy
  maxSpiritEnergy+=1
  spiritEnergy+=1
  if level>=60
  {
    physicalPower+=3
    physicalDefense+=3
    spiritPower+=3
    spiritDefense+=3
  }
  else if level>=25 and level<=59
  {
    //physical power
    if level mod 3=0
      physicalPower+=3
    else
      physicalPower+=2
    //physical defense
    if level mod 3=0
      physicalDefense+=3
    else
      physicalDefense+=2
    //spirit power
    if level mod 5=0
      spiritPower+=3
    else
      spiritPower+=2
    //spirit defense
    if level mod 4=0
      spiritDefense+=3
    else
      spiritDefense+=2
  }
  else
  {
    //physical power
    if level mod 3=0
      physicalPower+=2
    else
      physicalPower+=1
    //physical defense
    if level mod 3=0
      physicalDefense+=2
    else
      physicalDefense+=1
    //spirit power
    if level mod 5=0
      spiritPower+=2
    else
      spiritPower+=1
    //spirit defense
    if level mod 4=0
      spiritDefense+=2
    else
      spiritDefense+=1
  }
  levelUp=instance_create(x,y-48,oLevelUpNotice)
}
//death
if life<=0
{
  if !instance_exists(oGameOver)
  {
    stopLoopingSounds()
    gameOver=instance_create(0,0,oGameOver)
  }
}

if global.gamePaused=false
{
  characterStepEvent()
  //60fps change: the records, recharges and timers below are per 30fps tick (*gDeltaTime, or once per tick)
  //find distance moved
  if platformCharacterIs(ON_GROUND)
    //global.recDistanceRun+=abs(xVel)
    global.recDistanceRun+=abs(xVel)*gDeltaTime //60fps change: see above
  else if platformCharacterIs(IN_AIR)
    //global.recDistanceInAir+=abs(xVel)+abs(yVel)
    global.recDistanceInAir+=(abs(xVel)+abs(yVel))*gDeltaTime //60fps change: see above
  //off-screen (above room)
  if y<0
    //global.recTimeSpentOffscreen+=1
    global.recTimeSpentOffscreen+=gDeltaTime //60fps change: see above
  //keep player inside room
  if y>room_height+64
  {
    global.recFallenOffLevelNumber+=1
    life-=maxLife
  }
  if x<0
  {
    xVel=0
    x=0
  }
  else if x>room_width
  {
    xVel=0
    x=room_width
  }

  //Soothing Spring
  //if bInsideSoothingSpring=1
  if bInsideSoothingSpring=1 and gDeltaDoTicks //60fps change: whole points, once per 30fps tick
  {
    life+=1
  }

  //recharge spirit/element
  comboCharge=0
  if hitCombo>=5
  {
    comboCharge=(hitCombo/100)
    if comboCharge>1.01
      comboCharge=1.01
  }
  //60fps change: recharge per 30fps tick (*gDeltaTime)
  if spiritEnergy<maxSpiritEnergy
    spiritEnergy+=(baseSpiritRecharge+(global.SkSpiritMaster*0.15)+comboCharge+(level*0.008))*gDeltaTime
  else if spiritEnergy>maxSpiritEnergy
    spiritEnergy=maxSpiritEnergy
  if fireEnergy<maxFireEnergy
    fireEnergy+=(baseElementRecharge+(global.SkFireMastery*0.2)+comboCharge+(level*0.002))*gDeltaTime
  else if fireEnergy>maxFireEnergy
    fireEnergy=maxFireEnergy
  if waterEnergy<maxWaterEnergy
    waterEnergy+=(baseElementRecharge+(global.SkWaterMastery*0.2)+comboCharge+(level*0.002))*gDeltaTime
  else if waterEnergy>maxWaterEnergy
    waterEnergy=maxWaterEnergy
  if windEnergy<maxWindEnergy
    windEnergy+=(baseElementRecharge+(global.SkWindMastery*0.2)+comboCharge+(level*0.002))*gDeltaTime
  else if windEnergy>maxWindEnergy
    windEnergy=maxWindEnergy
  if earthEnergy<maxEarthEnergy
    earthEnergy+=(baseElementRecharge+(global.SkEarthMastery*0.2)+comboCharge+(level*0.002))*gDeltaTime
  else if earthEnergy>maxEarthEnergy
    earthEnergy=maxEarthEnergy

  //check money count
  if moneyTotal>global.p1MoneyMax
    moneyTotal=global.p1MoneyMax

  //blast off recovery
  if blastOffRecoveryTime>0
    //blastOffRecoveryTime-=1
    blastOffRecoveryTime=max(0,blastOffRecoveryTime-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0: it's checked for =0)

  //dash invulnerability time
  if dashInvulnerabilityTime>0
  {
    //afterImage=instance_create(x,y,oPlayerAfterImage)
    //dashInvulnerabilityTime-=1
    if gDeltaDoTicks {afterImage=instance_create(x,y,oPlayerAfterImage)} //60fps change: one after image per 30fps tick
    dashInvulnerabilityTime=max(0,dashInvulnerabilityTime-gDeltaTime) //60fps change: counts 30fps ticks (and stops at 0: it's checked for =0)
  }

  //after image effect
  //60fps change: one per 30fps tick (they were 2x/4x as many at 60/120fps)
  if gDeltaDoTicks
  {
  if sprite_index=sPlayerJumpSlash1 and jumpSlashPower>=200 //jump slash
    instance_create(x,y,oPlayerAfterImage)
  if currentAttackCombo=3 //3rd attack
    instance_create(x,y,oPlayerAfterImage)
  if attackState=TECH_GRAND_SLAM //grand slam
    instance_create(x,y,oPlayerAfterImage)
  if hurricaneDash!=0
    instance_create(x,y,oHurricaneDash)

  if sprite_index=sPlayerMorphBall
    instance_create(x,y,oPlayerBallImage)
  } //60fps change (added)

  //dash recovery
  if dashPoints<maxDashPoints
  {
    if dashRecoveryTime>=dashRecovery
    {
      //dashRecoveryTime=0
      //60fps change: the frame that adds the point counts as a whole 30fps tick, as at 30fps: the count starts again
      //that far back (0 at 30fps)
      dashRecoveryTime=gDeltaTime-1
      dashPoints+=1
    }
    else
    {
      if dashInvulnerabilityTime=0
        //dashRecoveryTime+=1
        dashRecoveryTime+=gDeltaTime //60fps change: counts 30fps ticks
    }

    if global.optDashWarn=1 //Low dash warning
    {
      if dashWarnSound=0 and dashPoints=0 //Ready the sound (For low dash warning)
      {
        playSound(global.snd_DashWarn,0,1,1)
        dashWarnSound=1
      }

      /*if dashWarnSound>=1 and dashWarnSound<=20 //Repeat sound
      {
        dashWarnSound+=1
        if dashWarnSound=10 {playSound(global.snd_DashWarn,0,1,1)}
        else if dashWarnSound=19 {playSound(global.snd_DashWarn,0,1,1)}
      }*/

      if dashWarnSound=1 and dashPoints>=1 //Dash ready sound
      {
        playSound(global.snd_DashWarn,0,1,11025)
        dashWarnSound=0
      }
    }
  }
  //rave mode time
  if bRaveActive=true
  {
    if raveTime<=0
    {
      if room=rPrimaryMemory7
        oMitra.setPDefense=2500
      with oRavePartner
        instance_destroy()
      with oRaveBall
        instance_destroy()
      global.p1RaveEnergy=0
      bRaveActive=false
      if SS_IsSoundPlaying(global.msc_YouSpinMeRound)
        SS_StopSound(global.msc_YouSpinMeRound)
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
    }
    else
      //raveTime-=1
      raveTime-=gDeltaTime //60fps change: counts 30fps ticks
  }
  //idle time
  if xVel=0 and yVel=0
  {
    //idleTime+=1
    idleTime+=gDeltaTime //60fps change: counts 30fps ticks
    if idleTime>global.recLongestIdleTime
      global.recLongestIdleTime=idleTime
  }
  //check run
  if runSwap=1
  {
    canRun=1
    kRun=1
  }
  else if runSwap=2
  {
    canRun=0
    kRun=0
  }
  //---------- STATUS EFFECTS ----------
  if statusPoison>0
  {
    //statusPoison-=1
    statusPoison-=gDeltaTime //60fps change: counts 30fps ticks
    //if statusPoison mod 2=0
    //60fps change: -1 life each time it counts down onto (or past) an even number, so the damage per second is the same.
    //(GM8's mod rounds fractions to whole numbers, so "mod 2=0" also passed at x.5 values above 30fps)
    if scrModPassDown(statusPoison,2)
      life-=1
    if statusPoison<=0
    {
      newDamage=instance_create(x,y-(sprite_height/2),oStatusAlert);
      newDamage.statusEffect="Poison#Recovered"
      newDamage.statusColor=make_color_rgb(78,192,34)
    }
  }
  if statusSpiritDrain>0
  {
    //60fps change: per 30fps tick
    //statusSpiritDrain-=1
    //spiritEnergy-=2
    //fireEnergy-=2
    //waterEnergy-=2
    //windEnergy-=2
    //earthEnergy-=2
    statusSpiritDrain-=gDeltaTime
    spiritEnergy-=2*gDeltaTime
    fireEnergy-=2*gDeltaTime
    waterEnergy-=2*gDeltaTime
    windEnergy-=2*gDeltaTime
    earthEnergy-=2*gDeltaTime
    if spiritEnergy<0
      spiritEnergy=0
    if fireEnergy<0
      fireEnergy=0
    if waterEnergy<0
      waterEnergy=0
    if windEnergy<0
      windEnergy=0
    if earthEnergy<0
      earthEnergy=0
    if statusSpiritDrain<=0
    {
      newDamage=instance_create(x,y-(sprite_height/2),oStatusAlert);
      newDamage.statusEffect="Spirit Drain#Recovered"
      newDamage.statusColor=make_color_rgb(78,192,34)
    }
  }
  if statusSkillLock>0
  {
    //statusSkillLock-=1
    statusSkillLock-=gDeltaTime //60fps change: counts 30fps ticks
    if statusSkillLock<=0
    {
      newDamage=instance_create(x,y-(sprite_height/2),oStatusAlert);
      newDamage.statusEffect="Skill Lock#Recovered"
      newDamage.statusColor=make_color_rgb(78,192,34)
    }
  }

  //------------------------------------
  //difficulty times
  //60fps change: counts 30fps ticks
  if global.difficulty=1
    global.recEasyTime+=gDeltaTime
  else if global.difficulty=2
    global.recNormalTime+=gDeltaTime
  else if global.difficulty=3
    global.recHardTime+=gDeltaTime
}
#define Keyboard_89
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.debugMenu=true //screen blur effect
  instance_create(0,0,oScreenEffect)
#define Mouse_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.debugMouseMove=1
{
  x=oIdentifier.x
  y=oIdentifier.y
}
#define Mouse_54
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.debugMenu=true
{
  debugMenu=show_menu_pos(320,240,"[0] Change Game Progress|[1] Change Life/Spirit...|[2] Change Items...|[3] Change Exp|[4] Change Skill Points|[5] Change Current Status...|[6] Teleport...|[7] Kill All|[8] Change Spell Level|[9] Change Shop Stock|[10] Set to test values|[11] Go to Test Room|[12] Change Stats|[13] Pause/Unpause|[14] Room Speed|[15] Change Shroud Warn|[16] Toggle Mouse Move",-1)
  //==================== CHANGE GAME PROGRESS ====================
  if debugMenu=0
    global.gameProgress=get_integer("Change Game Progress",global.gameProgress)
  //==================== CHANGE LIFE/SPIRIT... ====================
  else if debugMenu=1
  {
    status=show_menu_pos(320,240,"[0] Change Max Life|[1] Change Max Spirit Energy|[2] Change Max Elemental Energy",-1)
    if status=0
    {
      valueChange=get_integer("Change Max Life",maxLife)
      maxLife=valueChange
      fullhealth=show_question("Restore Health?")
      if fullhealth=true
        life=maxLife
      if life>maxLife
        life=maxLife
    }
    else if status=1
    {
      valueChange=get_integer("Change Max Spirit",maxSpiritEnergy)
      maxSpiritEnergy=valueChange
      if spiritEnergy>maxSpiritEnergy
        spiritEnergy=maxSpiritEnergy
    }
    else if status=2
    {
      valueChange=get_integer("Change Max Spirit",maxFireEnergy)
      maxFireEnergy=valueChange
      maxWaterEnergy=valueChange
      maxWindEnergy=valueChange
      maxEarthEnergy=valueChange
      if fireEnergy>maxFireEnergy
        fireEnergy=maxFireEnergy
      if waterEnergy>maxWaterEnergy
        waterEnergy=maxWaterEnergy
      if windEnergy>maxWindEnergy
        windEnergy=maxWindEnergy
      if earthEnergy>maxEarthEnergy
        earthEnergy=maxEarthEnergy
    }
  }
  //==================== CHANGE ITEMS... ====================
  else if debugMenu=2
  {
    items=show_menu_pos(320,240,"[0] Internetz|[1] Keys|[2] Suave Token",-1)
    if items=0
      moneyTotal=get_integer("Change Internetz",moneyTotal)
    else if items=1
      global.p1Keys=get_integer("Change Keys",global.p1Keys)
    else if items=2
      global.hasSuaveToken=get_integer("Suave Token#0:Remove, 1:Equip",global.hasSuaveToken)
  }
  //==================== CHANGE EXP ====================
  else if debugMenu=3
  {
    expCurrent=get_integer("Change Exp",expCurrent)
    expTotal+=expCurrent
  }
  //==================== CHANGE SKILL POINTS ====================
  else if debugMenu=4
    global.p1SkillPoints=get_integer("Change Skill Points",global.p1SkillPoints)
  //==================== CHANGE CURRENT STATUS... ====================
  else if debugMenu=5
  {
    itemFlags=show_menu_pos(320,240,"[0] Restore Spirit|[1] Restore Fire|[2] Restore Water|[3] Restore Wind|[4] Restore Earth|[5] Restore All|[6] Rave Energy|[7] Awesome Points",-1)
    if itemFlags=0
      spiritEnergy=maxSpiritEnergy
    else if itemFlags=1
      fireEnergy=maxFireEnergy
    else if itemFlags=2
      waterEnergy=maxWaterEnergy
    else if itemFlags=3
      windEnergy=maxWindEnergy
    else if itemFlags=4
      earthEnergy=maxEarthEnergy
    else if itemFlags=5
    {
      spiritEnergy=maxSpiritEnergy
      fireEnergy=maxFireEnergy
      waterEnergy=maxWaterEnergy
      windEnergy=maxWindEnergy
      earthEnergy=maxEarthEnergy
    }
    else if itemFlags=6
      global.p1RaveEnergy=raveMax
    else if itemFlags=7
      awesomePoints=get_integer("Change Awesome Points",awesomePoints)
  }
  //==================== TELEPORT ====================
  else if debugMenu=6
  {
    teleport=show_menu_pos(320,240,"[0] X/Y Position|[1] Change Rooms",-1)
    if teleport=0
    {
      xCoord=get_integer("Enter target x coordinate.",x)
      yCoord=get_integer("Enter target y coordinate.",y)
      x=xCoord
      y=yCoord
    }
    else if teleport=1
    {
      teleport=get_integer("Teleport - 0 for cancel#Note: Will crash the game if roomID does not exist.",room)
      if teleport!=0
      {
        xCoord=get_integer("Enter target x coordinate.",0)
        yCoord=get_integer("Enter target y coordinate.",0)
        global.newMapX=xCoord
        global.newMapY=yCoord
        writeToPlayerGlobals()
        room_goto(teleport)
      }
    }
  }
  //==================== KILL ALL ====================
  else if debugMenu=7
  {
    destroy=show_question("This will destroy all objects that extend the oEnemyBase object. Kill?")
    if destroy=true
      with oEnemyBase
        instance_destroy()
  }
  //==================== CHANGE SPELL LEVEL ====================
  else if debugMenu=8
  {
    spellLevel=get_integer("Change Spell Level",1)
    global.techLv=spellLevel
    global.fireLv=spellLevel
    global.waterLv=spellLevel
    global.windLv=spellLevel
    global.earthLv=spellLevel
  }
  //==================== CHANGE SHOP STOCK ====================
  else if debugMenu=9
  {
    shopStock=get_integer("Change Shop Stock",1)
    global.stockWeaponGem=shopStock
    global.stockArmor=shopStock
    global.stockRing=shopStock
  }
  //==================== TEST VALUES ====================
  else if debugMenu=10
  {
    setValues=show_question("This will set all relevant variables to the current progress of the game. Proceed?")
    if setValues=true
    {
      //Distortion (Before Abyss Lord Boss Fight)
      global.gameProgress=62
      global.newMapX=0
      global.newMapY=0
      maxLife+=100
      maxSpiritEnergy+=60
      maxFireEnergy+=30
      maxWaterEnergy+=30
      maxWindEnergy+=30
      maxEarthEnergy+=30
      global.techLv=2
      global.fireLv=2
      global.waterLv=2
      global.windLv=2
      global.earthLv=2
      global.p1TechniqueEquip="MENTAL INSURRECTION"
      expCurrent=81862
      expTotal+=expCurrent
      awesomePoints=8331
      global.p1SkillPoints=11
      global.playTimeHour=1
      global.playTimeMinute=10
      global.p1KillCount=518
      global.deathCount=14
      global.muffins=2
      global.p1WeaponGem=global.invWeaponGems[3]
      global.p1Armor=global.invArmor[3]
      global.p1Ring=global.invRing[3]
      writeToPlayerGlobals()
      for (i=0;i<=6;i+=1)
        global.switchTrigger[i]=1
      for (i=0;i<=0;i+=1)
        global.doorKeys[i]=1
      for (i=0;i<=0;i+=1)
        global.lockedDoors[i]=1
      room_goto(rDistortionW1_3)
    }
  }
  //==================== GO TO TEST ROOM ====================
  else if debugMenu=11
  {
    setValues=show_question("This will bring you to the testing room. Proceed?")
    if setValues=true
    {
      writeToPlayerGlobals()
      room_goto(rTestRoom)
    }
  }
  //==================== CHANGE STATS ====================
  else if debugMenu=12
  {
    statType=show_menu_pos(320,240,"[0] Physical Power|[1] Physical Defense|[2] Spirit Power|[3] Spirit Defense",-1)
    if statType=0
      physicalPower=get_integer("Change Physical Power",physicalPower)
    else if statType=1
      physicalDefense=get_integer("Change Physical Defense",physicalDefense)
    else if statType=2
      spiritPower=get_integer("Change Spirit Power",spiritPower)
    else if statType=3
      spiritDefense=get_integer("Change Spirit Defense",spiritDefense)
  }
  //==================== PAUSE/UNPAUSE ====================
  else if debugMenu=13
  {
    if global.gamePaused=0
      global.gamePaused=1
    else
      global.gamePaused=0
  }
  //==================== ROOM SPEED ====================
  else if debugMenu=14
  {
    //room_speed=get_integer("Change Room Speed.",room_speed)
    //60fps change: oGame sets room_speed every frame from the frame rate (F2), so this is a speed in 30fps terms (30 is
    //normal) that multiplies it
    global.debugSpeedMul=max(1,get_integer("Change Room Speed (30 is normal).",round(30*global.debugSpeedMul)))/30
  }
  //==================== CHANGE SHROUD WARN ====================
  else if debugMenu=15
  {
    global.shroudThreat=get_integer("Change Shroud threat level.",global.shroudThreat)
  }
  //==================== TOGGLE MOUSE MOVE ====================
  else if debugMenu=16
  {
    if global.debugMouseMove=0
      global.debugMouseMove=1
    else
      global.debugMouseMove=0
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.optShowGlow=true and global.p1CurrentElement!=0
{
  draw_set_alpha(0.85)
  draw_set_blend_mode(bm_add)
  if global.p1CurrentElement=1
    //draw_circle_color(x,y-26,32,make_color_rgb(255,0,0),c_black,false)
    draw_circle_color(x,y-26,32,scrElemColor(1,make_color_rgb(255,0,0)),c_black,false) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  else if global.p1CurrentElement=2
    //draw_circle_color(x,y-26,32,make_color_rgb(0,0,255),c_black,false)
    draw_circle_color(x,y-26,32,scrElemColor(2,make_color_rgb(0,0,255)),c_black,false) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  else if global.p1CurrentElement=3
    //draw_circle_color(x,y-26,32,make_color_rgb(0,255,0),c_black,false)
    draw_circle_color(x,y-26,32,scrElemColor(3,make_color_rgb(0,255,0)),c_black,false) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  else if global.p1CurrentElement=4
    //draw_circle_color(x,y-26,32,make_color_rgb(220,110,0),c_black,false)
    draw_circle_color(x,y-26,32,scrElemColor(4,make_color_rgb(220,110,0)),c_black,false) //element colors change: in the colour picked for its element (Element Colors, Options Set 3)
  draw_set_blend_mode(bm_normal)
  draw_set_alpha(1)
}
characterDrawEvent()
if bRaveActive=true //rave glow
{
  draw_set_alpha(0.35)
  raveColor=make_color_rgb(247,190,74)
  draw_set_blend_mode(bm_add)
  draw_circle_color(x,y-27,48,raveColor,c_black,false)
  draw_set_blend_mode(bm_normal)
}
