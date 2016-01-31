///scr_generate(); generates the ritual and pool from the grimoire and displays the words in the selectable scrolls

//Initialize the Grimoire (dictionary of all possible words)
global.gr=ds_list_create();

//This first block has WORDS, if needed, comment it and uncomment the second one
ds_list_add(global.gr,"Alohomora","Barada","Cuñao","Dispersio","Eldritch","Ftaghn","Gmail","Hullabaloo","Igitur","Japeto");
ds_list_add(global.gr,"Klatu","Latha","Mortes","Nicta","Oigan","Pantagruel","Qoras","Ratatata","Shirak","Tomacco");
ds_list_add(global.gr,"Ulver","Venta","Wilfred","Xena","Yog-Soggoth","Zlad","!@&%","$$$$","9999","----");

//This second block has LETTERS, leave only one of them uncommented
//ds_list_add(gr,"A","B","C","D","E","F","G","H","I","J");
//ds_list_add(gr,"K","L","M","N","O","P","Q","R","S","T");
//ds_list_add(gr,"U","V","W","X","Y","Z","1","2","3","4");


//Initialize the "ritual" (phrase to be guessed) and "pool" (list of words elligible)
global.rit=ds_list_create();
global.pool=ds_list_create();

global.selection=ds_list_create();

global.feedback=ds_list_create();

global.lives=5;

//Start random number generator - comment "randomize()" line to force the same seed, useful for debugging
randomize();


//Take 6 random words from the Grimoire into the Ritual, without repetitions
for (var i = 0; i < 6; i += 1){ 
    var candidate = "";
    
    if(ds_list_empty(global.rit)){
        global.rit[| i]=global.gr[| irandom(29)];  
        global.pool[| i]=global.rit[| i];
        show_debug_message("0  candidate = " + global.pool[| i]);
        continue;
    }  
    else {
        do {
            candidate = global.gr[| irandom(29)];
            show_debug_message(string(i) + "  candidate = " + candidate);
        } until (ds_list_find_index(global.rit, candidate)==-1);
        
        global.rit[| i]=candidate;
        global.pool[| i]=candidate;
    }
    
    
}

//Take another 4 words for the pool, without repetitions
for (var i = 6; i < 10; i += 1){
    var candidate = "";
    
    do {
        candidate = global.gr[| irandom(29)];
        show_debug_message(string(i) + "  candidate = " + candidate);
    } until (ds_list_find_index(global.pool, candidate)==-1);
       
    global.pool[| i]=candidate;
        
}



//Shuffle both ds_lists for random Ritual order and random (and different) Pool order

show_debug_message("");
show_debug_message("Ritual BEFORE shuffling is " + formatWordLists(global.rit));
show_debug_message("  Pool BEFORE shuffling is " + formatWordLists(global.pool));
show_debug_message("");
    

// This works, but I have to fix display issues after shuffling, uncomment when solved
//ds_list_shuffle(global.rit);
//ds_list_shuffle(global.pool);
//show_debug_message("Ritual AFTER shuffling is " + formatWordLists(global.rit));
//show_debug_message("  Pool AFTER shuffling is " + formatWordLists(global.pool));
//show_debug_message("");



for (var i = 0; i < 6; i++)  
    {   
    //v_id = instance_create(random_range(100,(room_width - 100)),random_range(100,(room_height - 100)),obj_PaperBox)
    var v_id;  
    v_id = instance_create(700,90+100*i,obj_PaperBox);  
    with (v_id)
        {
        is_winner = 1;
        word = global.rit[| i];
        draw_self();
        show_debug_message("word " + string(i) + " = " + word);
        slot = i;                    
        }
    }


for (var d = 0; d < 4; d++)
    {
    //v_id = instance_create(random_range(100,(room_width - 100)),random_range(100,(room_height - 100)),obj_PaperBox)  
    var v_id;
    v_id = instance_create(1000,210+100*d,obj_PaperBox);  
    with (v_id)
        {
        is_winner = 0;
        word = global.pool[| d+6];
        show_debug_message("word " + string(d) + " = " + word);
        draw_self();
        slot = -1;                    
        }
        
    }
