extends Node
signal Fishcollected()
@onready var animationFish = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationFish.play("Swim") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	emit_signal("Fishcollected")
	SignalBus.fish += 1
	queue_free()
