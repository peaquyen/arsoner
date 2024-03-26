/// @description debug for oGame
if (!instance_exists(oGame)) {
    // Instance does not exist, so create it
    var GamePriv = instance_create(5, 5, oGame);
    
    show_debug_message("Instance created!");
} else {
    // Instance already exists
    show_debug_message("Instance already exists!");
}