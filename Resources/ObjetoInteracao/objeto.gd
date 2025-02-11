extends Area2D
class_name ObjetoItem

@export var projetil : PackedScene
@export var is_arma : bool = false

var equipado : bool = false

func _on_mouse_entered():
	%Label.visible = true;


func _on_mouse_exited():
	%Label.visible = false;


func pegar_largar(pPaiAtual:Node, pNovoPai:Node, pMonitorable:bool):
	reparent(pNovoPai)
	monitorable = pMonitorable



func ligar_shader():
	pass

func desligar_shader():
	pass
