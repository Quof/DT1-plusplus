#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.deathCount+=1
global.gameOver=true
global.gamePaused=true
difficultyChange=false
//quick restart change (added): made by the pause menu's Quick Restart (oHUD): it takes its first option at once (Retry
//Boss in a boss fight, Retry From Room Entry elsewhere; the Step) and isn't drawn. Counted as a death all the same
qrNow=0
if variable_global_exists("qrRestart") {if global.qrRestart=1 {qrNow=1}}
global.qrRestart=0
if global.teleportEnabled=1
  global.teleportEnabled=0
if global.deathCount=1
  ranMessage=0
else
{
  var goMessage;
  goMessage=51
  if global.difficulty=1
    ranMessage=round(random(goMessage)+3)
  else
    ranMessage=round(random(goMessage))
}
if ranMessage=0 gameOverMessage="GAME  OVER"
else if ranMessage=1 gameOverMessage="WAY TO FAIL AT LIFE"
else if ranMessage=2 gameOverMessage="TRY NOT SUCKING NEXT TIME"
else if ranMessage=3 gameOverMessage="EVER THOUGHT ABOUT#WINNING?"
else if ranMessage=4 gameOverMessage="YOU COULD ALWAYS TRY#THE NOT SUCK BUTTON"
else if ranMessage=5 gameOverMessage="THREE WORDS#YOU SUCK ASS"
else if ranMessage=6 gameOverMessage="I CAN'T BEGIN TO DESCRIBE#HOW MUCH YOU SUCK"
else if ranMessage=7 gameOverMessage="WELL THE WORLD 'WAS'#DEPENDING ON YOU ANYWAY"
else if ranMessage=8 gameOverMessage="PRACTICE MORE, OH WAIT#YOU'D STILL FAIL"
else if ranMessage=9 gameOverMessage="MOST PATHETIC LOSS#EVER!!!"
else if ranMessage=10 gameOverMessage="YOU COULD WIN,#BUT THAT WOULD REQUIRE#YOU TO NOT FAIL"
else if ranMessage=11 gameOverMessage="YOU DID IT!!#OH... NEVERMIND"
else if ranMessage=12 gameOverMessage="READY TO CRY YET?"
else if ranMessage=13 gameOverMessage="YOU JUST BECAME#THEIR BITCH"
else if ranMessage=14 gameOverMessage="I LAUGHED JUST NOW"
else if ranMessage=15 gameOverMessage="REMEMBER THAT TIME#YOU LOST?#OH THAT'S NOW"
else if ranMessage=16 gameOverMessage="YOU JUST LOST THIS#AND 'THE GAME'"
else if ranMessage=17 gameOverMessage="APPARENTLY YOU WERE#BORN TO FAIL"
else if ranMessage=18 gameOverMessage="YOU JUST WEREN'T#GOOD ENOUGH"
else if ranMessage=19 gameOverMessage="YOU'RE AN OVERACHIEVER#WHEN IT COMES TO FAIL"
else if ranMessage=20 gameOverMessage="YOU TRIED ONCE AND FAILED#YOU TRIED AGAIN AND FAILED"
else if ranMessage=21 gameOverMessage="..."
else if ranMessage=22 gameOverMessage="IT'S OKAY, YOU WERE#NEVER THAT GOOD ANYWAY"
else if ranMessage=23 gameOverMessage="MIGHT AS WELL JUST#GIVE UP NOW"
else if ranMessage=24 gameOverMessage="YOU HAVE LOST " +string(global.deathCount) +string("#TIMES, WHICH IS PRETTY FUNNY")
else if ranMessage=25 gameOverMessage="YOU WEREN'T ALWAYS THIS#BAD WERE YOU?"
else if ranMessage=26 gameOverMessage="REMEMBER THAT TIME#YOU WON?#NEITHER DO I"
else if ranMessage=27 gameOverMessage="YOU COULD ALWAYS QUIT#BUT THEN YOU'D BE#A QUITTER"
else if ranMessage=28 gameOverMessage="GAME  OVER#AGAIN AND AGAIN"
else if ranMessage=29 gameOverMessage="NOT TO BE MEAN BUT#YOU SUCK"
else if ranMessage=30 gameOverMessage="YOUR SORRY ATTEMPT#AT PLAYING THIS#IS LAUGHABLE"
else if ranMessage=31 gameOverMessage="WOOSH!!#AND YOU LOST AGAIN"
else if ranMessage=32 gameOverMessage="YOU SUCK SO MUCH#AT THIS"
else if ranMessage=33 gameOverMessage="DON'T WORRY!#YOU'LL DO BETTER NEXT TIME!#WANT A HUG?"
else if ranMessage=34 gameOverMessage="OH, THERE WAS THIS MASSIVE#FAILURE WHO DIED BY, WAIT...#THAT WAS YOU"
else if ranMessage=35 gameOverMessage="I AWARD YOU NO POINTS.#MAY GOD HAVE MERCY#ON YOUR SOUL"
else if ranMessage=36 gameOverMessage="YOU'RE NOT A WINNER#I SEE"
else if ranMessage=37 gameOverMessage="WAX ON, WAX OFF,#WAX ON, WAX OFF"
else if ranMessage=38 gameOverMessage="YOU UNDERSTAND YOU AREN'T#SUPPOSE TO LOSE, RIGHT?"
else if ranMessage=39 gameOverMessage="YOU MUST PLAY A#MEAN PINBALL, HUH?"
else if ranMessage=40 gameOverMessage="MY BLIND AND DEAF#GRANDMA CAN PLAY#BETTER THAN YOU"
else if ranMessage=41 gameOverMessage="DOES SOMETHING STINK#IN HERE OR IS#IT JUST YOU?"
else if ranMessage=42 gameOverMessage="QUOTH THE PLAYER,#'NEVERMORE'"
else if ranMessage=43 gameOverMessage="THERE'S ALWAYS NEXT TIME.#AND AFTER THAT...#AND AFTER THAT AND SO ON"
else if ranMessage=44 gameOverMessage="YOU HAVE PLAYED OTHER#GAMES... RIGHT?"
else if ranMessage=45 gameOverMessage="LOSING IS INEVITABLE.#ESPECIALLY FOR YOU"
else if ranMessage=46 gameOverMessage="SORRY YOU LOST,#BUT WE DON'T HAVE#A COOKIE"
else if ranMessage=47 gameOverMessage="YOU MUST BE A VACUUM,#CAUSE YOU SUCK AND#BLOW AT THIS GAME"
else if ranMessage=48 gameOverMessage="SORRY IF I MADE YOU#CRY, I'LL LAY OFF THE#RAINBOWS NEXT TIME"
else if ranMessage=49 gameOverMessage="FOOD FOR THOUGHT:#STOP LOSING"
else if ranMessage=50 gameOverMessage="ACHIEVEMENT UNLOCKED...#OH WAIT..."
else if ranMessage=51 gameOverMessage="THAT WAS PATHETIC"
else if ranMessage=goMessage+1 gameOverMessage="DUDE, YOU'RE ON EASY MODE"
else if ranMessage=goMessage+2 gameOverMessage="TRY AN EASIER SETTING#OH WAIT YOU CAN'T"
else if ranMessage=goMessage+3 gameOverMessage="GO PLAY DORA'S ADVENTURE."
cl=c_white
rl=c_red
grayCol=make_color_rgb(75,75,75)
stopLoopingSounds()
stopAllMusic()
if global.quickGameOver=0
  playSound(global.snd_GameOver,0,1)
