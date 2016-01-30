///scr_generate();


var i;
var v_id;

    for (i = 0; i < 6; i++)  
        {   
        v_id = instance_create(random_range(100,(room_width - 100)),random_range(100,(room_height - 100)),obj_PaperBox)  
        with (v_id)
            {
            is_winner = 1;
            word_value = irandom(9);
            slot = i;                    
            }
        }

var d;
    for (d = 0; d < 4; d++)
        {
        v_id = instance_create(random_range(100,(room_width - 100)),random_range(100,(room_height - 100)),obj_PaperBox)  
        with (v_id)
            {
            is_winner = 0;
            word_value = irandom(9);
            slot = 0;                    
            }
            
        }
