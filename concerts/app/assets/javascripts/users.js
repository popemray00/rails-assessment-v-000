$(function(){
 $("a.load_concerts").on("click", function(e){
    
    $.ajax({
        method: "GET",
        url: this.href
    }).success(function(response){

        console.log(response)

        $("div.concerts").html(response)
    });


    e.preventDefault();
 })
})

$(function(){
    $("form").on("submit", function(e){
        e.preventDefault();

        var values = $(this).serialize();

        var posting = $.post('/users', values);

        posting.done(function(data){
            
        });
    });
});