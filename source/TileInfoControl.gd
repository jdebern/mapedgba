extends Control

func _ready():
	# fun example of lambda
	var root := $"/root/Main" as MapedGBA
	root.map_loaded.connect(_on_map_loaded)
	pass
	
func _on_map_loaded(map):
	if map is MapController:
		map.edit_cell_changed.connect(_receive_edit_cell_update)
	pass
	
func _receive_edit_cell_update(map, x, y):
	$MarginContainer/VBoxContainer/MapLabel.text = "Map ID: %d" % map
	$MarginContainer/VBoxContainer/TileLabel.text = "Tile: %d, %d" % [x, y]
	pass
