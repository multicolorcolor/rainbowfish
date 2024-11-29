extends Node2D
@onready var Ambient1 = $BG_Ambient_1
@onready var Ambient2 = $BG_Ambient_2
@onready var Ambient3 = $Forest_Ambient_3
@onready var Ambient4 = $Forest_Ambient_4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ambient1.play()
	Ambient2.play()
	Ambient3.play()
	Ambient4.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var tweensA2stop = create_tween()
	tweensA2stop.tween_property(Ambient2, "volume_db", -80.0, 3.0)
	var tweensFA4stop = create_tween()
	tweensFA4stop.tween_property(Ambient4, "volume_db", -80.0, 3.0)
	var tweensA1start = create_tween()
	tweensA1start.tween_property(Ambient1, "volume_db", 5.0, 3.0)
	var tweensFA3start = create_tween()
	tweensFA3start.tween_property(Ambient3, "volume_db", 0.0, 3.0)


func _on_area_2d_body_exited(body: Node2D) -> void:
	var tweensA2start = create_tween()
	tweensA2start.tween_property(Ambient2, "volume_db", 10.0, 3.0)
	var tweensFA4start = create_tween()
	tweensFA4start.tween_property(Ambient4, "volume_db", 10.0, 3.0)
	var tweensA1stop = create_tween()
	tweensA1stop.tween_property(Ambient1, "volume_db", -80.0, 3.0)
	var tweensFA3stop = create_tween()
	tweensFA3stop.tween_property(Ambient3, "volume_db", -80.0, 3.0)
