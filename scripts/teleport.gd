extends Area2D


@onready var ui = get_node("../../UI")

func _ready():
	pass
	
func action() -> void:
	print("teleport action!")
	ui.show_buttons()
