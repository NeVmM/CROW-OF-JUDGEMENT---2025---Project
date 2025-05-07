//disable alpha blending (we just want RGB from screen)
gpu_set_blendenable(true);

if (pause)
{
	surface_set_target(application_surface);
		if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
		else
		{
			pauseSurf = surface_create(resW, resH);
			buffer_set_surface(PauseSurfBuffer, pauseSurf, 0);
		}
	surface_reset_target()
}
/*
if (room != rm_MainMenu && room != rm_Settings && room != rm_CreditsMessage)

{//pause only happens in roomlevels not in main menu, credits and settings
	if (keyboard_check_pressed(ord("P")))
	{
		if (!pause)
		{
			pause = true;
			//deactivate everything other than this instance
			audio_pause_all();
			instance_deactivate_all(true);
			
			//NOTE: If you need to pause anything like anymating sprites, tiles
			//room backgrounds etc you need to do that separately, unfortunately
		
			//capture this game moment (won't capture draw gui contents though)
			pauseSurf = surface_create(resW, resH);
			surface_set_target(pauseSurf);
				draw_surface(application_surface, 0, 0);
			surface_reset_target();
			
			//back up this surface to a buffer in case we lose it (screen focus, etc)
			if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
			pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
			buffer_get_surface(pauseSurfBuffer, pauseSurf, 0 );
		}
		else
		{
			pause = false;
			instance_activate_all();
			audio_resume_all();
			if (surface_exists(pauseSurf)) surface_free(pauseSurf);
			if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		}
	}
}

	
		