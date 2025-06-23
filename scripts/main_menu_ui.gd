extends Control

var fullscreen:bool = false
var sound:bool = true
var fps:bool = false


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")

func _on_settings_pressed() -> void:
	$settings.show()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_settings_back_pressed() -> void:
	$settings.hide()


func _on_sounds_on_pressed() -> void:
	sound = !sound
	DataManager.is_sound = true
	if sound:
		$settings/sounds_on.text = "off"
		DataManager.is_sound = false
	else:
		$settings/sounds_on.text = "on"
		DataManager.is_sound = true


func _on_fullscreen_on_pressed() -> void:
	fullscreen = !fullscreen
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$settings/fullscreen_on.text = "enable"
		
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$settings/fullscreen_on.text = "disable"

func _on_back_about_pressed() -> void:
	$about.hide()


func _on_fps_on_pressed() -> void:
	fps = !fps
	if fullscreen:
		DataManager.fps = false
		$settings/fullscreen_on.text = "enable"
		
	else:
		DataManager.fps = true
		$"../Label2".text = str(Engine.get_frames_per_second())
		$settings/fullscreen_on.text = "disable"
