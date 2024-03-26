// Inherit the parent event
event_inherited();
image_speed = 0;

if (global.playerItemUnlocked[item] && !itemRepeatable) instance_destroy(); //just remove instance_destroy if you want to repurchase.
