	extends RichTextLabel

var dialog = ["Boa noite, caros moradores de Patris!", "Na verdade, uma INCRÍVEL noite!!!",
"O clima está ótimo e as colheitas não poderiam estar melhores!", "Entretanto...", "Temo dizer que não estou completamente feliz.",
"Em nosso balanço diário, fora me informado que não conseguimos o valor necessário de impostos da vila.", "Devido à falta de uma boa quantia de ouro,", "Certas providências serão tomadas.",
"Imediatamente.", "Peço gentilmente que as famílias Breton, Dufuor e Moreau arrumem com cuidado seus bens pessoais...", "E desapareçam da cidade.",
"Espero que tenha ficado claro para todos a importância de suas colaborações...", "Espero mesmo.", "Mas não fiquem tristes!", "Mal entendidos acontecem o tempo todo!",
"Voltem para suas casas e descansem, amanhã é um outro dia, haha!"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	#dialog[5] = "Pela falta de " + str($"/root/Global".coins) + " moedas que deveriam ter sido pagas para o bem da vila,"



func _input(event):
	if Input.is_action_just_pressed("ui_all"):
		if page == 15:
			$TimerFim.start()
		
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			if Input.is_action_just_pressed("ui_all"):
				set_visible_characters(get_total_character_count())
		if page == 8:
			$HappyPlayer.stop()
		if page == 10:
			if $TensoPlayer.play():
				pass
			else:
				$TensoPlayer.play()
		if page == 13:
			$TensoPlayer.stop()
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
	get_tree().change_scene("Fase2.tscn")
