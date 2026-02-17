extends Sprite2D
@export var daddyHappy : bool 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if daddyHappy == false:
		rotation = -180
	if daddyHappy == true:
		rotation += 12 * delta
