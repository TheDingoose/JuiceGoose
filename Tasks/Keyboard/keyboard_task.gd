extends Node2D

var cooldown = 0
@export var min_cooldown: float = 1
@export var max_cooldown: float = 3

var uptime: float = 0
@export var max_uptime: float = 2

var active: bool = false
var active_key

var key_dict = {
	"A": KEY_A,
	"B": KEY_B,
	"C": KEY_C,
	"D": KEY_D,
	"E": KEY_E,
	"F": KEY_F,
	"G": KEY_G,
	"H": KEY_H,
	"I": KEY_I,
	"J": KEY_J,
	"K": KEY_K,
	"L": KEY_L,
	"M": KEY_M,
	"N": KEY_N,
	"O": KEY_O,
	"P": KEY_P,
	"Q": KEY_Q,
	"R": KEY_R,
	"S": KEY_S,
	"T": KEY_T,
	"U": KEY_U,
	"V": KEY_V,
	"W": KEY_W,
	"X": KEY_X,
	"Y": KEY_Y,
	"Z": KEY_Z
}

func get_cooldown_length() -> float:
	return randf_range(min_cooldown, max_cooldown)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown = get_cooldown_length()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		uptime += delta
		if uptime > max_uptime:
			GameManager.fail()
			end_task()
	else:
		cooldown -= delta
		if cooldown < 0:
			if GameManager.can_add_task():
				active_key = key_dict.keys()[randi_range(0, key_dict.size() - 1)]
				start_task()
			cooldown = get_cooldown_length()
	pass
	

func _input(event: InputEvent) -> void:
	if active && event is InputEventKey:
		if event.pressed && event.keycode == key_dict[active_key]:
			end_task()
			pass

func start_task():
	active = true
	uptime = 0
	$Label.text = active_key
	$PopupBox.visible = true
	$Label.visible = true
	GameManager.add_task()
	pass

func end_task():
	active = false
	$PopupBox.visible = false
	$Label.visible = false
	cooldown = get_cooldown_length()
	GameManager.remove_task()
	pass
