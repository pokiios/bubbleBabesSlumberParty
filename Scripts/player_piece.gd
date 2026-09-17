class_name PlayerPiece extends Node3D

var board_position : int = 0

@onready var LerpTo : Marker3D = $LerpTo
@onready var sprite : Sprite3D = $Sprite3D
var moveSprite : bool = false
var dt = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dt += delta * 0.4 
	if moveSprite:
		sprite.position = sprite.position.lerp(LerpTo.position,dt)
		if abs(sprite.position.x - LerpTo.position.x) <= 2 and abs(sprite.position.y - LerpTo.position.y)<= 2 and abs(sprite.position.z - LerpTo.position.z)<= 2:
			moveSprite = false
			global_position = LerpTo.global_position
			sprite.position = Vector3i(0,0,0)
			LerpTo.global_position = global_position
	pass

func move_on_board(boardPositionCoord):
	LerpTo.global_position = boardPositionCoord
	moveSprite = true
