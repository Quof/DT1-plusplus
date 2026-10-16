//GM8.2 change (added): from DT3. Instance ids from the GM8.1 project aren't kept by GM8.2, so a room instance that code
//refers to by its old id registers itself in its creation code (GID_SET(oldId, self.id)) and the code asks GID(oldId)
//returns the instance, or noone
if (ds_map_exists(global.objectIDMap, argument0))
{
    return ds_map_find_value(global.objectIDMap, argument0);
}
else
{
    return noone;
}
