extends Node

var oneCompleted = []
var twoCompleted = []
var threeCompleted = []
var check = []
var point

static func sum(array):
	var sum = 0.0
	for element in array:
		sum+= element
	return sum

func _process(delta):
	
	var one = sum(oneCompleted)
	var two = sum(twoCompleted)
	var three = sum(twoCompleted)
	
	if oneCompleted.size() == 1:
		check.append(one)
		oneCompleted.append(0)
		
	if twoCompleted.size() == 1:
		check.append(two)
		twoCompleted.append(0)
		
	if threeCompleted.size() == 1:
		check.append(three)
		threeCompleted.append(0)
		
	point = sum(check)
