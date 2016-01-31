///create_firework_spark_red(x,y)
var xx = argument0;
var yy = argument1;

repeat (60)    
    {
    instance_create(xx-16+random(2), yy-16+random(2), obj_yellow_fireworks_piece);
    }
part_particles_create(obj_particles.system, xx, yy, obj_particles.yellow_fireworks_center_part,2);
