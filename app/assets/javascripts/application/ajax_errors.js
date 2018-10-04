document.addEventListener("ajax:error", function(e) {
  alert( e.originalEvent.detail[0] );
  if ( e.originalEvent.detail[2].status == 401 ) { location.reload(); }
});
