extends RayCast2D

@export var mao_esquerda : Marker2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pegar") && enabled:
		_interagir()

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
