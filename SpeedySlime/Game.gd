extends Node2D

const levels = [
	preload("res://levels/level1.tscn"),
	preload("res://levels/level2.tscn"),
	preload("res://levels/level3.tscn"),
	preload("res://levels/level4.tscn"),
	preload('res://levels/level5.tscn'),
	preload('res://levels/level6.tscn'),
	preload('res://levels/level7.tscn'),
	preload('res://levels/level8.tscn'),
	preload("res://levels/level9.tscn"),
	preload("res://levels/level10.tscn"),
	preload("res://levels/level11.tscn"),
	preload("res://levels/level12.tscn"),
	preload("res://levels/level13.tscn"),
	preload("res://levels/level14.tscn"),
	preload("res://levels/level15.tscn")
]

const win = preload("res://Win.tscn")

var currentlvl = 0
var level

func _ready():
	if MusicMuted.muted == false:
		$AudioStreamPlayer2D.play(0)
	add_lvl()

func add_lvl():
	level = levels[currentlvl].instance()
	add_child(level)
	level.connect("ded",self,'on_ded')
	level.connect("done",self,'on_done')
	level.connect("jump",self,'on_jump')
	level.connect("key",self,'on_key')
	

func on_ded():
	print('ded')
	if MusicMuted.sfx == false:
		$SFXHurt.play(0)
	level.queue_free()
	add_lvl()

func on_done():
	print('done')
	if MusicMuted.sfx == false:
		$SFXWin.play(0)
	level.queue_free()
	if currentlvl < len(levels)-1:
		currentlvl += 1
		add_lvl()
	else:
		$Stopwatch.pauseTime()
		var score = stepify($Stopwatch.getTime(),0.01)
		var w = win.instance()
		add_child(w)
		w.get_node("Panel/time").text = str(score)

func _physics_process(delta):
	if Input.is_key_pressed(KEY_R):
		if currentlvl == 0:
			$Stopwatch.resetTime()
		level.queue_free()
		add_lvl()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Main.tscn")
	$CanvasLayer/Time.text = str(stepify($Stopwatch.getTime(),0.01))

func on_jump():
	if MusicMuted.sfx == false:
		$SFXJump.play(0)

func on_key():
	if MusicMuted.sfx == false:
		$SFXKey.play(0)


