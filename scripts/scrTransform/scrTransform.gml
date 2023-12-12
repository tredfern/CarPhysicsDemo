function Transform(_id) constructor {
	object = _id;
	xOffset = _id.x;
	yOffset = _id.y;
	rotation = _id.image_angle;
	parent = object.parentId;
	
	function update() {
		if(!isNothing(parent)) {
			var _parentMatrix = matrix_build(parent.x, parent.y, 0, 0, 0, parent.image_angle, 1, 1, 1);
			var _out = matrix_transform_vertex(_parentMatrix, xOffset, yOffset, 0);
			object.x = _out[0];
			object.y = _out[1];
			object.image_angle = parent.image_angle + rotation;
		}
	}
	
	function rotate(_angle) {
		rotation = _angle;
	}
	
	function translate(_x, _y) {
		xOffset = _x;
		yOffset = _y;
	}
	
}