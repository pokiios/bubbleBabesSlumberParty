class_name PlayerPiece extends Node3D

var board_position : int = 0

var lerpTo : Vector3
var lerpFrom : Vector3
@onready var sprite : Sprite3D = $Sprite3D
var moveSprite : bool = false
var moveSteps : bool = false
var steps_to_move : Array[Vector3]
var which_step : int = 0
var t = 0.0
var going_forward : bool = true
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
	
	if moveSteps:
		t += delta * 0.8 
		sprite.global_position = lerpFrom.lerp(lerpTo,t)
		
		if t >= 1:
			which_step += 1

			if which_step == steps_to_move.size():
				moveSteps = false
				sprite.position = Vector3i(0,0,0)
				t = 0
			else:
				init_next_step()
				t = 0

	pass

func init_move_on_board(boardPositionCoord):
	lerpTo = boardPositionCoord
	lerpFrom = sprite.global_position
	global_position = boardPositionCoord
	sprite.global_position = lerpFrom
	moveSprite = true

func init_move_steps(direction : bool, steps : Array[Vector3], boardSize : int):

	steps_to_move = steps
	going_forward = direction
	which_step = 0
	moveSteps = true
	init_next_step()
	pass

func init_next_step():
	lerpTo = steps_to_move[which_step]
	lerpFrom = sprite.global_position
	global_position = steps_to_move[which_step]
	sprite.global_position = lerpFrom
