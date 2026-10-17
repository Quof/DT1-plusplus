#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
loadImage=false

global.debugMenu=0
versionTag="1.0.9.7"
SS_LoopSound(global.msc_TitleMenu)
//check ini
ini_open("GameDetails.ini")
currentCheck="ALPHA"
f1_Level=ini_read_real(currentCheck,"1",1)
f1_Kills=ini_read_real(currentCheck,"304",0)
f1_Deaths=ini_read_real(currentCheck,"305",0)
f1_Awesome=ini_read_real(currentCheck,"13",0)
f1_Location=ini_read_string(currentCheck,"311","Not Started")
f1_Muffins=ini_read_real(currentCheck,"310",0)
f1_GameBeat=ini_read_real(currentCheck,"204",0)
currentCheck="BETA"
f2_Level=ini_read_real(currentCheck,"1",1)
f2_Kills=ini_read_real(currentCheck,"304",0)
f2_Deaths=ini_read_real(currentCheck,"305",0)
f2_Awesome=ini_read_real(currentCheck,"13",0)
f2_Location=ini_read_string(currentCheck,"311","Not Started")
f2_Muffins=ini_read_real(currentCheck,"310",0)
f2_GameBeat=ini_read_real(currentCheck,"204",0)
currentCheck="OMEGA"
f3_Level=ini_read_real(currentCheck,"1",1)
f3_Kills=ini_read_real(currentCheck,"304",0)
f3_Deaths=ini_read_real(currentCheck,"305",0)
f3_Awesome=ini_read_real(currentCheck,"13",0)
f3_Location=ini_read_string(currentCheck,"311","Not Started")
f3_Muffins=ini_read_real(currentCheck,"310",0)
f3_GameBeat=ini_read_real(currentCheck,"204",0)
ini_close()

//decrypt
if f1_Location!="Not Started"
{
  f1_Level=encryptDecrypt(f1_Level,1)
  if f1_Kills>0
    f1_Kills=encryptDecrypt(f1_Kills,1)
  if f1_Deaths>0
    f1_Deaths=encryptDecrypt(f1_Deaths,1)
  if f1_Awesome>0
    f1_Awesome=encryptDecrypt(f1_Awesome,1)
}
if f2_Location!="Not Started"
{
  f2_Level=encryptDecrypt(f2_Level,1)
  if f2_Kills>0
    f2_Kills=encryptDecrypt(f2_Kills,1)
  if f2_Deaths>0
    f2_Deaths=encryptDecrypt(f2_Deaths,1)
  if f2_Awesome>0
    f2_Awesome=encryptDecrypt(f2_Awesome,1)
}
if f3_Location!="Not Started"
{
  f3_Level=encryptDecrypt(f3_Level,1)
  if f3_Kills>0
    f3_Kills=encryptDecrypt(f3_Kills,1)
  if f3_Deaths>0
    f3_Deaths=encryptDecrypt(f3_Deaths,1)
  if f3_Awesome>0
    f3_Awesome=encryptDecrypt(f3_Awesome,1)
}

//initialize player stats
global.p1Level=1
global.p1MaxLife=2000
global.p1Life=global.p1MaxLife
global.p1TotalExp=0
global.p1CurrentExp=0
global.p1ExpNext=round((global.p1Level+0.9)*(global.p1Level+0.8)*(global.p1Level+0.7)*7)
global.p1PhysicalPower=0
global.p1PhysicalDefense=10
global.p1SpiritPower=0
global.p1SpiritDefense=5
global.p1MoneyTotal=100
global.p1MoneyMax=1000
global.p1Awesome=0
global.p1RaveEnergy=0
global.p1SkillPoints=0
global.p1HeartPieces=0

//element levels
global.techLv=0
global.fireLv=1
global.waterLv=1
global.windLv=1
global.earthLv=1

//spirit and element stats
global.p1MaxSpiritEnergy=1000
global.p1SpiritEnergy=global.p1MaxSpiritEnergy
global.p1MaxFireEnergy=1000
global.p1FireEnergy=global.p1MaxFireEnergy
global.p1MaxWaterEnergy=1000
global.p1WaterEnergy=global.p1MaxWaterEnergy
global.p1MaxWindEnergy=1000
global.p1WindEnergy=global.p1MaxWindEnergy
global.p1MaxEarthEnergy=1000
global.p1EarthEnergy=global.p1MaxEarthEnergy

