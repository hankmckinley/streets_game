extends CanvasLayer

@onready var fade_rect = $ColorRect
@onready var player = get_node("../Player")


var locations = {
	1: Vector2(700, -150),
	2: Vector2(700, -1050),
	3: Vector2(700, 600)
}

func _ready():
	fade_rect.modulate.a = 0.0  # Start fully transparent
	hide_buttons()

func show_buttons():
	print("showing buttons")
	$Button1.show() 
	$Button2.show()
	$Button3.show()
	$Message.show()
	$Background.show()
	
func hide_buttons():
	print("Hiding buttons")
	$Button1.hide()
	$Button2.hide()
	$Button3.hide()
	$Message.hide()
	$Background.hide()
		
func fade_and_teleport(target_id: int):
	hide_buttons()
	var tween = get_tree().create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, 1)  # Fade to black
	await tween.finished
	
	

	player.global_position = locations[target_id]  # Move player

	tween = get_tree().create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, 1)  # Fade back in

# Buttons trigger teleportation
func _on_button1_pressed():
	fade_and_teleport(1)

func _on_button2_pressed():
	fade_and_teleport(2)

func _on_button3_pressed():
	fade_and_teleport(3)
