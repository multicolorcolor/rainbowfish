extends Control
@onready var flashback1 = $Flashback1
@onready var flashback2 = $Flashback2
@onready var flashback3 = $Flashback3
@onready var flashback4 = $Flashback4
@onready var anim = $TransitionAnimations
@onready var video1 = $Flashback1/Video
@onready var video1_idle = $Flashback1/videoIdle
@onready var video02 = $Flashback2/Video02
@onready var video02Idle = $Flashback2/videoIdle
@onready var pickupAudio = %Pickup_01_randomized
@onready var memoryAppear = %Memory_appear
@onready var MenCheering = %Men_Cheering
var flashback1IsPlaying = false
signal FlashbackTime
signal FlashbackOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 1 and flashback1IsPlaying == true:
		MenCheering.stop()
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		video1.stop()
		video1_idle.stop()
		flashback1.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 2 and flashback1IsPlaying == true:
		MenCheering.stop()
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		video02.stop()
		video02Idle.stop()
		flashback2.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 3 and flashback1IsPlaying == true:
		MenCheering.stop()
		anim.play("video1Out")
		anim.play("fadeOut")
		flashback1IsPlaying = false
		video02.stop()
		video02Idle.stop()
		flashback2.visible = false
		emit_signal("FlashbackOver")
	if Input.is_action_pressed("ui_accept") and SignalBus.fish == 4:
		flashback4.visible = false



func _on_fish_1_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	pickupAudio.play()
	memoryAppear.play()
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback1.visible = true
	MenCheering.play()
	video1.play()
	


func _on_fish_2_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	pickupAudio.play()
	memoryAppear.play()
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback2.visible = true
	MenCheering.play()
	video02.play()


func _on_fish_3_fishcollected() -> void:
	flashback1IsPlaying = true
	emit_signal("FlashbackTime")
	pickupAudio.play()
	memoryAppear.play()
	anim.play("fadeToWhite")
	await get_tree().create_timer(1).timeout
	flashback2.visible = true
	MenCheering.play()
	video02.play()


func _on_fish_4_fishcollected() -> void:
	flashback4.visible = true
	pickupAudio.play()
	memoryAppear.play()
	%Inventory.visible = true
	%Fish1.disabled = false
	%Fish2.disabled = false
	%Fish3.disabled = false
	%Fish4.disabled = false
	get_tree().paused = true


func _on_video_finished() -> void:
	video1_idle.play()


func _on_video_02_finished() -> void:
	video02Idle.play()