//resistances
global.p1FIREresist=0
global.p1WATERresist=0
global.p1WINDresist=0
global.p1EARTHresist=0

//weapon
global.p1CurrentElement=0 //relates to which element is equipped on the weapon
//0=None,1=Fire,2=Water,3=Wind,4=Earth
global.p1TechniqueEquip=""
global.p1SpellEquip=""
global.p1FireEquip="FIREBALL"
global.p1WaterEquip="WATER BLAST"
global.p1WindEquip="WIND BURST"
global.p1EarthEquip="ROCK SMASH"

//important item flags
global.hasWindBoots=true
global.hasSuaveToken=false
global.hasItemFinder=0

//skill tree data
global.SkSharpen=0
global.SkComboMaster=0
global.SkSmash=0
global.SkExpertise=0
global.SkDashPower=0
global.SkStrategist=0
//----------
global.SkFireAffinity=0
global.SkWaterAffinity=0
global.SkWindAffinity=0
global.SkEarthAffinity=0
//------------------------------
global.SkFireResist=0
global.SkWaterResist=0
global.SkWindResist=0
global.SkEarthResist=0
global.SkIronBody=0
global.SkFreeSpirit=0
global.SkAgility=0
global.SkSwiftFoot=0
global.SkQuickRecovery=0
//----------
global.SkPrecision=0
global.SkPerfection=0
global.SkVirtue=0
global.SkSpiritMaster=0
//------------------------------
global.SkFireMastery=0
global.SkFireCraft=0
global.SkProtection=0
//----------
global.SkWaterMastery=0
global.SkWaterCraft=0
global.SkElementalMaster=0
//----------
global.SkWindMastery=0
global.SkWindCraft=0
global.SkGoodFortune=0
global.SkStatistician=0
//----------
global.SkEarthMastery=0
global.SkEarthCraft=0
global.SkFaith=0

//play time
global.playTimeHour=0
global.playTimeMinute=0
global.playTimeSecond=0
global.playTimeFrameCount=0
global.gameRank=0

//========================================
//============== game flags ==============
//========================================
global.maxSkillCapsules=131   //131 max
global.maxMoneyChest=34      //add money and item chest together (with the 18 bead chests)
global.maxItemChest=41       //95 currently
global.maxHeartPiece=51
global.maxSpiritAuras=19
global.maxTechCapsules=9
//skill capsules
for (i=0;i<=global.maxSkillCapsules;i+=1)
  global.skillCapsules[i]=0
//money chests
for (i=0;i<=global.maxMoneyChest;i+=1)
  global.moneyChest[i]=0
//item chests
for (i=0;i<=global.maxItemChest;i+=1)
  global.itemChest[i]=0
//heart pieces
for (i=0;i<=global.maxHeartPiece;i+=1)
  global.heartPiece[i]=0
//spirit auras
for (i=0;i<=global.maxSpiritAuras;i+=1)
  global.spiritAuras[i]=0
//tech capsules
for (i=0;i<=global.maxTechCapsules;i+=1)
  global.techCapsule[i]=0

global.maxSwitchTriggers=14
global.maxDoors=9
//global switch triggers
for (i=0;i<=global.maxSwitchTriggers;i+=1)
  global.switchTrigger[i]=0
//door keys/locked doors
for (i=0;i<=global.maxDoors;i+=1)
{
  global.doorKeys[i]=0
  global.lockedDoors[i]=0
}

//map data
for (i=0;i<1;i+=1) //cell_1=dungeonNum, cell_2=roomNum
{
  for (ii=0;ii<24;ii+=1)
    global.dungeonMapData[i,ii]=0
}
for (i=0;i<1;i+=1) //cell_1=dungeonNum, cell_2=dungeonItem, 0:map, 1:compass
{
  for (ii=0;ii<2;ii+=1)
    global.dungeonItems[i,ii]=0
}

