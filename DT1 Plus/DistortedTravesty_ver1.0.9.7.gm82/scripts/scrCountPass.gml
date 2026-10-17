//60fps change (added): replaces "counter=argument1" for a counter that goes up by gDeltaTime each frame and keeps
//counting past it. True on the one frame the counter reaches (or passes) argument1, even if it never lands on it
//exactly (an instance made partway through a 30fps tick, with the frame rate changed while it counts).
//At 30fps (whole numbers counting up by 1, whole argument1) this is the same as "counter=argument1".
//argument0: the counter, after this frame's increment
//argument1: the count
return argument0>=argument1 and argument0-gDeltaTime<argument1
