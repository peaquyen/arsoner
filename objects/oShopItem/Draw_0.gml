// Inherit the parent event
event_inherited();

//Draw the item different, to make the item buyable again.
if (global.playerItemUnlocked[ITEM.BOW])
{
	if (image_index = 2) image_index = 4;
}
	