extends Node

#manage what scene we are in, and fail conditions in main game
@export var max_active_tasks = 10
@export var current_active_tasks = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fail():
	print("FAILURE")
	pass

func add_task():
	current_active_tasks += 1

func remove_task():
	current_active_tasks -= 1

func can_add_task() -> bool:
	return current_active_tasks < max_active_tasks
