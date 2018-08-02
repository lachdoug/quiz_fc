$( document ).on('turbolinks:load', function() {

  document.getElementById('quiz_question_ask_markdown').innerHTML =
    marked( document.getElementById('quiz_question_ask_markdown').innerHTML );

} );
