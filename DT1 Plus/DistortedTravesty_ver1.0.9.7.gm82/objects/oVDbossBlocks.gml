#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
leftBlock=instance_create(224,160,oMovingSolid)
with leftBlock
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=2
  image_yscale=2
}
rightBlock=instance_create(768,160,oMovingSolid)
with rightBlock
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=2
  image_yscale=2
}
topBlock=instance_create(480,-96,oMovingSolid)
with topBlock
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=4
  image_yscale=9
}
bottomLongLeft=instance_create(320,320,oMovingSolid) //320,224
with bottomLongLeft
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=4
  image_yscale=10
}
bottomLongRight=instance_create(640,320,oMovingSolid)
with bottomLongRight
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=4
  image_yscale=10
}
bottomShortLeft=instance_create(384,320,oMovingSolid)
with bottomShortLeft
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=4
  image_yscale=6
}
bottomShortRight=instance_create(576,320,oMovingSolid)
with bottomShortRight
{
  viscidTop=1
  makeActive()
  sprite_index=sInvisibleSolidMask
  visible=0
  image_xscale=4
  image_yscale=6
}

lbMoveDir=0    //left
rbMoveDir=0    //right
tbMoveDir=0    //top
bllbMoveDir=0  //bottom left long
brlbMoveDir=0  //bottom right long
blsbMoveDir=0  //bottom left short
brsbMoveDir=0  //bottom right short
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
****************************** block movement code ******************************
*/
//----- left block -----
if lbMoveDir=1
{
  leftBlock.xVel=-2
  if leftBlock.x<=224
  {
    leftBlock.x=224
    leftBlock.xVel=0
    lbMoveDir=0
  }
}
else if lbMoveDir=2
{
  leftBlock.xVel=2
  if leftBlock.x>=448
  {
    leftBlock.x=448
    leftBlock.xVel=0
    lbMoveDir=0
  }
}
//----- right block -----
if rbMoveDir=1
{
  rightBlock.xVel=2
  if rightBlock.x>=768
  {
    rightBlock.x=768
    rightBlock.xVel=0
    rbMoveDir=0
  }
}
else if rbMoveDir=2
{
  rightBlock.xVel=-2
  if rightBlock.x<=544
  {
    rightBlock.x=544
    rightBlock.xVel=0
    rbMoveDir=0
  }
}
//----- top block -----
if tbMoveDir=1
{
  topBlock.yVel=-1
  if topBlock.y<=-96
  {
    topBlock.y=-96
    topBlock.yVel=0
    tbMoveDir=0
  }
}
else if tbMoveDir=2
{
  topBlock.yVel=1
  if topBlock.y>=0
  {
    topBlock.y=0
    topBlock.yVel=0
    tbMoveDir=0
  }
}
//----- bottom left long block -----
if bllbMoveDir=1
{
  bottomLongLeft.yVel=1
  if bottomLongLeft.y>=320
  {
    bottomLongLeft.y=320
    bottomLongLeft.yVel=0
    bllbMoveDir=0
  }
}
else if bllbMoveDir=2
{
  bottomLongLeft.yVel=-1
  if bottomLongLeft.y<=224
  {
    bottomLongLeft.y=224
    bottomLongLeft.yVel=0
    bllbMoveDir=0
  }
}
//----- bottom right long block -----
if brlbMoveDir=1
{
  bottomLongRight.yVel=1
  if bottomLongRight.y>=320
  {
    bottomLongRight.y=320
    bottomLongRight.yVel=0
    brlbMoveDir=0
  }
}
else if brlbMoveDir=2
{
  bottomLongRight.yVel=-1
  if bottomLongRight.y<=224
  {
    bottomLongRight.y=224
    bottomLongRight.yVel=0
    brlbMoveDir=0
  }
}
//----- bottom left short block -----
if blsbMoveDir=1
{
  bottomShortLeft.yVel=0.5
  if bottomShortLeft.y>=320
  {
    bottomShortLeft.y=320
    bottomShortLeft.yVel=0
    blsbMoveDir=0
  }
}
else if blsbMoveDir=2
{
  bottomShortLeft.yVel=-0.5
  if bottomShortLeft.y<=288
  {
    bottomShortLeft.y=288
    bottomShortLeft.yVel=0
    blsbMoveDir=0
  }
}
//----- bottom right short block -----
if brsbMoveDir=1
{
  bottomShortRight.yVel=0.5
  if bottomShortRight.y>=320
  {
    bottomShortRight.y=320
    bottomShortRight.yVel=0
    brsbMoveDir=0
  }
}
else if brsbMoveDir=2
{
  bottomShortRight.yVel=-0.5
  if bottomShortRight.y<=288
  {
    bottomShortRight.y=288
    bottomShortRight.yVel=0
    brsbMoveDir=0
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//left block
draw_background_part(tileVeiledDetritus,0,112,32,16,leftBlock.x,leftBlock.y)
draw_background_part(tileVeiledDetritus,0,144,32,16,leftBlock.x,leftBlock.y+16)
//right block
draw_background_part(tileVeiledDetritus,0,112,32,16,rightBlock.x,rightBlock.y)
draw_background_part(tileVeiledDetritus,0,144,32,16,rightBlock.x,rightBlock.y+16)
//top block
for(i=0;i<2;i+=1)
  for(ii=0;ii<3;ii+=1)
    draw_background_part(tileVeiledDetritus,0,112,32,48,topBlock.x+(i*32),topBlock.y+(ii*48))
//bottom long left block
for(i=0;i<4;i+=1)
  draw_background_part(tileVeiledDetritus,0,0,16,16,bottomLongLeft.x+(i*16),bottomLongLeft.y)
for(i=0;i<2;i+=1)
  for(ii=0;ii<5;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomLongLeft.x+(i*32),bottomLongLeft.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<4;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomLongLeft.x+(i*32)+16,bottomLongLeft.y+(ii*32)+32)
for(i=0;i<2;i+=1)
  for(ii=0;ii<5;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomLongLeft.x+(i*32)+16,bottomLongLeft.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<4;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomLongLeft.x+(i*32),bottomLongLeft.y+(ii*32)+32)
//bottom long right block
for(i=0;i<4;i+=1)
  draw_background_part(tileVeiledDetritus,0,0,16,16,bottomLongRight.x+(i*16),bottomLongRight.y)
for(i=0;i<2;i+=1)
  for(ii=0;ii<5;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomLongRight.x+(i*32),bottomLongRight.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<4;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomLongRight.x+(i*32)+16,bottomLongRight.y+(ii*32)+32)
for(i=0;i<2;i+=1)
  for(ii=0;ii<5;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomLongRight.x+(i*32)+16,bottomLongRight.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<4;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomLongRight.x+(i*32),bottomLongRight.y+(ii*32)+32)
//bottom short left block
for(i=0;i<4;i+=1)
  draw_background_part(tileVeiledDetritus,0,0,16,16,bottomShortLeft.x+(i*16),bottomShortLeft.y)
for(i=0;i<2;i+=1)
  for(ii=0;ii<3;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomShortLeft.x+(i*32),bottomShortLeft.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<2;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomShortLeft.x+(i*32)+16,bottomShortLeft.y+(ii*32)+32)
for(i=0;i<2;i+=1)
  for(ii=0;ii<3;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomShortLeft.x+(i*32)+16,bottomShortLeft.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<2;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomShortLeft.x+(i*32),bottomShortLeft.y+(ii*32)+32)
//bottom short left block
for(i=0;i<4;i+=1)
  draw_background_part(tileVeiledDetritus,0,0,16,16,bottomShortRight.x+(i*16),bottomShortRight.y)
for(i=0;i<2;i+=1)
  for(ii=0;ii<3;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomShortRight.x+(i*32),bottomShortRight.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<2;ii+=1)
    draw_background_part(tileVeiledDetritus,64,48,16,16,bottomShortRight.x+(i*32)+16,bottomShortRight.y+(ii*32)+32)
for(i=0;i<2;i+=1)
  for(ii=0;ii<3;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomShortRight.x+(i*32)+16,bottomShortRight.y+(ii*32)+16)
for(i=0;i<2;i+=1)
  for(ii=0;ii<2;ii+=1)
    draw_background_part(tileVeiledDetritus,32,144,16,16,bottomShortRight.x+(i*32),bottomShortRight.y+(ii*32)+32)
