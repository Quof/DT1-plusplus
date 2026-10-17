#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//check for new game progress
if global.gameProgress=69
  global.gameProgress=70
//initialize variables
if !SS_IsSoundLooping(global.msc_WorldMapDistorted)
  stopAllMusic()

if global.gameProgress>=275
{
  redMapTint=instance_create(0,0,oWorldMapRedTint)
  if !SS_IsSoundLooping(global.msc_WorldMapDistorted)
  {
    var tempMplay;
    tempMplay=global.msc_WorldMapDistorted
    playMusic(tempMplay,0)
    SS_SetSoundFreq(tempMplay,22050)
  }
}
else
{
  var tempMplay;
  tempMplay=global.msc_WorldMap
  playMusic(tempMplay,0)
}

global.showArea=true
global.newMapX=0
global.newMapY=0
itemCheck=true
choseLevel=0
sceneProgress=0
locCircleSize=16
locSizeChange=0
gridAlpha=0
gridFadeTime=-45
for (i=0;i<=32;i+=1)
  gridEffect[i]=16*i
//place down map levels
lDonutPlains=instance_create(384,112,oMapLevel)
lDonutPlains.zoneName="Donut Plains"
lDonutPlains.zoneLoc1=rDonutPlains1
lDonutPlains.sprite_index=sWorldMapLevel1

