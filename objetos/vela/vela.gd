extends ObjetoItem
class_name Vela

@export var textura_sprite : AnimatedSprite2D


func ligar_shader():
	textura_sprite.material.set_shader_parameter("thickness",1)


func desligar_shader():
	textura_sprite.material.set_shader_parameter("thickness",0)
