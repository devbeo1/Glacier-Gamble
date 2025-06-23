extends Node3D
var current_x_offset:float = 0.0
var x_step:float = 0.4
var player_cards_value:int
@onready var cards = [
	preload("res://assets/Cards (large)/card_clubs_02.png"),
	preload("res://assets/Cards (large)/card_clubs_03.png"),
	preload("res://assets/Cards (large)/card_clubs_04.png"),
	preload("res://assets/Cards (large)/card_clubs_05.png"),
	preload("res://assets/Cards (large)/card_clubs_06.png"),
	preload("res://assets/Cards (large)/card_clubs_07.png"),
	preload("res://assets/Cards (large)/card_clubs_08.png"),
	preload("res://assets/Cards (large)/card_clubs_09.png"),
	preload("res://assets/Cards (large)/card_clubs_10.png"),
	preload("res://assets/Cards (large)/card_clubs_K.png"),
	preload("res://assets/Cards (large)/card_clubs_J.png"),
	preload("res://assets/Cards (large)/card_clubs_Q.png"),
	preload("res://assets/Cards (large)/card_clubs_A.png"),
	preload("res://assets/Cards (large)/card_diamonds_02.png"),
	preload("res://assets/Cards (large)/card_diamonds_03.png"),
	preload("res://assets/Cards (large)/card_diamonds_04.png"),
	preload("res://assets/Cards (large)/card_diamonds_05.png"),
	preload("res://assets/Cards (large)/card_diamonds_06.png"),
	preload("res://assets/Cards (large)/card_diamonds_07.png"),
	preload("res://assets/Cards (large)/card_diamonds_08.png"),
	preload("res://assets/Cards (large)/card_diamonds_09.png"),
	preload("res://assets/Cards (large)/card_diamonds_10.png"),
	preload("res://assets/Cards (large)/card_diamonds_K.png"),
	preload("res://assets/Cards (large)/card_diamonds_J.png"),
	preload("res://assets/Cards (large)/card_diamonds_Q.png"),
	preload("res://assets/Cards (large)/card_diamonds_A.png"),
	preload("res://assets/Cards (large)/card_hearts_02.png"),
	preload("res://assets/Cards (large)/card_hearts_03.png"),
	preload("res://assets/Cards (large)/card_hearts_04.png"),
	preload("res://assets/Cards (large)/card_hearts_05.png"),
	preload("res://assets/Cards (large)/card_hearts_06.png"),
	preload("res://assets/Cards (large)/card_hearts_07.png"),
	preload("res://assets/Cards (large)/card_hearts_08.png"),
	preload("res://assets/Cards (large)/card_hearts_09.png"),
	preload("res://assets/Cards (large)/card_hearts_10.png"),
	preload("res://assets/Cards (large)/card_hearts_K.png"),
	preload("res://assets/Cards (large)/card_hearts_J.png"),
	preload("res://assets/Cards (large)/card_hearts_Q.png"),
	preload("res://assets/Cards (large)/card_hearts_A.png"),
	preload("res://assets/Cards (large)/card_spades_02.png"),
	preload("res://assets/Cards (large)/card_spades_03.png"),
	preload("res://assets/Cards (large)/card_spades_04.png"),
	preload("res://assets/Cards (large)/card_spades_05.png"),
	preload("res://assets/Cards (large)/card_spades_06.png"),
	preload("res://assets/Cards (large)/card_spades_07.png"),
	preload("res://assets/Cards (large)/card_spades_08.png"),
	preload("res://assets/Cards (large)/card_spades_09.png"),
	preload("res://assets/Cards (large)/card_spades_10.png"),
	preload("res://assets/Cards (large)/card_spades_K.png"),
	preload("res://assets/Cards (large)/card_spades_J.png"),
	preload("res://assets/Cards (large)/card_spades_Q.png"),
	preload("res://assets/Cards (large)/card_spades_A.png")
]
const CARD_VALUES = [2,3,4,5,6,7,8,9,10,10,10,10,1,2,3,4,5,6,7,8,9,10,1,10,10,10,2,3,4,5,6,7,8,9,10,1,10,10,1,2,3,4,5,6,7,8,9,10,1,10,10,1]
var dealer_card_value:int

