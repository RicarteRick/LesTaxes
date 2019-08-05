extends Control

func _process(delta):
	
	if get_tree().paused:
		show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	if Input.is_action_just_pressed("ui_pause"):
		if $Comandos.hide() == true:
			$Comandos.show()
		else:
			get_tree().paused = !get_tree().paused


func _on_Button_pressed():
	get_tree().paused = !get_tree().paused


func _on_Button2_pressed():
	$Comandos.show()


func _on_ComandosVoltar_pressed():
	$Comandos.hide()


func _on_Button3_pressed():
	get_tree().quit()
