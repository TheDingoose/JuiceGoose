extends Camera3D

@export var CameraArmDirection = Vector3(0,1,1).normalized()
@export var CameraArmLength = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	look_at_from_position(CameraArmDirection * CameraArmLength, Vector3(0,0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
