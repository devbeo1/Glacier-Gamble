extends Node3D

@export var turn_speed:float = 80

func _process(delta: float) -> void:
	rotation.y += deg_to_rad(turn_speed) * delta
