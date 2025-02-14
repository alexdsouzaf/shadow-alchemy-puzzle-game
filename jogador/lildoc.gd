extends CharacterBody2D
class_name JogadorCorpo2D

@onready var animated_sprite_2d = %AnimatedSprite2D
@onready var state_machine = %StateMachine

@export var ray_cast_direita : RayCast2D
@export var mao : Marker2D

@export var vivo : bool = true
@export var objeto_atual : ObjetoItem
var mouse_na_area_aceitavel : bool

var pode_atirar = true

func _ready() -> void:
	state_machine.init(self)
	levelManager.jogador_corpo2d = self
	
	_conectar_signals()


func _conectar_signals():
	SignalManager.entrou_area_valida.connect(self._mouse_dentro_mapa)
	SignalManager.saiu_area_valida.connect(self._mouse_fora_mapa)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
	_skill()
	_habilitar_raycasts()
	_offset_mao()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _habilitar_raycasts():
	ray_cast_direita.target_position = Vector2( -20.0 if animated_sprite_2d.flip_h else 20.0, 0.0 )

func _offset_mao():
	mao.position = Vector2(15,3) if !animated_sprite_2d.flip_h else Vector2(-15,3)

func _skill():
	#deveria ser uma lista ou outra forma de controlar quando entrar aqui
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && objeto_atual != null && pode_atirar:
		if objeto_atual.is_arma :
			SignalManager.atirar.emit()
			pode_atirar = false
			%CooldownTiro.start()
		elif objeto_atual is LivroTeleporte && mouse_na_area_aceitavel:
			var dir = get_global_mouse_position()
			position = dir


func _on_cooldown_tiro_timeout():
	pode_atirar = true


func _mouse_dentro_mapa():
	mouse_na_area_aceitavel = true
func _mouse_fora_mapa():
	mouse_na_area_aceitavel = false