lToadTown=instance_create(416,96,oMapLevel)
lToadTown.zoneName="Toad Town"
lToadTown.zoneLoc1=rToadTown
lToadTown.sprite_index=sWorldMapTown
if global.gameProgress>=20
{
  lRumpyMountains=instance_create(448,96,oMapLevel)
  lRumpyMountains.zoneName="Rumpy Mountains"
  lRumpyMountains.zoneLoc1=rRumpyMountains1
  lRumpyMountains.sprite_index=sWorldMapLevel2
}
if global.gameProgress>=23
{
  lOldCastle=instance_create(480,112,oMapLevel)
  lOldCastle.zoneName="Old Castle"
  lOldCastle.zoneLoc1=rOldCastle1
  lOldCastle.sprite_index=sWorldMapDungeon1
}
if global.gameProgress>=35
{
  lDarkDepths=instance_create(368,144,oMapLevel)
  lDarkDepths.zoneName="Dark Depths"
  lDarkDepths.zoneLoc1=rDarkDepths1
  lDarkDepths.sprite_index=sWorldMapLevel3

  lBBFort=instance_create(416,144,oMapLevel)
  lBBFort.zoneName="Extra: Bullet Bill Fort"
  lBBFort.zoneLoc1=rBulletBillFort1
}
if global.gameProgress>=50
{
  lVegetableGarden=instance_create(304,144,oMapLevel)
  lVegetableGarden.zoneName="Vegetable Garden"
  lVegetableGarden.zoneLoc1=rVegetableGarden1
  lVegetableGarden.sprite_index=sWorldMapLevel4
}
if global.gameProgress>=69
{
  lDistortion1=instance_create(16,96,oMapLevel)
  lDistortion1.zoneName="Distortion 1"
  lDistortion1.zoneLoc1=rDistortionW1_1
  lDistortion1.sprite_index=sWorldMapDistortion

  lDustyRuins=instance_create(352,192,oMapLevel)
  lDustyRuins.zoneName="Dusty Ruins"
  lDustyRuins.zoneLoc1=rDustyRuins1
  lDustyRuins.sprite_index=sWorldMapDungeon1
}
if global.gameProgress>=81
{
  lAbstracity=instance_create(368,240,oMapLevel)
  lAbstracity.zoneName="Abstracity"
  lAbstracity.zoneLoc1=rAbstracity
  lAbstracity.sprite_index=sWorldMapTown

  lCheeseGarden=instance_create(320,176,oMapLevel)
  lCheeseGarden.zoneName="Extra: Cheese Garden"
  lCheeseGarden.zoneLoc1=rCheeseGarden1
}
if global.gameProgress>=86
{
  lFrightTrain=instance_create(416,240,oMapLevel)
  lFrightTrain.zoneName="Fright Train"
  lFrightTrain.zoneLoc1=rFrightTrain1
  lFrightTrain.sprite_index=sWorldMapLevel2
}
if global.gameProgress>=99
{
  lWestSideJungle=instance_create(368,288,oMapLevel)
  lWestSideJungle.zoneName="West Side Jungle"
  lWestSideJungle.zoneLoc1=rWestSideJungle1
  lWestSideJungle.sprite_index=sWorldMapLevel4
}
if global.gameProgress>=108
{
  lTheHideout=instance_create(352,336,oMapLevel)
  lTheHideout.zoneName="The Hideout"
  lTheHideout.zoneLoc1=rTheHideout1
  lTheHideout.sprite_index=sWorldMapDungeon1

  lDirtyRuins=instance_create(320,224,oMapLevel)
  lDirtyRuins.zoneName="Extra: Dirty Ruins"
  lDirtyRuins.zoneLoc1=rDirtyRuins1
}
if global.gameProgress>=128
{
  lIEF=instance_create(352,48,oMapLevel)
  lIEF.zoneName="Integrated Electrical Factory"
  lIEF.zoneLoc1=rIEF1
  lIEF.sprite_index=sWorldMapDungeon1

  lDistortion2=instance_create(16,128,oMapLevel)
  lDistortion2.zoneName="Distortion 2"
  lDistortion2.zoneLoc1=rDistortionW2_1
  lDistortion2.sprite_index=sWorldMapDistortion

  lMetropolis=instance_create(320,272,oMapLevel)
  lMetropolis.zoneName="Metropolis"
  if global.gameProgress>=133
    lMetropolis.zoneLoc1=rMetropolisStageSelect
  else
    lMetropolis.zoneLoc1=rMetropolisM1
  lMetropolis.sprite_index=sWorldMapLevel3
}
if global.gameProgress>=151
{
  lBRF=instance_create(272,240,oMapLevel)
  lBRF.zoneName="Black Rock Fortress"
  lBRF.zoneLoc1=rBRF_Entrance
  lBRF.sprite_index=sWorldMapDungeon2
}
if global.gameProgress>=183
{
  lWindySlopes=instance_create(240,272,oMapLevel)
  lWindySlopes.zoneName="Windy Slopes"
  lWindySlopes.zoneLoc1=rWindySlopes1
  lWindySlopes.sprite_index=sWorldMapLevel5

  lMaverickFactory=instance_create(336,304,oMapLevel)
  lMaverickFactory.zoneName="Extra: Maverick Factory"
  lMaverickFactory.zoneLoc1=rMaverickFactory1

  lSoFS=instance_create(192,160,oMapLevel)
  lSoFS.zoneName="Spire of Forgotten Souls"
  lSoFS.zoneLoc1=rSoFS_Entrance
  lSoFS.sprite_index=sWorldMapDungeon3
}
if global.gameProgress>=215
{
  lDistortion3=instance_create(16,160,oMapLevel)
  lDistortion3.zoneName="Distortion 3"
  lDistortion3.zoneLoc1=rDistortionW3_1
  lDistortion3.sprite_index=sWorldMapDistortion
}
if global.gameProgress>=221
{
  lSkyBase=instance_create(192,208,oMapLevel)
  lSkyBase.zoneName="Sky Base"
  lSkyBase.zoneLoc1=rSkyBase
  lSkyBase.sprite_index=sWorldMapDistortion

  lVeiledDetritus=instance_create(176,304,oMapLevel)
  lVeiledDetritus.zoneName="Veiled Detritus"
  lVeiledDetritus.zoneLoc1=rVeiledDetritus1
  lVeiledDetritus.sprite_index=sWorldMapDungeon1
}
if global.gameProgress>=242
{
  lShadyWoods=instance_create(144,256,oMapLevel)
  lShadyWoods.zoneName="Shady Woods"
  lShadyWoods.zoneLoc1=rShadyWoods1
  lShadyWoods.sprite_index=sWorldMapLevel1
}
if global.gameProgress>=275
{
  lDistortion4=instance_create(16,192,oMapLevel)
  lDistortion4.zoneName="Distortion 4"
  lDistortion4.zoneLoc1=rDistortionW4_1
  lDistortion4.sprite_index=sWorldMapDistortion

  lShadyCaves=instance_create(128,208,oMapLevel)
  lShadyCaves.zoneName="Shady Caves"
  lShadyCaves.zoneLoc1=rShadyCaves1
  lShadyCaves.sprite_index=sWorldMapLevel3
}
if global.gameProgress>=279
{
  lStalagmite=instance_create(112,320,oMapLevel)
  lStalagmite.zoneName="Extra: Stalagmite Ruins"
  lStalagmite.zoneLoc1=rStalagmiteRuins1
}
if global.gameProgress>=281
{
  lDataSegment=instance_create(80,96,oMapLevel)
  lDataSegment.zoneName="Secured Data Segment"
  lDataSegment.zoneLoc1=rDataSegment1
  lDataSegment.sprite_index=sWorldMapDungeon4
}
if global.gameProgress>=324
{
  lPrimaryMemory=instance_create(128,64,oMapLevel)
  lPrimaryMemory.zoneName="Final: Primary Memory"
  lPrimaryMemory.zoneLoc1=rPrimaryMemory1
  lPrimaryMemory.sprite_index=sWorldMapDistortion
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//world map functions
if global.gameProgress=16 //intro to World Map
{
  if sceneProgress=0
  {
    for (i=0;i<=0;i+=1)
      charDialogue[i]=0
    sceneProgress+=1
    convo[0]=0
  }
  else if charDialogue[0]=0
  {
    stringToShow="Nice, it's a world map.#And I've already figured out how to use it."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),256,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[1]; newMessage.window=1
    newMessage.fadingTime=150
    charDialogue[0]+=1
  }
  else if charDialogue[0]=1
  {
    //convo[0]+=1
    convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
    if convo[0]>=120
      charDialogue[0]+=1
  }
  else if charDialogue[0]=2
  {
    convo[0]=0
    stringToShow="Fill me in on how it works."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),120,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]+=1
  }
  else if charDialogue[0]=3
  {
    //convo[0]+=1
    convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
    if convo[0]>=90
      charDialogue[0]+=1
  }
  else if charDialogue[0]=4
  {
    convo[0]=0
    stringToShow="All you gotta do is click on the place you want to go.#The white circle is where you just came from."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),256,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[1]; newMessage.window=1
    newMessage.fadingTime=150
    charDialogue[0]+=1
  }
  else if charDialogue[0]=5
  {
    //convo[0]+=1
    convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
    if convo[0]>=120
      charDialogue[0]+=1
  }
  else if charDialogue[0]=6
  {
    convo[0]=0
    stringToShow="That's easy to use."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),120,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]+=1
  }
  else if charDialogue[0]=7
  {
    //convo[0]+=1
    convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
    if convo[0]>=90
      charDialogue[0]+=1
  }
  else if charDialogue[0]=8
  {
    convo[0]=0
    stringToShow="Yes.#Also when you highlight an area, you can see if you have all the hidden#items in that area."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),256,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[1]; newMessage.window=1
    newMessage.fadingTime=150
    charDialogue[0]+=1
  }
  else if charDialogue[0]=9
  {
    //convo[0]+=1
    convo[0]+=gDeltaTime //60fps change: counts 30fps ticks
    if convo[0]>=120
      charDialogue[0]+=1
  }
  else if charDialogue[0]=10
  {
    convo[0]=0
    stringToShow="Awesome, let's get to this then."
    messageWidth=string_width(stringToShow)
    newMessage=instance_create(256-(messageWidth/2),120,oMessagePerson)
    newMessage.message=stringToShow
    newMessage.talker=global.mainCharacters[0]
    newMessage.fadingTime=120
    charDialogue[0]+=1
  }
}

