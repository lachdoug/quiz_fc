$( document ).on('turbolinks:load', function() {

  let questionTestResizeIframe = function () {
    let selection = $( "#questionTestMediaWidthSelect" ).val().split(' x ')
    $( '#questionTestIframe ').css( "width", selection[0] )
    $( '#questionTestIframe ').css( "height", selection[1] )
  }

  $( "#questionTestMediaWidthSelect" ).on('change', function(e) {
    questionTestResizeIframe()
  })

  if ( $( "#questionTestMediaWidthSelect" ).length ) { questionTestResizeIframe() }

} )