image_speed=0.2
for (i=0;i<7;i+=1)
  background_foreground[i]=false
background_visible[7]=true
background_foreground[7]=true
oPlayer1.xVel=0
oPlayer1.yVel=0
oPlayer1.xAcc=0
oPlayer1.yAcc=0
view_angle[0]=0
alpha1=0
alpha2=0
alpha3=0
alpha4=0
transitionDelay=20
backAlpha=0
backColor=c_white
showOptions=0
useCommands=false
if global.currentBoss=""
{
  GOCursorPos=2
  GOCursorY=200
}
else
{
  GOCursorPos=1
  GOCursorY=176
}
GOCursorX=166
GOCursorInc=24
dcCursorX=14
dcCursorY=224
dcCursorPos=global.difficulty
if dcCursorPos=1
  dcCursorY-=24
else if dcCursorPos=3
  dcCursorY+=24
canLoad=false
staticEffect=0
f1_Location="Not Started"
f2_Location="Not Started"
f3_Location="Not Started"

effect_clear()
ini_open("GameDetails.ini")
currentCheck="ALPHA"
f1_Location=ini_read_string(currentCheck,"311","Not Started")
currentCheck="BETA"
f2_Location=ini_read_string(currentCheck,"311","Not Started")
currentCheck="OMEGA"
f3_Location=ini_read_string(currentCheck,"311","Not Started")
ini_close()
if global.currentQuestLog=1 and f1_Location!="Not Started"
  canLoad=true
