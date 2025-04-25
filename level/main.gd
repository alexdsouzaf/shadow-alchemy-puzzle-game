extends Node2D
class_name Main
@export var textura_transicao : TextureRect
@export var mundo : Node2D

func _ready() -> void:
	levelManager.main = self
	levelManager.textura_transicao = textura_transicao
