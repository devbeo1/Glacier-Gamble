extends Node3D

@onready var blackinside_chip= preload("res://scenes/chips/chips_blackinside_whiteoutside.tscn")#100
@onready var blue_chip= preload("res://scenes/chips/chips_blue.tscn")#10
@onready var whiteinside_chip= preload("res://scenes/chips/chips_whiteinside.tscn")#1
@onready var red_chip= preload("res://scenes/chips/chips_red.tscn")#5
@onready var green_chip= preload("res://scenes/chips/chips_green.tscn")#25
@onready var pink_chip= preload("res://scenes/chips/chips_pink.tscn")#2.50
@onready var yellow_chip =preload("res://scenes/chips/chips_yellow.tscn")#1000
@onready var gray_chip= preload("res://scenes/chips/chips_gray.tscn")#5000

@onready var chip_models = [
whiteinside_chip,
blackinside_chip,
blue_chip,
red_chip,
green_chip,
pink_chip,
yellow_chip,
gray_chip
]

var value_chips:float

var current_y_offset:float = 0.02
var offset_step:float = 0.05
var chip:Node3D
var money:float = 1000.0
var tempo_chip_val:float

const CHIP_VALUES = [1, 100, 10, 5, 25, 2.5, 1000, 5000]

func add_chip(id23):
	tempo_chip_val = 0
	tempo_chip_val = CHIP_VALUES[id23]
	chip = chip_models[id23].instantiate()
	value_chips += CHIP_VALUES[id23]
	chip.transform.origin.y = current_y_offset
	current_y_offset += offset_step
	chip.scale = Vector3(1.6,1.6,1.6)
	if money >= tempo_chip_val:
		money -= tempo_chip_val
		$chiossos.add_child(chip)
		if DataManager.is_sound == true:
			$"../audios/chip lay".play()
	else:
		$"../Camera3D/ui/extras/bought".text  = "You dont have enough money!!" 
	$"../Camera3D/ui/extras/money couter".text = str(money) + "$"

func _on_add_chip_1d_pressed() -> void:
	add_chip(0)


func _on_add_chip_2_5d_pressed() -> void:
	add_chip(5)


func _on_add_chip_5d_pressed() -> void:
	add_chip(3)


func _on_add_chip_10d_pressed() -> void:
	add_chip(2)

func _on_add_chip_100d_pressed() -> void:
	add_chip(1)

func _on_add_chip_1000d_pressed() -> void:
	add_chip(6)


func _on_add_chip_5000d_pressed() -> void:
	add_chip(7)


func _on_button_pressed() -> void:
	$"../Node3D".current_x_offset = 0.0
	$"../Node3D".player_cards_value = 0
	for chips_children in $"../chips/chiossos".get_children():
		chips_children.queue_free()
	for cardsosos in $cards.get_children():
		cardsosos.queue_free()
	$"../Node3D".add_card(randi_range(0,$"../Node3D".cards.size() - 1),true)
	$"../Node3D".add_card(randi_range(0,$"../Node3D".cards.size() - 1),true)