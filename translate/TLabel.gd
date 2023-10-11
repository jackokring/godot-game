class_name TLabel
extends Label

var defaults := {}

# Called when the node enters the scene tree for the first time.
func _ready():
	set("text", Util.format(get("text"), defaults))

func getTranslations() -> Dictionary:
	return defaults

