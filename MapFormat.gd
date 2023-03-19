class_name MapFormat extends Object

static func save_to_file(mapgroup: Array):
	var file = FileAccess.open("user://maped_world.json", FileAccess.WRITE)
	
	for instance in mapgroup:
		var controller := instance as MapController
		var data = [
			controller.MapId,
			controller.TexturePath
			]
		var string_data = JSON.stringify(data)
		file.store_string(string_data)
		pass
	
	pass
#var data_to_send = ["a", "b", "c"]
#var json_string = JSON.stringify(data_to_send)
## Save data
## ...
## Retrieve data
#var error = json.parse(json_string)
#if error == OK:
#    var data_received = json.data
#    if typeof(data_received) == TYPE_ARRAY:
#        print(data_received) # Prints array
#    else:
#        print("Unexpected data")
#else:
#    print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
