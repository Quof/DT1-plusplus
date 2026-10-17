/*
element colors change (added): Element Colors (Options Set 3, menuElemColorConfig): the colour picked for each element,
global.elemColor[1-4] (1 fire, 2 water, 3 wind, 4 earth; kept in Settings.ini's [ElementColors]), and what's needed to
draw everything that has that element's colour in it (scrElemColor). Called once, when the game starts (scrSettingsNames).
global.elemColorDef: each element's own colour, the one it has until it's changed: the HUD's (the current element's gem
and the energy bars; the spell's name is a lighter shade of it), which its after-images and element attacks use too.
While an element has it, everything of that element is drawn exactly as it always was.
The sprites with the element colours in their frames (one frame per element: the switches' crystals, the Neo Guardian's
orbs, the HUD's gem and energy bars) have a layer sprite each (<sprite>EC, made from them by the scratchpad's
gen_elemsprites.py): for each element, its first frame (ecLvFirst) has the pixels that aren't the element's colour (greys,
white sparkles; drawn as they are), then one white mask per shade of the colour (ecLvN of them), drawn tinted in that
shade (ecLvCol) as scrElemColor makes it (scrDrawElemSprite).
*/
var i;
global.elemColorDef[1]=make_color_rgb(246,54,54)  //fire
global.elemColorDef[2]=make_color_rgb(51,117,201) //water
global.elemColorDef[3]=make_color_rgb(0,214,0)    //wind
global.elemColorDef[4]=make_color_rgb(175,76,33)  //earth
global.elemName[1]="Fire"; global.elemName[2]="Water"; global.elemName[3]="Wind"; global.elemName[4]="Earth"
for(i=1;i<=4;i+=1) {global.elemColor[i]=global.elemColorDef[i]} //(oInitializeGame sets them too, then Settings.ini's)

