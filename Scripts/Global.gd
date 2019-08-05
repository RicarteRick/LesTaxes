extends Node

var coins: int = 0
var anim: int = 0

func _ready():
	update_coins_amount()
	get_tree().change_scene("Splash.tscn")

func add_coins(amount: int) -> void:
	coins += amount
	get_node("/root/Main/SfxPlayer").play()
	update_coins_amount()
	
func reset_coins() -> void:
	coins = 0
	update_coins_amount()
	
func update_coins_amount() -> void:
	get_node("/root/Main/CanvasLayer/Label").text = "Coins: " + str(coins)