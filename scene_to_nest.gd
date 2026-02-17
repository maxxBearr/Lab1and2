extends Node2D
var isBlue : bool = false
@onready var countdown_label: RichTextLabel = %CountdownLabel
@onready var button: Button = %Button
var isNotBlueText : String = "I want to be blue :("
var isBlueText : String = "I am finally blueeeeeueueue"
var tween : Tween
var currentText : String = ""
var newText := ""
@onready var color_rect: ColorRect = %ColorRect
var showingColorName : bool
func _ready() -> void:
	color_rect.visible = false
	countdown_label.visible_ratio = 0.0
	currentText = isNotBlueText
	tweenText(currentText)

func _process(delta: float) -> void:
	if showingColorName == false:
		if button.is_hovered():
			isBlue = true
			newText = isBlueText
		else:
			isBlue = false
			newText = isNotBlueText
		if newText != currentText:
			currentText = newText
			tweenText(newText)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("SwitchColor"):
		color_rect.visible = true
		color_rect.color.h += 0.2
		get_color_name_simple(color_rect.color)
		showingColorName = true
		
		if get_color_name_simple(color_rect.color) == "Blue":
			newText = "I am now Blue. . . .Wait, I am now blueeeeee"
			isBlue = true
		else:
			newText = "I am now " + get_color_name_simple(color_rect.color)
			isBlue = false
		tweenText(newText)
	if event.is_action_released("SwitchColor"):
		if isBlue == false:
			showingColorName = false
func tweenText(printMe: String):
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween()
	countdown_label.visible_ratio = 0.0
	countdown_label.text = printMe
	tween.tween_property(countdown_label, "visible_ratio", 1.0, 1.0)


func get_color_name_simple(color: Color) -> String:
	var hue = color.h
	if hue < 0.08 or hue > 0.92:
		return "Red"
	elif hue < 0.17:
		return "Orange"
	elif hue < 0.25:
		return "Yellow"
	elif hue < 0.5:
		return "Green"
	elif hue < 0.58:
		return "Cyan"
	elif hue < 0.75:
		return "Blue"
	elif hue < 0.83:
		return "Purple"
	else:
		return "Magenta"
