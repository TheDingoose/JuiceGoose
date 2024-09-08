extends Node2D

var cooldown = 0
@export var min_cooldown: float = 1
@export var max_cooldown: float = 3

var uptime: float = 0
@export var max_uptime: float = 7

var active: bool = false

func get_cooldown_length() -> float:
	return randf_range(min_cooldown, max_cooldown)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown = get_cooldown_length()
	pass

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
				start_task()
			cooldown = get_cooldown_length()
	pass

func start_task():
	active = true
	uptime = 0
	GameManager.add_task()
	$"Adbox-placeholder".visible = true
	$"Adbox-placeholder".position = Vector2(randi_range($"Adbox-placeholder".texture.get_width() / 2, get_viewport().size.x - $"Adbox-placeholder".texture.get_width() / 2),randi_range($"Adbox-placeholder".texture.get_height() / 2,get_viewport().size.y - $"Adbox-placeholder".texture.get_height() / 2))
	if randi_range(0,1):
		$"Adbox-placeholder/Alpha-ad-placeholder".visible = true
		$"Adbox-placeholder/Grub-ad-placeholder".visible = false
	else:
		$"Adbox-placeholder/Alpha-ad-placeholder".visible = false
		$"Adbox-placeholder/Grub-ad-placeholder".visible = true
		pass

func end_task():
	active = false
	cooldown = get_cooldown_length()
	GameManager.remove_task()
	$"Adbox-placeholder".visible = false
	pass

func _on_button_pressed() -> void:
	end_task()
	pass # Replace with function body.