func _ready() -> void:
	add_card(randi_range(0,cards.size() - 1),true)
	add_card(randi_range(0,cards.size() - 1),true)
	dealer_card_value = randi_range(1,21)

func add_card(id:int,is_player:bool):
	var new_card = preload("res://scenes/cards/card.tscn").instantiate()
	if DataManager.is_sound == true:
		$"../audios/card fan".play()
	new_card.texture = cards[id]
	new_card.transform.origin.x = current_x_offset
	current_x_offset += x_step
	$cards.add_child(new_card)
	if is_player == true:
		player_cards_value += CARD_VALUES[id]


func _on_stand_pressed() -> void:
	print(dealer_card_value)
	print(player_cards_value)
	add_card(randi_range(0,cards.size() - 1),true)
	if player_cards_value > 21:
		$"../Camera3D/ui/standhittypeshi/won_lost".text = "You busted!"
		current_x_offset = 0.0
		player_cards_value = 0
		$"../Camera3D/ui/lose".visible = true
		$"../Camera3D/ui/add_chips".visible = false
		$"../Camera3D/ui/extras".visible = false
		$"../Camera3D/ui/standhittypeshi".visible = false
		add_card(randi_range(0,cards.size() - 1),true)
		add_card(randi_range(0,cards.size() - 1),true)
	elif dealer_card_value > 21:
		$"../Camera3D/ui/standhittypeshi/won_lost".text = "Dealer busted!"
		$"../chips".money += 500
		current_x_offset = 0.0
		player_cards_value = 0
		for cardsosos in $cards.get_children():
			cardsosos.queue_free()
		add_card(randi_range(0,cards.size() - 1),true)
		add_card(randi_range(0,cards.size() - 1),true)


func _on_hit_pressed() -> void:
	print(dealer_card_value)
	print(player_cards_value)
	if player_cards_value > dealer_card_value:
		$"../Camera3D/ui/standhittypeshi/won_lost".text = "Player wins!"
		$"../chips".money += 500
		$"../Camera3D/ui/extras/money won".text = "+500"
		current_x_offset = 0.0
		player_cards_value = 0
		for cardsosos in $cards.get_children():
			cardsosos.queue_free()
		add_card(randi_range(0,cards.size() - 1),true)
		add_card(randi_range(0,cards.size() - 1),true)
		$"../chips".add_chip(randi_range(0,$"../chips".chip_models.size() - 1))
	elif dealer_card_value < player_cards_value:
		$"../Camera3D/ui/standhittypeshi/won_lost".text = "Dealer wins!"
		$"../chips".money -= 500
		$"../Camera3D/ui/extras/money won".text = "-500"
		current_x_offset = 0.0
		player_cards_value = 0
		for chips_children in $"../chips/chiossos".get_children():
			chips_children.queue_free()
		for cardsosos in $cards.get_children():
			cardsosos.queue_free()
		add_card(randi_range(0,cards.size() - 1),true)
		add_card(randi_range(0,cards.size() - 1),true)
	else:
		$"../Camera3D/ui/standhittypeshi/won_lost".text = "Draw!"
		current_x_offset = 0.0
		player_cards_value = 0
		for cardsosos in $cards.get_children():
			cardsosos.queue_free()
		add_card(randi_range(0,cards.size() - 1),true)
		add_card(randi_range(0,cards.size() - 1),true)


func _on_card_fan_finished() -> void:
	$"../audios/card place".play()


func _on_button_2_pressed() -> void:
	get_tree().reload_current_scene()
		    

func _process(_delta):
	if $"../chips".money <= 0:
		current_x_offset = 0.0
		player_cards_value = 0
		$"../Camera3D/ui/lose".visible = true
		$"../Camera3D/ui/add_chips".visible = false
		$"../Camera3D/ui/extras".visible = false
		$"../Camera3D/ui/standhittypeshi".visible = false