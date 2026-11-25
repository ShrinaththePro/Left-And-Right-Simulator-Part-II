extends Label

@onready var game_manager: Node = %GameManager

func _process(delta: float) -> void:
	text = "Good Job!!!\nYou Collected: " + str(game_manager.score) + " Coins!!!"
	modulate = Color.LIGHT_YELLOW