//game state data
global.gameProgress=-10          //the game's global progress state
global.currentQuestLog=0         //which file the player is using
global.saveEnabled=true          //if the player can save
global.gamePaused=true           //if the game is paused
global.gameOver=false            //if the game over screen is showing
global.showHUD=false             //if the HUD should be displayed
global.showArea=false            //if area name should be shown
global.cutscene=false            //used so the character can be moved during cutscenes easier
global.currentBoss=""            //the current boss battle in progress
global.p1KillCount=0             //the player's kill count
global.deathCount=0              //how many times the player has lost
global.menuPosition=1            //which submenu the player is in
global.difficulty=2              //game difficulty. 1=Easy, 2=Normal(default), 3=Hard, 4=Very Hard
global.newMapX=0                 //where to place the player on a new map
global.newMapY=0                 //where to place the player on a new map
global.worldMapX=0               //current position on the world map
global.worldMapY=0               //current position on the world map
for (i=0;i<=5;i+=1)
  global.pStatusStore[i]=0       //status before boss fight starts
global.p1Keys=0                  //key amount
global.killingSpree=0            //current kills in killing spree
global.killSpreeSoundCheck=0     //checks the sound being played
global.muffins=0                 //current amount of muffins
global.location="Not Started"    //your general location
global.screenWindowDouble=false  //if window is set to 2x mode
global.rbSwitchBlueOn=false      //which switch color is active
global.levelLimer[0]=0           //current timer (countdown)
global.levelLimer[1]=0           //set timer (when map changes or a gameover occurs)
global.targetMap=""              //used when leaving the data center
global.targetMapX=0              //used when leaving the data center
global.targetMapY=0              //used when leaving the data center
global.resetNewMapXY=false       //used when leaving the data center
global.resetMusic=false          //used for the save room
global.teleportEnabled=2         //if the player can use the teleport skill
//0:can use, 1:can't use (set to 0 if Game Over), 2: can't use
global.sessionPlayTime=0         //how long the player has been playing this play session
global.shroudThreat=0            //shroud threat level
global.sofsMax=0                 //highest floor set reached in Spire of Forgotten Souls
global.sofsCurrent=0             //current floor set in Spire of Forgotten Souls
global.soundAmplify=1            //sound frequency multiplier
global.quickGameOver=0           //Speed up Game Over sequence
global.castedSpell=0             //Spell that is being cast

//shooter high scores
global.shotWW_Highscore=0
global.shotDSE_Highscore=0

//timer
global.cTimerMinute=0
global.cTimerSecond=0
global.cTimerHundred=0

//area specific progress
global.MMnapalmProg=0
global.MMgyroProg=0
global.MMdiveProg=0
global.MMmysteryProg=0
for(i=0;i<4;i+=1)
  global.VDportals[i]=0

//records page 1
global.recPhysicalAttacks=0
global.recPhysicalHitsConnected=0
global.recTechsUsed=0
global.recTechsConnected=0
global.recSpellsCast=0
global.recSpellsConnected=0
global.recDashedForward=0
global.recDashedBackward=0
//records page 2
global.recDamageDealt=0
global.recDamageTaken=0
global.recTakenDamageNumber=0
global.recMaxHitCombo=0
global.recMaxKillChain=0
global.recMaxKillingSpree=0
global.recCrippledTargetNumber=0
global.recElementsFused=0
global.recEnemiesScanned=0
global.recLongestIdleTime=0
global.recPeopleTalkedTo=0
global.recJumped=0
global.recAirDashed=0
global.recMostPowerfulJumpAttack=0
//records page 3
global.recUsedRaveMode=0
global.recAchievementsCompleted=0
global.recWeakestHit=0
global.recStrongestHitInRave=0
global.recStrongestHitNoRave=0
global.recSavedNumber=0
global.recFallenOffLevelNumber=0
global.recItemsUsed=0
global.recItemsBought=0
global.recTotalInternetzEarned=0
global.recTotalInternetzSpent=0
global.recOpenedMenuNumber=0
global.recUsedAreaExit=0
global.recObjectsBroken=0
//records page 4
global.recDistanceRun=0
global.recDistanceInAir=0
global.recQuestionMarkBlocksHit=0
global.recSeenKirby=0
global.recSeenMichaelJackson=0
global.recSignsRead=0
global.recBinariesRead=0
global.recEasyTime=0
global.recNormalTime=0
global.recHardTime=0
//records page 5
global.recTimeSpentOffscreen=0
global.recBusterShotsUsed=0
global.recMaxBubbles=0
global.recBlazingAppear=0

