extends Control

var bodyColour : int
var accessoryColour : int
var accessoryType : int
var hairType : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bodyColour = 0
	accessoryColour = 0
	accessoryType = 0
	hairType = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_left_pressed() -> void:
	if bodyColour <= 0:
		bodyColour = 9
	else:
		bodyColour -= 1
	_set_materials()


func _on_button_right_pressed() -> void:
	if bodyColour >= 9:
		bodyColour = 0
	else:
		bodyColour += 1
	_set_materials()

func _set_materials():
	$ChrBody.material.set("shader_parameter/my_colour", CharacterManager.colours[bodyColour])
	print(CharacterManager.colours[bodyColour])
	pass
