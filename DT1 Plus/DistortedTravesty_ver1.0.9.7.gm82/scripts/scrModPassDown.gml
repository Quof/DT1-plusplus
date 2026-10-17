//60fps change (added): as scrModPass, for a counter that goes down by gDeltaTime each frame.
//True on the frame the counter reaches (or passes) a multiple of argument1.
//At 30fps (whole numbers counting down by 1) this is the same as "counter mod argument1=0".
//argument0: the counter, after this frame's decrement
//argument1: the multiple
return ceil(argument0/argument1)!=ceil((argument0+gDeltaTime)/argument1)
