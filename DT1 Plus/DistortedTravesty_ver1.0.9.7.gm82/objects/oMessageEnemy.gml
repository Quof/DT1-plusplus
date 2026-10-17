#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.gamePaused=true
global.recEnemiesScanned+=1
playSound(global.snd_InfoOn,0,1)
playSound(global.snd_DataScan,0,1)
windowClosed=false
jIntChange=0
oPlayer1.image_speed=0
textColor=make_color_rgb(0,255,0)
borderColor=make_color_rgb(0,24,0)
fillColor=make_color_rgb(0,48,0)
selectColor=make_color_rgb(0,96,0)
scanProgress=0
scanStep=0
statsWindowX=x
statsWindowY=y
combatWindowX=x
combatWindowY=y+81
controlWindowX=x+237
controlWindowY=y+39
crippleWindowX=x
crippleWindowY=y+228
resistWindowX=x
resistWindowY=y+282
statWindowHeight=0
combatWindowHeight=0
controlWindowHeight=0
crippleWindowHeight=0
resistWindowHeight=0
threatLevelX=x+237
threatLevelY=y+31
crippleX=x+1
crippleY=y+228
resistX=x+1
resistY=y+282
scatterIncTime=0
scatterDataX=x+329
setPos=91
for(i=0;i<19;i+=1)
{
  scatterData[i]=round(random(8999999)+1000000)
  scatterDataY[i]=y+setPos
  setPos+=6
}
bAssignValues=false

for(i=0;i<5;i+=1)
  scanData[i]=0

circleRad[0]=36
circleRad[1]=24
circleRad[2]=12
for(i=0;i<3;i+=1)
  circleAlpha[i]=0
//scan intro
bShowInfo=false
progressBar=0
barX=view_xview[0]+156
barY=view_yview[0]+128
scanDots="SCANNING"
scanDotsTime=0
scanConvertTime=0
loadingIncTime=0
loadingDataX=x+330
setPos=128
for(i=0;i<25;i+=1)
{
  loadingData[i]=round(random(899999999999)+100000000000)
  loadingDataY[i]=view_yview[0]+setPos
  setPos+=6
}
loadingData[2]="ERROR 404"
loadingData[4]="PLEASE WAIT"
loadingData[5]="THE TARGET IS"
loadingData[6]="BEING SCANNED"
loadingData[12]="SCANNING FOR"
loadingData[13]="THREAT LEVEL"
loadingData[18]="DATA TRANSFER"
loadingData[19]="CURRENTLY IN"
loadingData[20]="PROGRESS"
loadingData[21]="SYSTEM32.CED"
loadingData[22]="IS MISSING"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if windowClosed=true
  instance_destroy()

if bShowInfo=true
{
  //if keyboard_check_pressed(ord("J")) and windowClosed=false
  if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) and windowClosed=false //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
  {
    io_clear()
    scrGamepadSync() //gamepad change (added): and the gamepad's presses (io_clear only clears the keyboard's, so a pad press it was meant to use up still counted for the rest of the frame: A that closed dialogue also jumped, Up at a door went through the door it arrived at and back)
    playSound(global.snd_InfoOff,0,1)
    windowClosed=true
    global.gamePaused=false
  }
  //else if keyboard_check_pressed(ord("K")) and windowClosed=false
  else if (keyboard_check_pressed(ord("K")) or scrPadPressed(18)) and windowClosed=false //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    currentDisplay=combatData
  }
  //else if keyboard_check_pressed(ord("L")) and sideComment!="" and windowClosed=false
  else if (keyboard_check_pressed(ord("L")) or scrPadPressed(21)) and sideComment!="" and windowClosed=false //gamepad change: and the gamepad's Y (swap lists) (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    currentDisplay=sideComment
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bAssignValues=false
{
  scatterData[3]=xPos
  scatterData[4]=yPos
  scatterData[8]=xFind
  scatterData[9]=yFind
  scatterData[13]=currentLife
  scatterData[16]="INVALID"
  bAssignValues=true
}
//draw back color
draw_set_color(textColor)
draw_set_alpha(0.4)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
//target effect
for(i=0;i<3;i+=1)
{
  //circleAlpha[i]+=0.04
  circleAlpha[i]+=0.04*gDeltaTime //60fps change: per 30fps tick
  draw_set_alpha(circleAlpha[i])
  draw_circle(effectX,effectY,circleRad[i],true)
  //circleRad[i]-=1
  circleRad[i]-=gDeltaTime //60fps change: per 30fps tick
  if circleRad[i]<=0
  {
    circleRad[i]=36
    circleAlpha[i]=0
  }
}

