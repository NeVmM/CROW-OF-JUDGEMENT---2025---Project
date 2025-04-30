if (oRoomLimiter.roomLimit >= oRoomLimiter.maxTeleport)
{
    room_goto(RestArea);
	oRoomLimiter.roomLimit = 0;
	oRoomLimiter.restAreaLimit++;
}
else
{
	if (oRoomLimiter.restAreaLimit == 0)
	{
		var pick = irandom(2);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Hell1);
		//if (pick == 1) room_goto(TestForest2);
		//if (pick == 2) room_goto(TestForest3);
	}
	
	else if (oRoomLimiter.restAreaLimit == 1)
	{
		var pick = irandom(2);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Heavens1);
		if (pick == 1) room_goto(Heavens2);
		if (pick == 2) room_goto(Heavens3);
	}
	
	else
	{
		game_end();
	}
}


/*
else
{
	randomize();
    var pick = irandom(0);
    oRoomLimiter.roomLimit += 1; //increments up to 5, if 5 teleport to restarea

    if (pick == 0) room_goto(TutorialRoom);
    if (pick == 1) room_goto(TestForest1);
    if (pick == 2) room_goto(TestForest2);
    if (pick == 3) room_goto(TestForest3);
	if (pick == 4) room_goto(Hell1);
	if (pick == 5) room_goto(Overgrown1);
}
	*/
	
