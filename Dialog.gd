class_name Dialog
extends PanelContainer

signal ok
onready var exit_timer := $Timer
onready var intro := $Explode

## My weird controller flag.
var weird := 0

## Used as arguments for some functions.
enum Buttons {
	CANCEL, # menu A
	OK, # B
	SELECT, # X
	ESCAPE, # Y
	HOME, # L1
	END, # R1
	PGUP,
	PGDN,
}

# ABXY
const _pattern = [
	# normal over functional controllers
	["ui_cancel", "ui_accept", "ui_select", "ui_escape", "ui_home", "ui_end",
	 "ui_page_up", "ui_page_down"],
	# just the basic buttons with even select/start remapped too
	# this does alter the shortcut keys too
	["ui_cancel", "ui_select", "ui_escape", "ui_accept", "ui_home", "ui_end"],
]

# An easter egg?
func _on_pressed_left(weird_new: int):
	if weird != weird_new:
		# exit as not left button
		# and set mapping
		weird = weird_new
	else:
		# left button action in menu goes here
		pass

## Checks with [enum Dialog.Buttons].
func just_pressed(button: int) -> bool:
	if button >= _pattern[weird].size():
		return false
	return Input.is_action_just_pressed(_pattern[weird][button])

## Checks with [enum Dialog.Buttons].
func pressed(button: int) -> bool:
	if button >= _pattern[weird].size():
		return false
	return Input.is_action_pressed(_pattern[weird][button])

## Checks with [enum Dialog.Buttons].
func just_released(button: int) -> bool:
	if button >= _pattern[weird].size():
		return false
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
	if just_pressed(Buttons.OK):
		if is_visible_in_tree():
			_on_pause_popup_ok_pressed()
	if just_pressed(Buttons.SELECT):
		_on_pressed_left(1)
	if just_pressed(Buttons.ESCAPE):
		_on_pressed_left(0)
