extends Node


var frame_num = 0;
# Called when the node enters the scene tree for the first time.

var rotation_step = 15
var amount_of_frames : int
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	print("Amount of pictures: "+ str(4*(360/rotation_step)*(360/rotation_step)*(360/rotation_step)) )
	amount_of_frames = 4*(360/rotation_step)*(360/rotation_step)*(360/rotation_step)
func _process(delta: float) -> void:
	if(frame_num >  4*(360/rotation_step)*(360/rotation_step)*(360/rotation_step) ):
		get_tree().quit()
	

	var b = $SubViewportContainer/SubViewport.get_texture()

	
	for p in [Vector3(0,0,-1),Vector3(0,0,1),Vector3(0,1,0),Vector3(0,1,0)]:
		$SubViewportContainer/SubViewport/Node3D/OmniLight3D.global_position = p
		for i in range(360/rotation_step):
			$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.y +=deg_to_rad(rotation_step);
			for j in range(360/rotation_step):
				$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.z +=deg_to_rad(rotation_step);
				for k in range(360/rotation_step):
					$SubViewportContainer/SubViewport/Node3D/Node3D.rotation.x +=deg_to_rad(rotation_step);
					print(str(frame_num) +"/"+ str(amount_of_frames))
					await RenderingServer.frame_post_draw
					var c = b.get_image()
					c.save_png("res://pictures/"+str(frame_num)+".png")
					frame_num+=1;
					

	
	
