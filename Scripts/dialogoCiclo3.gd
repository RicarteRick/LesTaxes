	extends RichTextLabel

var dialog = ["Boa noite, caros moradores de Patris!", "Na verdade, uma INCRÍVEL noite!!!", "Hoje não posso demorar mais que o necessário...",
"Sendo assim, gostaria apenas de ressaltar minha satisfação!", "Mais uma vez, continuem com o bom trabalho.", "...",
"Haha."]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	#dialog[5] = "Pela falta de " + str($"/root/Global".coins) + " moedas que deveriam ter sido pagas para o bem da vila,"



func _input(event):
	
	if Input.is_action_just_pressed("ui_all"):
		if page == 6:
			$TimerFim.start()
			
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			if Input.is_action_just_pressed("ui_all"):
				set_visible_characters(get_total_character_count())
		

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_TimerBip_timeout():
	if get_visible_characters() < get_total_character_count():

		$BipPlayer.play()
		$TimerBip2.start()

func _on_TimerBip2_timeout():
	$BipPlayer.stop()
	$TimerBip2.stop()


func _on_TimerFim_timeout():
	get_tree().change_scene("Familia2.tscn")
