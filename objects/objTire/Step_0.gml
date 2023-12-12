/// @description Insert description here
// You can write your code in this editor


part_emitter_region(tireTrackParticles, tireEmitter, x - 2, x + 2, y - 2, y + 2, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_region(smokeParticles, smokeEmitter, x - 2, x + 2, y - 2, y + 2, ps_shape_rectangle, ps_distr_gaussian);


if(isSkidding) {
	part_emitter_burst(tireTrackParticles, tireEmitter, tireType, 8);
	part_type_orientation(tireType, image_angle, image_angle, 0, 0, 0);
	
	part_type_direction(smokeType, parentId.image_angle - 180, parentId.image_angle - 180, 0, 0);
	part_emitter_burst(smokeParticles, smokeEmitter, smokeType, 8);
}









