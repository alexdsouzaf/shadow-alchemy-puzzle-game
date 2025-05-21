extends CanvasLayer
class_name UIinGame

@export var label_pontos_vida : Label

func _ready() -> void:
	uIManager.ui_in_game = self
	atualizar_pontos_vida()

func atualizar_pontos_vida():
	label_pontos_vida.text = "HP: " + str(levelManager.jogador_corpo2d.componente_vida.vida_atual)
