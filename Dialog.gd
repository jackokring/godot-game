class_name Dialog
extends PanelContainer

signal ok
onready var exit_timer := $Timer
onready var intro := $Explode
var weird := 0
enum Buttons {
	CANCEL,
	ESCAPE,
	ACCEPT,
	SELECT,
}

# ABXY
const _pattern = [
	["ui_cancel", "ui_accept", "ui_select", "ui_escape"], # norm
	["ui_cancel", "ui_escape", "ui_accept", "ui_select"], # weird
]

func _on_pressed_left(weird_test: int):
	if weird != weird_test:
		# exit as not left button
		return
	# left button action goes here

func just_pressed(button: int) -> bool:
	return Input.is_action_just_pressed(_pattern[weird][button])

func pressed(button: int) -> bool:
	return Input.is_action_pressed(_pattern[weird][button])

func just_released(button: int) -> bool:
	return Input.is_action_just_released(_pattern[weird][button])

func _ready():
	# default to shown
	_on_pause_button_pressed()

func _on_pause_button_pressed():
	get_tree().paused = true
	show()
	intro.play()

func _on_pause_popup_cancel_pressed():
	hide()
	get_tree().paused = false

func _on_pause_popup_ok_pressed():
	# send data related to doing action
	emit_signal("ok", null)
	_on_pause_popup_cancel_pressed()

func _on_long_pause():
	if pressed(Buttons.CANCEL):
		# held
		get_tree().root.propagate_notification(NOTIFICATION_WM_QUIT_REQUEST)
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if just_pressed(Buttons.CANCEL):
		exit_timer.start(exit_timer.wait_time)
		if is_visible_in_tree():
			_on_pause_popup_cancel_pressed()
		else:
			_on_pause_button_pressed()
	if just_released(Buttons.CANCEL):
		exit_timer.stop()
	if just_pressed(Buttons.ACCEPT):
		if is_visible_in_tree():
			_on_pause_popup_ok_pressed()
	if just_pressed(Buttons.SELECT):
		_on_pressed_left(weird)
		weird = 1
	if just_pressed(Buttons.ESCAPE):
		_on_pressed_left(weird)
		weird = 0