//options flags
global.optLowHealthWarn=true
global.optShowExpEarned=true
global.optShowDamage=true
global.optEnemyStatus=true
global.optKeepMenuPosition=false
global.optMusic=100
global.optSound=100
global.optIdentifier=100
global.optShowGlow=false

global.optKillChainScreen=true
global.optKillChainSound=true
global.optKillingSpreeScreen=true
global.optKillingSpreeSound=true
global.optCombo=true
global.optShowAwesome=true
global.optEnemyHP=true
global.optGameDetail=1

global.optDPadDash=1
global.optRightIsForward=1
global.optShowHUD=1
global.optDashWarn=0

//main characters
global.mainCharacters[0]="Jerry"           //Protagonist
global.mainCharacters[1]="Jeremy"          //Protagonist's Sidekick
global.mainCharacters[2]="The Darkness"    //The Dark Entity
global.mainCharacters[3]="Hexor"           //The Bad Hacker
global.mainCharacters[4]="The Informant"   //The Darkness' Spy
global.mainCharacters[5]="Syrus"           //Protagonists' friend

//items
global.invWeaponGems[0]="Amethyst"
global.invWeaponGems[1]="Emerald"
global.invWeaponGems[2]="Garnet"
global.invWeaponGems[3]="Hematite"
global.invWeaponGems[4]="Ivory"
global.invWeaponGems[5]="Jade"
global.invWeaponGems[6]="Jasper"
global.invWeaponGems[7]="Lapis Lazuli"
global.invWeaponGems[8]="Malachite"
global.invWeaponGems[9]="Opal"
global.invWeaponGems[10]="God Hand"

global.invArmor[0]="Feather Jacket"
global.invArmor[1]="Linen Jacket"
global.invArmor[2]="Durable Jacket"
global.invArmor[3]="Velvet Jacket"
global.invArmor[4]="Exquisite Jacket"
global.invArmor[5]="Darkmoon Jacket"
global.invArmor[6]="Faerie Jacket"
global.invArmor[7]="Ancestral Jacket"
global.invArmor[8]="Azure Jacket"
global.invArmor[9]="Awesome Jacket"

global.invRing[0]="Chrome Ring"
global.invRing[1]="Elegant Ring"
global.invRing[2]="Protection Ring"
global.invRing[3]="Signet Ring"
global.invRing[4]="Moon Ring"
global.invRing[5]="Cobalt Ring"
global.invRing[6]="Coral Ring"
global.invRing[7]="Silver Ring"
global.invRing[8]="Sacred Ring"
global.invRing[9]="Shadow Ring"
global.invRing[10]="Twilight Ring"
global.invRing[11]="Diamond Ring"

/*
********** Bracelet Beads **********
Value meaning: 0-Don't have, 1-Acquired, 2-Equipped S1, 3-Equipped S2, 4-Equipped S3, 5-Equipped S4
0: Sword
1: Shield
2: Mage
3: Mental
4: Triforce
5: Fire
6: Water
7: Wind
8: Earth
9: Elemental
10: Vamp
11: Spirit
12: Ribbon
13: Revenge
14: Rave
15: Trap
16: Stun
17: Poison
*/
for(i=0;i<18;i+=1)
  global.invBracelet[i]=0

//equipment
global.p1WeaponGem=global.invWeaponGems[0]
global.p1Armor=global.invArmor[0]
global.p1Ring=global.invRing[0]
global.p1BraceletSlots=1

//shop prices
global.priceWeaponGem=40
global.priceArmor=30
global.priceRing=20
global.priceBracelet=100

//if value is above 0, a new item is in stock
global.stockWeaponGem=0
global.stockArmor=0
global.stockRing=0

global.p1Skittles=3
global.p1Smoothie=1
global.p1Starburst=1
global.p1GummyBears=1

//controls
global.ctrlUp="W"
global.ctrlDown="S"
global.ctrlLeft="A"
global.ctrlRight="D"
global.ctrlAttack="K"
global.ctrlJump="J"
global.ctrlTech="L"
global.ctrlSpell="O"
global.ctrlCycleBack="U"
global.ctrlCycleForward="I"
global.ctrlAbilityBack="Z"
global.ctrlAbilityForward="C"
global.ctrlRave="M"
global.ctrlDashLeft="Q"
global.ctrlDashRight="E"

