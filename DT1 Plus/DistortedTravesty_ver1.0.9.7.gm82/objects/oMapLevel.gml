#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
selectionMade=false
screenFlash=0
showLevelName=false
textColor=make_color_rgb(0,150,0)
lineColor=make_color_rgb(0,255,0)
borderColor=make_color_rgb(0,24,0)
fillColor=make_color_rgb(0,48,0)
cirRad=24
cirSizeChange=0
recLength=0
scX=359
scY=24
frameTime=0
alarm[0]=1
allItems=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//all item check
if zoneName="Donut Plains"
{
  if global.skillCapsules[4]=1 and global.skillCapsules[6]=1 and global.skillCapsules[95]=1 and global.skillCapsules[96]=1 and global.itemChest[1]=1 and global.itemChest[2]=1 and global.moneyChest[3]=1 and global.heartPiece[0]=1 and global.heartPiece[44]=1 and global.spiritAuras[0]=1 and global.invBracelet[16]>=1
    allItems=true
}
else if zoneName="Toad Town"
{
  if global.skillCapsules[5]=1 and global.moneyChest[1]=1 and global.heartPiece[1]=1 and global.heartPiece[2]=1 and global.invBracelet[1]>=1
    allItems=true
}
else if zoneName="Rumpy Mountains"
{
  if global.skillCapsules[7]=1 and global.skillCapsules[8]=1 and global.skillCapsules[97]=1 and global.skillCapsules[112]=1 and global.skillCapsules[113]=1  and global.skillCapsules[114]=1 and global.moneyChest[4]=1 and global.moneyChest[25]=1 and global.itemChest[3]=1 and global.heartPiece[3]=1 and global.heartPiece[4]=1 and global.heartPiece[45]=1 and global.spiritAuras[1]=1 and global.spiritAuras[16]=1 and global.invBracelet[5]>=1
    allItems=true
}
else if zoneName="Old Castle"
{
  if global.skillCapsules[9]=1 and global.skillCapsules[10]=1 and global.skillCapsules[109]=1 and global.skillCapsules[110]=1 and global.skillCapsules[111]=1 and global.moneyChest[2]=1 and global.itemChest[4]=1 and global.itemChest[40]=1 and global.heartPiece[5]=1 and global.heartPiece[50]=1 and global.techCapsule[5]=1
    allItems=true
}
else if zoneName="Extra: Bullet Bill Fort"
{
  if global.skillCapsules[17]=1 and global.skillCapsules[18]=1 and global.heartPiece[12]=1 and global.invBracelet[0]>=1
    allItems=true
}
else if zoneName="Dark Depths"
{
  if global.skillCapsules[11]=1 and global.skillCapsules[12]=1 and global.skillCapsules[103]=1 and global.skillCapsules[104]=1 and global.moneyChest[5]=1 and global.itemChest[5]=1 and global.itemChest[6]=1 and global.heartPiece[7]=1 and global.heartPiece[8]=1 and global.spiritAuras[2]=1 and global.techCapsule[0]=1 and global.techCapsule[7]=1 and global.techCapsule[8]=1
    allItems=true
}
else if zoneName="Vegetable Garden"
{
  if global.skillCapsules[13]=1 and global.skillCapsules[14]=1 and global.skillCapsules[101]=1 and global.skillCapsules[102]=1 and global.moneyChest[6]=1 and global.itemChest[7]=1 and global.heartPiece[9]=1 and global.heartPiece[10]=1 and global.heartPiece[46]=1 and global.spiritAuras[3]=1 and global.invBracelet[6]>=1
    allItems=true
}
else if zoneName="Distortion 1"
{
  if global.skillCapsules[15]=1 and global.skillCapsules[16]=1 and global.moneyChest[7]=1 and global.moneyChest[8]=1 and global.itemChest[8]=1 and global.itemChest[9]=1 and global.heartPiece[11]=1 and global.spiritAuras[4]=1 and global.invBracelet[2]>=1
    allItems=true
}
else if zoneName="Dusty Ruins"
{
  if global.skillCapsules[19]=1 and global.skillCapsules[20]=1 and global.moneyChest[9]=1 and global.itemChest[11]=1 and global.heartPiece[13]=1 and global.heartPiece[14]=1 and global.heartPiece[15]=1 and global.spiritAuras[5]=1 and global.invBracelet[8]>=1
    allItems=true
}
else if zoneName="Abstracity"
{
  if global.skillCapsules[21]=1 and global.skillCapsules[22]=1 and global.moneyChest[12]=1 and global.heartPiece[16]=1
    allItems=true
}
else if zoneName="Extra: Cheese Garden"
{
  if global.skillCapsules[26]=1 and global.skillCapsules[27]=1 and global.itemChest[12]=1 and global.heartPiece[18]=1 and global.invBracelet[15]>=1
    allItems=true
}
else if zoneName="Fright Train"
{
  if global.skillCapsules[23]=1 and global.skillCapsules[24]=1 and global.skillCapsules[25]=1 and global.moneyChest[30]=1 and global.heartPiece[17]=1 and global.spiritAuras[6]=1 and global.invBracelet[7]>=1
    allItems=true
}
else if zoneName="West Side Jungle"
{
  if global.skillCapsules[28]=1 and global.skillCapsules[29]=1 and global.skillCapsules[30]=1 and global.skillCapsules[31]=1 and global.skillCapsules[32]=1 and global.moneyChest[10]=1 and global.moneyChest[11]=1 and global.moneyChest[33]=1 and global.itemChest[13]=1 and global.itemChest[41]=1 and global.heartPiece[19]=1 and global.heartPiece[20]=1 and global.invBracelet[3]>=1 and global.techCapsule[9]=1
    allItems=true
}
else if zoneName="Extra: Dirty Ruins"
{
  if global.skillCapsules[43]=1 and global.skillCapsules[44]=1 and global.skillCapsules[45]=1 and global.itemChest[20]=1 and global.itemChest[21]=1 and global.heartPiece[25]=1 and global.invBracelet[13]>=1
    allItems=true
}
else if zoneName="The Hideout"
{
  if global.skillCapsules[33]=1 and global.skillCapsules[34]=1 and global.skillCapsules[35]=1 and global.skillCapsules[36]=1 and global.skillCapsules[37]=1 and global.skillCapsules[38]=1 and global.skillCapsules[39]=1 and global.moneyChest[13]=1 and global.moneyChest[14]=1 and global.itemChest[14]=1 and global.itemChest[15]=1 and global.itemChest[16]=1 and global.itemChest[17]=1 and global.heartPiece[21]=1 and global.heartPiece[22]=1 and global.spiritAuras[7]=1 and global.spiritAuras[8]=1
    allItems=true
}
else if zoneName="Integrated Electrical Factory"
{
  if global.skillCapsules[0]=1 and global.skillCapsules[1]=1 and global.skillCapsules[2]=1 and global.skillCapsules[3]=1 and global.moneyChest[0]=1 and global.itemChest[0]=1 and global.itemChest[10]=1 and global.heartPiece[6]=1
    allItems=true
}
else if zoneName="Distortion 2"
{
  if global.skillCapsules[40]=1 and global.skillCapsules[41]=1 and global.skillCapsules[42]=1 and global.moneyChest[15]=1 and global.moneyChest[16]=1 and global.itemChest[18]=1 and global.itemChest[19]=1 and global.heartPiece[23]=1 and global.heartPiece[24]=1 and global.spiritAuras[9]=1
    allItems=true
}
else if zoneName="Metropolis"
{
  if global.skillCapsules[46]=1 and global.skillCapsules[47]=1 and global.skillCapsules[48]=1 and global.skillCapsules[49]=1 and global.skillCapsules[50]=1 and global.skillCapsules[51]=1 and global.skillCapsules[52]=1 and global.skillCapsules[53]=1 and global.skillCapsules[54]=1 and global.skillCapsules[55]=1 and global.skillCapsules[56]=1 and global.skillCapsules[57]=1 and global.skillCapsules[58]=1 and global.moneyChest[31]=1 and global.itemChest[22]=1 and global.itemChest[23]=1 and global.itemChest[24]=1 and global.heartPiece[26]=1 and global.heartPiece[27]=1 and global.heartPiece[28]=1 and global.heartPiece[29]=1 and global.heartPiece[30]=1 and global.spiritAuras[10]=1
    allItems=true
}
else if zoneName="Black Rock Fortress"
{
  if global.skillCapsules[59]=1 and global.skillCapsules[60]=1 and global.skillCapsules[61]=1 and global.skillCapsules[62]=1 and global.skillCapsules[63]=1 and global.skillCapsules[64]=1 and global.moneyChest[17]=1 and global.moneyChest[18]=1 and global.itemChest[25]=1 and global.itemChest[26]=1 and global.itemChest[27]=1 and global.itemChest[28]=1 and global.itemChest[29]=1 and global.heartPiece[31]=1 and global.spiritAuras[11]=1 and global.techCapsule[1]=1
    allItems=true
}
else if zoneName="Extra: Maverick Factory"
{
  if global.skillCapsules[65]=1 and global.skillCapsules[66]=1 and global.skillCapsules[67]=1 and global.moneyChest[19]=1 and global.heartPiece[32]=1 and global.techCapsule[2]=1 and global.invBracelet[17]>=1
    allItems=true
}
else if zoneName="Spire of Forgotten Souls"
{
  if global.skillCapsules[74]=1 and global.skillCapsules[105]=1 and global.skillCapsules[106]=1 and global.skillCapsules[107]=1 and global.heartPiece[35]=1 and global.heartPiece[47]=1 and global.heartPiece[48]=1 and global.spiritAuras[18]=1 and global.invBracelet[4]>=1 and global.invBracelet[9]>=1
    allItems=true
}
else if zoneName="Windy Slopes"
{
  if global.skillCapsules[68]=1 and global.skillCapsules[69]=1 and global.skillCapsules[70]=1 and global.skillCapsules[127]=1 and global.moneyChest[29]=1 and global.itemChest[30]=1 and global.heartPiece[33]=1 and global.techCapsule[3]=1
    allItems=true
}
else if zoneName="Distortion 3"
{
  if global.skillCapsules[71]=1 and global.skillCapsules[72]=1 and global.skillCapsules[131]=1 and global.itemChest[31]=1 and global.heartPiece[34]=1 and global.techCapsule[4]=1 and global.invBracelet[14]>=1
    allItems=true
}
else if zoneName="Sky Base"
{
  if global.skillCapsules[73]=1 and global.skillCapsules[94]=1
    allItems=true
}
else if zoneName="Veiled Detritus"
{
  if global.skillCapsules[75]=1 and global.skillCapsules[76]=1 and global.skillCapsules[77]=1 and global.skillCapsules[78]=1 and global.skillCapsules[79]=1 and global.skillCapsules[128]=1 and global.moneyChest[20]=1 and global.moneyChest[21]=1 and global.moneyChest[22]=1 and global.moneyChest[23]=1 and global.itemChest[32]=1 and global.itemChest[33]=1 and global.itemChest[34]=1 and global.itemChest[35]=1 and global.itemChest[36]=1 and global.heartPiece[36]=1 and global.heartPiece[37]=1 and global.spiritAuras[12]=1 and global.invBracelet[12]>=1
    allItems=true
}
else if zoneName="Shady Woods"
{
  if global.skillCapsules[80]=1 and global.skillCapsules[81]=1 and global.skillCapsules[84]=1 and global.skillCapsules[126]=1 and global.itemChest[37]=1 and global.heartPiece[38]=1 and global.spiritAuras[13]=1 and global.techCapsule[6]=1 and global.invBracelet[11]>=1
    allItems=true
}
else if zoneName="Distortion 4"
{
  if global.skillCapsules[82]=1 and global.skillCapsules[83]=1 and global.skillCapsules[85]=1 and global.skillCapsules[86]=1 and global.skillCapsules[87]=1 and global.skillCapsules[88]=1 and global.skillCapsules[89]=1 and global.skillCapsules[90]=1 and global.skillCapsules[91]=1 and global.moneyChest[24]=1 and global.itemChest[38]=1 and global.heartPiece[39]=1 and global.heartPiece[40]=1 and global.heartPiece[41]=1 and global.spiritAuras[14]=1
    allItems=true
}
else if zoneName="Shady Caves"
{
  if global.skillCapsules[92]=1 and global.skillCapsules[93]=1 and global.moneyChest[32]=1 and global.heartPiece[42]=1 and global.heartPiece[43]=1 and global.spiritAuras[15]=1
    allItems=true
}
else if zoneName="Extra: Stalagmite Ruins"
{
  if global.skillCapsules[98]=1 and global.skillCapsules[99]=1 and global.skillCapsules[100]=1 and global.moneyChest[26]=1 and global.moneyChest[27]=1 and global.spiritAuras[17]=1 and global.invBracelet[10]>=1
    allItems=true
}
else if zoneName="Secured Data Segment"
{
  if global.skillCapsules[108]=1 and global.skillCapsules[115]=1 and global.skillCapsules[116]=1 and global.skillCapsules[117]=1 and global.skillCapsules[118]=1 and global.skillCapsules[119]=1 and global.skillCapsules[120]=1 and global.skillCapsules[121]=1 and global.skillCapsules[122]=1 and global.skillCapsules[123]=1 and global.skillCapsules[124]=1 and global.skillCapsules[125]=1 and global.skillCapsules[129]=1 and global.skillCapsules[130]=1 and global.moneyChest[28]=1 and global.moneyChest[34]=1 and global.itemChest[39]=1 and global.heartPiece[49]=1 and global.heartPiece[51]=1 and global.spiritAuras[19]=1
    allItems=true
}
else if zoneName="Final: Primary Memory"
  allItems=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sWorldMapSecret or sprite_index=sWorldMapDistortion
{
  //frameTime+=1
  frameTime+=gDeltaTime //60fps change: counts 30fps ticks
  //if frameTime=7
  if scrCountPass(frameTime,7) //60fps change: once, when the count reaches it
    image_index=1
  //else if frameTime=13
  else if scrCountPass(frameTime,13) //60fps change: once, when the count reaches it
    image_index=2
  //else if frameTime=19
  else if scrCountPass(frameTime,19) //60fps change: once, when the count reaches it
    image_index=1
  //else if frameTime=25
  else if scrCountPass(frameTime,25) //60fps change: once, when the count reaches it
  {
    image_index=0
    frameTime=0
  }
}
if oWorldMap.choseLevel>0 and selectionMade=true
{
  //screenFlash-=0.1
  screenFlash-=0.1*gDeltaTime //60fps change: per 30fps tick
  if screenFlash<=0
  {
    //transition_steps=10
    transition_steps=10/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=21
    room_goto(zoneLoc1)
  }
}
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if oWorldMap.choseLevel=0
{
  if zoneName="Abstracity" and SS_IsSoundLooping(global.msc_WorldMapDistorted)
  {
    //do nothing
  }
  else
    stopAllMusic()
  playSound(global.snd_BarrierDestroy,0,1)
  screenFlash=1
  selectionMade=true
  oWorldMap.choseLevel=1
}
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if showLevelName=false and oWorldMap.choseLevel=0
{
  playSound(global.snd_MapBlip,0,1)
  recLength=0
  showLevelName=true
}
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if showLevelName=true and oWorldMap.choseLevel=0
{
  showLevelName=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//show level icon
draw_sprite(sprite_index,image_index,x,y)
//show area name
if showLevelName=true
{
  //x,y line position
  draw_set_alpha(0.6)
  draw_set_color(lineColor)
  draw_line(0,y,512,y)
  draw_line(x,0,x,384)
  //effect
  draw_set_alpha(0.9)
  draw_set_color(textColor)
  draw_rectangle(x-40,y-20,x-29,y-8,false)
  draw_rectangle(x-29,y-20,x-29+recLength,y-15,false)
  draw_rectangle(x+29,y+8,x+40,y+20,false)
  draw_rectangle(x+29,y+15,x+29-recLength,y+20,false)
  if recLength<36
    //recLength+=6
    recLength+=6*gDeltaTime //60fps change: per 30fps tick
  else
  {
    draw_set_font(fnt_ScanData)
    draw_set_halign(fa_left)
    draw_text(x+10,y-22,x)
    draw_set_halign(fa_right)
    draw_text(x-10,y+13,y)
    draw_set_halign(fa_center)
    draw_text(x,y+20,"MAP COORDINATES")
    draw_set_halign(fa_left)
    draw_text(x-90,y-29,"PROGRESS STATE: " +string(global.gameProgress))
  }
  //circle
  draw_set_alpha(0.7)
  draw_set_color(lineColor)
  //cirSizeChange+=1
  cirSizeChange+=gDeltaTime //60fps change: counts 30fps ticks
  //if cirSizeChange>=1 and cirSizeChange<=14
  if cirSizeChange>0 and cirSizeChange<=14 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //cirRad-=1.5
    cirRad-=1.5*gDeltaTime //60fps change: per 30fps tick
  else if cirSizeChange>=15
  {
    cirRad=24
    cirSizeChange=0
  }
  draw_circle(x,y,cirRad,true)
  //area box
  draw_set_alpha(1)
  draw_set_color(fillColor)
  draw_rectangle(96,6,367,25,false) //skill capsule
  draw_rectangle(367,1,396,30,false) //treasure box
  draw_rectangle(396,6,417,25,false) //heart piece
  draw_rectangle(417,6,438,25,false) //spirit aura
  draw_rectangle(438,6,457,25,false) //other
  draw_set_color(borderColor)
  draw_line(351,6,351,25)
  draw_rectangle(96,6,367,25,true) //skill capsule
  draw_rectangle(367,1,396,30,true) //treasure Box
  draw_rectangle(396,6,417,25,true) //heart piece
  draw_rectangle(417,6,438,25,true) //spirit aura
  draw_rectangle(438,6,457,25,true) //other
  //area name
  draw_set_font(fnt_AreaName)
  draw_set_halign(fa_center)
  draw_set_color(lineColor)
  draw_text(224,4,zoneName)
  //item check
  if zoneName="Donut Plains"
  {
    if global.skillCapsules[4]=1 and global.skillCapsules[6]=1 and global.skillCapsules[95]=1 and global.skillCapsules[96]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.itemChest[1]=1 and global.itemChest[2]=1 and global.moneyChest[3]=1 and global.invBracelet[16]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[0]=1 and global.heartPiece[44]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[0]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Toad Town"
  {
    if global.skillCapsules[5]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[1]=1 and global.invBracelet[1]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[1]=1 and global.heartPiece[2]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Rumpy Mountains"
  {
    if global.skillCapsules[7]=1 and global.skillCapsules[8]=1 and global.skillCapsules[97]=1 and global.skillCapsules[112]=1 and global.skillCapsules[113]=1 and global.skillCapsules[114]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[4]=1 and global.moneyChest[25]=1 and global.itemChest[3]=1 and global.invBracelet[5]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[3]=1 and global.heartPiece[4]=1 and global.heartPiece[45]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[1]=1 and global.spiritAuras[16]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Old Castle"
  {
    if global.skillCapsules[9]=1 and global.skillCapsules[10]=1 and global.skillCapsules[109]=1 and global.skillCapsules[110]=1 and global.skillCapsules[111]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[2]=1 and global.itemChest[4]=1 and global.itemChest[40]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[5]=1 and global.heartPiece[50]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[5]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Extra: Bullet Bill Fort"
  {
    if global.skillCapsules[17]=1 and global.skillCapsules[18]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.invBracelet[0]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[12]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Dark Depths"
  {
    if global.skillCapsules[11]=1 and global.skillCapsules[12]=1 and global.skillCapsules[103]=1 and global.skillCapsules[104]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[5]=1 and global.itemChest[5]=1 and global.itemChest[6]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[7]=1 and global.heartPiece[8]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[2]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[0]=1 and global.techCapsule[7]=1 and global.techCapsule[8]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Vegetable Garden"
  {
    if global.skillCapsules[13]=1 and global.skillCapsules[14]=1 and global.skillCapsules[101]=1 and global.skillCapsules[102]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[6]=1 and global.itemChest[7]=1 and global.invBracelet[6]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[9]=1 and global.heartPiece[10]=1 and global.heartPiece[46]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[3]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Distortion 1"
  {
    if global.skillCapsules[15]=1 and global.skillCapsules[16]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[7]=1 and global.moneyChest[8]=1 and global.itemChest[8]=1 and global.itemChest[9]=1 and global.invBracelet[2]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[11]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[4]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Dusty Ruins"
  {
    if global.skillCapsules[19]=1 and global.skillCapsules[20]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[9]=1 and global.itemChest[11]=1 and global.invBracelet[8]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[13]=1 and global.heartPiece[14]=1 and global.heartPiece[15]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[5]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Abstracity"
  {
    if global.skillCapsules[21]=1 and global.skillCapsules[22]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[12]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[16]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Extra: Cheese Garden"
  {
    if global.skillCapsules[26]=1 and global.skillCapsules[27]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.itemChest[12]=1 and global.invBracelet[15]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[18]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Fright Train"
  {
    if global.skillCapsules[23]=1 and global.skillCapsules[24]=1 and global.skillCapsules[25]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[30]=1 and global.invBracelet[7]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[17]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[6]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="West Side Jungle"
  {
    if global.skillCapsules[28]=1 and global.skillCapsules[29]=1 and global.skillCapsules[30]=1 and global.skillCapsules[31]=1 and global.skillCapsules[32]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[10]=1 and global.moneyChest[11]=1 and global.moneyChest[33]=1 and global.itemChest[13]=1 and global.itemChest[41]=1 and global.invBracelet[3]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[19]=1 and global.heartPiece[20]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[9]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Extra: Dirty Ruins"
  {
    if global.skillCapsules[43]=1 and global.skillCapsules[44]=1 and global.skillCapsules[45]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.itemChest[20]=1 and global.itemChest[21]=1 and global.invBracelet[13]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[25]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="The Hideout"
  {
    if global.skillCapsules[33]=1 and global.skillCapsules[34]=1 and global.skillCapsules[35]=1 and global.skillCapsules[36]=1 and global.skillCapsules[37]=1 and global.skillCapsules[38]=1 and global.skillCapsules[39]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[13]=1 and global.moneyChest[14]=1 and global.itemChest[14]=1 and global.itemChest[15]=1 and global.itemChest[16]=1 and global.itemChest[17]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[21]=1 and global.heartPiece[22]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[7]=1 and global.spiritAuras[8]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Integrated Electrical Factory"
  {
    if global.skillCapsules[0]=1 and global.skillCapsules[1]=1 and global.skillCapsules[2]=1 and global.skillCapsules[3]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[0]=1 and global.itemChest[0]=1 and global.itemChest[10]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[6]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Distortion 2"
  {
    if global.skillCapsules[40]=1 and global.skillCapsules[41]=1 and global.skillCapsules[42]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[15]=1 and global.moneyChest[16]=1 and global.itemChest[18]=1 and global.itemChest[19]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[23]=1 and global.heartPiece[24]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[9]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Metropolis"
  {
    if global.skillCapsules[46]=1 and global.skillCapsules[47]=1 and global.skillCapsules[48]=1 and global.skillCapsules[49]=1 and global.skillCapsules[50]=1 and global.skillCapsules[51]=1 and global.skillCapsules[52]=1 and global.skillCapsules[53]=1 and global.skillCapsules[54]=1 and global.skillCapsules[55]=1 and global.skillCapsules[56]=1 and global.skillCapsules[57]=1 and global.skillCapsules[58]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[31]=1 and global.itemChest[22]=1 and global.itemChest[23]=1 and global.itemChest[24]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[26]=1 and global.heartPiece[27]=1 and global.heartPiece[28]=1 and global.heartPiece[29]=1 and global.heartPiece[30]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[10]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Black Rock Fortress"
  {
    if global.skillCapsules[59]=1 and global.skillCapsules[60]=1 and global.skillCapsules[61]=1 and global.skillCapsules[62]=1 and global.skillCapsules[63]=1 and global.skillCapsules[64]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[17]=1 and global.moneyChest[18]=1 and global.itemChest[25]=1 and global.itemChest[26]=1 and global.itemChest[27]=1 and global.itemChest[28]=1 and global.itemChest[29]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[31]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[11]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[1]=1
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Extra: Maverick Factory"
  {
    if global.skillCapsules[65]=1 and global.skillCapsules[66]=1 and global.skillCapsules[67]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[19]=1 and global.invBracelet[17]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[32]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[2]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Spire of Forgotten Souls"
  {
    if global.skillCapsules[74]=1 and global.skillCapsules[105]=1 and global.skillCapsules[106]=1 and global.skillCapsules[107]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.invBracelet[4]>=1 and global.invBracelet[9]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[35]=1 and global.heartPiece[47]=1 and global.heartPiece[48]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[18]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Windy Slopes"
  {
    if global.skillCapsules[68]=1 and global.skillCapsules[69]=1 and global.skillCapsules[70]=1 and global.skillCapsules[127]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[29]=1 and global.itemChest[30]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[33]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[3]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Distortion 3"
  {
    if global.skillCapsules[71]=1 and global.skillCapsules[72]=1 and global.skillCapsules[131]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.itemChest[31]=1 and global.invBracelet[14]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[34]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[4]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Sky Base"
  {
    if global.skillCapsules[73]=1 and global.skillCapsules[94]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    draw_sprite(sBigChest,0,scX+23,scY+4)
    draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Veiled Detritus"
  {
    if global.skillCapsules[75]=1 and global.skillCapsules[76]=1 and global.skillCapsules[77]=1 and global.skillCapsules[78]=1 and global.skillCapsules[79]=1 and global.skillCapsules[128]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[20]=1 and global.moneyChest[21]=1 and global.moneyChest[22]=1 and global.moneyChest[23]=1 and global.itemChest[32]=1 and global.itemChest[33]=1 and global.itemChest[34]=1 and global.itemChest[35]=1 and global.itemChest[36]=1 and global.invBracelet[12]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[36]=1 and global.heartPiece[37]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[12]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Shady Woods"
  {
    if global.skillCapsules[80]=1 and global.skillCapsules[81]=1 and global.skillCapsules[84]=1 and global.skillCapsules[126]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.itemChest[37]=1 and global.invBracelet[11]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[38]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[13]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    if global.techCapsule[6]=1
      draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Distortion 4"
  {
    if global.skillCapsules[82]=1 and global.skillCapsules[83]=1 and global.skillCapsules[85]=1 and global.skillCapsules[86]=1 and global.skillCapsules[87]=1 and global.skillCapsules[88]=1 and global.skillCapsules[89]=1 and global.skillCapsules[90]=1 and global.skillCapsules[91]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[24]=1 and global.itemChest[38]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[39]=1 and global.heartPiece[40]=1 and global.heartPiece[41]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[14]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Shady Caves"
  {
    if global.skillCapsules[92]=1 and global.skillCapsules[93]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[32]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[42]=1 and global.heartPiece[43]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[15]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Extra: Stalagmite Ruins"
  {
    if global.skillCapsules[98]=1 and global.skillCapsules[99]=1 and global.skillCapsules[100]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[26]=1 and global.moneyChest[27]=1 and global.invBracelet[10]>=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[17]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Secured Data Segment"
  {
    if global.skillCapsules[108]=1 and global.skillCapsules[115]=1 and global.skillCapsules[116]=1 and global.skillCapsules[117]=1 and global.skillCapsules[118]=1 and global.skillCapsules[119]=1 and global.skillCapsules[120]=1 and global.skillCapsules[121]=1 and global.skillCapsules[122]=1 and global.skillCapsules[123]=1 and global.skillCapsules[124]=1 and global.skillCapsules[125]=1 and global.skillCapsules[129]=1 and global.skillCapsules[130]=1
      draw_sprite(sSkillCapsule,0,scX,scY)
    if global.moneyChest[28]=1 and global.moneyChest[34]=1 and global.itemChest[39]=1
      draw_sprite(sBigChest,0,scX+23,scY+4)
    if global.heartPiece[49]=1 and global.heartPiece[51]=1
      draw_sprite(sHeartPiece,0,scX+40,scY-17)
    if global.spiritAuras[19]=1
      draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
  else if zoneName="Final: Primary Memory"
  {
    draw_sprite(sSkillCapsule,0,scX,scY)
    draw_sprite(sBigChest,0,scX+23,scY+4)
    draw_sprite(sHeartPiece,0,scX+40,scY-17)
    draw_sprite(sSpiritAura,0,scX+61,scY-16)
    draw_sprite(sNewTechPickup,1,scX+80,scY-16)
  }
}
//all item check
if allItems=true and oWorldMap.itemCheck=true
{
  if sprite_index=sWorldMapDistortion
    draw_sprite(sAllItemIcon,-1,x+6,y+6)
  else if sprite_index=sWorldMapSecret
    draw_sprite(sAllItemIcon,-1,x+5,y+5)
  else
    draw_sprite(sAllItemIcon,-1,x+10,y+10)
}
//flash after map choice
if oWorldMap.choseLevel>0 and selectionMade=true
{
  draw_set_color(c_white)
  draw_set_alpha(screenFlash)
  draw_rectangle(0,0,512,384,false)
}
