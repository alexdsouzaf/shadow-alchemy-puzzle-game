extends Node2D

func _ready():
	SignalManager.atirar.connect(self._on_atirar)

func _on_atirar():
	var lilDoc = levelManager.jogador_corpo2d
	var dir = get_global_mouse_position() - lilDoc.position
	var arma = lilDoc.objeto_atual
	var instancia = arma.projetil.instantiate()
	add_child(instancia)
	instancia.position = lilDoc.position
	instancia.direction = dir.normalized()
