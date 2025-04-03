extends Node2D

#TODO achar um jeito de apenas criar instancias do jogador e nunca ter ele diretamente no editor
#@onready var jogador = preload("res://jogador/lildoc.tscn")

@export var textura_transicao : TextureRect


func _ready() -> void:
	levelManager.main = self
	levelManager.textura_transicao = textura_transicao
	#instancia_jogador()

#func instancia_jogador():
	#var instanciaJogador = jogador.instantiate()
	#inventario.add_child(instanciaJogador)
