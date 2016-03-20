functionsign_out(){
    $("#loading").show();
    $.get("log_in",{logout:"True"}   ,
            function(){
                window.location="";
            }     );
}          