else if global.currentQuestLog=2 and f2_Location!="Not Started"
  canLoad=true
else if global.currentQuestLog=3 and f3_Location!="Not Started"
  canLoad=true

with oEvEscapeEffects
  instance_destroy()

if global.quickGameOver=1
{
  global.quickGameOver=0
  staticEffect=9
  background_alpha[7]=0
  backAlpha=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if staticEffect>=2 //fade to black
{
  //staticEffect+=1
  staticEffect+=gDeltaTime //60fps change: counts 30fps ticks
  //if staticEffect=3
  if scrCountPass(staticEffect,3) //60fps change: once, when the count reaches it
  {
    background_alpha[7]=0
    backAlpha=1
  }
  //else if staticEffect=10
  else if scrCountPass(staticEffect,10) //60fps change: once, when the count reaches it
  {
    backColor=c_black
    //if showOptions=0
    if scrCountPass(showOptions,0) //60fps change: once, when the count reaches it
    {
      showOptions=1
      alpha1=0.1
    }
  }
}
else //static effect
{
  //staticEffect+=0.04
  staticEffect+=0.04*gDeltaTime //60fps change: per 30fps tick
  if staticEffect>=1.4
    staticEffect=2
  background_alpha[7]=staticEffect
}

//if showOptions>0 and useCommands=false //start options
if showOptions>=1 and useCommands=false //start options //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
{
  //showOptions+=1
  showOptions+=gDeltaTime //60fps change: counts 30fps ticks
  //if showOptions=2
  if scrCountPass(showOptions,2) //60fps change: once, when the count reaches it
    playSound(global.snd_Continue,0,1)
  //if showOptions=20
  if scrCountPass(showOptions,20) //60fps change: once, when the count reaches it
    useCommands=true
}

if qrNow=1 {useCommands=true} //quick restart change (added): see the Create event
if difficultyChange=false
{
  if useCommands=true
  {
    //if keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) //down
    if keyboard_check_pressed(ord("S")) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //down //gamepad change: and the gamepad's Down (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if GOCursorPos=5
      {
        if global.currentBoss=""
        {
          GOCursorPos=2
          GOCursorY-=GOCursorInc*3
        }
        else
        {
          GOCursorPos=1
          GOCursorY-=GOCursorInc*4
        }
      }
      else
      {
        GOCursorPos+=1
        GOCursorY+=GOCursorInc
      }
    }
    //if keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) //up
    if keyboard_check_pressed(ord("W")) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //up //gamepad change: and the gamepad's Up (scrGamepadInit)
    {
      playSound(global.snd_MenuCursor,0,1)
      if global.currentBoss=""
      {
        if GOCursorPos=2
        {
          GOCursorPos=5
          GOCursorY+=GOCursorInc*3
        }
        else
        {
          GOCursorPos-=1
          GOCursorY-=GOCursorInc
        }
      }
      else
      {
        if GOCursorPos=1
        {
          GOCursorPos=5
          GOCursorY+=GOCursorInc*4
        }
        else
        {
          GOCursorPos-=1
          GOCursorY-=GOCursorInc
        }
      }
    }
    //if keyboard_check_pressed(ord("J")) //confirm
    if (keyboard_check_pressed(ord("J")) or scrPadPressed(17) or qrNow=1) //confirm //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit); quick restart change: or at once for a Quick Restart
    {
      if qrNow=1 {if global.currentBoss="" {GOCursorPos=2} else {GOCursorPos=1}} //quick restart change (added): the first option, whatever was pressed this frame
      scrGamepadSync() //input bleed fix (added): the pad's A (also Jump) doesn't count as held until let go: retrying with it held jumped as soon as the player had control
      if GOCursorPos=1 //retry boss
      {
        playSound(global.snd_MenuConfirm,0,1)
        global.gamePaused=false
        room_restart()
      }
      else if GOCursorPos=2 //retry room
      {
        playSound(global.snd_MenuConfirm,0,1)

        var tChkHP;
        tChkHP=global.p1Life/global.p1MaxLife
        if tChkHP<=oPlayer1.lowHealthThreshold
        {
          tChkHP=round(global.p1MaxLife*(oPlayer1.lowHealthThreshold+0.01))
          global.p1Life=tChkHP
        }

        global.currentBoss=""
        if global.location="Boss Room"
        {
          room_goto(rBR_Main)
        }
        else
        {
          //-------------------- room specific changes --------------------
          if room=rIEF3 and global.gameProgress=4 //Rave Mode tutorial
            global.gameProgress=3
          else if room=rIEF6 and global.gameProgress=9 //DCyborg boss fight
            global.gameProgress=8
          else if room=rOldCastle5 and global.gameProgress=32 //DarkMind boss fight
            global.gameProgress=31
          else if room=rDarkDepths4 and global.gameProgress=41 //DTorso boss fight
            global.gameProgress=40
          else if room=rVegetableGarden4 and global.gameProgress=56 //MetaKnight boss fight
            global.gameProgress=55
          else if room=rDistortionW1_4 and global.gameProgress=63 //AbyssLord boss fight
            global.gameProgress=62
          else if room=rDustyRuins5 and global.gameProgress=77 //FlameInstigator boss fight
            global.gameProgress=76
          else if room=rFrightTrain7 and global.gameProgress=98 //Quick Time Distorter boss fight
            global.gameProgress=97
          else if room=rWestSideJungle5 and global.gameProgress=106 //Dragonroot boss fight
            global.gameProgress=105
          else if room=rTheHideout9 and global.gameProgress=114 //Metallicardian boss fight
            global.gameProgress=113
          else if room=rDistortionW2_6 and global.gameProgress=127 //Demon Cursor boss fight
            global.gameProgress=126
          else if room=rFortL1_6 and global.gameProgress=142 //King Mech boss fight
            global.gameProgress=141
          else if room=rFortL2_4 and global.gameProgress=150 //Copy X boss fight
            global.gameProgress=149
          else if room=rBRFort9 and global.gameProgress=169 //Neo Guardian boss fight
            global.gameProgress=168
          else if room=rBRFort17 and global.gameProgress=180 //Necrobane boss fight
            global.gameProgress=179
          else if room=rMaverickFactory3 and global.MMnapalmProg=8 //Wild Skull Machine boss fight
            global.MMnapalmProg=7
          else if room=rWindyCaves4 and global.gameProgress=194 //Enflamed Blazing Bat boss fight
            global.gameProgress=193
          else if room=rDistortionW3_8 and global.gameProgress=208 //Breakout Mystery boss fight
            global.gameProgress=207
          else if room=rVeiledDetritus12 and global.VDportals[1]=4 //Dark Gear boss fight
            global.VDportals[1]=3
          else if room=rVDlock5_3 and global.gameProgress=238 //Arrghus boss fight
            global.gameProgress=237
          else if room=rShadyWoods4 and global.gameProgress=248 //Ultimate Phalanx boss fight (Woods)
          {
            global.gameProgress=249
            global.teleportEnabled=2
          }
          else if room=rDistortionW4_6 and global.gameProgress=260 //Fourth Wall Crusher boss fight
            global.gameProgress=259
          else if room=rShadyCaves5 and global.gameProgress=274 //Ultimate Phalanx boss fight (Caves)
            global.gameProgress=273
          else if room=rDataSegment9 and global.gameProgress=301 //Data Collector boss fight
            global.gameProgress=300
          else if room=rDataSegment20 and global.gameProgress=321 //Shroud Lord boss fight
            global.gameProgress=320
          else if room=rPrimaryMemory6 and global.gameProgress=337 //Mecha Guardian boss fight
            global.gameProgress=336
          //------------------------------------------------------------
          global.gamePaused=false
          updateOnDeath()
          if global.location="Spire of Forgotten Souls" //Spire of Forgotten Souls
          {
            global.newMapX=256
            global.newMapY=320
            if room=rSoFS_Floor99 or room=rSoFS_Floor100
              room_restart()
            else
              room_goto(rSoFS_Entrance)
          }
          else
            room_restart()
          if room=rPrimaryMemory7 //Mitra boss fight
          {
            global.gameProgress=338
            global.newMapX=1744
            global.newMapY=320
            room_goto(rPrimaryMemory6)
          }
          if room=rPrimaryMemoryEscape1 or room=rPrimaryMemoryEscape2 or room=rPrimaryMemoryEscape3 or room=rPrimaryMemoryEscape4 or room=rPrimaryMemoryEscape5 //Escape scene
          {
            global.gameProgress=342
            global.newMapX=0
            global.newMapY=0
            room_goto(rPrimaryMemoryEscape1)
          }
        }
      }
      else if GOCursorPos=3 and canLoad=true //load file
      {
        loadSaveData(1)
        global.resetMusic=true
        global.currentBoss=""
        if sectionRead="ALPHA" and global.location!="Not Started"
          room_goto(rDataCenter)
        else if sectionRead="BETA" and global.location!="Not Started"
          room_goto(rDataCenter)
        else if sectionRead="OMEGA" and global.location!="Not Started"
          room_goto(rDataCenter)
        playSound(global.snd_MenuConfirm,0,1)
        global.gameOver=false
        global.gamePaused=false
      }
      else if GOCursorPos=4 and global.difficulty!=4 //change difficulty
      {
        playSound(global.snd_MenuConfirm,0,1)
        dcCursorY=224
        dcCursorPos=global.difficulty
        if dcCursorPos=1
          dcCursorY-=24
        else if dcCursorPos=3
          dcCursorY+=24
        difficultyChange=true
      }
      else if GOCursorPos=5 //title screen
      {
        playSound(global.snd_MenuCancel,0,1)
        room_goto(rIntro)
      }
      else
        playSound(global.snd_MenuCancel,0,1)
    }
  }
}
else //difficulty change selection
{
  //if keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) //down
  if keyboard_check_pressed(ord("S")) or (keyboard_check_pressed(vk_down) or scrPadPressed(4)) //down //gamepad change: and the gamepad's Down (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if dcCursorPos=3
    {
      dcCursorPos=1
      dcCursorY-=GOCursorInc*2
    }
    else
    {
      dcCursorPos+=1
      dcCursorY+=GOCursorInc
    }
  }
  //if keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) //up
  if keyboard_check_pressed(ord("W")) or (keyboard_check_pressed(vk_up) or scrPadPressed(3)) //up //gamepad change: and the gamepad's Up (scrGamepadInit)
  {
    playSound(global.snd_MenuCursor,0,1)
    if dcCursorPos=1
    {
      dcCursorPos=3
      dcCursorY+=GOCursorInc*2
    }
    else
    {
      dcCursorPos-=1
      dcCursorY-=GOCursorInc
    }
  }
  //if keyboard_check_pressed(ord("J")) //confirm
  if (keyboard_check_pressed(ord("J")) or scrPadPressed(17)) //confirm //gamepad change: and the gamepad's Menu Confirm (scrGamepadInit)
  {
    scrGamepadSync() //input bleed fix (added): see the confirm above
    playSound(global.snd_MenuConfirm,0,1)
    global.difficulty=dcCursorPos
    difficultyChange=false
  }
  //if keyboard_check_pressed(ord("K")) //cancel
  if (keyboard_check_pressed(ord("K")) or scrPadPressed(18)) //cancel //gamepad change: and the gamepad's Menu Cancel (scrGamepadInit)
  {
    playSound(global.snd_MenuCancel,0,1)
    difficultyChange=false
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if qrNow=1 {exit} //quick restart change (added): not drawn for a Quick Restart (see the Create event)
draw_set_alpha(backAlpha)
draw_set_color(backColor)
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)

