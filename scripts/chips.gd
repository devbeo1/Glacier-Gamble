extends Node3D

@export var turn_speed:float = 0.5

func _process(delta: float) -> void:
	rotation.y += deg_to_rad(turn_speed)+delta