if bShowInfo=true //SCAN DATA
{
draw_set_alpha(1)
draw_set_font(fnt_ScanData)
draw_set_halign(fa_left)
draw_text(effectX-36,effectY+36,round(random(8999999)+1000000))
draw_text(effectX-36,effectY+42,round(random(8999999)+1000000))
draw_text(effectX-36,effectY+48,round(random(8999999)+1000000))
//statistical data window
if statWindowHeight<78
  //statWindowHeight+=6
  statWindowHeight+=6*gDeltaTime //60fps change: per 30fps tick
if combatWindowHeight<144
  //combatWindowHeight+=6
  combatWindowHeight+=6*gDeltaTime //60fps change: per 30fps tick
if controlWindowHeight<39
  //controlWindowHeight+=3
  controlWindowHeight+=3*gDeltaTime //60fps change: per 30fps tick
if crippleWindowHeight<51
  //crippleWindowHeight+=3
  crippleWindowHeight+=3*gDeltaTime //60fps change: per 30fps tick
if resistWindowHeight<48
  //resistWindowHeight+=4
  resistWindowHeight+=4*gDeltaTime //60fps change: per 30fps tick
draw_set_alpha(1)
draw_set_color(fillColor)
draw_rectangle(statsWindowX,statsWindowY,statsWindowX+234,statsWindowY+statWindowHeight,false)
draw_set_color(borderColor)
draw_rectangle(statsWindowX,statsWindowY,statsWindowX+234,statsWindowY+statWindowHeight,true)
if statWindowHeight>=13
  draw_line(statsWindowX,statsWindowY+13,statsWindowX+234,statsWindowY+13)
//combat data window
draw_set_color(fillColor)
draw_rectangle(combatWindowX,combatWindowY,combatWindowX+326,combatWindowY+combatWindowHeight,false)
draw_set_color(borderColor)
draw_rectangle(combatWindowX,combatWindowY,combatWindowX+326,combatWindowY+combatWindowHeight,true)
//control window
draw_set_color(fillColor)
draw_rectangle(controlWindowX,controlWindowY,controlWindowX+139,controlWindowY+controlWindowHeight,false)
draw_set_color(selectColor)
if controlWindowHeight>=39
{
  if currentDisplay=combatData
    draw_rectangle(controlWindowX,controlWindowY+14,controlWindowX+139,controlWindowY+26,false)
  else if currentDisplay=sideComment
    draw_rectangle(controlWindowX,controlWindowY+27,controlWindowX+139,controlWindowY+39,false)
}
draw_set_color(borderColor)
draw_rectangle(controlWindowX,controlWindowY,controlWindowX+139,controlWindowY+controlWindowHeight,true)
if controlWindowHeight>=13
  draw_line(controlWindowX,controlWindowY+13,controlWindowX+139,controlWindowY+13)
if controlWindowHeight>=26
  draw_line(controlWindowX,controlWindowY+26,controlWindowX+139,controlWindowY+26)
if controlWindowHeight>=39
  draw_line(controlWindowX+10,controlWindowY,controlWindowX+10,controlWindowY+39)
//cripple window
draw_set_color(fillColor)
draw_rectangle(crippleWindowX,crippleWindowY,crippleWindowX+376,crippleWindowY+crippleWindowHeight,false)
draw_set_color(borderColor)
draw_rectangle(crippleWindowX,crippleWindowY,crippleWindowX+376,crippleWindowY+crippleWindowHeight,true)
//resist window
draw_set_color(fillColor)
draw_rectangle(resistWindowX,resistWindowY,resistWindowX+130,resistWindowY+resistWindowHeight,false)
draw_set_color(borderColor)
draw_rectangle(resistWindowX,resistWindowY,resistWindowX+130,resistWindowY+resistWindowHeight,true)

//statistical data
draw_set_color(textColor)
draw_set_font(fnt_EnemyScan)
if statWindowHeight>=78
{
  draw_text(statsWindowX+3,statsWindowY,name)
  draw_text(statsWindowX+3,statsWindowY+13,"Durability:")
  draw_text(statsWindowX+3,statsWindowY+26,"Power Output:")
  draw_text(statsWindowX+3,statsWindowY+39,"Armor:")
  draw_text(statsWindowX+3,statsWindowY+52,"Spirit Output:")
  draw_text(statsWindowX+3,statsWindowY+65,"Spirit Resistance:")
  draw_set_halign(fa_right)
  if scanProgress<5
  {
    if scanStep>=12
    {
      scanProgress+=1
      //scanStep=0
      //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
      scanStep=gDeltaTime-1
    }
    else
      //scanStep+=1
      scanStep+=gDeltaTime //60fps change: see above

    if gDeltaDoTicks //60fps change (added): new random numbers once per 30fps tick
    for(i=0;i<5;i+=1)
      scanData[i]=round(random(8999)+1000)
  }
  if scanProgress>=1
  {
    real(life)
    if bossInfo=false
    {
      barLife=life/20
      if barLife>226
        barLife=226
      draw_set_alpha(0.3)
      draw_line_width(statsWindowX+230,statsWindowY+22,statsWindowX+230-barLife,statsWindowY+22,4)
      draw_set_alpha(1)
      draw_text(statsWindowX+231,statsWindowY+13,life)
    }
    else
      draw_text(statsWindowX+231,statsWindowY+13,"????")
  }
  else
    draw_text(statsWindowX+231,statsWindowY+13,scanData[0])
  if scanProgress>=2
  {
    barPPower=pPower/6
    if barPPower>226
      barPPower=226
    draw_set_alpha(0.3)
    draw_line_width(statsWindowX+230,statsWindowY+35,statsWindowX+230-barPPower,statsWindowY+35,4)
    draw_set_alpha(1)
    draw_text(statsWindowX+231,statsWindowY+26,pPower)
  }
  else
    draw_text(statsWindowX+231,statsWindowY+26,scanData[1])
  if scanProgress>=3
  {
    barPDefense=pDefense/6
    if barPDefense>226
      barPDefense=226
    draw_set_alpha(0.3)
    draw_line_width(statsWindowX+230,statsWindowY+48,statsWindowX+230-barPDefense,statsWindowY+48,4)
    draw_set_alpha(1)
    draw_text(statsWindowX+231,statsWindowY+39,pDefense)
  }
  else
    draw_text(statsWindowX+231,statsWindowY+39,scanData[2])
  if scanProgress>=4
  {
    barSPower=sPower/6
    if barSPower>226
      barSPower=226
    draw_set_alpha(0.3)
    draw_line_width(statsWindowX+230,statsWindowY+61,statsWindowX+230-barSPower,statsWindowY+61,4)
    draw_set_alpha(1)
    draw_text(statsWindowX+231,statsWindowY+52,sPower)
  }
  else
    draw_text(statsWindowX+231,statsWindowY+52,scanData[3])
  if scanProgress>=5
  {
    barSDefense=sDefense/6
    if barSDefense>226
      barSDefense=226
    draw_set_alpha(0.3)
    draw_line_width(statsWindowX+230,statsWindowY+74,statsWindowX+230-barSDefense,statsWindowY+74,4)
    draw_set_alpha(1)
    draw_text(statsWindowX+231,statsWindowY+65,sDefense)
  }
  else
    draw_text(statsWindowX+231,statsWindowY+65,scanData[4])
}
//combat data & Jeremy's comments
draw_set_font(fnt_CombatData)
draw_set_halign(fa_left)
if combatWindowHeight>=114
  draw_text_ext(combatWindowX+2,combatWindowY,currentDisplay,8,320)
//controls
draw_set_font(fnt_EnemyScan)
if controlWindowHeight>=39
{
  draw_text(controlWindowX+2,controlWindowY,"J End Analysis")
  draw_text(controlWindowX+2,controlWindowY+13,"K Combat Data")
  draw_text(controlWindowX+2,controlWindowY+26,"L " +string(global.mainCharacters[1]) +string(" Comments"))
}
//cripple data
draw_set_font(fnt_CombatData)
if crippleWindowHeight>=51
{
  draw_text(crippleX,crippleY,"Cripple Point:")
  draw_text(crippleX+100,crippleY,crippleData)
}
//resist data
if resistWindowHeight>=48
{
  draw_set_halign(fa_left)
  draw_text(resistX,resistY,"Fire Resist:")
  draw_text(resistX,resistY+9,"Water Resist:")
  draw_text(resistX,resistY+18,"Wind Resist:")
  draw_text(resistX,resistY+27,"Earth Resist:")
  draw_text(resistX,resistY+36,"Skill Resist:")
  draw_set_halign(fa_right)
  if bossInfo=false
  {
    draw_text(resistX+129,resistY,fireRes)
    draw_text(resistX+129,resistY+9,waterRes)
    draw_text(resistX+129,resistY+18,windRes)
    draw_text(resistX+129,resistY+27,earthRes)
    draw_text(resistX+129,resistY+36,skillRes)
  }
  else
  {
    draw_text(resistX+129,resistY,"???")
    draw_text(resistX+129,resistY+9,"???")
    draw_text(resistX+129,resistY+18,"???")
    draw_text(resistX+129,resistY+27,"???")
    draw_text(resistX+129,resistY+36,"???")
  }
}
//threat level
draw_set_font(fnt_ScanData)
draw_set_halign(fa_left)
draw_text(threatLevelX,threatLevelY,"Threat Level:")
draw_set_halign(fa_right)
draw_text(threatLevelX+80,threatLevelY,round(100-(oPlayer1.lifePercent*100)))
draw_set_halign(fa_left)
draw_text(threatLevelX+80,threatLevelY,"%")

//scatter data
//scatterIncTime+=1
scatterIncTime+=gDeltaTime //60fps change: counts 30fps ticks
for(i=0;i<19;i+=1)
{
  draw_text(scatterDataX,scatterDataY[i],">")
  draw_text(scatterDataX+4,scatterDataY[i],scatterData[i])
  if scatterIncTime>=4
  {
    scatterDataY[i]-=6
    if scatterDataY[i]<=y+85
      scatterDataY[i]=y+91+(6*18)
  }
}
if scatterIncTime>=4
  scatterIncTime=0
}
else //SCANNING DATA
{
  draw_set_alpha(1)
  draw_set_color(fillColor)
  draw_rectangle(barX,barY,barX+202,barY+12,false)
  draw_set_color(borderColor)
  draw_rectangle(barX,barY,barX+202,barY+12,true)
  draw_set_color(selectColor)
  draw_rectangle(barX+1,barY+1,barX+progressBar,barY+11,false)
  draw_set_color(textColor)
  draw_set_font(fnt_EnemyScan)
  draw_set_halign(fa_left)
  if scanDotsTime>=2 and progressBar<200
  {
    if scanDots="SCANNING"
      scanDots="SCANNING."
    else if scanDots="SCANNING."
      scanDots="SCANNING.."
    else if scanDots="SCANNING.."
      scanDots="SCANNING..."
    else if scanDots="SCANNING..."
      scanDots="SCANNING...."
    else if scanDots="SCANNING...."
      scanDots="SCANNING....."
    else if scanDots="SCANNING....."
      scanDots="SCANNING"
    //scanDotsTime=0
    //60fps change: counts 30fps ticks; the frame that resets it counts as a whole tick, as at 30fps (it doesn't count up), so the count starts that far back (0 at 30fps)
    scanDotsTime=gDeltaTime-1
  }
  else
    //scanDotsTime+=1
    scanDotsTime+=gDeltaTime //60fps change: see above
  draw_text(barX+1,barY,scanDots)
  if progressBar>=200
  {
    progressBar=201
    if scanDots!="SCAN COMPLETE"
    {
      playSound(global.snd_ScanComplete,0,1)
      scanDots="SCAN COMPLETE"
    }
    //scanConvertTime+=1
    scanConvertTime+=gDeltaTime //60fps change: counts 30fps ticks
    if scanConvertTime>=30
    {
      playSound(global.snd_MenuOpen,0,1)
      bShowInfo=true
    }
  }
  else
    //progressBar+=5
    progressBar+=5*gDeltaTime //60fps change: per 30fps tick
  //loading data
  draw_set_font(fnt_ScanData)
  //loadingIncTime+=1
  loadingIncTime+=gDeltaTime //60fps change: counts 30fps ticks
  for(i=0;i<25;i+=1)
  {
    draw_text(loadingDataX,loadingDataY[i],">")
    draw_text(loadingDataX+4,loadingDataY[i],loadingData[i])
    draw_text(loadingDataX-276,loadingDataY[i],">")
    draw_text(loadingDataX-272,loadingDataY[i],loadingData[i])
    if loadingIncTime>=3
    {
      loadingDataY[i]-=6
      if loadingDataY[i]<=view_yview[0]+122
        loadingDataY[i]=view_yview[0]+128+(6*24)
    }
  }
  if loadingIncTime>=3
    loadingIncTime=0
}
