/*
element wheel change (added): the Element Wheel (scrElemWheel) around the player while it's showing: a box for each
element where its direction is (Fire above, Water right, Wind below, Earth left; each element's HUD gem in the colour
picked for it, Element Colors) and Physical's in the middle (gold, as the HUD's D-pad has Physical), on the player, for
letting go without picking. Boxes like the HUD's D-pad (brown edge, gold rail, navy); the element on has a white rail.
Moved in from the view's edges so it's all on screen. Called by oHUD's Draw (with oPlayer1) after the HUD, so it's over
everything. Only drawn on a frame scrElemWheel ran (not while the game is paused).
*/
var cx,cy,i,bx,by,k;
if !ewOn or ewFrame!=global.gpFrames {exit} //only while it's up (from the button's press to its release)
cx=round(x)
cy=round(y)-26 //the middle of the player (sPlayerIdle: 53 high, origin at the feet)
cx=median(view_xview[0]+44,cx,view_xview[0]+view_wview[0]-45)
cy=median(view_yview[0]+44,cy,view_yview[0]+view_hview[0]-45)
for(i=0;i<=4;i+=1) //0 Physical (middle), 1 Fire (up), 2 Water (right), 3 Wind (down), 4 Earth (left)
{
  bx=cx
  by=cy
  if i=1 {by-=35}
  else if i=2 {bx+=35}
  else if i=3 {by+=35}
  else if i=4 {bx-=35}
  if i=0 {draw_set_alpha(0.85)} //over the player
  for(k=2;k>=0;k-=1) //the box, 16x16: brown edge, gold rail (white: the element on), navy
  {
    if k=2 {draw_set_color(make_color_rgb(64,32,16))}
    else if k=1
    {
      if global.p1CurrentElement=i {draw_set_color(c_white)}
      else {draw_set_color(make_color_rgb(248,192,72))}
    }
    else {draw_set_color(make_color_rgb(32,48,64))}
    draw_rectangle(bx-6-k,by-6-k,bx+5+k,by+5+k,false)
  }
  if i=0 //Physical: a gold gem
  {
    draw_set_color(make_color_rgb(248,192,72))
    draw_rectangle(bx-2,by-4,bx+1,by+3,false)
    draw_rectangle(bx-4,by-2,bx+3,by+1,false)
    draw_set_color(make_color_rgb(255,240,190))
    draw_rectangle(bx-2,by-2,bx-1,by-1,false)
    draw_set_alpha(1)
  }
  else {scrDrawElemSprite(2,i,bx-5,by-5,1,1,0,1)} //the element's HUD gem (sCurrentElement, 10x10)
}
