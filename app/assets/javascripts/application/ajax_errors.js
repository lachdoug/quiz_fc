document.addEventListener("ajax:error", function(e) {
  alert( e.detail[0] );
  if ( e.detail[2].status == 401 ) { location.reload(); }
});
