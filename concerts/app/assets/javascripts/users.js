

$(function(){
 $("a.load_concerts").on("click", function(e){
    e.preventDefault();
    $.ajax({
        method: "GET",
        url: this.href,
        dataType: "json",
        success:function(json){
            const $ol = $("div.concerts ol")
            $ol.html("")

            json.forEach(function(f){
                $ol.append("<li>" + f.title + "</li>");
                $ol.append("<li>" + f.cost + "</li>");
                $ol.append("<li>" + f.time + "</li>");
                $ol.append("<li>" + f.min_age + "</li>");
            });
        }
    });
    
 })
})




$(function(){
    $("#new_note").click("submit", function(e){
        e.preventDefault();
        
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: displayNote
         })
    });
});

function displayNote(data) {
    console.log(data);
    const newNote = new Note(data);
    const noteHTML = newNote.formatShowNote();
    $(".notes").html(noteHTML)
}


function Note(data) {
    this.content = data
}

Note.prototype.formatShowNote = function() {
    let noteHTML = ` <p>${this.content}</p>`
    return noteHTML;
}