extends Area2D
class_name JogadorHurtBox


@export var componente_viva : ComponenteVida

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_dano"):
		componente_viva.tomar_dano(body.get_dano())


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("get_dano"):
		componente_viva.tomar_dano(area.get_dano())
