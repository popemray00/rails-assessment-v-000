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
    $("#new_note").on("submit", function(e){
        url = this.action

        data = {
            'authenticity_token': $("input[name='authenticity_token']").val(),
            'content': {
                'content': $("#note_content").val()
            }
        };


        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function(response){
                var $ol = $("div.notes ol")
                $ol.append(response);
            }
        });
        
        e.preventDefault();
    });
});