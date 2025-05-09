#region // Main Menu, Settings, and Credits Music

if room == rm_MainMenu 
{
	if (room_previous==rm_Settings||room_previous==rm_CreditsMessage){
		audio_pause_sound(MainMenu_Music);
		audio_resume_sound(MainMenu_Music);
	}
	else
	{
		audio_stop_all();
		audio_play_sound(MainMenu_Music, 10, true);
	}
}
if room == rm_CreditsMessage { 
	audio_pause_sound(MainMenu_Music);
	audio_resume_sound(MainMenu_Music);
}
if room == rm_Settings {
	audio_pause_sound(MainMenu_Music);
	audio_resume_sound(MainMenu_Music);
}

#endregion
