class_name TLabel
extends Label

var translations := {} setget setTranslations, getTranslations
var _save: String

# Called when the node enters the scene tree for the first time.
func _ready():
	# print(tr(get("text")))
	_save = get("text")
	set("text", Util.format(_save, translations))

func getTranslations() -> Dictionary:
	return translations

func setTranslations(trans: Dictionary) -> void:
	translations = trans
	# make ready for ready
	set("text", _save)
	_ready()
