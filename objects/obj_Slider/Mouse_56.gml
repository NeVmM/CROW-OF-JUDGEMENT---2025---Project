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
		audio_sound_gain(HeavenAreaLast_END_Music, amount_current / 100, 0);
	break;
	break;
	case "sound": //soundeffects
	global.sound_volume = amount_current;
		
		audio_sound_gain(snd_Click, amount_current / 100, 0); 
		audio_sound_gain(ArmsAttack, amount_current / 100, 0);
		audio_sound_gain(ArmsDead, amount_current / 100, 0);
		audio_sound_gain(CrowAttack, amount_current / 100, 0);
		audio_sound_gain(CrowJump, amount_current / 100, 0);
		audio_sound_gain(CrowRoll, amount_current / 100, 0);
		audio_sound_gain(CrowWalk, amount_current / 100, 0);
		audio_sound_gain(EyeAngelAttack, amount_current / 100, 0);
		audio_sound_gain(EyeAngelDead, amount_current / 100, 0);
		audio_sound_gain(EyeDeadSfx, amount_current / 100, 0);
		audio_sound_gain(FairyChaseSFX, amount_current / 100, 0);
		audio_sound_gain(FairyDead, amount_current / 100, 0);
		audio_sound_gain(ImplingDead, amount_current / 100, 0);
		audio_sound_gain(LightSlimeAttack, amount_current / 100, 0);
		audio_sound_gain(LightSlimeDead, amount_current / 100, 0);
		audio_sound_gain(SkeletonWalking, amount_current / 100, 0);
		audio_sound_gain(SlimeAttack, amount_current / 100, 0);
		audio_sound_gain(SlimeDead, amount_current / 100, 0);
		audio_sound_gain(SpiritSwordAttack, amount_current / 100, 0);
		audio_sound_gain(SpiritSwordDead, amount_current / 100, 0);
	break;
	case "brightness":
	break;
}


