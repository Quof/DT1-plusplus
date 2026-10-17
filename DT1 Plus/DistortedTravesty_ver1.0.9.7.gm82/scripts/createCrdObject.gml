/*
This script creates the image objects during the credits
argument0: objectNum
argument1: x
argument2: y
argument3: sprite to use
argument4: image speed
argument5: h speed
argument6: v speed
*/
argument0=instance_create(argument1,argument2,oEvCreditCharacter)
argument0.sprite_index=argument3
argument0.image_speed=argument4
//argument0.hspeed=argument5
argument0._hspeed=argument5 //60fps change: _hspeed (see correctHSpeedVSpeed in oEvCreditCharacter)
//argument0.vspeed=argument6
argument0._vspeed=argument6 //60fps change: see above
