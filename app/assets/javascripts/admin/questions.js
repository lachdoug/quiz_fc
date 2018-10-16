$( document ).on('turbolinks:load', function() {

  var questionTestResizeIframe = function () {
    var size = $( "#questionTestMediaWidthSelect" ).val().split(' x ')
    $( '#questionTestIframe ').css( "width", size[0] )
    $( '#questionTestIframe ').css( "height", size[1] )
  }

  var questionTestMediaWidthSubmit = function () {
    $( '#questionTestMediaWidthForm' ).submit()
  }

  $( "#questionTestMediaWidthSelect" ).on('change', function(e) {
    questionTestResizeIframe()
    questionTestMediaWidthSubmit()
  })

  $( "#questionTestMediaWidthPreviousButton" ).on('click', function(e) {
    if ( $("#questionTestMediaWidthSelect > option:selected")[0] === $("#questionTestMediaWidthSelect > option:first")[0] ) {
      // debugger
      $("#questionTestMediaWidthSelect > option:selected").prop("selected", false)
      $("#questionTestMediaWidthSelect > option").last().prop("selected", true);
    } else {
      $("#questionTestMediaWidthSelect > option:selected")
          .prop("selected", false)
          .prev()
          .prop("selected", true);
    }
    questionTestResizeIframe()
    questionTestMediaWidthSubmit()
  })

  $( "#questionTestMediaWidthNextButton" ).on('click', function(e) {
    $("#questionTestMediaWidthSelect > option:selected")
        .prop("selected", false)
        .next()
        .prop("selected", true);
    questionTestResizeIframe()
    questionTestMediaWidthSubmit()
  })

  questionTestResizeIframe()

} )
