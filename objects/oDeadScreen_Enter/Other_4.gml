if (room != my_room)
{

    instance_destroy();
}
else 
{

    fade_alpha = 1;    // Start fully black (will fade in)
    is_fading = false; // Ready to begin fade in


    visible = true;
}