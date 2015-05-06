$(document).ready(function (){
  $('#new_question_form').on('submit', function(event) {
    event.preventDefault();
    var form = $(this);

    var request = $.ajax({
      url: form.attr('action'),
      type: 'POST',
      dataType: 'json',
      data: form.serialize(),
    })

    request.done(function(response){

      var clone = $('.question-container').last().clone();
      clone.find('a').attr("href", "/questions/"+ response.question.id);
      clone.find('#title').text(response.question.title)
      clone.find('#q_votes').html("Votes: " +response.question.votes);
      $('#upvote_button').attr('action', "questions/" + response.question.id + "/upvote");
      $('#downvote_button').attr('action', "questions/" + response.question.id + "/downvote");
      $('.question-wrapper').append(clone);
    })
  })
})
