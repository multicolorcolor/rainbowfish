extends ProgressBar
@export var max_health: float
var health

func _ready() -> void:
	health = max_health
	value = 100

func _process(delta: float):
	if Input.is_action_just_pressed("ui_up"):
		print("taking damage")
		take_damage()
	
func take_damage():
	var tweenBreathe = create_tween()
	tweenBreathe.tween_property(self, "value", 0, 2)


func _on_area_2d_body_exited(body: Node2D) -> void:
	var tweenBreathe = create_tween()
	tweenBreathe.tween_property(self, "value", 0, 2)


func _on_area_2d_body_entered(body: Node2D) -> void:
	var tweenBreatheRefill = create_tween()
	tweenBreatheRefill.tween_property(self, "value", 100, 2)
