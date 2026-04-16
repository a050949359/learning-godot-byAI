extends CharacterBody2D

@export var speed := 260.0

var can_move := true
var play_area := Rect2(Vector2.ZERO, Vector2(960.0, 540.0))


func _physics_process(_delta: float) -> void:
	if not can_move:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	global_position = global_position.clamp(play_area.position, play_area.end)
