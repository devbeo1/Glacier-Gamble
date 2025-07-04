extends Node3D

var fullscreen:bool
var fps:bool
var sound:bool

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("hud"):
		$"Camera3D/ui/HUD".visible = true
		$"Camera3D/ui/lose".visible = false
		$"Camera3D/ui/add_chips".visible = false
		$"Camera3D/ui/extras".visible = false
		$"Camera3D/ui/standhittypeshi".visible = false
	if DataManager.fps == true:
		$Camera3D/Label.text = str(Engine.get_frames_per_second())
	if $Camera3D/ui/HUD/ColorRect/ColorRect.visible == true:
		if Input.is_action_just_pressed("hud"):
			$Camera3D/ui/HUD/ColorRect/ColorRect.visible == false

func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().quit()


func _on_go_back_pressed() -> void:
	$"Camera3D/ui/HUD".visible = false
	$"Camera3D/ui/lose".visible = false
	$"Camera3D/ui/add_chips".visible = true
	$"Camera3D/ui/extras".visible = true
	$"Camera3D/ui/standhittypeshi".visible = true


func _on_button_3_pressed() -> void:
	$Camera3D/ui/HUD/ColorRect/ColorRect.visible = true


func _on_settings_back_pressed() -> void:
	$Camera3D/ui/HUD/ColorRect/ColorRect.visible = false


func _on_sounds_on_pressed() -> void:
	sound = !sound
	DataManager.is_sound = true
	if sound:
		$Camera3D/ui/HUD/ColorRect/ColorRect/sounds_on.text = "off"
		DataManager.is_sound = false
	else:
		$Camera3D/ui/HUD/ColorRect/ColorRect/sounds_on.text = "on"
		DataManager.is_sound = true


func _on_fullscreen_on_pressed() -> void:
	fullscreen = !fullscreen
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$Camera3D/ui/HUD/ColorRect/ColorRect/fullscreen_on.text = "enable"
		
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$Camera3D/ui/HUD/ColorRect/ColorRect/fullscreen_on.text = "disable"


func _on_fps_on_pressed() -> void:
	if fps:
		DataManager.fps = false
		$Camera3D/ui/HUD/ColorRect/ColorRect/fps_on.text = "enable"
		
	else:
		DataManager.fps = true
		$Camera3D/ui/HUD/ColorRect/ColorRect/fps_on.text = "disable"
