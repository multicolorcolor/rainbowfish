extends CharacterBody2D
var speed = 10
var accel = 7
@onready var navAgent: NavigationAgent2D = $NavigationAgent2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta):
	var direction = Vector3()
	
	navAgent.target_position = get_global_mouse_position()
	
	direction = navAgent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
	
	
	
