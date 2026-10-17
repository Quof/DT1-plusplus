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
oPlayer1.visible=false
oHUD.visible=false
oIdentifier.visible=false
lightBlue=make_color_rgb(0,228,255)
darkBlue=make_color_rgb(0,87,194)
midY=0
bigStripsX=0
outerY=0
smallStripsX=0
clBlend=5
global.gamePaused=true
stopPlayer()

data_Full=">Analyzing New Ability Data...#>Processing Data...#>Reconfiguring Skill Menu Data...#>Restructuring DNA sequence...#>Hacking End Users Registry Data...#>Uploading New Registry Data...#>.........................#>Upload and Hack Complete...#>End User Data Compromised...#>Yay..."
data_New=""
data_Pos=0

text_Full="YOU GOT A NEW ABILITY"
text_New=""
text_Pos=0
if oPlayer1.x=16
{
  abilityGet_Full="INFERNO"
  global.fireLv+=1
  jeremyPhrase="No, I'm not going to show you what it looks like.#Do that on your own."
}
else if oPlayer1.x=32
{
  abilityGet_Full="BLAST SHIELD"
  global.windLv+=1
  jeremyPhrase="Check it out on your own.#No need to show you here."
}
else if oPlayer1.x=64
{
  abilityGet_Full="SOOTHING SPRING"
  global.waterLv+=1
  jeremyPhrase="Just look at it yourself,#I don't feel like showing it to you."
}
else if oPlayer1.x=128
{
  abilityGet_Full="ROCK DRILL"
  global.earthLv+=1
  jeremyPhrase="You can view it without me showing you here."
}
abilityGet_New=""
abilityGet_Pos=0
if global.MMnapalmProg=6 and global.MMgyroProg=6 and global.MMdiveProg=6 and global.MMmysteryProg=6
  goToCutscene=1
else
  goToCutscene=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//stage intro
if sceneProgress=0 //start music
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=45
  if scrCountPass(sceneDelay,45) //60fps change: once, when the count reaches it
  {
    var tempMplay;
    tempMplay=global.msc_MMweaponGet
    playMusic(tempMplay,0,1)
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=1 //center opens
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay>=1 and sceneDelay<=16
  if sceneDelay>0 and sceneDelay<=16 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
    //midY+=2
    midY+=2*gDeltaTime //60fps change: per 30fps tick
  else if sceneDelay>=25
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=2 //big strips
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if bigStripsX<room_width
    //bigStripsX+=12
    bigStripsX+=12*gDeltaTime //60fps change: per 30fps tick
  else
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=3 //small strips
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if outerY<6
    //outerY+=1
    outerY+=gDeltaTime //60fps change: counts 30fps ticks
  if smallStripsX<room_width
    //smallStripsX+=12
    smallStripsX+=12*gDeltaTime //60fps change: per 30fps tick
  else
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=4 //wait time
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=30
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=5 //player sprite appear
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=30
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=6 //wait time
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=30
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=7 //text appear - you got a new ability
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=60
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=8 //text appear - ability
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=75
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=9 //Jeremy speaks
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
  {
    msgCreate(jeremyPhrase,0,oMessagePerson,global.mainCharacters[1],1,1)
    newMessage.fadingTime=90
  }
  if sceneDelay>=105
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=10 //end
{
  stopAllMusic()
  global.gamePaused=false
  global.newMapX=0
  global.newMapY=0
  if goToCutscene=1
  {
    //transition_steps=30
    transition_steps=30/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=21
    room_goto(rCutscene2)
  }
  else
  {
    //transition_steps=45
    transition_steps=45/gDeltaTime //60fps change: transition_steps counts frames: the same time
    transition_kind=15
    room_goto(rMetropolisStageSelect)
  }
}

draw_set_alpha(1)
if sceneProgress>=1 //mid part
{
  draw_set_color(lightBlue)
  draw_rectangle(0,room_height/2,room_width,room_height/2+midY,false)
  draw_rectangle(0,room_height/2,room_width,room_height/2-midY,false)
}
if sceneProgress>=2 //dark blue inner bars
{
  draw_set_color(darkBlue)
  draw_rectangle(0,room_height/2+midY,bigStripsX,room_height/2+midY+9,false)
  draw_rectangle(room_width,room_height/2-midY,room_width-bigStripsX,room_height/2-midY-9,false)
}
if sceneProgress>=3 //light blue outer bars
{
  draw_set_color(lightBlue)
  draw_rectangle(0,room_height/2+midY+9,bigStripsX,room_height/2+midY+9+outerY,false)
  draw_rectangle(room_width,room_height/2-midY-9,room_width-bigStripsX,room_height/2-midY-9-outerY,false)
  draw_set_color(darkBlue)
  draw_line(0,room_height/2+midY+12,smallStripsX,room_height/2+midY+12)
  draw_line(0,room_height/2+midY+15,smallStripsX,room_height/2+midY+15)
  draw_line(room_width,room_height/2-midY-12,room_width-smallStripsX,room_height/2-midY-12)
  draw_line(room_width,room_height/2-midY-15,room_width-smallStripsX,room_height/2-midY-15)
}
if sceneProgress>=4 //random text
{
  draw_set_halign(fa_left)
  draw_set_color(make_color_rgb(0,255,0))
  draw_set_font(fnt_ScanData)
  if data_Pos>=0
  {
    if data_Pos<string_length(data_Full)
    {
      draw_text(12,280,data_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      data_Pos+=1
      data_New+=string_char_at(data_Full,data_Pos)
      } //60fps change (added)
    }
    else
      draw_text(12,280,data_Full)
  }
}
if sceneProgress>=5 //character appears
{
  draw_sprite_ext(sPlayerIdle,0,room_width/2,room_height/2+26,1,1,1,make_color_rgb(clBlend,clBlend,clBlend),1)
  if clBlend<255
    //clBlend+=10
    clBlend+=10*gDeltaTime //60fps change: per 30fps tick
}
if sceneProgress>=7 //you got a weapon
{
  draw_set_font(fnt_EnemyScan)
  draw_set_halign(fa_center)
  draw_set_color(lightBlue)
  if text_Pos>=0
  {
    if text_Pos<string_length(text_Full)
    {
      draw_text(room_width/2,room_height/2+64,text_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      text_Pos+=1
      text_New+=string_char_at(text_Full,text_Pos)
      } //60fps change (added)
    }
    else
      draw_text(room_width/2,room_height/2+64,text_Full)
  }
}
if sceneProgress>=8 //which weapon
{
  if abilityGet_Pos>=0
  {
    if abilityGet_Pos<string_length(abilityGet_Full)
    {
      draw_text(room_width/2,room_height/2+80,abilityGet_New)
      if gDeltaDoTicks //60fps change (added): one letter per 30fps tick (the position stays a whole number)
      { //60fps change (added)
      abilityGet_Pos+=1
      abilityGet_New+=string_char_at(abilityGet_Full,abilityGet_Pos)
      } //60fps change (added)
    }
    else
      draw_text(room_width/2,room_height/2+80,abilityGet_Full)
  }
}
