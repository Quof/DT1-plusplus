//60fps change (added): replaces "counter mod argument1=0" for a counter that goes up by gDeltaTime each frame.
//True on the frame the counter reaches (or passes) a multiple of argument1, so it still happens once per multiple
//(above 30fps the counter has fractions, and GM8's mod rounds fractions to whole numbers).
//At 30fps (whole numbers counting up by 1) this is the same as "counter mod argument1=0".
//argument0: the counter, after this frame's increment
//argument1: the multiple
return floor(argument0/argument1)!=floor((argument0-gDeltaTime)/argument1)
