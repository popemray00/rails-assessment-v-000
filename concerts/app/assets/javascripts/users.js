

$(function(){
 $("a.load_concerts").on("click", function(e){
    
    $.ajax({
        method: "GET",
        url: this.href,
        dataType: "json"
    }).success(function(response){
        load_concerts(response)
    });


    e.preventDefault();
 })
})

function load_concerts(data){
    const myArray = data;
    const arrayLength = myArray.length;
    for (var i = 0; i < arrayLength; i++){
         console.log(myArray[i])
         $("div.concerts").html(myArray[i])
         debugger
    }
    $("div.concerts").html(myArray[i])
}



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