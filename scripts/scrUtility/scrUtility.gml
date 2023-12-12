function isNothing(_val) {
	return _val == noone || _val == undefined;	
}

function isInstance(_val) {
	return !isNothing(_val) && instance_exists(_val);
}

function getNormalVectorX(_angle) {
	return lengthdir_x(1, _angle);
}

function getNormalVectorY(_angle) {
	return lengthdir_y(1, _angle);
}

function getLateralVelocity() {
	var _nx = getNormalVectorX(image_angle + 90);
	var _ny = getNormalVectorY(image_angle + 90);
	
	return dot_product(_nx, _ny, velocity.x, velocity.y);
}

function getForwardVelocity() {
	var _nx = getNormalVectorX(image_angle);
	var _ny = getNormalVectorY(image_angle);
	
	return dot_product(_nx, _ny, velocity.x, velocity.y);
}

function convertMetersPerSecondToPixels(_velocity) {
	return _velocity / METERS_TO_PIXELS * FRAME_RATE_TIME;
}

function trackStat(_statName, _statValue) {
	array_push(objStatsDisplay.stats, [_statName, _statValue]);
}