//60fps change (added): whether the player would stand on something here (a solid, or a platform they can land on).
//Used by pMoveToWrapNew's slope check
if isCollisionBottom(1)
  return 1
if canLandOnPlatforms()
  if isCollisionPlatform()=0 and isCollisionPlatformBottom(1) and kDown=0
    return 1
return 0
