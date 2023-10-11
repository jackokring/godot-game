extends PanelContainer

signal ok
onready var exit_timer := $Timer

func _ready():
	# default to shown
	_on_pause_button_pressed()

func _on_pause_button_pressed():
	get_tree().paused = true
	show()

func _on_pause_popup_cancel_pressed():
	hide()
	get_tree().paused = false

func _on_pause_popup_ok_pressed():
	# send data related to doing action
	emit_signal("ok", null)
	_on_pause_popup_cancel_pressed()

func _on_long_pause():
	if Input.is_action_pressed("ui_cancel"):
		# held
		get_tree().root.propagate_notification(NOTIFICATION_WM_QUIT_REQUEST)
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		exit_timer.start(exit_timer.wait_time)
		if is_visible_in_tree():
			_on_pause_popup_cancel_pressed()
		else:
			_on_pause_button_pressed()
	if Input.is_action_just_released("ui_cancel"):
		exit_timer.stop()
	if Input.is_action_just_pressed("ui_accept"):
		if is_visible_in_tree():
			_on_pause_popup_ok_pressed()
