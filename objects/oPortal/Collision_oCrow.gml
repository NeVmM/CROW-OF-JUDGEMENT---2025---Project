if (oRoomLimiter.roomLimit >= oRoomLimiter.maxTeleport)
{
	//teleports to restarea
    room_goto(RestArea);
	health = 100;
	oRoomLimiter.roomLimit = 0;
	
	oRoomLimiter.restAreaLimit++;
}
else
{
	//stages in order but randomized picker
	if (oRoomLimiter.restAreaLimit == 0)
	{
		var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Forest1);
		if (pick == 1) room_goto(Forest2);
		if (pick == 2) room_goto(Forest3);
		if (pick == 3) room_goto(Forest4);
		if (pick == 4) room_goto(Forest5);
	}
	
	else if (oRoomLimiter.restAreaLimit == 1)
	{
		var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Overgrown1);
		if (pick == 1) room_goto(Overgrown2);
		if (pick == 2) room_goto(Overgrown3);
		if (pick == 3) room_goto(Overgrown4);
		if (pick == 4) room_goto(Overgrown5);
	}
	
	else if (oRoomLimiter.restAreaLimit == 2)
	{
		var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Caverns1);
		if (pick == 1) room_goto(Caverns1);
		if (pick == 2) room_goto(Caverns1);
		if (pick == 3) room_goto(Caverns1);
		if (pick == 4) room_goto(Caverns1);
	}
	
	else if (oRoomLimiter.restAreaLimit == 3)
	{
		var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Hell1);
		if (pick == 1) room_goto(Hell1);
		if (pick == 2) room_goto(Hell1);
		if (pick == 3) room_goto(Hell1);
		if (pick == 4) room_goto(Hell1);
	}
	
	else if (oRoomLimiter.restAreaLimit == 4)
	{
		var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Heavens1);
		if (pick == 1) room_goto(Heavens2);
		if (pick == 2) room_goto(Heavens3);
		if (pick == 3) room_goto(Heavens4);
		if (pick == 4) room_goto(Heavens5);
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
	