if showOptions>0
{
  draw_set_alpha(0.05)
  draw_set_color(make_color_rgb(142,25,0))
  GOlineY1=view_yview[0]+85
  GOlineY2=view_yview[0]+87
  for (i=0;i<30;i+=1)
  {
    draw_rectangle(view_xview[0],GOlineY1,view_xview[0]+512,GOlineY2,false)
    GOlineY1-=1.5
    GOlineY2+=1.5
  }
  draw_set_alpha(0.025)
  draw_set_color(make_color_rgb(235,209,98))
  GOlineY1=view_yview[0]+85
  GOlineY2=view_yview[0]+87
  for (i=0;i<9;i+=1)
  {
    draw_rectangle(view_xview[0],GOlineY1,view_xview[0]+512,GOlineY2,false)
    GOlineY1-=1
    GOlineY2+=1
  }
  draw_set_halign(fa_center)
  draw_set_valign(fa_middle)
  draw_set_color(c_white)
  draw_set_alpha(1)
  draw_set_font(fnt_GameOver)
  draw_text(view_xview[0]+256,view_yview[0]+85,gameOverMessage)
  draw_set_valign(fa_top)
  draw_set_font(fnt_Continue)
  draw_set_halign(fa_left)
  if alpha1>0 and alpha1<=1
    //alpha1+=0.1
    alpha1+=0.1*gDeltaTime //60fps change: per 30fps tick
  if alpha1>0.6 and alpha2<=1
    //alpha2+=0.1
    alpha2+=0.1*gDeltaTime //60fps change: per 30fps tick
  if alpha2>0.6 and alpha3<=1
    //alpha3+=0.1
    alpha3+=0.1*gDeltaTime //60fps change: per 30fps tick
  if alpha3>0.6 and alpha4<=1
    //alpha4+=0.1
    alpha4+=0.1*gDeltaTime //60fps change: per 30fps tick

  if global.currentBoss!=""
    draw_text_color(view_xview[0]+210,view_yview[0]+166,"Retry Boss",cl,cl,cl,cl,alpha1)
  if global.location="Boss Room"
    draw_text_color(view_xview[0]+210,view_yview[0]+190,"Go back to Boss HUB",cl,cl,cl,cl,alpha1)
  else
    draw_text_color(view_xview[0]+210,view_yview[0]+190,"Retry From Room Entry",cl,cl,cl,cl,alpha1)
  draw_text_color(view_xview[0]+210,view_yview[0]+214,"Load From Last Save",cl,cl,cl,cl,alpha2)
  if global.difficulty=4
    draw_text_color(view_xview[0]+210,view_yview[0]+238,"Change Difficulty",grayCol,grayCol,grayCol,grayCol,alpha3)
  else
    draw_text_color(view_xview[0]+210,view_yview[0]+238,"Change Difficulty",cl,cl,cl,cl,alpha3)
  draw_text_color(view_xview[0]+210,view_yview[0]+262,"Return To Title Screen",cl,cl,cl,cl,alpha4)
}

