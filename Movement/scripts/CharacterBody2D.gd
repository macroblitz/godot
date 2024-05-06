extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta):
	# Konpeki Sensei May-3-2024
	
	var directionX = Input.get_axis("move_left", "move_right")
	var directionY = Input.get_axis("move_up", "move_down")
	
	# Move Player
	if directionX || directionY:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED
		
		if directionX == 1 && directionY == 0:
			# Face Right
			$Sprite2D.set_rotation_degrees(0)
		if directionX == 0 && directionY == 1:
			# Face Down
			$Sprite2D.set_rotation_degrees(90)
		if directionX == -1 && directionY == 0:
			# Face Left
			$Sprite2D.set_rotation_degrees(180)
		if directionX == 0 && directionY == -1:
			# Face Up
			$Sprite2D.set_rotation_degrees(270)
			
	else:
		# Stop Moving
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
