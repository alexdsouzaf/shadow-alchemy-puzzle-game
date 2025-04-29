extends Area2D
class_name EspinhosNoChao

@export var colisionShape: CollisionShape2D
@export var animation : AnimatedSprite2D
@export var timer_recolher : Timer
@export var timer_aparecer : Timer

@export var tempo_para_aparecer : int
@export var tempo_para_recolher : int

@export var dano_espinhos : int = 1

var estado : espinhoEstadoEnum = espinhoEstadoEnum.oculto

enum espinhoEstadoEnum {
	oculto,
	visivel,
}

func _definir_timers():
	timer_recolher.wait_time = tempo_para_recolher
	timer_aparecer.wait_time = tempo_para_aparecer

func _ready() -> void:
	_definir_timers()
	timer_aparecer.start()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "aparecendo":
		colisionShape.disabled = false
		timer_recolher.start()
		
	if animation.animation == "recolhendo":
		colisionShape.disabled = true
		timer_aparecer.start()


func _on_timer_timeout() -> void:
	if estado == espinhoEstadoEnum.oculto:
		estado = espinhoEstadoEnum.visivel
		animation.play("aparecendo")


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("tomar_dano"):
		body.tomar_dano(1)


func _on_timer_recolher_timeout() -> void:
	if estado == espinhoEstadoEnum.visivel:
		estado = espinhoEstadoEnum.oculto
		animation.play("recolhendo")

func get_dano():
	return dano_espinhos
