/// @description Track Car



with(followTarget) {
	var vel = speed;
	other.zoomTo = vel / 5;			
}
		
xTo = followTarget.x +  followTarget.hspeed * leadTargetDistance;
yTo = followTarget.y + (followTarget.vspeed * leadTargetDistance);



x += (xTo - x) / scrollRate;
y += (yTo - y) / scrollRate;


zoomTo = clamp(zoomTo, minZoom, maxZoom);
zoom += (zoomTo - zoom) / zoomRate;

var _w = cameraWidth * zoom;
var _h = cameraHeight * zoom;
camera_set_view_size(view_camera[0], _w, _h);
camera_set_view_pos(view_camera[0], x - (_w/2), y - (_h/2));