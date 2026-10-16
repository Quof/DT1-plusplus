#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
global.recBlazingAppear+=1
image_speed=0.33
currentSpell="FIELD BLAST"
damageType="SPIRIT"
spiritPower=round(oPlayer1.spiritPower*1.5)
elementType=1
skillPower=350
mask_index=sBlazingAssistFire2

attackProgress=0
attackTime=0
x=oPlayer1.x+lengthdir_x(400,135)
y=oPlayer1.y+lengthdir_y(400,135)
pointToHitX=oPlayer1.x
pointToHitY=oPlayer1.y

ranMessage=irandom_range(0,1)
if ranMessage=0
  messageToShow="Eat fire bitches!!"
else if ranMessage=1
  messageToShow="Want some help " +string(global.mainCharacters[0]) +string("?")

msgCreate(messageToShow,0,oMessagePerson,"Blazing The Bat",0,1)
newMessage.fadingTime=110
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if global.gamePaused=false
{
  if attackProgress=0 //crash down
  {
    image_xscale+=0.003
    image_yscale+=0.003
    x+=1.5
    y+=1.5
    if point_distance(x,y,pointToHitX,pointToHitY)<12
      attackProgress+=1
  }
  else if attackProgress=1 //blow up
  {
    attackTime+=1
    if attackTime>=60
    {
      image_xscale+=0.5
      image_yscale+=0.5
    }
    else
    {
      image_xscale+=0.05
      image_yscale+=0.05
    }
    if attackTime>=80
      instance_destroy()
  }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,-1,x,y,1,1,image_angle,image_blend,image_alpha)
draw_sprite_ext(sBlazingAssistFire1,-1,x,y,image_xscale,image_yscale,image_angle,image_blend,0.33)
draw_sprite_ext(sBlazingAssistFire2,-1,x,y,image_xscale,image_yscale,45,image_blend,0.6)
draw_set_alpha(1)
draw_set_alpha(random(0.05)+0.6)
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,image_xscale*64,c_red,c_black,false)
draw_set_blend_mode(bm_normal)
