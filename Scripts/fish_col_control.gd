extends Node
signal Fishcollected()
@onready var animationFish = $AnimationPlayer
@onready var audio = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Swim")
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	#audio.play()
	emit_signal("Fishcollected")
	SignalBus.fish += 1
	queue_free()
