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

noItemSign=instance_create(265,1856,oMisc)
noItemSign.sprite_index=sStalSign
noItemSign.type=1
noItemSign.depth=25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sceneProgress=0
{
  if oPlayer1.x>=672
  {
    playSound(global.snd_BreakOut,0,0.95)
    stopAllMusic()
    tile_layer_show(999999)
    var newSolid,tEffect;
    newSolid=instance_create(496,1744,oInvisibleSolid); newSolid.image_yscale=12
    newSolid=instance_create(880,1744,oInvisibleSolid); newSolid.image_yscale=12
    for(i=0;i<12;i+=1)
    {
      tEffect=instance_create(504,1752+(i*16),oEffect)
      tEffect.sprite_index=sGrenadeExplosion
      tEffect=instance_create(888,1752+(i*16),oEffect)
      tEffect.sprite_index=sGrenadeExplosion
    }
    sceneProgress+=1
    sceneDelay=0 //439
  }
}
else if sceneProgress=1
{
  sceneDelay+=1
  if sceneDelay=30
  {
    msgCreate("I can't tell if we did something bad or not.",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=90
  }
  else if sceneDelay=130
  {
    msgCreate("You're standing on a whale by the way.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=80
  }
  else if sceneDelay=220
  {
    msgCreate("Look at you, being all observant!",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=70
  }
  else if sceneDelay=300
  {
    playSound(global.snd_BreakOut,0,1)
    instance_create(0,0,oViewShaker)
    var tFlash;
    tFlash=instance_create(0,0,oScreenFlash); tFlash.image_alpha=0.3; tFlash.fadeSpeed=0.05
    oGiantWhale.eyeFrame=0
  }
  else if sceneDelay=310
  {
    msgCreate("Whoa, JEREMY!! WHAT'S GOING ON?!",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=60
  }
  else if sceneDelay=370
  {
    msgCreate("Like I would know!",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=50
  }
  else if sceneDelay=410 {oGiantWhale.eyeFrame=1}
  else if sceneDelay=430
  {
    msgCreate("You're supposed to... whoa, WHY IS IT RISING?!",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=80
  }
  else if sceneDelay=440 {oGiantWhale.yVel=-1; oGiantWhale.eyeFrame=1}
  else if sceneDelay=560
  {
    playMusic(global.msc_VeiledDetritus,0)
    SS_SetSoundFreq(global.msc_VeiledDetritus,8000)
    msgCreate("Why have you come here?",0,oMessagePerson,"Bob the Wise Whale",5,1)
    newMessage.fadingTime=80
  }
  else if sceneDelay=650
  {
    msgCreate("Eh... that's a good question. Why ARE we here, Jeremy?",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=100
  }
  else if sceneDelay=760
  {
    msgCreate("Looking for anything that may help us get out of this program.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=100
  }
  else if sceneDelay=870
  {
    msgCreate("Then you are the ones that have caused the ruckus around our world.#Your goal is an unattainable one. Seek harmony among the world.",0,oMessagePerson,"Bob the Wise Whale",5,1)
    newMessage.fadingTime=180
  }
  else if sceneDelay=1060
  {
    msgCreate("That's what we're trying to do now.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=80
  }
  else if sceneDelay=1150
  {
    msgCreate("Your methods are not wise. I also sense that one among you has given#birth to that which will bring ruin to this world. Destroy this creation#which only seeks to bring destruction, for even that which#watches over the world will fall.",0,oMessagePerson,"Bob the Wise Whale",5,1)
    newMessage.fadingTime=300
  }
  else if sceneDelay=1460
  {
    msgCreate("What's it mean by that?",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=70
  }
  else if sceneDelay=1540
  {
    msgCreate("It's being rather cryptic. I'm not completely sure,#but I think I have an idea of what it means.",0,oMessagePerson,global.mainCharacters[1],0,1)
    newMessage.fadingTime=130
  }
  else if sceneDelay=1680
  {
    msgCreate("If you truly seek balance in the world, then take my treasure.",0,oMessagePerson,"Bob the Wise Whale",5,1)
    newMessage.fadingTime=110
  }
  else if sceneDelay=1800
  {
    msgCreate("So just like that you're going to give us a gift?",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=100
  }
  else if sceneDelay=1910
  {
    msgCreate("I am unable to stop you, all I ask is that you seek balance in our world.",0,oMessagePerson,"Bob the Wise Whale",5,1)
    newMessage.fadingTime=120
  }
  else if sceneDelay=2040
  {
    msgCreate("We will try our best.",0,oMessagePerson,global.mainCharacters[0],0,1)
    newMessage.fadingTime=70
  }
}

if oGiantWhale.y<=336 {oGiantWhale.yVel=0; oGiantWhale.y=336}

if sceneProgress=1 and sceneDelay>=300
{
  if oGiantWhale.chainY<276 {oGiantWhale.chainY+=6}
}
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
