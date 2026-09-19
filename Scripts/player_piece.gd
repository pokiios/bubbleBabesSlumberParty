class_name PlayerPiece extends Node3D

var board_position : int = 0

var lerpTo : Vector3
var lerpFrom : Vector3
@onready var sprite : Sprite3D = $Sprite3D
var moveSprite : bool = false
var t = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print('lerpto: ' + str(lerpTo) +  ', lerpfrom: ' + str(lerpFrom) + ', sprite: ' + str(sprite.global_position) + ', t: ' + str(t))
	if moveSprite:
		t += delta * 0.8 
		sprite.global_position = lerpFrom.lerp(lerpTo,t)
		if t >= 1:
			moveSprite = false
			sprite.position = Vector3i(0,0,0)
			t = 0
	pass

func move_on_board(boardPositionCoord):
	lerpTo = boardPositionCoord
	lerpFrom = sprite.global_position
	global_position = boardPositionCoord
	sprite.global_position = lerpFrom
	moveSprite = true
