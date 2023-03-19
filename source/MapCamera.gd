extends Camera2D

@export_category("Config")
@export var ScaleMin: float = 0.4
@export var ScaleMax: float = 1.75
#@export var PanSpeed = 2.0

var ZoomTable = [0.1, 0.25]

var is_dragging : = false
var last_mouse_pos := Vector2()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				is_dragging = true
				last_mouse_pos = event.position
			elif is_dragging:
				is_dragging = false
		pass
		
	if event is InputEventMouseMotion:		
		if is_dragging:
			var delta = event.position - last_mouse_pos
			if zoom.x < 1:
				delta *= (1 + (1-zoom.x))
			position = position - delta
			last_mouse_pos = event.position
			pass
		pass
		
	if event is InputEventKey or event is InputEventMouseButton:
		# catch zooms
		var _mod = Input.is_action_pressed("modifier")
		if Input.is_action_just_pressed("zoom_in"):
			_zoom(true, _mod)
		elif Input.is_action_just_pressed("zoom_out"):
			_zoom(false, _mod)
		pass
	pass

func _zoom(zoom_in: bool, mod: bool):
	var idx: int = 0 if not mod else 1
	var delta: float = 1.0 if zoom_in else -1.0
	zoom.x = clamp(zoom.x + (ZoomTable[idx] * delta), ScaleMin, ScaleMax)
	zoom.y = zoom.x
	pass
