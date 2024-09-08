extends Node

#manage scene transitions and communicate with game data where to go next

#main menu list and esc button management
#current scene
#scene list

var failure_scene = preload("res://Scenes/Gameplay/Failure.tscn")
var office_scene = preload("res://Scenes/Gameplay/MainOffice.tscn")

var save_file
#goto_scene()

func _init() -> void:
	if not FileAccess.file_exists("user://JuiceGooseData.save"):
		save_file = FileAccess.open("user://JuiceGooseData.save", FileAccess.WRITE)
		#TODO: put in every base thing that needs to be read into the saveFile
		save_file.close()
	save_file = FileAccess.open("user://JuiceGooseData.save", FileAccess.READ_WRITE)
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scene = office_scene.instantiate()
	get_tree().get_root().add_child.call_deferred(scene)
	
	var savetest = {"Hullo!" = 1, "Heya" = 2}
	
	var json_string = JSON.stringify(savetest)
	save_file.store_line(json_string)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_failstate():
	var scene = failure_scene.instantiate()
	get_tree().get_root().add_child(scene)
