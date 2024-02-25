extends MyLevel

@onready var smile = $Smile
@onready var mesh_instance_3d = $MeshInstance3D

func _process(delta):
	mesh_instance_3d.rotate_y(deg_to_rad(90 * delta))
	mesh_instance_3d.rotate_z(deg_to_rad(45 * delta))
	smile.rotate_z(deg_to_rad(180 * delta))
