extends CharacterBody2D
class_name InimigoToxico
@onready var animated_sprite_2d = %AnimatedSprite2D
@onready var state_machine = %StateMachine

@export var dano_area_toxica : int = 1

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)


func _on_area_dano_area_entered(area):
	if area is BulletGenerica:
		queue_free()


func _on_area_toxica_body_entered(body: Node2D) -> void:
	# TODO emitir um signal?
	pass # Replace with function body.

func get_dano() -> int:
	return dano_area_toxica
