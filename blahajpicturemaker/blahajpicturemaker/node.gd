extends Node


var frame_num = 0;
# Called when the node enters the scene tree for the first time.

var rotation_step = 15
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	print("Amount of pictures: "+ str((360/rotation_step)*(360/rotation_step)*(360/rotation_step)) )
func _process(delta: float) -> void:
	if(frame_num >  (360/rotation_step)*(360/rotation_step)*(360/rotation_step) ):
		get_tree().quit()
	

	var b = $SubViewportContainer/SubViewport.get_texture()
	await RenderingServer.frame_post_draw
	var c = b.get_image()
	c.save_png("res://pictures/"+str(frame_num)+".png")
	for i in range(360/rotation_step):
		$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.y +=deg_to_rad(rotation_step);
		for j in range(360/rotation_step):
			$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.z +=deg_to_rad(rotation_step);
			for k in range(360/rotation_step):
				#print(frame_num)
				$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.x +=deg_to_rad(rotation_step);

	
	frame_num+=1;
