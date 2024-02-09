extends Node3D

@export var MoveSpeed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var MoveInput = Vector2(Input.get_axis("Left","Right"), Input.get_axis("Up","Down"))
	position.x += MoveInput.x * MoveSpeed * delta
	position.z += MoveInput.y * MoveSpeed * delta
	pass
