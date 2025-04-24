extends Node2D
class_name ComponenteVida

@export var vida_maxima : int = 0 
var vida_atual : int

func _ready() -> void:
	iniciar()

func curar(pPontosCura:int):
	vida_atual += pPontosCura


func tomar_dano(pPontosDano:int):
	vida_atual -= pPontosDano
	uIManager.atualizar_componente_vida()
	if vida_atual == 0:
		levelManager.reinicia_fase()

func _on_hurt_box_body_entered(body: Node2D) -> void:
	pass

func iniciar():
	vida_atual = vida_maxima
