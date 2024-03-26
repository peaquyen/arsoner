function ActivateHatCat() {

	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);

	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wow, you find it already!");
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				//offer quest
				//NewTextBox("Hello there! You look like a brave adventurer, whatsup with the cape and all?", 2);
				NewTextBox("pea: xiuChann!! I love you!! Goodnight<3");
				
				NewTextBox("Could you help me find my missing hat?",2,["4:Of course!","5:This task is beneath me"]);
				
			}
		
		}break;
	
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wow, you find it !");
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				//clue reminder
				NewTextBox("I think I lèt my hat in that scary cave to the north east.",2);
				NewTextBox("You might need sometimes to get there!",2);

			}
		
		}break;
		
		case 2: //quest already completed
		{
			NewTextBox("Thank you so much", 2);
		} break;

	}

}