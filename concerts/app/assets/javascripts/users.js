var $ol = $("div.notes ol")

$(function(){
 $("a.load_concerts").on("click", function(e){
    
    $.ajax({
        method: "GET",
        url: this.href,
        dataType: "json"
    }).success(function(response){

        console.log(response)
        //debugger
        load_concerts(response)
    });


    e.preventDefault();
 })
})

function load_concerts(data){
    $("div.concerts").html(data[0].title)
}

$(function(){
    $("#new_note").on("submit", function(e){
        e.preventDefault();
        url = this.action
        
        data = {
            'authenticity_token': $("input[name='authenticity_token']").val(),
            'note': {
                'content': $("#note_content").val()
            }
        };

        $.ajax({
            method: "POST",
            url: url,
            data: data,
            dataType: "json"
            success: function(response){
                debugger
                var $ol = $("div.notes ol")
                $ol.append(response)
            }
        });

    });
});

