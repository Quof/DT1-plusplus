#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
enemyCount=-1
bossFinishFadeAlpha=1
fadeColor=c_black
sceneProgress=0
sceneDelay=0

//GM8.2 change (added): this room's own four tiles on the fortress layer (depth 1000000), greyed with it below. The
//original greyed them by their GM8.1 tile ids (10197501-10197503, 10197507), but GM8.2 numbers a room's tiles as it
//loads it, so those ids don't exist ("Tile does not exist."). They're found where they are instead, before the fortress
//tiles are added to the same layer (those overlap some of them)
var tRoomTile,tI;
tRoomTile[0]=tile_layer_find(1000000,157,296) //GM8.1 10197501: (133,272) 48x48
tRoomTile[1]=tile_layer_find(1000000,205,296) //GM8.1 10197502: (181,272) 48x48
tRoomTile[2]=tile_layer_find(1000000,245,285) //GM8.1 10197503: (229,269) 32x32
tRoomTile[3]=tile_layer_find(1000000,114,285) //GM8.1 10197507: (95,269) 38x32

fortressLeft=tile_add(backBRFExteriorProp,0,0,136,222,176,54,1000000)
fortressRight=tile_add(backBRFExteriorProp,0,0,136,222,176,54,1000000)
tile_set_scale(fortressRight,-1,1)
fortressEmblem=tile_add(backBRFExteriorEmblem,0,0,38,38,157,191,1000000)

xTilePlacer=room_width-32
for(i=0;i<64;i+=1)
{
  grassTile1[i]=tile_add(backBRFExteriorGrass,0,0,32,32,xTilePlacer,320,999999)
  tile_set_blend(grassTile1[i],c_ltgray)
  grassTile2[i]=tile_add(backBRFExteriorGrass,0,0,32,32,xTilePlacer,352,999999)
  tile_set_blend(grassTile2[i],c_ltgray)
  xTilePlacer-=32
}

background_index[0]=backBRFExteriorCloud
background_visible[0]=true
background_y[0]=32
background_vtiled[0]=false
background_hspeed[0]=-2

playerImage=instance_create(400,312,oMisc)
playerImage.sprite_index=sJerryLookBR
playerImage.image_speed=0.2
playerImage.type=1

tile_set_blend(fortressLeft,c_gray)
tile_set_blend(fortressRight,c_gray)
tile_set_blend(fortressEmblem,c_gray)
//tile_set_blend(10197501,c_gray)
//tile_set_blend(10197502,c_gray)
//tile_set_blend(10197503,c_gray)
//tile_set_blend(10197507,c_gray)
for(tI=0;tI<4;tI+=1) {if tRoomTile[tI]>=0 {tile_set_blend(tRoomTile[tI],c_gray)}} //GM8.2 change: the room's tiles, found at the top

tile_layer_shift(1000000,-384,0)
tile_layer_shift(999998,192,0)
playerImage.x+=192
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sceneProgress=0
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //if sceneDelay=1
  if scrCountPass(sceneDelay,1) //60fps change: once, when the count reaches it
  {
    var tempMplay;
    tempMplay=global.msc_BRFintro
    playMusic(tempMplay,0,1)
    global.gamePaused=true
    stopPlayer()
  }
  else if sceneDelay>=80
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=1
{
  if bossFinishFadeAlpha>0
    //bossFinishFadeAlpha-=0.1
    bossFinishFadeAlpha-=0.1*gDeltaTime //60fps change: per 30fps tick
  else if bossFinishFadeAlpha<=0
    sceneProgress+=1
}
else if sceneProgress=2
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  //tile_layer_shift(1000000,0.9,0)
  tile_layer_shift(1000000,0.9*gDeltaTime,0) //60fps change: the layers slide every frame: per 30fps tick
  //tile_layer_shift(999999,1.15,0)
  tile_layer_shift(999999,1.15*gDeltaTime,0) //60fps change: see above
  //if sceneDelay>=300
  if sceneDelay>299 //60fps change: the same 30fps ticks (it counts in gDeltaTime steps)
  {
    //tile_layer_shift(999998,-1.5,0)
    tile_layer_shift(999998,-1.5*gDeltaTime,0) //60fps change: see above
    //playerImage.x-=1.5
    playerImage.x-=1.5*gDeltaTime //60fps change: per 30fps tick
  }
  if sceneDelay>=630
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=3
{
  //sceneDelay+=1
  sceneDelay+=gDeltaTime //60fps change: counts 30fps ticks
  if sceneDelay>=285
  {
    sceneDelay=0
    sceneProgress+=1
  }
}
else if sceneProgress=4
{
  stopAllMusic()
  global.gameProgress=155
  global.gamePaused=false
  //transition_steps=30
  transition_steps=30 //60fps change: the original steps: GM plays a room transition at the new room's own speed (30; oGame sets room_speed only once the room runs), so steps/gDeltaTime made it 2x/4x as long at 60/120fps
  transition_kind=21
  room_goto(rBRFort1)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(0,0,room_width,32,false)

if bossFinishFadeAlpha>0
{
  draw_set_alpha(bossFinishFadeAlpha)
  draw_set_color(fadeColor)
  draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false)
}
