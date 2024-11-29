extends Node2D
@onready var fishesAnim = $Fishes/AnimationPlayer
@onready var pickup02Audio = %Pickup_02_randomized
@onready var backgroundMusic = %BG_Ambient_1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	backgroundMusic.play()
	fishesAnim.play("fishes_swimming_without_care_in_the_world")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pickup_01_randomized_finished() -> void:
	pass
	#pickup02Audio.play()
