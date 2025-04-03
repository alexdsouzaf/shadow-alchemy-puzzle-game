extends Node

#essa classe vai ter todas as referencias de canvas layer que representam uma UI
#eh o responsavel por atualizar elementos na tela de um jeito mais facil
class_name UIManager

var ui_in_game : UIinGame

func atualizar_componente_vida():
	if ui_in_game != null:
		ui_in_game.atualizar_pontos_vida()
