extends Node2D
class_name Main
@export var textura_transicao : TextureRect
@export var mundo : Node2D

func _ready() -> void:
	levelManager.main = self
	levelManager.textura_transicao = textura_transicao
	_carregar_ultima_sala()


func _carregar_ultima_sala():
	var ultima_sala = GameSave.load_save_salas()
	if ultima_sala.numero_sala > 0:
		levelManager.carregar_fase_numero(ultima_sala.numero_sala)
	else:
		levelManager.carregar_fase_numero(1)
