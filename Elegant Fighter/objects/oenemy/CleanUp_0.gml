/// @description 
instance_destroy(hitbox);
atk = -1;
attacking = false;

dazed = false;
with (oDaze) if (owner == other.id) instance_destroy();