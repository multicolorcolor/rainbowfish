extends Control
@onready var flashback1 = $Flashback1
@onready var flashback2 = $Flashback2
@onready var flashback3 = $Flashback3
@onready var flashback4 = $Flashback4
signal FlashbackTime
signal FlashbackOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 1:
		flashback1.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 2:
		flashback2.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 3:
		flashback3.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 4:
		flashback4.visible = false



func _on_fish_1_fishcollected() -> void:
	flashback1.visible = true
	emit_signal("FlashbackTime")


func _on_fish_2_fishcollected() -> void:
	flashback2.visible = true
	emit_signal("FlashbackTime")


func _on_fish_3_fishcollected() -> void:
	flashback3.visible = true
	emit_signal("FlashbackTime")


func _on_fish_4_fishcollected() -> void:
	flashback4.visible = true
	get_tree().paused = true
