extends CharacterBody2D
@onready var flashback1 = $Flashbacks/Flashback1

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
		
	if Input.is_action_just_pressed("ui_right"):
		sprite.scale.x = abs(sprite.scale.x)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		animation.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animation()

func update_animation():
	if velocity.x != 0:
		animation.play("Run")
	else:
		animation.play('Idle')
		
	if velocity.y < 0:
		animation.play("Idle")	
	if velocity.y > 0:
		animation.play("Idle")		
	


func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://Scenes/Main menu test.tscn")
		if event.keycode ==KEY_SPACE and SignalBus.fish == 1:
			flashback1.visible = false
		if event.keycode ==KEY_SPACE and SignalBus.fish == 2:
			flashback1.visible = false
		if event.keycode ==KEY_SPACE and SignalBus.fish == 3:
			flashback1.visible = false


func _on_flashbacks_flashback_time() -> void:
	set_physics_process(false)
	animation.stop()


func _on_flashbacks_flashback_over() -> void:
	set_physics_process(true)
	animation.play()
