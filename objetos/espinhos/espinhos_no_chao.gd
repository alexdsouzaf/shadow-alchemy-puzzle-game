extends Area2D
class_name EspinhosNoChao

@export var colisionShape: CollisionShape2D
@export var animation : AnimatedSprite2D
@export var timer : Timer

var estado : espinhoEstadoEnum = espinhoEstadoEnum.oculto

enum espinhoEstadoEnum {
	oculto,
	visivel,
}

func _ready() -> void:
	timer.start(10)

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "aparendo":
		timer.start(5)
		
	if animation.animation == "recolhendo":
		timer.start(10)


func _on_timer_timeout() -> void:
	if estado == espinhoEstadoEnum.oculto:
		estado = espinhoEstadoEnum.visivel
		animation.play("aparendo")
		
	if estado == espinhoEstadoEnum.visivel:
		estado = espinhoEstadoEnum.oculto
		animation.play("recolhendo")


func _on_body_entered(body: Node2D) -> void:
	# TODO  checar se o corpo que colidu possui a funcao basica pra receber dano
	pass # Replace with function body.
