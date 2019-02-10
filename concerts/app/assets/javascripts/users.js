

$(document).on("turbolinks:load",function(){
 $("a.load_notes").on("click", function(e){
    e.preventDefault();
    $.ajax({
        method: "GET",
        url: this.href,
        dataType: "json",
        success:function(json){
            const $ol = $("div.all_notes ol")
            $ol.html("")

            json.forEach(function(f){
                $ol.append("<li>" + f.content + "</li>");
            });
        }
    });
    
 })
})




$(document).on("turbolinks:load",function(){
    $("#new_note").on("submit", function(e){
        e.preventDefault();
        
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            dataType: 'json'
        }).done(function (response) {
            displayNote(response)
            console.log(response)
        })
    });
});

function displayNote(data) {
    console.log(data);
    const newNote = new Note(data);
    const noteHTML = newNote.formatShowNote();
    $(".notes").html(noteHTML)
}

class Note {
    constructor(data) {
        this.content = data.content
    }
}

Note.prototype.formatShowNote = function() {
    let noteHTML = ` <p>${this.content}</p>`
    return noteHTML;
}