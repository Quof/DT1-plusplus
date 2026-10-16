/*
This script creates the text for the credits.
argument0: string
argument1: scroll speed
argument2: font
argument3: align
argument4: y adjustment
*/
credits=instance_create(0,0,oEvCreditText)
credits.creditString=argument0
credits.scrollSpeed=argument1
credits.creditFont=argument2
credits.creditAlign=argument3
credits.yAdjust=argument4
