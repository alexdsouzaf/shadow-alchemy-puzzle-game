extends Area2D
class_name BulletGenerica

@export var atributos : BulletResource
@export var audio_tiro : AudioStreamPlayer

var direction : Vector2

func _ready() -> void:
	_configura_audio()

func _physics_process(delta: float) -> void:
	global_position += atributos.speed * direction


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _configura_audio():
	if atributos.som_tiro != null:
		audio_tiro.stream = atributos.som_tiro #as AudioStream
		audio_tiro.play()
