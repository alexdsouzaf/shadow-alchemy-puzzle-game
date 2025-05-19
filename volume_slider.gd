extends HSlider
class_name VolumeSlider

@export var audioBus : GlobalEnum.AudioBusEnum

var bus_index : int

func _ready() -> void:
	print(GlobalEnums.AudioBusEnumDescription[audioBus])
	bus_index = AudioServer.get_bus_index(GlobalEnums.AudioBusEnumDescription[audioBus]) #aqui ta o valor do enum e nao o nome


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))

func _on_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SignalManager.salvar_volume.emit(value,audioBus)

func setar_value_db_to_linear(valorAudio:float) -> void:
	value = valorAudio
