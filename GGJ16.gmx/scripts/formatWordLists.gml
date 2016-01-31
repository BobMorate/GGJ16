//formatWordLists(list);

var list = argument[0];

var returnText = "";

for (var i = 0; i<ds_list_size(list); i++){
    returnText+=" "+ string(list[| i]) ;
}

return returnText;



