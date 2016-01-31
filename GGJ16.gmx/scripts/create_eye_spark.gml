///create_eye_spark(x,y)
var xx = argument0;
var yy = argument1;

repeat (10)    
    {
    instance_create(xx-16+random(2), yy-16+random(2), obj_eyespark_piece);
    }
part_particles_create(obj_particles.system, xx, yy, obj_particles.eyespark_center_part,2);
