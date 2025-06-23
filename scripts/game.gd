extends Node3D

func _process(_delta: float) -> void:
	if DataManager.fps == true:
		$Camera3D/Label.text = str(Engine.get_frames_per_second())


func _on_button_2_pressed() -> void:
	get_tree().quit()
