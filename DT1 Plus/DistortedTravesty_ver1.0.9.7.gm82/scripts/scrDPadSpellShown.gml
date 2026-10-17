/*
dpad spells change (added): argument0: 1 the HUD's technique line, 2 its spell line (top right). Returns what's shown
there: with DPad Spells on, the element's name on the spell line (PHYSICAL with no element on, FIRE/WATER/WIND/EARTH: the
spell comes from the direction held) and nothing on the technique line; with it off, the equipped spell / technique, as
before.
*/
if global.optDPadSpells
{
  if argument0=1 {return ""}
  if global.p1CurrentElement>=1 and global.p1CurrentElement<=4 {return string_upper(global.dpsLabel[global.p1CurrentElement])}
  return "PHYSICAL" //no element on (0)
}
if argument0=1 {return global.p1TechniqueEquip}
return global.p1SpellEquip
