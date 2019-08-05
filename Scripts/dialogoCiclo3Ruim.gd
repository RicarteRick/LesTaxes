	extends RichTextLabel

var dialog = ["Boa noite.", "...", "Não, não é uma incrível noite.",
"Eu tenho cara de palhaço para vocês?", "...", "*sim*",
"EXATAMENTE, NÃO TENHO!", "Achei que tinha deixado bem claro a importância da colaboração de todos.", "Vincent e Renault",
"As duas famílias cujas casas são as mais bonitas da cidade...", "ainda assim pecam perante vosso rei", "Deplorável.", 
"Aos demais, estão dispensados.", "...", "*eu não aguento mais esse filhinho de salto alto*"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	#dialog[5] = "Pela falta de " + str($"/root/Global".coins) + " moedas que deveriam ter sido pagas para o bem da vila,"



func _input(event):
	
	if Input.is_action_just_pressed("ui_all"):
		if page == 14:
			$TimerFim.start()
			
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			if Input.is_action_just_pressed("ui_all"):
				set_visible_characters(get_total_character_count())
		if page == 1:
			pass
			#$HappyPlayer.stop()
		if page == 2:
			if $TensoPlayer.play():
				pass
			else:
				$TensoPlayer.play()


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
	get_tree().change_scene("Familia2Bom.tscn")
