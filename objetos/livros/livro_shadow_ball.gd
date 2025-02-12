extends ObjetoItem
class_name LivroShadowBall

@export var textura_sprite : Sprite2D


func ligar_shader():
	textura_sprite.material.set_shader_parameter("thickness",1)


func desligar_shader():
	textura_sprite.material.set_shader_parameter("thickness",0)
