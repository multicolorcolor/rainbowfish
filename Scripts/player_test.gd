extends CharacterBody2D
@onready var flashback1 = $Flashbacks/Flashback1
@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://Scenes/Main menu test.tscn")
		if event.keycode ==KEY_SPACE and SignalBus.fish == 1:
			flashback1.visible = false

func _physics_process(_delta):
	get_input()
	move_and_slide()