//the layer sprites (kind: scrDrawElemSprite's argument0)
//sPuzzleCrystal -> sPuzzleCrystalEC
global.ecSprOrig[0]=sPuzzleCrystal; global.ecSprMask[0]=sPuzzleCrystalEC
global.ecLvCol[0,1]=make_color_rgb(255,132,97)
global.ecLvCol[0,2]=make_color_rgb(182,41,59)
global.ecLvCol[0,3]=make_color_rgb(116,28,46)
global.ecLvCol[0,4]=make_color_rgb(66,13,13)
global.ecLvFirst[0,1]=0; global.ecLvN[0,1]=4
global.ecLvCol[0,6]=make_color_rgb(145,211,255)
global.ecLvCol[0,7]=make_color_rgb(66,164,237)
global.ecLvCol[0,8]=make_color_rgb(71,107,168)
global.ecLvCol[0,9]=make_color_rgb(77,65,102)
global.ecLvFirst[0,2]=5; global.ecLvN[0,2]=4
global.ecLvCol[0,11]=make_color_rgb(165,218,139)
global.ecLvCol[0,12]=make_color_rgb(128,161,110)
global.ecLvCol[0,13]=make_color_rgb(77,130,51)
global.ecLvCol[0,14]=make_color_rgb(40,73,22)
global.ecLvFirst[0,3]=10; global.ecLvN[0,3]=4
global.ecLvCol[0,16]=make_color_rgb(245,166,89)
global.ecLvCol[0,17]=make_color_rgb(178,111,101)
global.ecLvCol[0,18]=make_color_rgb(118,74,84)
global.ecLvCol[0,19]=make_color_rgb(66,44,54)
global.ecLvFirst[0,4]=15; global.ecLvN[0,4]=4
//sElementalOrbs -> sElementalOrbsEC
global.ecSprOrig[1]=sElementalOrbs; global.ecSprMask[1]=sElementalOrbsEC
global.ecLvCol[1,1]=make_color_rgb(248,192,192)
global.ecLvCol[1,2]=make_color_rgb(232,136,136)
global.ecLvCol[1,3]=make_color_rgb(224,80,80)
global.ecLvCol[1,4]=make_color_rgb(176,56,56)
global.ecLvCol[1,5]=make_color_rgb(120,24,24)
global.ecLvCol[1,6]=make_color_rgb(72,0,0)
global.ecLvFirst[1,1]=0; global.ecLvN[1,1]=6
global.ecLvCol[1,8]=make_color_rgb(144,208,224)
global.ecLvCol[1,9]=make_color_rgb(96,160,200)
global.ecLvCol[1,10]=make_color_rgb(48,104,184)
global.ecLvCol[1,11]=make_color_rgb(32,72,136)
global.ecLvCol[1,12]=make_color_rgb(16,32,88)
global.ecLvCol[1,13]=make_color_rgb(0,0,40)
global.ecLvFirst[1,2]=7; global.ecLvN[1,2]=6
global.ecLvCol[1,15]=make_color_rgb(160,232,160)
global.ecLvCol[1,16]=make_color_rgb(136,216,136)
global.ecLvCol[1,17]=make_color_rgb(88,192,88)
global.ecLvCol[1,18]=make_color_rgb(56,144,56)
global.ecLvCol[1,19]=make_color_rgb(24,88,24)
global.ecLvCol[1,20]=make_color_rgb(0,40,0)
global.ecLvFirst[1,3]=14; global.ecLvN[1,3]=6
global.ecLvCol[1,22]=make_color_rgb(255,199,149)
global.ecLvCol[1,23]=make_color_rgb(249,175,109)
global.ecLvCol[1,24]=make_color_rgb(223,149,83)
global.ecLvCol[1,25]=make_color_rgb(177,103,37)
global.ecLvCol[1,26]=make_color_rgb(126,60,0)
global.ecLvCol[1,27]=make_color_rgb(55,27,0)
global.ecLvCol[1,28]=make_color_rgb(48,23,0)
global.ecLvCol[1,29]=make_color_rgb(32,32,0)
global.ecLvFirst[1,4]=21; global.ecLvN[1,4]=8
//sCurrentElement -> sCurrentElementEC
global.ecSprOrig[2]=sCurrentElement; global.ecSprMask[2]=sCurrentElementEC
global.ecLvCol[2,1]=make_color_rgb(255,125,125)
global.ecLvCol[2,2]=make_color_rgb(246,54,54)
global.ecLvCol[2,3]=make_color_rgb(178,1,1)
global.ecLvCol[2,4]=make_color_rgb(107,11,11)
global.ecLvFirst[2,1]=0; global.ecLvN[2,1]=4
global.ecLvCol[2,6]=make_color_rgb(129,171,224)
global.ecLvCol[2,7]=make_color_rgb(51,117,201)
global.ecLvCol[2,8]=make_color_rgb(6,78,167)
global.ecLvCol[2,9]=make_color_rgb(12,46,89)
global.ecLvFirst[2,2]=5; global.ecLvN[2,2]=4
global.ecLvCol[2,11]=make_color_rgb(33,255,33)
global.ecLvCol[2,12]=make_color_rgb(0,214,0)
global.ecLvCol[2,13]=make_color_rgb(0,139,0)
global.ecLvCol[2,14]=make_color_rgb(3,73,3)
global.ecLvFirst[2,3]=10; global.ecLvN[2,3]=4
global.ecLvCol[2,16]=make_color_rgb(220,104,53)
global.ecLvCol[2,17]=make_color_rgb(175,76,33)
global.ecLvCol[2,18]=make_color_rgb(132,51,16)
global.ecLvCol[2,19]=make_color_rgb(89,34,11)
global.ecLvFirst[2,4]=15; global.ecLvN[2,4]=4
//sElementTrack -> sElementTrackEC
global.ecSprOrig[3]=sElementTrack; global.ecSprMask[3]=sElementTrackEC
global.ecLvCol[3,1]=make_color_rgb(255,125,125)
global.ecLvCol[3,2]=make_color_rgb(246,54,54)
global.ecLvCol[3,3]=make_color_rgb(178,1,1)
global.ecLvFirst[3,1]=0; global.ecLvN[3,1]=3
global.ecLvCol[3,5]=make_color_rgb(129,171,224)
global.ecLvCol[3,6]=make_color_rgb(51,117,201)
global.ecLvCol[3,7]=make_color_rgb(6,78,167)
global.ecLvFirst[3,2]=4; global.ecLvN[3,2]=3
global.ecLvCol[3,9]=make_color_rgb(33,255,33)
global.ecLvCol[3,10]=make_color_rgb(0,214,0)
global.ecLvCol[3,11]=make_color_rgb(0,139,0)
global.ecLvFirst[3,3]=8; global.ecLvN[3,3]=3
global.ecLvCol[3,13]=make_color_rgb(220,104,53)
global.ecLvCol[3,14]=make_color_rgb(175,76,33)
global.ecLvCol[3,15]=make_color_rgb(132,51,16)
global.ecLvFirst[3,4]=12; global.ecLvN[3,4]=3
