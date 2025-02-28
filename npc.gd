extends Area2D

# Reference to the dialog box (which will be shown when the player presses space).
@export var dialog_box: Panel
@export var dialog_label: Label

# Detect when player is near
var player_nearby = false

# Dialogue text to display
var dialog_text = "Hello there, welcome to my world!"

# When the player enters the NPC's area, set player_nearby to true.
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):  # Assuming the player is in the 'player' group.
		player_nearby = true
		print("Player is nearby!")

# When the player exits the NPC's area, set player_nearby to false.
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		dialog_box.visible = false  # Hide dialog when the player leaves.
		print("Player left!")

# Check for spacebar press and show dialog box if the player is nearby.
func _process(delta):
	if player_nearby and Input.is_action_just_pressed("ui_accept"):  # "ui_accept" is mapped to Spacebar by default.
		dialog_box.visible = true  # Show the dialog box.
		dialog_label.text = dialog_text  # Set the dialog text.

	elif not player_nearby:
		dialog_box.visible = false  # Hide the dialog box when not near the NPC.
