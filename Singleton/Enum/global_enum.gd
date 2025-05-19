extends Node
class_name GlobalEnums

#region [definicao de enumerados]
enum AudioBusEnumType {
	Master,
	Music,
	sfx,
	UI
}
#endregion

#region [constantes para usar]
const AudioBusEnum = AudioBusEnumType
#endregion

#region [dicionaria do descricoes]

const AudioBusEnumDescription = {
	AudioBusEnumType.Master: "Master",
	AudioBusEnumType.Music: "Music",
	AudioBusEnumType.sfx: "sfx",
	AudioBusEnumType.UI: "UI"
}

#endregion