if useCommands=true
  draw_sprite(sGameOverCursor,-1,view_xview[0]+GOCursorX,view_yview[0]+GOCursorY)
if difficultyChange=true
{
  draw_rectangle(view_xview[0]+11,view_yview[0]+187,view_xview[0]+159,view_yview[0]+265,true)
  if global.difficulty=1
    draw_text_color(view_xview[0]+56,view_yview[0]+190,"Beginner",rl,rl,rl,rl,1)
  else
    draw_text_color(view_xview[0]+56,view_yview[0]+190,"Beginner",cl,cl,cl,cl,1)
  if global.difficulty=2
    draw_text_color(view_xview[0]+56,view_yview[0]+214,"Veteran",rl,rl,rl,rl,1)
  else
    draw_text_color(view_xview[0]+56,view_yview[0]+214,"Veteran",cl,cl,cl,cl,1)
  if global.difficulty=3
    draw_text_color(view_xview[0]+56,view_yview[0]+238,"Hardcore",rl,rl,rl,rl,1)
  else
    draw_text_color(view_xview[0]+56,view_yview[0]+238,"Hardcore",cl,cl,cl,cl,1)
  draw_sprite(sGameOverCursor,-1,view_xview[0]+dcCursorX,view_yview[0]+dcCursorY)
}
