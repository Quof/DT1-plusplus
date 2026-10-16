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
if global.gameProgress=40 and room=rDarkDepths4
{
  npcInformant=instance_create(496,304,oMisc)
  npcInformant.sprite_index=sInformantIdle
  npcInformant.image_speed=0
  npcInformant.type=1
  npcTorso=instance_create(576,304,oMisc)
  npcTorso.sprite_index=sDTorsoNormal
  npcTorso.image_speed=0.1
  npcTorso.image_xscale=-1
  npcTorso.type=1
}
else if room=rDilutedMansion4
{
  newWall1_1=0
  newWall1_2=0
  newWall1_3=0
  newWall2_1=0
  newWall2_2=0
  newWall2_3=0
  if oPlayer1.y<384
  {
    depth=999999
    newWall1_1=instance_create(256,672,oBreakableBlock3)
    newWall1_1.visible=0
    newWall1_1.image_xscale=2
    newWall1_1.image_yscale=2
    newWall1_2=instance_create(288,672,oBreakableBlock3)
    newWall1_2.visible=0
    newWall1_2.image_xscale=2
    newWall1_2.image_yscale=2
    newWall1_3=instance_create(320,672,oBreakableBlock3)
    newWall1_3.visible=0
    newWall1_3.image_xscale=2
    newWall1_3.image_yscale=2
    newWall2_1=instance_create(256,704,oBreakableBlock3)
    newWall2_1.visible=0
    newWall2_1.image_xscale=2
    newWall2_1.image_yscale=2
    newWall2_2=instance_create(288,704,oBreakableBlock3)
    newWall2_2.visible=0
    newWall2_2.image_xscale=2
    newWall2_2.image_yscale=2
    newWall2_3=instance_create(320,704,oBreakableBlock3)
    newWall2_3.visible=0
    newWall2_3.image_xscale=2
    newWall2_3.image_yscale=2
  }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gameProgress=36 //intro to Transylvania
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Hold on, weren't we JUST in the Mushroom Kingdom?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Yes, I thought so too...#I think I'm starting to figure out what's going on, but I need a#little more data to confirm it.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("Well, I'll just head through this tunnel.#Damn man, I know what enemy type is going to show up now too.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=4
  {
    global.gameProgress=37
    sceneProgress=0
    areaDisplay=instance_create(0,0,oAreaDisplay)
    areaDisplay.areaString="Dark Depths"
    global.gamePaused=false
  }
}
if global.gameProgress=40 and room=rDarkDepths4 //Boss Fight (Distorted Torso)
{
  if sceneProgress=0
  {
    if oPlayer1.x>=400
    {
      global.gamePaused=true
      stopPlayer()
      xVel=0
      yVel=0
      oPlayer1.sprite_index=sPlayerJump
      sceneProgress+=1
    }
  }
  else if sceneProgress=1
  {
    if oPlayer1.y<304
      oPlayer1.y+=4
    else
    {
      oPlayer1.sprite_index=sPlayerIdle
      sceneProgress+=1
    }
  }
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("Where is the Muffin in this area?#They will not wait much longer.",1,oMessageCutscene,global.mainCharacters[4] +string(" - the guy with the hat"))
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("We are working hard to get it, we've tracked it down to the west.",1,oMessageCutscene,"The Big Guy",0)
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You will need to speed it up, the Strawberry Muffin was taken recently#and they are not happy about it.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("News sure does travel fast.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("Dude, be quiet.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
  {
    npcInformant.image_xscale=-1
    msgCreate("...",1,oMessageCutscene,global.mainCharacters[4])
  }
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Hey there.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You...#I sense the presence of a Muffin.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Actually you're just getting a good wiff of it.#It gives off a pretty strong smell.#Which I might add makes it very hard not to eat.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("You're the one that stole the Strawberry Muffin!",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("I wouldn't say THAT!",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Let me handle this.",1,oMessageCutscene,"The Big Guy")
  else if sceneProgress=14 and bWaitForInput=false
  {
    npcInformant.image_xscale=1
    msgCreate("I was going to suggest that.#I am FAR too awesome to fight.",1,oMessageCutscene,global.mainCharacters[4])
  }
  else if sceneProgress=15 and bWaitForInput=false
    msgCreate("He just used my word.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=16
  {
    sceneDelay+=1
    if sceneDelay=1
      npcInformant.sprite_index=sInformantEye
    else if sceneDelay=8
      npcInformant.image_index=1
    else if sceneDelay=15
      npcInformant.image_index=2
    else if sceneDelay=22
      npcInformant.image_index=3
    else if sceneDelay=29
      npcInformant.image_index=4
    else if sceneDelay=36
      npcInformant.image_index=5
    else if sceneDelay=43
      npcInformant.image_index=6
    else if sceneDelay>=55
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=17 and bWaitForInput=false
    msgCreate("What are you doing?",1,oMessageCutscene,"The Big Guy")
  else if sceneProgress=18 and bWaitForInput=false
    msgCreate("Lending you some of their power.",1,oMessageCutscene,global.mainCharacters[4])
  else if sceneProgress=19
  {
    sceneDelay+=1
    if sceneDelay>20 and instance_exists(npcTorso)
    {
      effect_create_above(ef_smoke,(npcTorso.x-(npcTorso.sprite_width/2))+random(npcTorso.sprite_width),(npcTorso.y-(npcTorso.sprite_height))+random(npcTorso.sprite_height),0,c_black)
      if npcTorso.image_blend=c_white
        npcTorso.image_blend=c_red
      else
        npcTorso.image_blend=c_white
    }
    if sceneDelay=20
      npcTorso.sprite_index=sDTorsoNAir
    if sceneDelay>=40 and sceneDelay<=74
      npcTorso.y-=2
    if sceneDelay=100
    {
      playSound(global.snd_BreakOut,0,1)
      bossFinishFadeAlpha=1
      with npcTorso
        instance_destroy()
    }
    if sceneDelay=101
      boss=instance_create(576,224,oDTorso)
    if sceneDelay>=120 and bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    if sceneDelay>=170
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=20 and bWaitForInput=false
    msgCreate("That's just nasty.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=21 and bWaitForInput=false
  {
    npcInformant.sprite_index=sInformantIdle
    npcInformant.image_xscale=-1
    msgCreate("But is perfect for getting that Muffin back.",1,oMessageCutscene,global.mainCharacters[4])
  }
  else if sceneProgress=22
  {
    sceneDelay+=1
    if instance_exists(npcInformant)
      npcInformant.image_yscale-=0.05
    if sceneDelay>=21
      with npcInformant
        instance_destroy()
    if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=23 and bWaitForInput=false
    msgCreate("That's quite a bit of dark energy it's giving off.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=24 and bWaitForInput=false
    msgCreate("Suffer!",1,oMessageCutscene,global.mainCharacters[2])
  else if sceneProgress=25 and bWaitForInput=false
    msgCreate("Given the fact that every waking moment I realize I missed a new#episode of the best TV series ever because of this.#Yeah, I think I'm suffering already.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=26 and bWaitForInput=false
    msgCreate("Didn't that guy seem familiar?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=27 and bWaitForInput=false
    msgCreate("Actually yes, I swear I've seen him in our world...#Kinda creepy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=28
  {
    sceneDelay+=1
    if sceneDelay=3
    {
      barrier1=instance_create(304,192,oBossBarrier)
      barrier2=instance_create(304,240,oBossBarrier)
      barrier3=instance_create(704,240,oBossBarrier)
      oPlayer1.raveTime=0
      sceneDelay=0
      global.gameProgress=41
      sceneProgress=0
      boss.activateBoss=1
      storeStatus(0)
      global.currentBoss="DTorso"
      var tempMplay;
      tempMplay=findMusic()
      playMusic(tempMplay,0)
      global.gamePaused=false
    }
  }
}
else if global.gameProgress=41 //boss fight ends (Distorted Torso)
{
  if sceneProgress=0 and enemyCount=0
  {
    global.gamePaused=true
    oPlayer1.image_speed=0
    oPlayer1.bCanTakeDamage=false
    stopAllMusic()
    sceneProgress+=1
  }
  else if sceneProgress=1
  {
    if bossFinishFadeAlpha<1
      bossFinishFadeAlpha+=0.05
    else if bossFinishFadeAlpha>=1
      sceneProgress+=1
  }
  else if sceneProgress=2
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      endBoss()
      oPlayer1.x=408
      oPlayer1.y=305
      oPlayer1.image_xscale=1
    }
    if sceneDelay>=60
    {
      oPlayer1.life=oPlayer1.maxLife
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=3
  {
    if bossFinishFadeAlpha>0
      bossFinishFadeAlpha-=0.05
    else if bossFinishFadeAlpha<=0
      sceneProgress+=1
  }
  else if sceneProgress=4
  {
    sceneDelay+=1
    if sceneDelay>=25
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Interesting.#What do you think of all this?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("That thing mentioned something about a Muffin to the west.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Yeah, but I just want to go home.#I don't really care about this Muffin stuff.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=8 and bWaitForInput=false
    msgCreate("Well we have no leads, let's just take the key in the next room#and use it to unlock the door in the beginning of this place.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=9 and bWaitForInput=false
    msgCreate("You didn't have to straight out tell me what to do.#I could've figured that out.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=10 and bWaitForInput=false
    msgCreate("Don't you know anything about game design?#You have to assume the player is an idiot.#Go for the lowest common denominator.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=11 and bWaitForInput=false
    msgCreate("I don't think they'd have made it this far if that was the case.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=12 and bWaitForInput=false
    msgCreate("What about wussy mode, aka Easy Mode?",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=13 and bWaitForInput=false
    msgCreate("Oh right...#Anyway, let's just go.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=14
  {
    global.gameProgress=42
    global.currentBoss=""
    var tempMplay;
    tempMplay=findMusic()
    playMusic(tempMplay,0)
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=44 //fading room
{
  if sceneProgress=0
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=35
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("Hmm, someone else is hacking into this area.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("What does that mean?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("This area is going to be a little unstable, don't trust everything you see.#I'm trying to make everything display properly, but this guy is pretty good.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("Well you do your thing, I'll do mine.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5
  {
    global.gameProgress=45
    sceneProgress=0
    global.gamePaused=false
  }
}
if global.gameProgress=46 and room=rDilutedMansion3 //new techs
{
  if sceneProgress=0 and !instance_exists(oNewTechPickup)
  {
    sceneDelay+=1
    if sceneDelay=1
    {
      global.gamePaused=true
      stopPlayer()
    }
    else if sceneDelay>=50
    {
      sceneDelay=0
      sceneProgress+=1
    }
  }
  else if sceneProgress=1 and bWaitForInput=false
    msgCreate("These two new abilities should be able to get you around easier.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=2 and bWaitForInput=false
    msgCreate("How do you know that?",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=3 and bWaitForInput=false
    msgCreate("I cheated.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=4 and bWaitForInput=false
    msgCreate("You would.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=5 and bWaitForInput=false
    msgCreate("Yeah...#Anyway, in case you don't know how to select a new ability.#Open your menu and go to the skills tab, from there you#can assign a new ability to each element.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=6 and bWaitForInput=false
    msgCreate("That's easy.",1,oMessageCutscene,global.mainCharacters[0])
  else if sceneProgress=7 and bWaitForInput=false
    msgCreate("Very, these will allow you to get to the top floor of#the first room in this place.",1,oMessageCutscene,global.mainCharacters[1])
  else if sceneProgress=8
  {
    global.gameProgress=47
    sceneProgress=0
    global.gamePaused=false
  }
}

keyWaitForInput()
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
else if room=rDilutedMansion4
{
  if instance_exists(newWall1_1)
  {
    draw_background_part(tileDilutedMansion,16,16,32,32,newWall1_1.x-16,newWall1_1.y-16)
    draw_background_part(tileDilutedMansion,16,16,16,32,newWall1_1.x+16,newWall1_1.y-16)
    draw_background_part(tileDilutedMansion,16,16,32,16,newWall1_1.x-16,newWall1_1.y+16)
    draw_background_part(tileDilutedMansion,16,16,16,16,newWall1_1.x+16,newWall1_1.y+16)
  }
  if instance_exists(newWall1_2)
  {
    draw_background_part(tileDilutedMansion,16,16,32,32,newWall1_2.x,newWall1_2.y-16)
    draw_background_part(tileDilutedMansion,16,16,32,16,newWall1_2.x,newWall1_2.y+16)
  }
  if instance_exists(newWall1_3)
  {
    draw_background_part(tileDilutedMansion,32,16,32,32,newWall1_3.x,newWall1_3.y-16)
    draw_background_part(tileDilutedMansion,32,16,32,16,newWall1_3.x,newWall1_3.y+16)
  }
  if instance_exists(newWall2_1)
  {
    draw_background_part(tileDilutedMansion,16,16,32,32,newWall2_1.x-16,newWall2_1.y)
    draw_background_part(tileDilutedMansion,16,16,16,32,newWall2_1.x+16,newWall2_1.y)
    draw_background_part(tileDilutedMansion,16,16,32,16,newWall2_1.x-16,newWall2_1.y+32)
    draw_background_part(tileDilutedMansion,16,16,16,16,newWall2_1.x+16,newWall2_1.y+32)
  }
  if instance_exists(newWall2_2)
  {
    draw_background_part(tileDilutedMansion,16,16,32,32,newWall2_2.x,newWall2_2.y)
    draw_background_part(tileDilutedMansion,16,16,32,16,newWall2_2.x,newWall2_2.y+32)
  }
  if instance_exists(newWall2_3)
  {
    draw_background_part(tileDilutedMansion,32,16,32,32,newWall2_3.x,newWall2_3.y)
    draw_background_part(tileDilutedMansion,32,16,16,16,newWall2_3.x,newWall2_3.y+32)
    draw_background_part(tileDilutedMansion,64,16,16,16,newWall2_3.x+16,newWall2_3.y+32)
  }
}
