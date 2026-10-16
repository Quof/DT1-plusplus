//GM8.2 change (added): from DT3. Registers an instance under its old GM8.1 id (see GID)
//argument0: the old id; argument1: the instance
ds_map_delete(global.objectIDMap, argument0)
ds_map_add(global.objectIDMap, argument0, argument1)
