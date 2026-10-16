/*
This script is called in the HUD pause menu.
It is used to unequip beads.
argument0: The current slot
*/
for(i=0;i<18;i+=1)
{
  if global.invBracelet[i]=argument0
  {
    global.invBracelet[i]=1
    break;
  }
}
