#region  // Main Menu, Settings, and Credits Music
if room == rm_MainMenu {
	if (room_previous==rm_Settings||room_previous==rm_CreditsMessage){
		audio_pause_sound(snd_Music);
		audio_resume_sound(snd_Music);
	}
	else
	{
		audio_stop_all();
		audio_play_sound(snd_Music, 10, true);
	}
}
if room == rm_CreditsMessage { 
	audio_pause_sound(snd_Music);
	audio_resume_sound(snd_Music);
}
if room == rm_Settings {
	audio_pause_sound(snd_Music);
	audio_resume_sound(snd_Music);
}
#endregion
#region //room levels
if room == Hell1{
	audio_stop_all();
	audio_play_sound(snd_Music2, 10, true); 
}
if room == Heavens1{
	audio_stop_all();
	audio_play_sound(snd_Music2, 10, true); 
}
#endregion