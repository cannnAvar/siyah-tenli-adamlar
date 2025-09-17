extends CharacterBody2D


const SPEED := 300.0



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
