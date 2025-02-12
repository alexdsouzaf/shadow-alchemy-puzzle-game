extends RayCast2D

@export var mao_esquerda : Marker2D

var objeto_na_visao : ObjetoItem = null

func _physics_process(delta: float) -> void:
	_destacar_objeto()
	if Input.is_action_just_pressed("pegar") && enabled:
		_interagir()

# TODO: revisar essa logica por que ta um pouco bugado
# um dos lados para de monitorar o item no chao
func _destacar_objeto():
	if is_colliding() && get_collider() is ObjetoItem:
		objeto_na_visao = get_collider() as ObjetoItem
		objeto_na_visao.ligar_shader()
	elif objeto_na_visao != null:
		objeto_na_visao.desligar_shader()
		objeto_na_visao = null

func _interagir():
	if is_colliding() && get_collider() is ObjetoItem:
		var objetoDetectado = get_collider() as ObjetoItem
		
		if levelManager.jogador_corpo2d.objeto_atual != null:
			var objeto_atual = mao_esquerda.get_child(0) as ObjetoItem
			objeto_atual.pegar_largar(mao_esquerda, levelManager.pool_objeto_no_chao,true)
		
		
		levelManager.jogador_corpo2d.objeto_atual = objetoDetectado
		objetoDetectado.pegar_largar(levelManager.pool_objeto_no_chao, mao_esquerda,false)
		
		clear_exceptions()
		objetoDetectado.global_position = mao_esquerda.global_position
		add_exception(objetoDetectado)
	else:
		#se nada foi detectado larga o objeto atual
		if levelManager.jogador_corpo2d.objeto_atual != null:
			var objeto_atual = mao_esquerda.get_child(0) as ObjetoItem
			if objeto_atual != null:
				levelManager.jogador_corpo2d.objeto_atual = null
				objeto_atual.pegar_largar(mao_esquerda,levelManager.pool_objeto_no_chao,true)
				clear_exceptions()
