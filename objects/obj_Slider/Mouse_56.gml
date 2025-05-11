is_being_dragged = false;

switch(setting){
	case "music": //bg musics
		global.music_volume = amount_current;
		
		audio_sound_gain(snd_Music, amount_current / 100, 0);
		audio_sound_gain(Hell_Music, amount_current / 100, 0);
		audio_sound_gain(MainMenu_Music, amount_current / 100, 0);
		audio_sound_gain(Overgrown_Music, amount_current / 100, 0);
		audio_sound_gain(RestArea_Music, amount_current / 100, 0);
		audio_sound_gain(TutorialArea_Music, amount_current / 100, 0);
		audio_sound_gain(Cavern_Music, amount_current / 100, 0);
		audio_sound_gain(Forest_Music, amount_current / 100, 0);
	break;
	case "sound": //soundeffects
	global.sound_volume = amount_current;
		
		audio_sound_gain(snd_Click, amount_current / 100, 0); 
		audio_sound_gain(ArmsAttack, amount_current / 100, 0);
	break;
	case "brightness":
	break;
}


