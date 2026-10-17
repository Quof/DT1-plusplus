//60fps change (added): an angle in 0-360 (360 not included), as GameMaker keeps its built-in direction.
//For _direction (which stands in for direction, see correctSpeedDirection) where the code compares it with angles.
//argument0: the angle
return argument0-floor(argument0/360)*360
