extends Node
class_name GameSave

#trackeia as salas
const save_salas = "user://savegame-salas.tres"

#armazena as configuracoes
const save_settings = "user://savegame-settings.tres"

func _ready() -> void:
	pass

# TODO: testar usar como static quando esse sistema estiver funcionando na pratica, so pra ver uma coisa
func write_save_salas(pModeloParaSalvar:SaveSalaModel):
	ResourceSaver.save(pModeloParaSalvar, save_salas)

func write_save_settings(pModeloParaSalvar:SaveSettingsModel):
	ResourceSaver.save(pModeloParaSalvar, save_settings)


static func load_save_salas() -> SaveSalaModel:
	if ResourceLoader.exists(save_salas):
		return load(save_salas)
	return null

static func load_save_settings() -> SaveSettingsModel:
	if ResourceLoader.exists(save_settings):
		return load(save_settings)
	return null
