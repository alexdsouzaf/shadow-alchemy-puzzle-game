extends Node2D

#TODO achar um jeito de apenas criar instancias do jogador e nunca ter ele diretamente no editor
#@onready var jogador = preload("res://jogador/lildoc.tscn")

func _ready() -> void:
	levelManager.main = self
	#instancia_jogador()

#func instancia_jogador():
	#var instanciaJogador = jogador.instantiate()
	#inventario.add_child(instanciaJogador)
