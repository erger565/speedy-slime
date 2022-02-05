extends Area2D

var db = false
var state = 'up'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	anim()

func anim():
	if db == false:
		db = true
		if state == 'up':
			global_position.y += 10
			state = 'down'
		else:
			global_position.y -= 10
			state = 'up'
		yield(get_tree().create_timer(0.7),'timeout')
		db = false
