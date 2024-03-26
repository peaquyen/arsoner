/// @description Progress Transition

with (oPlayer) 
{
	if (state = PlayerStateTransition) state = PlayerStateTransition;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) //If screen fully obscured
	{
		room_goto(target); //in room transition
		leading = IN
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) //If screen fully revealed
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();
	}
}