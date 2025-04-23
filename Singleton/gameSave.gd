extends Resource
class_name GameSave

#trackeia as salas
const save_salas = "user://savegame-salas.tres"
#var salaRes : SaveSalaModel

#armazena as configuracoes
const save_settings = "user://savegame-settings.tres"
#var settingsRes : SaveSettingsModel

func _ready() -> void:
	_inicializa_arquivos_se_nao_existir()

func _inicializa_arquivos_se_nao_existir():
	if load_save_settings() == null:
		ResourceSaver.save(SaveSalaModel.new(), save_salas)
	
	if load_save_salas() == null:
		ResourceSaver.save(SaveSettingsModel.new(), save_salas)

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
