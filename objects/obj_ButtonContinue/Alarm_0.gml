var pick = irandom(4);
		oRoomLimiter.roomLimit += 1;
		
		if (pick == 0) room_goto(Hell1);
		if (pick == 1) room_goto(Hell2);
		if (pick == 2) room_goto(Hell3);
		if (pick == 3) room_goto(Hell4);
		if (pick == 4) room_goto(Hell5);