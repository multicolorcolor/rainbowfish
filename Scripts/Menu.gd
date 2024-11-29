extends Node
@onready var pickup = $"%Pickup_02_randomized"
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_button_down() -> void:
	#pickup.play()
	#anim.play("fade")
	#await get_tree().create_timer(1).timeout
	SignalBus.fish = 0
	get_tree().change_scene_to_file("res://Scenes/TestScene.tscn")
	
	
