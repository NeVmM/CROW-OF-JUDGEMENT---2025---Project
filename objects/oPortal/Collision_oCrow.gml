if (oRoomLimiter.roomLimit >= oRoomLimiter.maxTeleport)
{
    room_goto(RestArea);
    restAreaIncrease++;
	
}
else
{
    
	/*
	if (restAreaIncrease == 1)
    {
        var ForestPick = irandom(2);
        oRoomLimiter.roomLimit += 1;

        if (ForestPick == 0) room_goto(TestForest1);
        if (ForestPick == 1) room_goto(TestForest2);
        if (ForestPick == 2) room_goto(TestForest3);
    }

    if (restAreaIncrease == 2)
    {
        var OvergrownPick = irandom(0);
        oRoomLimiter.roomLimit += 1;

        if (OvergrownPick == 0) room_goto(Overgrown1);
    }

    if (restAreaIncrease == 3)
    {
        var HellPick = irandom(0);
        oRoomLimiter.roomLimit += 1;

        if (HellPick == 0) room_goto(Hell1);
    }

    if (restAreaIncrease == 4)
    {
        var HeavensPick = irandom(2);
        oRoomLimiter.roomLimit += 1;

        if (HeavensPick == 0) room_goto(Heavens1);
        if (HeavensPick == 1) room_goto(Heavens2);
        if (HeavensPick == 2) room_goto(Heavens3);
    }
}

*/




	
	//==============================================
	
	
	
    randomize();
    var pick = irandom(5);
    oRoomLimiter.roomLimit += 1;

    if (pick == 0) room_goto(Heavens1);
    if (pick == 1) room_goto(Heavens2);
    if (pick == 2) room_goto(TestForest1);
    if (pick == 3) room_goto(TestForest2);
	if (pick == 4) room_goto(TestForest3);
	if (pick == 5) room_goto(Hell1);
	
	
}
