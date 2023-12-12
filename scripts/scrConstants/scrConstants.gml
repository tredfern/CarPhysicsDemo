// Layers for drawing, makes it easier to rearrange and move objects around in the future
#macro LAYER_TIRES "Underbody"
#macro LAYER_GROUND "Ground"


// This should match the room physics configuration
#macro METERS_TO_PIXELS 0.0333
#macro FRAME_RATE_TIME 0.0166
#macro METERS_PER_SECOND (METERS_TO_PIXELS / FRAME_RATE_TIME)
#macro GRAVITY 9.81
#macro AIR_RESISTANCE 2.5
#macro GROUND_RESISTANCE 8
#macro INERTIA_SCALE 1

// How fast the wheels turns (degrees per frame)
#macro STEERING_INCREMENT 1.2	
#macro THROTTLE_INCREMENT 0.1