global.debugMouseMove=0

//initialize start up screen --------------------------------------------------
fileCursorPos=1
fileCursorX=84
fileCursorY=240
cursorMoveInc=86
arraySizeMin=1
arraySizeMax=5
chooseNewGame=false
recRed=0
bFadeInRed=true
fade=0 //screen fade when file choice made
sFade=0
//intro data
introProgress=0
loadingType=""
controlHelp="If I remembered how I programmed this,#then the controls for cursor movement is:#[A] Left     [D] Right#And I'm sure other stuff is:#[J] Confirm     [K] Cancel"

loadImage=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//cursor movement
if keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) and fade=0
{
  playSound(global.snd_MenuCursor,0,1)
  if fileCursorPos<arraySizeMax
  {
    fileCursorX+=cursorMoveInc
    fileCursorPos+=1
  }
  else
  {
    fileCursorPos=arraySizeMin
    if arraySizeMin=1
      fileCursorX-=cursorMoveInc*(arraySizeMax-1)
    else if arraySizeMin=2
      fileCursorX-=cursorMoveInc*(arraySizeMax-2)
    else
      fileCursorX-=cursorMoveInc*(arraySizeMax-1)
  }
}
else if keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) and fade=0
{
  playSound(global.snd_MenuCursor,0,1)
  if fileCursorPos>arraySizeMin
  {
    fileCursorX-=cursorMoveInc
    fileCursorPos-=1
  }
  else
  {
    fileCursorPos=arraySizeMax
    if arraySizeMax=5
      fileCursorX+=cursorMoveInc*(arraySizeMax-1)
    else if arraySizeMax=4
      fileCursorX+=cursorMoveInc*(arraySizeMax-2)
    else
      fileCursorX+=cursorMoveInc*(arraySizeMax-1)
  }
}

//start game
if keyboard_check_pressed(ord("J")) and fade=0
{
  if chooseNewGame=true
  {
    playSound(global.snd_PressStart,0,1)
    if introProgress=0
    {
      global.currentQuestLog=fileCursorPos-1
      fade=1
    }
    else
    {
      SS_StopSound(global.msc_TitleMenu)
      global.difficulty=fileCursorPos
      room_goto(rIEFtutorial)
    }
  }
  else
  {
    if fileCursorPos=1
    {
      playSound(global.snd_MenuConfirm,0,1)
      chooseNewGame=true
      fileCursorPos=2
      fileCursorX+=cursorMoveInc
      arraySizeMin=2
      arraySizeMax=4
    }
    else if fileCursorPos=2 or fileCursorPos=3 or fileCursorPos=4
    {
      if fileCursorPos=2
        sectionRead="ALPHA"
      else if fileCursorPos=3
        sectionRead="BETA"
      else if fileCursorPos=4
        sectionRead="OMEGA"
      if sectionRead="ALPHA" and f1_Location!="Not Started"
      {
        loadSaveData(0)
        global.resetMusic=true
        SS_StopSound(global.msc_TitleMenu)
        room_goto(rDataCenter)
      }
      else if sectionRead="BETA" and f2_Location!="Not Started"
      {
        loadSaveData(0)
        global.resetMusic=true
        SS_StopSound(global.msc_TitleMenu)
        room_goto(rDataCenter)
      }
      else if sectionRead="OMEGA" and f3_Location!="Not Started"
      {
        loadSaveData(0)
        global.resetMusic=true
        SS_StopSound(global.msc_TitleMenu)
        room_goto(rDataCenter)
      }
    }
    else if fileCursorPos=5
      game_end()
  }
}

if f1_GameBeat>0 or f2_GameBeat>0 or f3_GameBeat>0 //Go to Boss Rush room
{
  if keyboard_check_pressed(ord("P"))
  {
    for(i=0;i<18;i+=1)
      global.invBracelet[i]=1
    global.p1BraceletSlots=3
    global.difficulty=2
    global.p1SkillPoints=80
    SS_StopSound(global.msc_TitleMenu)
    room_goto(rBR_Main)
  }
}

