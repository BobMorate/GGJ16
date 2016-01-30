green = irandom_range(1, 8);
var count, dir;

count = 0;
dir = 0;

global.thought_id = 0;

repeat(8)
    {
    count += 1;
    if (count == green) with (instance_create( 320, 193, obj_thought_green))
        {
        direction = dir;
        
        thought_number = other.word_number;     // which array position [x]
        }
    
    else if (count != green) with (instance_create( 320, 193, obj_thought_red))
        {
        direction = dir;
        
        thought_number = other.word_number;     // which array position [x]
        }
    
    dir += 45;
    }


        
word_number += 1;
