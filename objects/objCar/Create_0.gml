/// @description Set up tires and car properties

event_inherited();

//Make car slightly transparent to see the wheels
image_alpha = 0.6;

//State values for simulation
steering = 0;
throttle = 0;
acceleration = 0;
brake = 0;
emergencyBrake = 0;
lateralAcceleration = 0;
yawRate = 0;
velocity = { x: 0, y: 0};		//Velocity values in meters per second

//Vehicle size - assumes sprite is facing to the right
length = sprite_width;
width = sprite_height;

// Wheel base
axleWidth = 28;
frontAxle = 45;
rearAxle = 45;
maxSteering = 25;


// Create and connect tires
frontLeftTire = instance_create_layer(frontAxle, -axleWidth, LAYER_TIRES, objTire, { parentId: id });
frontRightTire = instance_create_layer(frontAxle, axleWidth, LAYER_TIRES, objTire, { parentId: id });

rearLeftTire = instance_create_layer(-rearAxle, -axleWidth, LAYER_TIRES, objTire, { parentId: id });
rearRightTire = instance_create_layer(-rearAxle, axleWidth, LAYER_TIRES, objTire, { parentId: id });


// Car properties
mass = 1200; // kg
inertia = mass * INERTIA_SCALE;
centerGravityToFront = length * .5 * METERS_TO_PIXELS;
centerGravityToRear = length * .5 * METERS_TO_PIXELS;
centerGravityToFrontAxle = frontAxle * METERS_TO_PIXELS;
centerGravityToRearAxle = rearAxle * METERS_TO_PIXELS;
centerGravityHeight = 0.55;
wheelRadius = 0.3;
tireGrip = 2;
lockGrip = 0.7;
engineForce = 8000;
brakeForce = 12000;
eBrakeForce = 5000;
weightTransfer = 0.2;
cornerStiffnessFront = 5.0;
cornerStiffnessRear = 5.2;
wheelBase = centerGravityToFrontAxle + centerGravityToRearAxle;
axleWeightRatioFront = centerGravityToRearAxle / wheelBase;
axleWeightRatioRear = centerGravityToFrontAxle / wheelBase;

show_debug_message("Car Configured");