$( document ).on('turbolinks:load', function() {

  var questionTestResizeIframe = function () {
    var selection = $( "#questionTestMediaWidthSelect" ).val().split(' x ')
    $( '#questionTestIframe ').css( "width", selection[0] )
    $( '#questionTestIframe ').css( "height", selection[1] )
  }

  $( "#questionTestMediaWidthSelect" ).on('change', function(e) {
    questionTestResizeIframe()
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
  })

  $( "#questionTestMediaWidthNextButton" ).on('click', function(e) {
    $("#questionTestMediaWidthSelect > option:selected")
        .prop("selected", false)
        .next()
        .prop("selected", true);
    questionTestResizeIframe()
  })

  if ( $( "#questionTestMediaWidthSelect" ).length ) { questionTestResizeIframe() }

} )
