extends RichTextLabel

var dialog = ["Sempre há um outro jeito de resolver as coisas", "A vida não é um jogo de coletáveis,",
"Não se aproveite dos outros. Você é capaz de tudo!", "Basta correr atrás.", "...", "Obrigado por chegar até aqui, espero que tenha gostado de nosso Les Taxes!", "até a próxima <3"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)


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
		if page == 4:
			$TristePlayer.stop()
		if page == 5:
			if $HappyPlayer.play():
				pass
			else:
				$HappyPlayer.play()

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
	get_tree().change_scene("Splash.tscn")
