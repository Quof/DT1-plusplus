/*
This script is called when showing the Dungeon Map.
*/
var gSnap,mapX,mapY,noVisit,visit,playerPosX,playerPosY,dunItemX,dunItemY;
gSnap=16
mapX=subMenuQuestX
mapY=subMenuQuestY
noVisit=make_color_rgb(115,115,115) //gray
visit=make_color_rgb(188,188,234) //light blue
draw_set_color(noVisit)
if global.location="Veiled Detritus" // ========================= VEILED DETRITUS =========================
{
  //-------------------- fill --------------------
  if global.dungeonItems[0,0]=1
  {
    draw_rectangle(mapX+(2*gSnap),mapY+(4*gSnap),mapX+(2*gSnap)+31,mapY+(4*gSnap)+15,0)
    draw_rectangle(mapX+(4*gSnap),mapY+(4*gSnap),mapX+(4*gSnap)+31,mapY+(4*gSnap)+15,0)
    draw_rectangle(mapX+(5*gSnap),mapY+(5*gSnap),mapX+(5*gSnap)+31,mapY+(5*gSnap)+31,0)
    draw_rectangle(mapX+(7*gSnap),mapY+(6*gSnap),mapX+(7*gSnap)+31,mapY+(6*gSnap)+15,0)
    draw_rectangle(mapX+(8*gSnap),mapY+(5*gSnap),mapX+(8*gSnap)+31,mapY+(5*gSnap)+15,0)
    draw_rectangle(mapX+(6*gSnap),mapY+(4*gSnap),mapX+(6*gSnap)+31,mapY+(4*gSnap)+15,0)
    draw_rectangle(mapX+(8*gSnap),mapY+(4*gSnap),mapX+(8*gSnap)+31,mapY+(4*gSnap)+15,0)
    draw_rectangle(mapX+(7*gSnap),mapY+(2*gSnap),mapX+(7*gSnap)+15,mapY+(2*gSnap)+31,0)
    draw_rectangle(mapX+(9*gSnap),mapY+(3*gSnap),mapX+(9*gSnap)+31,mapY+(3*gSnap)+15,0)
    draw_rectangle(mapX+(9*gSnap),mapY+(2*gSnap),mapX+(9*gSnap)+31,mapY+(2*gSnap)+15,0)
    draw_rectangle(mapX+(10*gSnap),mapY+(4*gSnap),mapX+(10*gSnap)+31,mapY+(4*gSnap)+15,0)
    draw_rectangle(mapX+(10*gSnap),mapY+(5*gSnap),mapX+(10*gSnap)+31,mapY+(5*gSnap)+15,0)
    draw_rectangle(mapX+(10*gSnap),mapY+(6*gSnap),mapX+(10*gSnap)+31,mapY+(6*gSnap)+31,0)
    draw_rectangle(mapX+(12*gSnap),mapY+(6*gSnap),mapX+(12*gSnap)+31,mapY+(6*gSnap)+15,0)
    draw_rectangle(mapX+(12*gSnap),mapY+(7*gSnap),mapX+(12*gSnap)+15,mapY+(7*gSnap)+31,0)
    draw_rectangle(mapX+(11*gSnap),mapY+(2*gSnap),mapX+(11*gSnap)+15,mapY+(2*gSnap)+31,0)
    draw_rectangle(mapX+(12*gSnap),mapY+(2*gSnap),mapX+(12*gSnap)+31,mapY+(2*gSnap)+15,0)
    draw_rectangle(mapX+(12*gSnap),mapY+(3*gSnap),mapX+(12*gSnap)+31,mapY+(3*gSnap)+31,0)
    draw_rectangle(mapX+(7*gSnap),mapY+(7*gSnap),mapX+(7*gSnap)+15,mapY+(7*gSnap)+15,0)
    draw_rectangle(mapX+(6*gSnap),mapY+(2*gSnap),mapX+(6*gSnap)+15,mapY+(2*gSnap)+15,0)
    draw_rectangle(mapX+(14*gSnap),mapY+(2*gSnap),mapX+(14*gSnap)+15,mapY+(2*gSnap)+15,0)
    draw_rectangle(mapX+(13*gSnap),mapY+(8*gSnap),mapX+(13*gSnap)+15,mapY+(8*gSnap)+15,0)
  }
  draw_set_color(visit)
  if global.dungeonMapData[0,0]=1
    draw_rectangle(mapX+(2*gSnap),mapY+(4*gSnap),mapX+(2*gSnap)+31,mapY+(4*gSnap)+15,0)
  if global.dungeonMapData[0,1]=1
    draw_rectangle(mapX+(4*gSnap),mapY+(4*gSnap),mapX+(4*gSnap)+31,mapY+(4*gSnap)+15,0)
  if global.dungeonMapData[0,2]=1
  {
    draw_rectangle(mapX+(5*gSnap),mapY+(5*gSnap),mapX+(5*gSnap)+31,mapY+(5*gSnap)+31,0)
    if global.dungeonItems[0,0]=0
      draw_sprite(sDungeonItems,0,mapX+(6*gSnap),mapY+(5*gSnap)) //map
  }
  if global.dungeonMapData[0,3]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(6*gSnap),mapX+(7*gSnap)+31,mapY+(6*gSnap)+15,0)
  if global.dungeonMapData[0,4]=1
    draw_rectangle(mapX+(8*gSnap),mapY+(5*gSnap),mapX+(8*gSnap)+31,mapY+(5*gSnap)+15,0)
  if global.dungeonMapData[0,5]=1
    draw_rectangle(mapX+(6*gSnap),mapY+(4*gSnap),mapX+(6*gSnap)+31,mapY+(4*gSnap)+15,0)
  if global.dungeonMapData[0,6]=1
  {
    draw_rectangle(mapX+(8*gSnap),mapY+(4*gSnap),mapX+(8*gSnap)+31,mapY+(4*gSnap)+15,0)
    if global.dungeonItems[0,1]=0
      draw_sprite(sDungeonItems,1,mapX+(8*gSnap),mapY+(4*gSnap)) //compass
  }
  if global.dungeonMapData[0,7]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(2*gSnap),mapX+(7*gSnap)+15,mapY+(2*gSnap)+31,0)
  if global.dungeonMapData[0,8]=1
    draw_rectangle(mapX+(9*gSnap),mapY+(3*gSnap),mapX+(9*gSnap)+31,mapY+(3*gSnap)+15,0)
  if global.dungeonMapData[0,9]=1
    draw_rectangle(mapX+(9*gSnap),mapY+(2*gSnap),mapX+(9*gSnap)+31,mapY+(2*gSnap)+15,0)
  if global.dungeonMapData[0,10]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(4*gSnap),mapX+(10*gSnap)+31,mapY+(4*gSnap)+15,0)
  if global.dungeonMapData[0,11]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(5*gSnap),mapX+(10*gSnap)+31,mapY+(5*gSnap)+15,0)
  if global.dungeonMapData[0,12]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(6*gSnap),mapX+(10*gSnap)+31,mapY+(6*gSnap)+31,0)
  if global.dungeonMapData[0,13]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(6*gSnap),mapX+(12*gSnap)+31,mapY+(6*gSnap)+15,0)
  if global.dungeonMapData[0,14]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(7*gSnap),mapX+(12*gSnap)+15,mapY+(7*gSnap)+31,0)
  if global.dungeonMapData[0,15]=1
    draw_rectangle(mapX+(11*gSnap),mapY+(2*gSnap),mapX+(11*gSnap)+15,mapY+(2*gSnap)+31,0)
  if global.dungeonMapData[0,16]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(2*gSnap),mapX+(12*gSnap)+31,mapY+(2*gSnap)+15,0)
  if global.dungeonMapData[0,17]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(3*gSnap),mapX+(12*gSnap)+31,mapY+(3*gSnap)+31,0)
  if global.dungeonMapData[0,18]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(7*gSnap),mapX+(7*gSnap)+15,mapY+(7*gSnap)+15,0)
  if global.dungeonMapData[0,19]=1
    draw_rectangle(mapX+(6*gSnap),mapY+(2*gSnap),mapX+(6*gSnap)+15,mapY+(2*gSnap)+15,0)
  if global.dungeonMapData[0,20]=1
    draw_rectangle(mapX+(14*gSnap),mapY+(2*gSnap),mapX+(14*gSnap)+15,mapY+(2*gSnap)+15,0)
  if global.dungeonMapData[0,21]=1
    draw_rectangle(mapX+(13*gSnap),mapY+(8*gSnap),mapX+(13*gSnap)+15,mapY+(8*gSnap)+15,0)
  //-------------------- outlines --------------------
  draw_set_color(c_white)
  if global.dungeonItems[0,0]=1
  {
    draw_rectangle(mapX+(2*gSnap),mapY+(4*gSnap),mapX+(2*gSnap)+31,mapY+(4*gSnap)+15,1)
    draw_rectangle(mapX+(4*gSnap),mapY+(4*gSnap),mapX+(4*gSnap)+31,mapY+(4*gSnap)+15,1)
    draw_rectangle(mapX+(5*gSnap),mapY+(5*gSnap),mapX+(5*gSnap)+31,mapY+(5*gSnap)+31,1)
    draw_rectangle(mapX+(7*gSnap),mapY+(6*gSnap),mapX+(7*gSnap)+31,mapY+(6*gSnap)+15,1)
    draw_rectangle(mapX+(8*gSnap),mapY+(5*gSnap),mapX+(8*gSnap)+31,mapY+(5*gSnap)+15,1)
    draw_rectangle(mapX+(6*gSnap),mapY+(4*gSnap),mapX+(6*gSnap)+31,mapY+(4*gSnap)+15,1)
    draw_rectangle(mapX+(8*gSnap),mapY+(4*gSnap),mapX+(8*gSnap)+31,mapY+(4*gSnap)+15,1)
    draw_rectangle(mapX+(7*gSnap),mapY+(2*gSnap),mapX+(7*gSnap)+15,mapY+(2*gSnap)+31,1)
    draw_rectangle(mapX+(9*gSnap),mapY+(3*gSnap),mapX+(9*gSnap)+31,mapY+(3*gSnap)+15,1)
    draw_rectangle(mapX+(9*gSnap),mapY+(2*gSnap),mapX+(9*gSnap)+31,mapY+(2*gSnap)+15,1)
    draw_rectangle(mapX+(10*gSnap),mapY+(4*gSnap),mapX+(10*gSnap)+31,mapY+(4*gSnap)+15,1)
    draw_rectangle(mapX+(10*gSnap),mapY+(5*gSnap),mapX+(10*gSnap)+31,mapY+(5*gSnap)+15,1)
    draw_rectangle(mapX+(10*gSnap),mapY+(6*gSnap),mapX+(10*gSnap)+31,mapY+(6*gSnap)+31,1)
    draw_rectangle(mapX+(12*gSnap),mapY+(6*gSnap),mapX+(12*gSnap)+31,mapY+(6*gSnap)+15,1)
    draw_rectangle(mapX+(12*gSnap),mapY+(7*gSnap),mapX+(12*gSnap)+15,mapY+(7*gSnap)+31,1)
    draw_rectangle(mapX+(11*gSnap),mapY+(2*gSnap),mapX+(11*gSnap)+15,mapY+(2*gSnap)+31,1)
    draw_rectangle(mapX+(12*gSnap),mapY+(2*gSnap),mapX+(12*gSnap)+31,mapY+(2*gSnap)+15,1)
    draw_rectangle(mapX+(12*gSnap),mapY+(3*gSnap),mapX+(12*gSnap)+31,mapY+(3*gSnap)+31,1)
    draw_rectangle(mapX+(7*gSnap),mapY+(7*gSnap),mapX+(7*gSnap)+15,mapY+(7*gSnap)+15,1)
    draw_rectangle(mapX+(6*gSnap),mapY+(2*gSnap),mapX+(6*gSnap)+15,mapY+(2*gSnap)+15,1)
    draw_rectangle(mapX+(14*gSnap),mapY+(2*gSnap),mapX+(14*gSnap)+15,mapY+(2*gSnap)+15,1)
    draw_rectangle(mapX+(13*gSnap),mapY+(8*gSnap),mapX+(13*gSnap)+15,mapY+(8*gSnap)+15,1)
  }
  if global.dungeonMapData[0,0]=1
    draw_rectangle(mapX+(2*gSnap),mapY+(4*gSnap),mapX+(2*gSnap)+31,mapY+(4*gSnap)+15,1)
  if global.dungeonMapData[0,1]=1
    draw_rectangle(mapX+(4*gSnap),mapY+(4*gSnap),mapX+(4*gSnap)+31,mapY+(4*gSnap)+15,1)
  if global.dungeonMapData[0,2]=1
    draw_rectangle(mapX+(5*gSnap),mapY+(5*gSnap),mapX+(5*gSnap)+31,mapY+(5*gSnap)+31,1)
  if global.dungeonMapData[0,3]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(6*gSnap),mapX+(7*gSnap)+31,mapY+(6*gSnap)+15,1)
  if global.dungeonMapData[0,4]=1
    draw_rectangle(mapX+(8*gSnap),mapY+(5*gSnap),mapX+(8*gSnap)+31,mapY+(5*gSnap)+15,1)
  if global.dungeonMapData[0,5]=1
    draw_rectangle(mapX+(6*gSnap),mapY+(4*gSnap),mapX+(6*gSnap)+31,mapY+(4*gSnap)+15,1)
  if global.dungeonMapData[0,6]=1
    draw_rectangle(mapX+(8*gSnap),mapY+(4*gSnap),mapX+(8*gSnap)+31,mapY+(4*gSnap)+15,1)
  if global.dungeonMapData[0,7]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(2*gSnap),mapX+(7*gSnap)+15,mapY+(2*gSnap)+31,1)
  if global.dungeonMapData[0,8]=1
    draw_rectangle(mapX+(9*gSnap),mapY+(3*gSnap),mapX+(9*gSnap)+31,mapY+(3*gSnap)+15,1)
  if global.dungeonMapData[0,9]=1
    draw_rectangle(mapX+(9*gSnap),mapY+(2*gSnap),mapX+(9*gSnap)+31,mapY+(2*gSnap)+15,1)
  if global.dungeonMapData[0,10]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(4*gSnap),mapX+(10*gSnap)+31,mapY+(4*gSnap)+15,1)
  if global.dungeonMapData[0,11]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(5*gSnap),mapX+(10*gSnap)+31,mapY+(5*gSnap)+15,1)
  if global.dungeonMapData[0,12]=1
    draw_rectangle(mapX+(10*gSnap),mapY+(6*gSnap),mapX+(10*gSnap)+31,mapY+(6*gSnap)+31,1)
  if global.dungeonMapData[0,13]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(6*gSnap),mapX+(12*gSnap)+31,mapY+(6*gSnap)+15,1)
  if global.dungeonMapData[0,14]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(7*gSnap),mapX+(12*gSnap)+15,mapY+(7*gSnap)+31,1)
  if global.dungeonMapData[0,15]=1
    draw_rectangle(mapX+(11*gSnap),mapY+(2*gSnap),mapX+(11*gSnap)+15,mapY+(2*gSnap)+31,1)
  if global.dungeonMapData[0,16]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(2*gSnap),mapX+(12*gSnap)+31,mapY+(2*gSnap)+15,1)
  if global.dungeonMapData[0,17]=1
    draw_rectangle(mapX+(12*gSnap),mapY+(3*gSnap),mapX+(12*gSnap)+31,mapY+(3*gSnap)+31,1)
  if global.dungeonMapData[0,18]=1
    draw_rectangle(mapX+(7*gSnap),mapY+(7*gSnap),mapX+(7*gSnap)+15,mapY+(7*gSnap)+15,1)
  if global.dungeonMapData[0,19]=1
    draw_rectangle(mapX+(6*gSnap),mapY+(2*gSnap),mapX+(6*gSnap)+15,mapY+(2*gSnap)+15,1)
  if global.dungeonMapData[0,20]=1
    draw_rectangle(mapX+(14*gSnap),mapY+(2*gSnap),mapX+(14*gSnap)+15,mapY+(2*gSnap)+15,1)
  if global.dungeonMapData[0,21]=1
    draw_rectangle(mapX+(13*gSnap),mapY+(8*gSnap),mapX+(13*gSnap)+15,mapY+(8*gSnap)+15,1)
  //-------------------- map connections --------------------
  draw_set_color(visit)
  if global.dungeonMapData[0,0]=1
  {
    draw_line(mapX+(2*gSnap),mapY+(4*gSnap)+6,mapX+(2*gSnap),mapY+(4*gSnap)+9)
    draw_line(mapX+(4*gSnap)-1,mapY+(4*gSnap)+6,mapX+(4*gSnap)-1,mapY+(4*gSnap)+9)
  }
  if global.dungeonMapData[0,1]=1
  {
    draw_line(mapX+(4*gSnap),mapY+(4*gSnap)+6,mapX+(4*gSnap),mapY+(4*gSnap)+9)
    draw_line(mapX+(6*gSnap)-1,mapY+(4*gSnap)+6,mapX+(6*gSnap)-1,mapY+(4*gSnap)+9)
    draw_line(mapX+(5*gSnap)+6,mapY+(5*gSnap)-1,mapX+(5*gSnap)+9,mapY+(5*gSnap)-1)
  }
  if global.dungeonMapData[0,2]=1
  {
    draw_line(mapX+(7*gSnap)-1,mapY+(6*gSnap)+6,mapX+(7*gSnap)-1,mapY+(6*gSnap)+9)
    draw_line(mapX+(5*gSnap)+6,mapY+(5*gSnap),mapX+(5*gSnap)+9,mapY+(5*gSnap))
  }
  if global.dungeonMapData[0,3]=1
  {
    draw_line(mapX+(7*gSnap),mapY+(6*gSnap)+6,mapX+(7*gSnap),mapY+(6*gSnap)+9)
    draw_line(mapX+(8*gSnap)+6,mapY+(6*gSnap),mapX+(8*gSnap)+9,mapY+(6*gSnap))
    draw_line(mapX+(7*gSnap)+6,mapY+(7*gSnap)-1,mapX+(7*gSnap)+9,mapY+(7*gSnap)-1)
  }
  if global.dungeonMapData[0,4]=1
  {
    draw_line(mapX+(10*gSnap)-1,mapY+(5*gSnap)+6,mapX+(10*gSnap)-1,mapY+(5*gSnap)+9)
    draw_line(mapX+(8*gSnap)+6,mapY+(6*gSnap)-1,mapX+(8*gSnap)+9,mapY+(6*gSnap)-1)
  }
  if global.dungeonMapData[0,5]=1
  {
    draw_line(mapX+(6*gSnap),mapY+(4*gSnap)+6,mapX+(6*gSnap),mapY+(4*gSnap)+9)
    draw_line(mapX+(8*gSnap)-1,mapY+(4*gSnap)+6,mapX+(8*gSnap)-1,mapY+(4*gSnap)+9)
    draw_line(mapX+(7*gSnap)+6,mapY+(4*gSnap),mapX+(7*gSnap)+9,mapY+(4*gSnap))
  }
  if global.dungeonMapData[0,6]=1
  {
    draw_line(mapX+(8*gSnap),mapY+(4*gSnap)+6,mapX+(8*gSnap),mapY+(4*gSnap)+9)
    draw_line(mapX+(10*gSnap)-1,mapY+(4*gSnap)+6,mapX+(10*gSnap)-1,mapY+(4*gSnap)+9)
    draw_line(mapX+(9*gSnap)+6,mapY+(4*gSnap),mapX+(9*gSnap)+9,mapY+(4*gSnap))
  }
  if global.dungeonMapData[0,7]=1
  {
    draw_line(mapX+(7*gSnap),mapY+(2*gSnap)+6,mapX+(7*gSnap),mapY+(2*gSnap)+9)
    draw_line(mapX+(7*gSnap)+6,mapY+(4*gSnap)-1,mapX+(7*gSnap)+9,mapY+(4*gSnap)-1)
  }
  if global.dungeonMapData[0,8]=1
  {
    draw_line(mapX+(10*gSnap)+6,mapY+(3*gSnap),mapX+(10*gSnap)+9,mapY+(3*gSnap))
    draw_line(mapX+(9*gSnap)+6,mapY+(4*gSnap)-1,mapX+(9*gSnap)+9,mapY+(4*gSnap)-1)
  }
  if global.dungeonMapData[0,9]=1
    draw_line(mapX+(10*gSnap)+6,mapY+(3*gSnap)-1,mapX+(10*gSnap)+9,mapY+(3*gSnap)-1)
  if global.dungeonMapData[0,10]=1
  {
    draw_line(mapX+(10*gSnap),mapY+(4*gSnap)+6,mapX+(10*gSnap),mapY+(4*gSnap)+9)
    draw_line(mapX+(12*gSnap)-1,mapY+(4*gSnap)+6,mapX+(12*gSnap)-1,mapY+(4*gSnap)+9)
    draw_line(mapX+(11*gSnap)+6,mapY+(4*gSnap),mapX+(11*gSnap)+9,mapY+(4*gSnap))
    draw_line(mapX+(10*gSnap)+6,mapY+(5*gSnap)-1,mapX+(10*gSnap)+9,mapY+(5*gSnap)-1)
  }
  if global.dungeonMapData[0,11]=1
  {
    draw_line(mapX+(10*gSnap),mapY+(5*gSnap)+6,mapX+(10*gSnap),mapY+(5*gSnap)+9)
    draw_line(mapX+(10*gSnap)+6,mapY+(5*gSnap),mapX+(10*gSnap)+9,mapY+(5*gSnap))
    draw_line(mapX+(10*gSnap)+6,mapY+(6*gSnap)-1,mapX+(10*gSnap)+9,mapY+(6*gSnap)-1)
  }
  if global.dungeonMapData[0,12]=1
  {
    draw_line(mapX+(12*gSnap)-1,mapY+(6*gSnap)+6,mapX+(12*gSnap)-1,mapY+(6*gSnap)+9)
    draw_line(mapX+(12*gSnap)-1,mapY+(7*gSnap)+6,mapX+(12*gSnap)-1,mapY+(7*gSnap)+9)
    draw_line(mapX+(10*gSnap)+6,mapY+(6*gSnap),mapX+(10*gSnap)+9,mapY+(6*gSnap))
  }
  if global.dungeonMapData[0,13]=1
    draw_line(mapX+(12*gSnap),mapY+(6*gSnap)+6,mapX+(12*gSnap),mapY+(6*gSnap)+9)
  if global.dungeonMapData[0,14]=1
  {
    draw_line(mapX+(12*gSnap),mapY+(7*gSnap)+6,mapX+(12*gSnap),mapY+(7*gSnap)+9)
    draw_line(mapX+(13*gSnap)-1,mapY+(8*gSnap)+6,mapX+(13*gSnap)-1,mapY+(8*gSnap)+9)
  }
  if global.dungeonMapData[0,15]=1
  {
    draw_line(mapX+(12*gSnap)-1,mapY+(2*gSnap)+6,mapX+(12*gSnap)-1,mapY+(2*gSnap)+9)
    draw_line(mapX+(11*gSnap)+6,mapY+(4*gSnap)-1,mapX+(11*gSnap)+9,mapY+(4*gSnap)-1)
  }
  if global.dungeonMapData[0,16]=1
  {
    draw_line(mapX+(12*gSnap),mapY+(2*gSnap)+6,mapX+(12*gSnap),mapY+(2*gSnap)+9)
    draw_line(mapX+(14*gSnap)-1,mapY+(2*gSnap)+6,mapX+(14*gSnap)-1,mapY+(2*gSnap)+9)
  }
  if global.dungeonMapData[0,17]=1
    draw_line(mapX+(12*gSnap),mapY+(4*gSnap)+6,mapX+(12*gSnap),mapY+(4*gSnap)+9)
  if global.dungeonMapData[0,18]=1
    draw_line(mapX+(7*gSnap)+6,mapY+(7*gSnap),mapX+(7*gSnap)+9,mapY+(7*gSnap))
  if global.dungeonMapData[0,19]=1
    draw_line(mapX+(7*gSnap)-1,mapY+(2*gSnap)+6,mapX+(7*gSnap)-1,mapY+(2*gSnap)+9)
  if global.dungeonMapData[0,20]=1
    draw_line(mapX+(14*gSnap),mapY+(2*gSnap)+6,mapX+(14*gSnap),mapY+(2*gSnap)+9)
  if global.dungeonMapData[0,21]=1
    draw_line(mapX+(13*gSnap),mapY+(8*gSnap)+6,mapX+(13*gSnap),mapY+(8*gSnap)+9)

  if global.gameProgress=1000000 //reference door sides
  {
    draw_line(mapX+(XX*gSnap),mapY+(YY*gSnap)+6,mapX+(XX*gSnap),mapY+(YY*gSnap)+9) //left
    draw_line(mapX+(XX*gSnap)-1,mapY+(YY*gSnap)+6,mapX+(XX*gSnap)-1,mapY+(YY*gSnap)+9) //right
    draw_line(mapX+(XX*gSnap)+6,mapY+(YY*gSnap),mapX+(XX*gSnap)+9,mapY+(YY*gSnap)) //top
    draw_line(mapX+(XX*gSnap)+6,mapY+(YY*gSnap)-1,mapX+(XX*gSnap)+9,mapY+(YY*gSnap)-1) //bottom
  }
  //-------------------- show dungeon items --------------------
  if global.dungeonItems[0,1]=1
  {
    dunItemX=subMenuQuestX+4
    dunItemY=subMenuQuestY+4
    //keys
    if global.doorKeys[6]=0
      draw_sprite(sHUDmapItem,-1,dunItemX+(8*gSnap),dunItemY+(5*gSnap))
    if global.doorKeys[7]=0
      draw_sprite(sHUDmapItem,-1,dunItemX+(9*gSnap),dunItemY+(2*gSnap))
    if global.doorKeys[8]=0
      draw_sprite(sHUDmapItem,-1,dunItemX+(13*gSnap),dunItemY+(6*gSnap))
    if global.doorKeys[9]=0
      draw_sprite(sHUDmapItem,-1,dunItemX+(12*gSnap),dunItemY+(3*gSnap))
    //locks
    if global.VDportals[0]<3
      draw_sprite_ext(sVDCrystal,-1,dunItemX+(7*gSnap)+4,dunItemY+(7*gSnap)+4,0.4,0.4,0,c_white,1)
    if global.VDportals[1]<3
      draw_sprite_ext(sVDCrystal,-1,dunItemX+(6*gSnap)+4,dunItemY+(2*gSnap)+4,0.4,0.4,0,c_white,1)
    if global.VDportals[2]<3
      draw_sprite_ext(sVDCrystal,-1,dunItemX+(14*gSnap)+4,dunItemY+(2*gSnap)+4,0.4,0.4,0,c_white,1)
    if global.VDportals[3]<3
      draw_sprite_ext(sVDCrystal,-1,dunItemX+(13*gSnap)+4,dunItemY+(8*gSnap)+4,0.4,0.4,0,c_white,1)
  }
  //-------------------- show player position --------------------
  playerPosX=subMenuQuestX+2
  playerPosY=subMenuQuestY+2
  if room=rVeiledDetritus1
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(2*gSnap)
    else
      playerPosX+=(3*gSnap)
    playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus2
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(4*gSnap)
    else
      playerPosX+=(5*gSnap)
    playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus3
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(5*gSnap)
    else
      playerPosX+=(6*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(5*gSnap)
    else
      playerPosY+=(6*gSnap)
  }
  else if room=rVeiledDetritus4
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(7*gSnap)
    else
      playerPosX+=(8*gSnap)
    playerPosY+=(6*gSnap)
  }
  else if room=rVeiledDetritus5
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(8*gSnap)
    else
      playerPosX+=(9*gSnap)
    playerPosY+=(5*gSnap)
  }
  else if room=rVeiledDetritus6
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(6*gSnap)
    else
      playerPosX+=(7*gSnap)
    playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus7
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(8*gSnap)
    else
      playerPosX+=(9*gSnap)
    playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus8
  {
    playerPosX+=(7*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(2*gSnap)
    else
      playerPosY+=(3*gSnap)
  }
  else if room=rVeiledDetritus9
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(9*gSnap)
    else
      playerPosX+=(10*gSnap)
    playerPosY+=(3*gSnap)
  }
  else if room=rVeiledDetritus10
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(9*gSnap)
    else
      playerPosX+=(10*gSnap)
    playerPosY+=(2*gSnap)
  }
  else if room=rVeiledDetritus11
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(10*gSnap)
    else
      playerPosX+=(11*gSnap)
    playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus12
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(10*gSnap)
    else
      playerPosX+=(11*gSnap)
    playerPosY+=(5*gSnap)
  }
  else if room=rVeiledDetritus13
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(10*gSnap)
    else
      playerPosX+=(11*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(6*gSnap)
    else
      playerPosY+=(7*gSnap)
  }
  else if room=rVeiledDetritus14
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(12*gSnap)
    else
      playerPosX+=(13*gSnap)
    playerPosY+=(6*gSnap)
  }
  else if room=rVeiledDetritus15
  {
    playerPosX+=(12*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(7*gSnap)
    else
      playerPosY+=(8*gSnap)
  }
  else if room=rVeiledDetritus16
  {
    playerPosX+=(11*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(2*gSnap)
    else
      playerPosY+=(3*gSnap)
  }
  else if room=rVeiledDetritus17
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(12*gSnap)
    else
      playerPosX+=(13*gSnap)
    playerPosY+=(2*gSnap)
  }
  else if room=rVeiledDetritus18
  {
    if oPlayer1.x<room_width/2
      playerPosX+=(12*gSnap)
    else
      playerPosX+=(13*gSnap)
    if oPlayer1.y<room_height/2
      playerPosY+=(3*gSnap)
    else
      playerPosY+=(4*gSnap)
  }
  else if room=rVeiledDetritus19
  {
    playerPosX+=(7*gSnap)
    playerPosY+=(7*gSnap)
  }
  else if room=rVeiledDetritus20
  {
    playerPosX+=(6*gSnap)
    playerPosY+=(2*gSnap)
  }
  else if room=rVeiledDetritus21
  {
    playerPosX+=(14*gSnap)
    playerPosY+=(2*gSnap)
  }
  else if room=rVeiledDetritus22
  {
    playerPosX+=(13*gSnap)
    playerPosY+=(8*gSnap)
  }
  if room!=rDataCenter
    draw_sprite_part_ext(sPlayerIdle,0,4,1,16,15,playerPosX,playerPosY,0.75,0.75,c_white,1)
}
