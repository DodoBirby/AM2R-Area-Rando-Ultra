global.start_room = 21
global.save_x = 3408
global.save_y = 1184
if (global.saxmode && global.sax)
{
    global.start_room = 376
    global.save_x = 144
    global.save_y = 176
}
global.ingame = 1
global.timeofday = 0
reset_map()
init_map()
load_character_vars()
AR_Randomise_Rooms()
AR_Randomise_Bosses()
AR_Randomise_Pipes()
file_delete((((working_directory + "\AreaRando\random") + string((global.saveslot + 1))) + ".ini"))
file_delete((((working_directory + "\AreaRando\save") + string((global.saveslot + 1))) + ".dat"))
scr_newgame()
save_game(((working_directory + "\AreaRando\save") + string((global.saveslot + 1))))
room_change(global.start_room, 0)
