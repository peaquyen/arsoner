function PurchaseItem(_item, _amount, _cost, _repeatable){
	if (global.playerMoney >= _cost)
	{
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerMoney -= _cost;
		global.playerEquipped = _item;
		if (!_repeatable) instance_destroy(activate); //if you want things repeat to repurchase!
		
		var _desc= "";
		switch (_item)
		{
			case ITEM.BOW: _desc = "The bow!\nFire with the activate key to damage enemies, \nfind ammo in the world!";break;
			case ITEM.BOMB: _desc = "Bombs!\nActivate to light the fuse, then again to throw.\nBlow apart enemies, pots, and certain large cave blocking boulders!";break;
			case ITEM.HOOK: _desc = "Scrappling hook!\nActivate to hook things towards you,\nor you towards things!\nUse with care!";break;
			default: _desc = "No item description found!";break;
		}
		NewTextBox(_desc,1);
	}
	else
	{
		NewTextBox("Not enough money...",1);
	}
}