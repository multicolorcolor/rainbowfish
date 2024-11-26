extends Control
@onready var flashback1 = $Flashback1
@onready var flashback2 = $Flashback2
@onready var flashback3 = $Flashback3
@onready var flashback4 = $Flashback4
@onready var anim = $TransitionAnimations
@onready var video1 = $Flashback1/Video
@onready var video_idle = $Flashback1/videoIdle
var flashback1IsPlaying = false
signal FlashbackTime
signal FlashbackOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 1 and flashback1IsPlaying == true:
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 2 and flashback1IsPlaying == true:
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 3 and flashback1IsPlaying == true:
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 4:
		flashback4.visible = false



func _on_fish_1_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback1.visible = true
	video1.play()
	await get_tree().create_timer(12).timeout
	video_idle.play()
	


func _on_fish_2_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback1.visible = true
	video1.play()
	await get_tree().create_timer(12).timeout
	video_idle.play()


func _on_fish_3_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback1.visible = true
	video1.play()
	await get_tree().create_timer(12).timeout
	video_idle.play()


func _on_fish_4_fishcollected() -> void:
	flashback4.visible = true
	get_tree().paused = true
