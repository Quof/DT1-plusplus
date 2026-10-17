/*
element colors change (added): the element enemies already about (oBladeArm, oBombTurret, oDataCollector) take the
element colours as they are now: their tint is worked out when they're made (or change element) from the game's (ecBase)
and their element (ecElem). Everything else works its colour out as it's drawn. Called when the Element Colors panel
closes (oHUD).
*/
with all
{
  if variable_local_exists("ecBase")
  {
    baseColor=scrElemColor(ecElem,ecBase)
    if bTakingDamage=false {image_blend=baseColor} //(while hit it's red; it goes back to baseColor after)
  }
}
