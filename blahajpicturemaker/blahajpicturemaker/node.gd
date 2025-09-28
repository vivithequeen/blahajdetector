extends Node


var frame_num = 0;
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(frame_num >  5832 ):
		get_tree().quit()
	

	var b = $SubViewportContainer/SubViewport.get_texture()
	await RenderingServer.frame_post_draw
	var c = b.get_image()
	c.save_png("res://pictures/"+str(frame_num)+".png")
	for i in range(18):
		$SubViewportContainer/SubViewport/Node3D/Low_poly_blahaj1.rotation.y +=deg_to_rad(20);
		for j in range(18):
			$SubViewportContainer/SubViewport/Node3D/Low_poly_blahaj1.rotation.z +=deg_to_rad(20);
			for k in range(18):
				$SubViewportContainer/SubViewport/Node3D/Low_poly_blahaj1.rotation.x +=deg_to_rad(20);

	
	frame_num+=1;