//toggle item check
/*
if keyboard_check_pressed(ord("J"))
{
  if itemCheck=true
    itemCheck=false
  else
    itemCheck=true
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//grid effect
draw_set_color(c_black)
//gridFadeTime+=1
gridFadeTime+=gDeltaTime //60fps change: counts 30fps ticks
//if gridFadeTime>=1 and gridFadeTime<=100
if gridFadeTime>0 and gridFadeTime<=100 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  //gridAlpha+=0.001
  gridAlpha+=0.001*gDeltaTime //60fps change: per 30fps tick
//else if gridFadeTime>=131 and gridFadeTime<=230
else if gridFadeTime>130 and gridFadeTime<=230 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  //gridAlpha-=0.001
  gridAlpha-=0.001*gDeltaTime //60fps change: per 30fps tick
else if gridFadeTime>=310
  gridFadeTime=0
draw_set_alpha(gridAlpha)
for (i=0;i<=32;i+=1)
  draw_line(gridEffect[i],0,gridEffect[i],384)
for (i=0;i<=24;i+=1)
  draw_line(0,gridEffect[i],512,gridEffect[i])
//world map paths
draw_set_alpha(1)
draw_line_width(lDonutPlains.x,lDonutPlains.y,lToadTown.x,lToadTown.y,2)
if global.gameProgress>=20
  draw_line_width(lToadTown.x,lToadTown.y,lRumpyMountains.x,lRumpyMountains.y,2)
if global.gameProgress>=23
  draw_line_width(lRumpyMountains.x,lRumpyMountains.y,lOldCastle.x,lOldCastle.y,2)
if global.gameProgress>=35
{
  draw_line_width(lDonutPlains.x,lDonutPlains.y,lDarkDepths.x,lDarkDepths.y,2)
  draw_line_width(lDonutPlains.x,lDonutPlains.y,lBBFort.x,lBBFort.y,2)
}
if global.gameProgress>=50
  draw_line_width(lDarkDepths.x,lDarkDepths.y,lVegetableGarden.x,lVegetableGarden.y,2)
if global.gameProgress>=70
  draw_line_width(lDarkDepths.x,lDarkDepths.y,lDustyRuins.x,lDustyRuins.y,2)
if global.gameProgress>=81
{
  draw_line_width(lDustyRuins.x,lDustyRuins.y,lAbstracity.x,lAbstracity.y,2)
  draw_line_width(lVegetableGarden.x,lVegetableGarden.y,lCheeseGarden.x,lCheeseGarden.y,2)
}
if global.gameProgress>=86
  draw_line_width(lAbstracity.x,lAbstracity.y,lFrightTrain.x,lFrightTrain.y,2)
if global.gameProgress>=99
  draw_line_width(lAbstracity.x,lAbstracity.y,lWestSideJungle.x,lWestSideJungle.y,2)
if global.gameProgress>=108
{
  draw_line_width(lDustyRuins.x,lDustyRuins.y,lDirtyRuins.x,lDirtyRuins.y,2)
  draw_line_width(lWestSideJungle.x,lWestSideJungle.y,lTheHideout.x,lTheHideout.y,2)
}
if global.gameProgress>=128
{
  draw_line_width(lIEF.x,lIEF.y,lDonutPlains.x,lDonutPlains.y,2)
  draw_line_width(lWestSideJungle.x,lWestSideJungle.y,lMetropolis.x,lMetropolis.y,2)
}
if global.gameProgress>=151
  draw_line_width(lMetropolis.x,lMetropolis.y,lBRF.x,lBRF.y,2)
if global.gameProgress>=183
{
  draw_line_width(lMetropolis.x,lMetropolis.y,lMaverickFactory.x,lMaverickFactory.y,2)
  draw_line_width(lMetropolis.x,lMetropolis.y,lWindySlopes.x,lWindySlopes.y,2)
}
if global.gameProgress>=221
  draw_line_width(lWindySlopes.x,lWindySlopes.y,lVeiledDetritus.x,lVeiledDetritus.y,2)
if global.gameProgress>=242
  draw_line_width(lVeiledDetritus.x,lVeiledDetritus.y,lShadyWoods.x,lShadyWoods.y,2)
if global.gameProgress>=275
  draw_line_width(lShadyWoods.x,lShadyWoods.y,lShadyCaves.x,lShadyCaves.y,2)
if global.gameProgress>=279
  draw_line_width(lVeiledDetritus.x,lVeiledDetritus.y,lStalagmite.x,lStalagmite.y,2)
if global.gameProgress>=281
  draw_line_width(lShadyCaves.x,lShadyCaves.y,lDataSegment.x,lDataSegment.y,2)
if global.gameProgress>=324
  draw_line_width(lDataSegment.x,lDataSegment.y,lPrimaryMemory.x,lPrimaryMemory.y,2)

//current position
/*locSizeChange+=1
if locSizeChange>=1 and locSizeChange<=20
  //locCircleSize-=0.6
  locCircleSize-=0.6*gDeltaTime //60fps change: per 30fps tick
else if locSizeChange>=21
{
  locCircleSize=16
  locSizeChange=0
}
draw_set_color(c_white)
draw_circle(global.worldMapX,global.worldMapY,16,true)
draw_circle(global.worldMapX,global.worldMapY,locCircleSize,true)*/
/*
if global.gameProgress>=18
{
  draw_set_color(c_black)
  draw_set_font(fnt_EnemyScan)
  draw_set_halign(fa_center)
  draw_text(room_width/2+32,10,"Press 'J' to toggle item check.")
}
