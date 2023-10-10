extends PanelContainer

func _on_pause_button_pressed():
	get_tree().paused = true
	show()

func _on_pause_popup_cancel_pressed():
	hide()
	get_tree().paused = false

func _on_pause_popup_ok_pressed():
	ok()
	_on_pause_popup_cancel_pressed()

func ok():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if is_visible_in_tree():
			_on_pause_popup_cancel_pressed()
		else:
			_on_pause_button_pressed()
	if Input.is_action_just_pressed("ui_accept"):
		if is_visible_in_tree():
			_on_pause_popup_ok_pressed()


