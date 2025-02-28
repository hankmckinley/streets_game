extends CharacterBody2D

@export var speed = 100

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
		$AnimatedSprite2D.animation = "move_right"
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
		$AnimatedSprite2D.animation = "move_left"
	elif Input.is_action_pressed("move_down"):
		direction.y += 1
		$AnimatedSprite2D.animation = "move_down"
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1
		$AnimatedSprite2D.animation = "move_up"

	if direction.length() > 0:
		direction = direction.normalized()
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation ="idle"
		$AnimatedSprite2D.stop()

	velocity = direction * speed
	move_and_slide()
