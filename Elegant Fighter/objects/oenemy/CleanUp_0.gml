/// @description 
instance_destroy(hitbox);
atk = -1;
attacking = false;

dazed = false;
with (oDaze_CcWise) if (owner == other.id) instance_destroy();