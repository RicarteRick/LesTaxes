extends Area2D


func _on_Coin_body_entered(body):
	if body.get_name() == "Player":
		Global.add_coins(1)
		queue_free()
		