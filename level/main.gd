extends Node2D

@export var textura_transicao : TextureRect

func _ready() -> void:
	levelManager.main = self
	levelManager.textura_transicao = textura_transicao
