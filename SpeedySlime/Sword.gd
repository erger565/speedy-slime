extends Area2D

export var minX = 0
export var maxX = 100
export var speed = 1

var direction = 'right'

var rotdb = false

func animrotate():
	if rotdb == false:
		rotdb = true
		global_rotation_degrees += 12
		yield(get_tree().create_timer(0.01),'timeout')
		rotdb = false

func _ready():
	animmove()

func _physics_process(delta):
	animrotate()

func animmove():

	if direction == 'right':
		$Tween.interpolate_property(self,'global_position',Vector2(minX,global_position.y), Vector2(maxX,global_position.y), speed,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	else:
		$Tween.interpolate_property(self,'global_position',Vector2(maxX,global_position.y), Vector2(minX,global_position.y),speed,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
func _on_Tween_tween_completed(object, key):
	if direction == 'right':
		direction = 'left'
	else:
		direction = 'right'
	animmove()
