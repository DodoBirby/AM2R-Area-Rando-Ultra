w = string_width(optext)
if (w < 80)
    w = 80
draw_set_alpha(1)
draw_set_font(global.fontGUI2)
draw_set_color(c_black)
draw_set_alpha(0.4)
if (global.curropt == optionid)
    draw_set_color(c_gray)
draw_rectangle((x - 2), (y - 1), ((x + textoffset) - 8), (y + 8), false)
if editing
    draw_set_color(c_green)
draw_rectangle(((x + textoffset) - 2), (y - 1), (((x + textoffset) + w) + 1), (y + 8), false)
draw_set_alpha(1)
draw_set_color(c_black)
draw_text((x + 1), (y - 3), label)
draw_text(((x + textoffset) + 1), (y - 3), optext)
draw_set_color(c_white)
if (enabled == 0)
    draw_set_alpha(0.5)
else
    draw_set_alpha(1)
draw_text(x, (y - 4), label)
draw_text((x + textoffset), (y - 4), optext)
draw_set_alpha(1)
