var map, access, list, deadend, node1, node2, targetnode, i, index, j, checknode;
AR_Logic()
if ds_exists(global.roommap, 1)
    ds_map_destroy(global.roommap)
global.roommap = ds_map_create()
map = global.roommap
access = global.accessnodes
list = global.nodelist
deadend = global.deadendlist
if file_exists("AreaRando/seed.txt")
    file_delete("AreaRando/seed.txt")
fid = file_text_open_append("AreaRando/seed.txt")
while (ds_list_size(access) > 0)
{
    ds_list_shuffle(access)
    node1 = ds_list_find_value(access, 0)
    ds_list_delete(access, 0)
    if (ds_list_size(list) > 0)
    {
        ds_list_shuffle(list)
        node2 = ds_list_find_value(list, 0)
        ds_list_delete(list, 0)
        targetnode = node2[0]
        for (i = 1; i < array_length_1d(node2); i++)
        {
            index = -1
            for (j = 0; j < ds_list_size(list); j++)
            {
                checknode = ds_list_find_value(list, j)
                if (node2[i] == checknode[0])
                {
                    if (ds_list_find_index(access, checknode[0]) == -1)
                    {
                        index = j
                        ds_list_add(access, checknode[0])
                    }
                }
            }
            if (index != -1)
                ds_list_delete(list, index)
        }
    }
    else if (ds_list_size(deadend) > 0)
    {
        ds_list_shuffle(deadend)
        targetnode = ds_list_find_value(deadend, 0)
        ds_list_delete(deadend, 0)
    }
    else if (ds_list_size(access) > 0)
    {
        ds_list_shuffle(access)
        targetnode = ds_list_find_value(access, 0)
        ds_list_delete(access, 0)
    }
    file_text_write_string(fid, ((string(node1) + "-") + string(targetnode)))
    file_text_writeln(fid)
    ds_map_add(map, node1, targetnode)
    ds_map_add(map, targetnode, node1)
}
file_text_close(fid)
ds_list_destroy(list)
ds_list_destroy(access)
ds_list_destroy(deadend)
