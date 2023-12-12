/// @description Insert description here
// You can write your code in this editor

isSkidding = false;
tireTrackParticles = part_system_create(psTireTracks);
part_system_layer(tireTrackParticles, LAYER_GROUND);
tireEmitter = 0;	//Index of the tire emitter

// Get the tire particle type
var _info = particle_get_info(tireTrackParticles);
tireType = _info.emitters[tireEmitter].parttype.ind;


smokeParticles = part_system_create(psTireSmoke);
part_system_layer(smokeParticles, LAYER_TIRES);
smokeEmitter = 0;	//Index of smoke emitter

var _info = particle_get_info(smokeParticles);
smokeType = _info.emitters[smokeEmitter].parttype.ind;


// Inherit the parent event
event_inherited();

