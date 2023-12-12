/// @description Get player input and update tire state

var _dt = delta_time / 1000000;
throttle = keyboard_check(vk_up);
brake = keyboard_check(vk_down);
emergencyBrake = keyboard_check(vk_space);

//Turn the wheels
var _turn = (keyboard_check(vk_left) - keyboard_check(vk_right)) * STEERING_INCREMENT;

// Drift back to zero
steering = clamp(steering + _turn, -maxSteering, maxSteering);
if (_turn == 0) {
	steering = max(abs(steering) - STEERING_INCREMENT, 0) * sign(steering);
}



frontLeftTire.transform.rotate(steering);
frontRightTire.transform.rotate(steering)


// Calculate current velocities
var _forwardVelocity = getForwardVelocity();
var _lateralVelocity = getLateralVelocity();


// Calculate weight of vehicle on axles
var _axleWeightFront = mass * (axleWeightRatioFront * GRAVITY - weightTransfer * acceleration * centerGravityHeight / wheelBase);
var _axleWeightRear = mass * (axleWeightRatioRear * GRAVITY + weightTransfer * acceleration * centerGravityHeight / wheelBase);

var _yawSpeedFront = centerGravityToFrontAxle * yawRate;
var _yawSpeedRear = -centerGravityToRearAxle * yawRate;

var _slipAngleFront = arctan2(_lateralVelocity + _yawSpeedFront, abs(_forwardVelocity)) - sign(_forwardVelocity) * degtorad(steering);
var _slipAngleRear = arctan2(_lateralVelocity + _yawSpeedRear, abs(_forwardVelocity));

var _tireGripFront = tireGrip;
var _tireGripRear = tireGrip * (1 - emergencyBrake * (1 - lockGrip));	// Rear can slip when ebrake is enabled

var _frictionForceFront = clamp(-cornerStiffnessFront * _slipAngleFront, -_tireGripFront, _tireGripFront) * _axleWeightFront;
var _frictionForceRear = clamp(-cornerStiffnessRear * _slipAngleRear, -_tireGripRear, _tireGripRear) * _axleWeightRear;

var _brakePower = min(brake * brakeForce + emergencyBrake * eBrakeForce, brakeForce);
var _accelPower = throttle * engineForce;

var _tractionForce = _accelPower - _brakePower * sign(_forwardVelocity);
var _dragForceX = -GROUND_RESISTANCE * _forwardVelocity - AIR_RESISTANCE * _forwardVelocity * abs(_forwardVelocity);
var _dragForceY = -GROUND_RESISTANCE * _lateralVelocity - AIR_RESISTANCE * _lateralVelocity * abs(_lateralVelocity);

var _totalForwardForce = _dragForceX + _tractionForce;
var _totalLateralForce = _dragForceY + dcos(steering) * _frictionForceFront + _frictionForceRear;

var _totalForwardAccel = _totalForwardForce / mass;
var _totalLateralAccel = _totalLateralForce / mass;

// Update velocity (rear wheel drive, pointing in direction of image_angle)
velocity.x += (lengthdir_x(_totalForwardAccel, image_angle) + lengthdir_x(_totalLateralAccel, image_angle + 90)) * _dt;
velocity.y += (lengthdir_y(_totalForwardAccel, image_angle) + lengthdir_y(_totalLateralAccel, image_angle + 90)) * _dt;

var _angularTorque = _frictionForceFront * centerGravityToFrontAxle - _frictionForceRear * centerGravityToRearAxle;


var _angularAccel = _angularTorque / inertia;
yawRate += _angularAccel * FRAME_RATE_TIME;


// Update sprite properties
x += convertMetersPerSecondToPixels(velocity.x);
y += convertMetersPerSecondToPixels(velocity.y);
image_angle += radtodeg(yawRate) * FRAME_RATE_TIME;


//Statistics - Useful for debugging
trackStat("Velocity (m/s)", getForwardVelocity());
trackStat("Velocity (kmh)", getForwardVelocity() * 3600 / 1000);
trackStat("Lateral Velocity (m/s)", getLateralVelocity());
trackStat("Total Force", _totalForwardForce);
trackStat("Lateral Force", _totalLateralForce);
trackStat("Slip Angle Front", _slipAngleFront);
trackStat("Slip Angle Rear", _slipAngleRear);
trackStat("Friction Front", _frictionForceFront);
trackStat("Friction Rear", _frictionForceRear);
trackStat("Yaw Rate (radians)", yawRate);
trackStat("Yaw Rate deg/s", radtodeg(yawRate));
trackStat("Angular Torque", _angularTorque);
trackStat("Steering", degtorad(steering));