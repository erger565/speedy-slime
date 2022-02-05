extends KinematicBody2D

var speed = 200
var grav = 300
var jumpforce = 0

var keys = 0

var vel = Vector2()

var shrinkdb = false

var jp = preload("res://assets/JumpPart.tscn")

signal ded
signal done

signal jump
signal key

func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("left"):
		vel.x -= speed
	
	if Input.is_action_pressed("right"):
		vel.x += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			jumpforce += 10
			shrink()
		else:
			if jumpforce != 0:
				jumpforce = clamp(jumpforce, 0,450)
				jump(jumpforce)
				jumpforce = 0
	else:
		vel.y += grav*delta
	
	for i in $Player.get_overlapping_areas():
		if 'Spike' in i.name or 'Sword' in i.name:
			emit_signal('ded')
		if 'door' in i.name:
			emit_signal("done")
			
		if 'Key' in i.name:
			keys += 1
			i.queue_free()
			emit_signal("key")
		if 'lockedblock' in i.name:
			if keys > 0:
				keys -= 1
				i.get_parent().queue_free()
				emit_signal("key")
	
func shrink():
	if shrinkdb == false:
		shrinkdb = true
		if scale.x > 0.1:
			scale -= Vector2(0.1,0.1)
		yield(get_tree().create_timer(0.2),'timeout')
		shrinkdb = false

func jump(force):
	emit_signal("jump")
	vel.y -= force
	scale = Vector2(1,1)
	
	var pa = jp.instance()
	pa.global_position = global_position
	get_parent().add_child(pa)
	pa.emitting = true
	
