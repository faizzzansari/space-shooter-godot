extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainScene/Game.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_released("Enter"):
		get_tree().change_scene_to_file("res://Scenes/MainScene/Game.tscn")
