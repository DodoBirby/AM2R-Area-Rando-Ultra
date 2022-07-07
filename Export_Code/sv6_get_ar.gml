if ds_exists(global.roommap, 1)
    ds_map_destroy(global.roommap)
global.roommap = ds_map_create()
ds_map_read(global.roommap, base64_decode(file_text_read_string(argument0)))
