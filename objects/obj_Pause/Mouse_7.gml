if (room != rm_MainMenu && room != rm_Settings && room != rm_CreditsMessage) {
    
    if (!pause) {
        pause = true;
        sprite_index = sResume;

        // Pause logic
        audio_pause_all();
        instance_deactivate_all(true);
        instance_activate_object(obj_Pause); // Keep pause button active

        pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
            draw_surface(application_surface, 0, 0);
        surface_reset_target();

        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0 );

    } else {
        pause = false;
        sprite_index = sPauseB;

        // Resume logic
        instance_activate_all();
		sprite_index = sPauseB;
        audio_resume_all();
        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
}
