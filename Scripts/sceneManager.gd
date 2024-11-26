extends Node2D
@onready var fishesAnim = $Fishes/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fishesAnim.play("fishes_swimming_without_care_in_the_world")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
