extends Node

var time = 0.0
var doCount = true

func _process(delta):
	if doCount:
		time += delta

func getTime():
	return time

func resetTime():
	time = 0.0

func pauseTime():
	doCount = false

func unpausetime():
	doCount = true
