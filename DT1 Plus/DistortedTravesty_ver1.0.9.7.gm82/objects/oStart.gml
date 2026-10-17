#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
sColor=c_black
sFade=0
fadeDelay=0
spriteToShow=0
xScale=1
yScale=1
rotation=0
discombobulateY=oPlayer1.y-384
discomFrame=0
oPlayer1.visible=false
oPlayer1.image_speed=0.1
if global.gameProgress=0
  sFade=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=-10
{
  if sceneProgress=1
  {
    if discombobulateY>=oPlayer1.y
    {
      discomFrame=1
      //sceneDelay+=1
      sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
      if sceneDelay>=3
      {
        oPlayer1.visible=true
        sceneDelay=0
        sceneProgress+=1
      }
    }
    else
      //discombobulateY+=16
      discombobulateY+=16*gDeltaTime //60fps change: per 30fps tick
  }
  else if sceneProgress=2
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=15
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Gah, I HATE discombobulating into places like this!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("At least you're in one piece this time.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Last time was the worst, it turned me into a woman!#Oh and I'm still sour about what happened.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("I couldn't help it, you were hot. You would have done the same thing#had you been in my place!",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("That's true...#Well whatever, let's just kick this guy's ass quickly and go.#I've got a date later.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("You do, with who?#It better not be with the new secretary, I've got the hots for her.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("Nah man, my TV.#My favorite show is coming on later and if I miss this episode,#I'll be pissed... oh yeah, how is that new system working on your laptop?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Really good, I can see you with this and everything.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("Nifty.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("It is, I'll keep monitoring the area for you.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Sounds good!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    global.gamePaused=false
    global.showHUD=true
    global.gameProgress=-9
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Integrated Electrical Factory"
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    tutorial=instance_create(0,0,oStartTutorial)
    levelEvent=instance_create(0,0,oEvIEF)
    instance_destroy()
  }
}

keyWaitForInput()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(sColor)
draw_set_alpha(sFade)
if global.gameProgress=-10 and sceneProgress=0
{
  if fadeDelay<=30
    //fadeDelay+=30 //1
    fadeDelay+=30*gDeltaTime //1 //60fps change: per 30fps tick
  else
    //sFade-=1 //0.01
    sFade-=gDeltaTime //0.01 //60fps change: counts 30fps ticks

  //if sFade<=0
  if sFade<1 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //sceneDelay+=1
    sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
    if sceneDelay>=5
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
}
if sceneProgress=0
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
else if sceneProgress=1
  draw_sprite(sPlayerDiscombobulate,discomFrame,oPlayer1.x,discombobulateY)
