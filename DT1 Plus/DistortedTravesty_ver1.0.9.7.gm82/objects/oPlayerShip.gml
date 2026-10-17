#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lifeMax=8
life=5
bombMax=4
bomb=4
normalSpd=6
focusSpd=3
moveSpd=normalSpd
bFocus=false
bShooting=false
reShootTime=0
collisionRotate=0
focusRotate=0
bCanTakeDamage=true
damageTime=0
grazeCount=0
oneUpProg=0
bHoming=0

shooterCurrentScore=0
if room=rWindyMountains
  shooterHiScore=global.shotWW_Highscore
else if room=rDataSegmentEntry
  shooterHiScore=global.shotDSE_Highscore

HUD_Event=instance_create(0,0,oEvSkyBaseHUD)
grazer=instance_create(0,0,oPlayerShipGrazer)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  //****************************** CONTROLS ******************************
  //key "focus"
  if keyboard_check(ord(global.ctrlJump))
  {
    bFocus=true
    moveSpd=focusSpd
  }
  else
  {
    bFocus=false
    moveSpd=normalSpd
  }
  //key left
  if (keyboard_check(ord(global.ctrlLeft)) or keyboard_check(vk_left)) and x>16
  {
    //x-=moveSpd
    x-=moveSpd*gDeltaTime //60fps change: per 30fps tick
  }
  //key right
  if (keyboard_check(ord(global.ctrlRight)) or keyboard_check(vk_right)) and x<view_shooter_x-16
  {
    //x+=moveSpd
    x+=moveSpd*gDeltaTime //60fps change: per 30fps tick
  }
  //key up
  if (keyboard_check(ord(global.ctrlUp)) or keyboard_check(vk_up)) and y>16
  {
    //y-=moveSpd
    y-=moveSpd*gDeltaTime //60fps change: per 30fps tick
  }
  //key down
  if (keyboard_check(ord(global.ctrlDown)) or keyboard_check(vk_down)) and y<room_height-16
  {
    //y+=moveSpd
    y+=moveSpd*gDeltaTime //60fps change: per 30fps tick
  }
  //key "shoot"
  if keyboard_check(ord(global.ctrlAttack))
    bShooting=true
  else
    bShooting=false
  //key "bomb"
  if keyboard_check_pressed(ord(global.ctrlTech)) and !instance_exists(oPlayerBomb) and bomb>0
  {
    bomb-=1
    pBomb=instance_create(x,y,oPlayerBomb)
  }
  //key "pause"
  if keyboard_check_pressed(ord("P"))
  {
    global.gamePaused=true
    pauseMenu=instance_create(0,0,oShipPauseMenu)
    pauseMenu.topWord="Paused"
    pauseMenu.bottomWord="Continue"
  }
  //key "element swap forward"
  /*if keyboard_check_pressed(ord(global.ctrlCycleForward))
  {

  }
  //key "element swap back"
  if keyboard_check_pressed(ord(global.ctrlCycleBack))
  {

  }*/

  //reshoot
  if reShootTime>0
    //reShootTime-=1
    reShootTime-=gDeltaTime //60fps change: counts 30fps ticks
  //if bShooting=true and reShootTime=0
  if bShooting=true and reShootTime<=0 //60fps change: <= so it can still fire if the frame rate changes mid-count
  {
    playSound(global.snd_ShipShot,0,0.6)
    newBullet=instance_create(x-4,y-6,oPlayerShooterShot)
    newBullet=instance_create(x+5,y-6,oPlayerShooterShot)
    if bHoming=0
      bHoming=1
    else if bHoming=1
    {
      newBulletHoming=instance_create(x,y,oPlayerShooterHomingShot)
      bHoming=0
    }
    reShootTime=2
  }

  //damage time
  if damageTime>0
  {
    //damageTime-=1
    damageTime-=gDeltaTime //60fps change: counts 30fps ticks
    if scrModPassDown(damageTime,1) //60fps change (added): the blink once per 30fps tick (each time the count passes a whole number)
    { //60fps change (added)
    if image_alpha=0.75
      image_alpha=0.25
    else
      image_alpha=0.75
    } //60fps change (added)
    //if damageTime=0
    if damageTime<=0 //60fps change: <= so it still ends if the frame rate changes mid-count
    {
      image_alpha=1
      bCanTakeDamage=true
    }
  }

  //****************************** SCORE CHECK ******************************
  if shooterHiScore<shooterCurrentScore
  {
    shooterHiScore=shooterCurrentScore
    if room=rWindyMountains
      global.shotWW_Highscore=shooterHiScore
    else if room=rDataSegmentEntry
      global.shotDSE_Highscore=shooterHiScore
  }

  if oneUpProg=0 and shooterCurrentScore>=500000
  {
    life+=1
    oneUpProg+=1
  }
  else if oneUpProg=1 and shooterCurrentScore>=1500000
  {
    life+=1
    oneUpProg+=1
  }
  else if oneUpProg=2 and shooterCurrentScore>=3000000
  {
    life+=1
    oneUpProg+=1
  }

  if life>lifeMax
    life=lifeMax

  //lose condition
  if life<=0
  {
    global.gamePaused=true
    pauseMenu=instance_create(0,0,oShipPauseMenu)
    pauseMenu.topWord="Game Over"
    pauseMenu.bottomWord="Retry"
  }
  //------------------------------------
  //difficulty times
  if global.difficulty=1
    //global.recEasyTime+=1
    global.recEasyTime+=gDeltaTime //60fps change: counts 30fps ticks (as oPlayer1 does)
  else if global.difficulty=2
    //global.recNormalTime+=1
    global.recNormalTime+=gDeltaTime //60fps change: see above
  else if global.difficulty=3
    //global.recHardTime+=1
    global.recHardTime+=gDeltaTime //60fps change: see above
}
#define Mouse_53
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//newEnemy=instance_create(mouse_x,mouse_y,oEnemyShip1)
#define Mouse_54
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*debugMenu=show_menu_pos(320,240,"[0] Change Game Progress|[1] Change Life/Spirit...|[2] Change Items...|[3] Change Exp|[4] Change Skill Points|[5] Change Current Status...|[6] Teleport...|[7] Kill All|[8] Change Spell Level|[9] Change Shop Stock|[10] Set to test values|[11] Go to Test Room|[12] Change Stats",-1)
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
}*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bFocus=true
{
  draw_set_blend_mode(bm_add)
  draw_sprite_ext(sShipFocusEffect,-1,x,y,0.28,0.28,focusRotate,c_white,0.25)
  draw_set_blend_mode(bm_normal)
}
draw_sprite_ext(sPlayerShip,-1,x,y,1,1,0,c_white,image_alpha)
if bFocus=true
{
  //collisionRotate+=1
  collisionRotate+=gDeltaTime //60fps change: per 30fps tick
  //focusRotate+=3
  focusRotate+=3*gDeltaTime //60fps change: per 30fps tick
  draw_sprite_ext(sPlayerShipViewCol,-1,x,y,1,1,collisionRotate,c_white,image_alpha)
}
//draw_sprite(sIdentifier2,-1,mouse_x,mouse_y)
