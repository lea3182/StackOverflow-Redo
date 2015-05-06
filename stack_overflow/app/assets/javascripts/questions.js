$(document).ready(function (){
  $('#new_question_form').on('submit', function(event) {
    event.preventDefault();
    var form = $(this);

    var request = $.ajax({
      url: form.attr('action'),
      type: 'POST',
      dataType: 'json',
      data: form.serialize(),
    });

    request.done(function(response){

      var clone = $('.question-container').last().clone();
      clone.find('a').attr("href", "/questions/"+ response.question.id);
      clone.find('#question-title').text(response.question.title)
      clone.find('#q_votes').html("Votes: " +response.question.votes);
      $('#upvote_button').attr('action', "questions/" + response.question.id + "/upvote");
      $('#downvote_button').attr('action', "questions/" + response.question.id + "/downvote");
      $('.question-wrapper').append(clone);
    });
  });

  $('#new_answer_form').on('submit', function(event) {
    event.preventDefault();
    var form = $(this);


    var request = $.ajax({
      url: form.attr('action'),
      type: 'POST',
      dataType: 'json',
      data: form.serialize(),
    });

    request.done(function(response){
      console.log("yay")

      var clone = $('.answer-container').last().clone();
       clone.find('#answer-title').text("Title: " +response.title);
       clone.find('#answer-content').text("Content: " +response.content);
       clone.find('#a_votes').html("Votes: " +response.votes);
       $('#a_upvote_button').attr('action', "questions/" + response.question_id + "/answers" + response.id + "/upvote");
      $('#a_downvote_button').attr('action', "questions/" + response.question_id + "/answers" + response.id + "/downvote");
      $('#edit_button').attr('action', "questions/" + response.question_id + "/answers" + response.id + "/edit");
      $('#delete_button').attr('action', "questions/" + response.question_id + "/answers" + response.id + "/delete");
      $('.answer-wrapper').append(clone);
    });
  });
});
