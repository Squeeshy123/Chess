extends Node2D

var spot = {}
var spots = []
var spot_size = 64

export var black_colour = Color()
export var white_colour = Color()

func _ready():
	for i in get_children():
		if i.has_method("set_board"):
			i.set_board(self)
	for x in range(8):
		for y in range(8):
			spots.append(Vector2(x,y))
	
	update()

func _draw():
	for i in range(spots.size()):
		if int(spots[i].x + spots[i].y) % 2 == 0:
			draw_rect(Rect2(spots[i] * spot_size, Vector2.ONE * spot_size), black_colour)
		else:
			draw_rect(Rect2(spots[i] * spot_size, Vector2.ONE * spot_size), white_colour)

func load_key(key : String):
	# Cursor Position
	var cur_pos = Vector2(0,0)
	for c in key:
		if c.is_valid_integer():
			if cur_pos.x + int(c) > 8:
				cur_pos.y += 1
				cur_pos.x += int(c)-8
			else:
				cur_pos.x += c
