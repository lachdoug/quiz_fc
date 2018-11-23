$( document ).on('turbolinks:load', function() {
  document.querySelectorAll( "[data-alert]").forEach( function(el) {
    el.addEventListener( 'click', function() { alert( el.dataset.alert ) } )
  } )
} )
