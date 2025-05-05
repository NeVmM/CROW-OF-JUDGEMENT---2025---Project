// Room Start event of obj_GameController (or wherever you want to load the game)
ini_open("save.ini");

// Load player data
global.player_x = ini_read_real("Player", "x", 0);
global.player_y = ini_read_real("Player", "y", 0);
global.player_hp = ini_read_real("Player", "hp", 100);
global.player_points = ini_read_real("Player", "points", 0);

// Create player instance at the saved position
if (instance_exists(oCrow)) {
    oCrow.x = global.player_x;
    oCrow.y = global.player_y;
    oCrow.hp = global.player_hp;
    oCrow.points = global.player_points;
} else {
    // If oCrow doesn't exist, create a new one at the saved position
    instance_create_layer(global.player_x, global.player_y, "ObjectsBlocks", oCrow);
}

// Load instances of enemies
var count = ini_read_real("Enemy", "count", 0);
for (var i = 0; i < count; i++) {
    var ex = ini_read_real("Enemy_" + string(i), "x", 0);
    var ey = ini_read_real("Enemy_" + string(i), "y", 0);
    var hp = ini_read_real("Enemy_" + string(i), "hp", 100);

    // Create the enemy instance at the saved position
    var inst = instance_create_layer(x, y, "Enemiess", oEnemy);
    inst.hp = hp;
}

ini_close();
