extends StaticBody2D

var db = false
var blink = false

func _physics_process(delta):
	blink()

func blink():
	if db == false:
		db = true
		if blink == false:
			blink = true
			visible = false
			$CollisionShape2D.disabled = true
		else:
			blink = false
			visible = true
			$CollisionShape2D.disabled = false
		yield(get_tree().create_timer(1),"timeout")
		db = false
