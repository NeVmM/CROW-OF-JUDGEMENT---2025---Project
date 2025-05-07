if (!is_fading)
{
    if (oRoomLimiter.roomLimit >= oRoomLimiter.maxTeleport)
    {
        // Teleport to rest area
        target_room = RestArea;
        is_fading = true;
        health = 100;
        oRoomLimiter.roomLimit = 0;
        oRoomLimiter.restAreaLimit++;
    }
    else
    {
      //stages in order but randomized picker
        if (oRoomLimiter.restAreaLimit == 0)
        {
			oPoints.points = 0; //reset points after tutorial
			oTimer.timer = 0; //reset timer after tutorial
			
            var pick = irandom(4);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = Forest1;
            if (pick == 1) target_room = Forest2;
            if (pick == 2) target_room = Forest3;
            if (pick == 3) target_room = Forest4;
            if (pick == 4) target_room = Forest5;
        }

        else if (oRoomLimiter.restAreaLimit == 1)
        {
            var pick = irandom(4);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = Overgrown1;
            if (pick == 1) target_room = Overgrown2;
            if (pick == 2) target_room = Overgrown3;
            if (pick == 3) target_room = Overgrown4;
            if (pick == 4) target_room = Overgrown5;
        }
		
		else if (oRoomLimiter.restAreaLimit == 2)
        {
            var pick = irandom(0);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = Caverns1;
        }

        else if (oRoomLimiter.restAreaLimit == 3)
        {
            var pick = irandom(4);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = Hell1;
			if (pick == 1) target_room = Hell2;
			if (pick == 2) target_room = Hell3;
			if (pick == 3) target_room = Hell4;
			if (pick == 4) target_room = Hell5;
        }

        else if (oRoomLimiter.restAreaLimit == 4)
        {
            var pick = irandom(4);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = Heavens1;
            if (pick == 1) target_room = Heavens2;
            if (pick == 2) target_room = Heavens3;
            if (pick == 3) target_room = Heavens4;
            if (pick == 4) target_room = Heavens5;
        }
		
		else if (oRoomLimiter.restAreaLimit == 5)
        {
            var pick = irandom(0);
            oRoomLimiter.roomLimit += 1;

            if (pick == 0) target_room = RoomOutro;
        }

        else
        {
            game_end();
        }

        if (target_room != noone)
        {
            is_fading = true;
        }
		
		
    }
}

