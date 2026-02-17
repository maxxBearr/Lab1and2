extends Node2D
@onready var label: Label = %Label
@onready var scene_to_nest_blue: = %SceneToNestBlue
@onready var canvas_modulate: CanvasModulate = %CanvasModulate
@onready var timer: Timer = %Timer
var discoing : bool
@onready var daddy: Sprite2D = %Daddy
func _ready() -> void:
	canvas_modulate.visible = false
func _process(delta: float) -> void:
	if scene_to_nest_blue.isBlue == true:
		label.text = "Now my child is blue now yayayayayay"
		daddy.daddyHappy = true
		if timer.is_stopped():
			timer.start(0.1)
		timer.timeout.connect(func():
			canvas_modulate.visible = true
			canvas_modulate.color.h += 0.3
			timer.start(0.5))
	elif scene_to_nest_blue.isBlue == false:
		timer.stop()
		canvas_modulate.visible = false
		daddy.daddyHappy = false
		label.text = "I am the Parent node. My child is not blue :(
			if only some one could press SPACE to make things right"
