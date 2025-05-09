is_being_dragged = false;

switch(setting){
	case "music": //bg musics
		global.music_volume = amount_current;
		
		audio_sound_gain(snd_Music, amount_current / 100, 0);
		audio_sound_gain(Hell1_Music, amount_current / 100, 0);
	break;
	case "sound": //soundeffects
	global.sound_volume = amount_current;
		
		audio_sound_gain(snd_Click, amount_current / 100, 0); 
		audio_sound_gain(snd_armsattack, amount_current / 100, 0);
	break;
	case "brightness":
	break;
}


