extends TextureProgressBar
@export var max_health: float
var health
var tweenBreathe = create_tween()
var tweenBreatheRefill = create_tween()
@onready var anim = get_node("%TransitionAnimations")
@onready var oxygen = get_node("%Oxygen")

func _ready() -> void:
	health = max_health
	value = 100

func _process(delta: float):
	if value == 0:
		anim.play("DeathScreen")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://Scenes/Main menu test.tscn")
	#var tweenOxygen = create_tween()
	#tweenOxygen.tween_property(oxygen, "modulate:a", 1, 2)
	
func take_damage():
	var tweenBreathe = create_tween()
	tweenBreathe.tween_property(self, "value", 0, 2)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if tweenBreathe:
		tweenBreathe.kill() 
	tweenBreatheRefill = create_tween()
	tweenBreatheRefill.tween_property(self, "value", 100, 2)
	tweenBreatheRefill.parallel().tween_property(oxygen, "modulate:a", 0, 2)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if tweenBreathe:
		tweenBreathe.kill() 
	tweenBreathe = create_tween()
	tweenBreathe.tween_property(self, "value", 0, 50)
	tweenBreathe.parallel().tween_property(oxygen, "modulate:a", 1, 50)
