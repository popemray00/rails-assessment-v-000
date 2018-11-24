$(function(){
 $("a.load_concerts").on("click", function(e){
    
    $.ajax({
        method: "GET",
        url: this.href
    }).done(function(data){
        
        console.log(data)
    });


    e.preventDefault();
 })
})