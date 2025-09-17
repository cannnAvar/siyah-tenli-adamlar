extends CharacterBody2D


const SPEED := 300.0

const BULLET = preload("res://scene/bullet.tscn")



func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")

	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	

	move_and_slide()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		var bullet := BULLET.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		
