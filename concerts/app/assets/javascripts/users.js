$(function(){
 $("a.load_concerts").on("click", function(e){
    
    $.ajax({
        method: "GET",
        url: this.href
    }).done(function(response){

        console.log(response)

        $("div.concerts").html(response)
    });


    e.preventDefault();
 })
})