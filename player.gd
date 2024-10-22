extends CharacterBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity_player = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO:
		velocity_player = velocity_player.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity_player = velocity_player.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = velocity_player
	
	move_and_slide()
