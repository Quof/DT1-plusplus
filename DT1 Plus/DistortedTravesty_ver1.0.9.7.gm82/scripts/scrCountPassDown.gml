//60fps change (added): as scrCountPass, for a counter that goes down by gDeltaTime each frame.
//True on the one frame the counter reaches (or passes) argument1.
//At 30fps (whole numbers counting down by 1, whole argument1) this is the same as "counter=argument1".
//argument0: the counter, after this frame's decrement
//argument1: the count
return argument0<=argument1 and argument0+gDeltaTime>argument1