if keyboard_check_pressed(ord("K")) and fade=0 and introProgress=0
{
  if chooseNewGame=true
  {
    playSound(global.snd_MenuCancel,0,1)
    chooseNewGame=false
    fileCursorPos=1
    fileCursorX=86
    arraySizeMin=1
    arraySizeMax=5
  }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(oGame)
  SS_Unload()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if loadImage=false
{
  //loadingBar=121
  draw_set_alpha(1)
  draw_set_font(fnt_Continue)
  draw_set_halign(fa_center)
  draw_set_color(c_ltgray)
  draw_rectangle(202,156,370,162,false)
  draw_set_color(c_white)
  draw_rectangle(202,156,370,162,true)
  draw_set_color(c_green)
  draw_text(244,112,"Loading External Files")
  draw_rectangle(203,157,203+loadingBar,161,false)
  draw_text(244,170,"Loading: " +string(loadingType))
}
else
{
  //file slots
  draw_set_color(c_black)
  draw_set_alpha(0.3)
  draw_rectangle(269,301,500,380,0) //control help darken
  draw_rectangle(48,149,464,200,0) //cursor tip darken
  if chooseNewGame=false
    draw_sprite(sFileSlots,0,84,256)
  else
    draw_sprite_ext(sFileSlots,0,84,256,1,1,0,c_green,1)
  draw_sprite(sFileSlots,1,170,256)
  draw_sprite(sFileSlots,2,256,256)
  draw_sprite(sFileSlots,3,342,256)
  if chooseNewGame=false
    draw_sprite(sFileSlots,4,428,256)
  else
    draw_sprite_ext(sFileSlots,4,428,256,1,1,0,c_gray,1)
  draw_set_alpha(1)
  draw_set_font(fnt_showMessage)
  draw_set_halign(fa_left)
  textDropShadow(controlHelp,272,302,c_white,c_black,3)
  textDropShadow("Game by ZephyrBurst",3,368,c_white,c_black,1)
  textDropShadow("Version: " +string(versionTag),3,3,c_white,c_black,1)

  //quest records
  draw_set_font(fnt_SubMenu)
  draw_set_color(c_black)
  draw_rectangle(16,292,236,365,false)
  draw_set_color(c_white)
  draw_rectangle(16,292,236,365,true)
  draw_text(19,292,"Level:")
  draw_text(19,304,"Kills:")
  draw_text(19,316,"Deaths:")
  draw_text(19,328,"Awesome:")
  draw_text(19,340,"Location:")
  draw_text(19,352,"Muffins:")
  draw_set_halign(fa_right)
  if fileCursorPos=2
  {
    draw_text(233,292,f1_Level)
    draw_text(233,304,f1_Kills)
    draw_text(233,316,f1_Deaths)
    draw_text(233,328,f1_Awesome)
    draw_text(233,340,f1_Location)
    draw_text(233,352,f1_Muffins)
    if f1_GameBeat>0
      draw_sprite(sAllItemIcon,0,219,359)
  }
  if fileCursorPos=3
  {
    draw_text(233,292,f2_Level)
    draw_text(233,304,f2_Kills)
    draw_text(233,316,f2_Deaths)
    draw_text(233,328,f2_Awesome)
    draw_text(233,340,f2_Location)
    draw_text(233,352,f2_Muffins)
    if f2_GameBeat>0
      draw_sprite(sAllItemIcon,0,219,359)
  }
  if fileCursorPos=4
  {
    draw_text(233,292,f3_Level)
    draw_text(233,304,f3_Kills)
    draw_text(233,316,f3_Deaths)
    draw_text(233,328,f3_Awesome)
    draw_text(233,340,f3_Location)
    draw_text(233,352,f3_Muffins)
    if f3_GameBeat>0
      draw_sprite(sAllItemIcon,0,219,359)
  }

  if f1_GameBeat>0 or f2_GameBeat>0 or f3_GameBeat>0 //Boss Rush Reminder
  {
    draw_set_halign(fa_left)
    textDropShadow("Press [P] to find yourself in the Boss Room!",24,277,c_white,c_black,1)
  }
  if f1_GameBeat=6 or f2_GameBeat=6 or f3_GameBeat=6 //Debug Mode Reminder
  {
    draw_set_halign(fa_left)
    textDropShadow("S Rank Bonus: Press [Enter] in the save room and type in 'cheesecake'.#You can then access a few debug options with right click.#Some keyboard buttons do things too!",40,198,c_white,c_black,1)
  }

  //slot descriptions
  draw_set_font(fnt_showMessage)
  draw_set_halign(fa_center)
  if chooseNewGame=false
  {
    if fileCursorPos=1
      cursorTip="This option is for starting a new game. You can start a new game by#pressing the confirm key here."
    else if fileCursorPos=2
      cursorTip="Load your game from File 1.#This is usually the file most people choose to play from."
    else if fileCursorPos=3
      cursorTip="Load your game from File 2.#You're either trying to be different or someone else is#using the first slot."
    else if fileCursorPos=4
      cursorTip="Load your game from File 3.#This slot is corrupted at times."
    else if fileCursorPos=5
      cursorTip="Use this option to close the game. However in doing so, the game may#delete random data in your registry."
  }
  else
    cursorTip="You must now select the file you want to start a new game in.#Don't question it, just do it."
  draw_set_color(c_black)
  draw_set_alpha(1)
  draw_text(257,153,cursorTip) //br
  draw_text(255,153,cursorTip) //bl
  draw_text(257,151,cursorTip) //tr
  draw_text(255,151,cursorTip) //tl
  draw_set_color(c_white)
  draw_text(256,152,cursorTip)
  //file cursor
  draw_sprite(sPlayerWalk,-1,fileCursorX,fileCursorY)

  if introProgress=0
  {
    draw_set_blend_mode(bm_add)
    draw_set_color(c_red)
    draw_set_alpha(recRed)
    if bFadeInRed=true
    {
      //recRed+=0.002
      recRed+=0.002*gDeltaTime //60fps change: per 30fps tick
      if recRed>=0.2
        bFadeInRed=false
    }
    else
    {
      //recRed-=0.002
      recRed-=0.002*gDeltaTime //60fps change: per 30fps tick
      if recRed<=0
        bFadeInRed=true
    }
    draw_rectangle(0,0,view_wview,view_hview,false)
  }
  draw_set_blend_mode(bm_normal)
  //screen fade after file choice made
  draw_set_alpha(sFade)
  draw_set_color(c_black)
  draw_rectangle(0,0,view_wview,view_hview,false)
  if fade>0
  {
    if introProgress=0
      //sFade+=1 //+=0.01
      sFade+=gDeltaTime //+=0.01 //60fps change: counts 30fps ticks

    if sFade>=1 and introProgress=0
    {
      fileCursorPos=2
      fileCursorX=216
      fileCursorY=179
      cursorMoveInc=128
      arraySizeMin=1
      arraySizeMax=4
      fade=0
      introProgress=1
    }
  }
  if introProgress=1
  {
    if fileCursorPos=1
      draw_sprite(sDifficultySelect,0,256,64)
    else
      draw_sprite_ext(sDifficultySelect,0,256,64,0.7,0.7,0,c_white,0.5)

    if fileCursorPos=2
      draw_sprite(sDifficultySelect,1,256,128)
    else
      draw_sprite_ext(sDifficultySelect,1,256,128,0.7,0.7,0,c_white,0.5)

    if fileCursorPos=3
    {
      draw_sprite(sDifficultySelect,2,256,192)
      draw_set_color(make_color_rgb(247,190,74))
      draw_set_halign(fa_center)
      draw_set_font(fnt_MessageMenu)
      draw_text(256,305,"Can and most likely will induce a bit of rage#However you can switch to an easier setting during#the game if this is too much.")
    }
    else
      draw_sprite_ext(sDifficultySelect,2,256,192,0.7,0.7,0,c_white,0.5)

    if fileCursorPos=4
    {
      draw_sprite(sDifficultySelect,3,256,256)
      draw_sprite(sWarningSymbol,-1,56,332)
      draw_sprite(sWarningSymbol,-1,456,332)
      draw_set_color(make_color_rgb(247,190,74))
      draw_set_halign(fa_center)
      draw_set_font(fnt_MessageMenu)
      draw_text(256,298,"!! WARNING !!#Playing on this setting may... no, WILL induce madness.#You cannot switch to an easier setting once you choose this.#Not for the weak of heart. You have been warned.")
    }
    else
      draw_sprite_ext(sDifficultySelect,3,256,256,0.7,0.7,0,c_white,0.5)
  }
}
