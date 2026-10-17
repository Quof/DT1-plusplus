/*
element colors change (added): the colour to draw in place of argument1, which is one of element argument0's colours
(1 fire, 2 water, 3 wind, 4 earth; anything else isn't an element: argument1 as it is).
While the element has its own colour (global.elemColorDef; Element Colors, Options Set 3), it's argument1: the game's.
Changed, it's the picked colour's hue, with argument1's saturation and brightness taken as much over or under the picked
colour's as argument1's are over or under the element's own colour: lighter, darker or paler shades stay that way.
*/
var tC,tD;
if argument0<1 or argument0>4 {return argument1}
tC=global.elemColor[argument0]
tD=global.elemColorDef[argument0]
if tC=tD {return argument1}
return make_color_hsv(color_get_hue(tC),min(255,color_get_saturation(argument1)*color_get_saturation(tC)/max(1,color_get_saturation(tD))),min(255,color_get_value(argument1)*color_get_value(tC)/max(1,color_get_value(tD))))
