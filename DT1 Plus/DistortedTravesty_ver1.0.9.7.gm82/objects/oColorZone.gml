#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if zoneElement=1
  image_blend=c_red
else if zoneElement=2
  image_blend=c_blue
else if zoneElement=3
  image_blend=c_green
else if zoneElement=4
  image_blend=make_color_rgb(120,60,0)
flashTime=0
innerAlpha=0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.gamePaused=false
{
  if zoneType=0
  {
    if collision_rectangle(x,y,x+zoneWidth,y+zoneHeight,oPlayer1,0,1)
    {
      if zoneElement=oColorIndControl.elementToShow
        oColorIndControl.bWillDamagePlayer=2
      if flashTime=0
      {
        if innerAlpha=0.5
          innerAlpha=0.6
        else
          innerAlpha=0.5
        flashTime=3
      }
      else
        flashTime-=1
    }
    else
    {
      flashTime=0
      innerAlpha=0.5
    }
  }
  else if zoneType=1
  {
    if collision_circle(x,y,zoneRadius,oPlayer1,0,1)
    {
      if zoneElement=oColorIndControl.elementToShow
        oColorIndControl.bWillDamagePlayer=2
      if flashTime=0
      {
        if innerAlpha=0.5
          innerAlpha=0.6
        else
          innerAlpha=0.5
        flashTime=3
      }
      else
        flashTime-=1
    }
    else
    {
      flashTime=0
      innerAlpha=0.5
    }
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if zoneType=0
{
  draw_set_color(image_blend)
  draw_set_alpha(innerAlpha)
  draw_rectangle(x,y,x+zoneWidth,y+zoneHeight,0)
  draw_set_alpha(0.9)
  draw_rectangle(x,y,x+zoneWidth,y+zoneHeight,1)
}
else if zoneType=1
{
  draw_set_color(image_blend)
  draw_set_alpha(innerAlpha)
  draw_circle(x,y,zoneRadius,0)
  draw_set_alpha(0.9)
  draw_circle(x,y,zoneRadius,1)
}
