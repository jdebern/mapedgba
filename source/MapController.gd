class_name MapController

extends Sprite2D

signal edit_cell_changed(map, x, y)

@export_category("Config")
@export
var MapId: int = 0
var TexturePath: String = ""

var editpos := Vector2()
var cellsize = 16

func _input(event):
	var camera := $"/root/Main/Camera2D" as Camera2D
	if event is InputEventMouseMotion:
		#var vprect = get_viewport_rect()
		#var worldpos = event.position + (camera.get_screen_center_position() - (vprect.size * 0.5 * camera.zoom.x))
		var mousepos = get_global_mouse_position()
		if get_rect().has_point(mousepos):
			set_edit_cell(mousepos)
	pass
	
	
func set_edit_cell(worldpos: Vector2):
	# center the sprite to 0,0
	var pos = worldpos - position
	var rsize := get_rect().size as Vector2
	var xcell = floor(pos.x / cellsize)
	var ycell = floor(pos.y / cellsize)
	editpos = Vector2(xcell * cellsize, ycell * cellsize)
	queue_redraw()
	edit_cell_changed.emit(MapId, xcell, ycell)
	pass
	
func set_source_texture(tex: ImageTexture, path: String):
	texture = tex
	pass
	

func _draw():
	var rect : Rect2 = get_rect()
#	draw_circle(rect.position, 5.0, Color.RED)
#	draw_circle(rect.position + rect.size, 5.0, Color.BLUE)
#	draw_circle(Vector2.ZERO, 10.0, Color.WHITE)
	draw_rect(Rect2(editpos, Vector2(cellsize, cellsize)), Color.CYAN, true)
	pass


func _on_texture_changed():
	set_centered(true)
	pass # Replace with function body.
