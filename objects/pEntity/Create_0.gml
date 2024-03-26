/// @description Essential Entity Setup
// You can write your code in this editor
//entityHitScript = -1;
z = 0;
flash = 0;
lifted = 0;
thrown = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash"); //return the ID
entityDropList = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col")); //for dynamically create entity. 









