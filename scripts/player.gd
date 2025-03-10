extends CharacterBody2D

@export var speed = 100
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

@onready var ui = get_node("../UI")

var current_zone = 0  # Stores which teleport zone the player is in (1, 2, or 3)

var in_convo: bool = false

func _ready() -> void:
	ui.hide_buttons()
	
func _input(event):
	if event.is_action_pressed("ui_accept") and in_convo == false:
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			in_convo = true
			return

func _physics_process(delta):
	

	var direction = Vector2.ZERO
	
	
	#if Input.is_action_just_pressed("ui_accept"):
	#	var actionables = actionable_finder.get_overlapping_areas()
	#	if actionables.size() > 0:
	#		actionables[0].action()
	#		return
	


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
		in_convo = false
		direction = direction.normalized()
		$AnimatedSprite2D.play()
	else:
		# $AnimatedSprite2D.animation ="idle"
		$AnimatedSprite2D.stop()

	velocity = direction * speed
	move_and_slide()
