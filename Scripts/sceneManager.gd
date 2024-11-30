extends Node2D
@onready var fishesAnim = $Fishes/AnimationPlayer
@onready var pickup02Audio = %Pickup_02_randomized
@onready var backgroundMusic = %BG_Ambient_1
@onready var inventory = $CanvasLayer/Inventory
var bagOpen
var memoryPlaying
@onready var bagOpened = $CanvasLayer/Bag/Open
@onready var bagClosed = $CanvasLayer/Bag/Closed
@onready var fish1Inv = $CanvasLayer/Inventory/Fish1
@onready var fish2Inv = $CanvasLayer/Inventory/Fish2
@onready var fish3Inv = $CanvasLayer/Inventory/Fish3
@onready var fish4Inv = $CanvasLayer/Inventory/Fish4
@onready var memory01 = $CanvasLayer/memory01
@onready var memory01video = $CanvasLayer/memory01/Video
@onready var memory01videoIdle = $CanvasLayer/memory01/videoIdle
@onready var memory02 = $CanvasLayer/memory02
@onready var memory02video = $CanvasLayer/memory02/Video02
@onready var memory02videoIdle = $CanvasLayer/memory02/videoIdle02


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


func _on_bag_button_down() -> void:
	inventory.visible = !inventory.visible
	get_tree().paused = !get_tree().paused
	if SignalBus.fish >= 1:
		fish1Inv.disabled = false
	if SignalBus.fish >= 2:
		fish2Inv.disabled = false
	if SignalBus.fish >= 3:
		fish3Inv.disabled = false
	if SignalBus.fish >= 4:
		fish4Inv.disabled = false
	bagOpen = !bagOpen
	if bagOpen == true:
		bagOpened.visible = true
	else:
		bagOpened.visible = false
	if memoryPlaying == true:
		memory01.visible = false
		memory01video.stop()
		memoryPlaying = false
		memory02.visible = false
		memory02video.stop()
		memoryPlaying = false
		inventory.visible = !inventory.visible

func _on_bag_toggled(toggled_on: bool) -> void:
	pass


func _on_fish_1_button_down() -> void:
	memoryPlaying = true
	memory01.visible = true
	memory01video.play()
	inventory.visible = !inventory.visible


func _on_video_finished() -> void:
	memory01videoIdle.play()


func _on_video_02_finished() -> void:
	memory02videoIdle.play()


func _on_fish_2_button_down() -> void:
	memoryPlaying = true
	memory02.visible = true
	memory02video.play()
	inventory.visible = !inventory.visible


func _on_fish_3_button_down() -> void:
	memoryPlaying = true
	memory02.visible = true
	memory02video.play()
	inventory.visible = !inventory.visible


func _on_fish_4_button_down() -> void:
	pass # Replace with function body.
