$( document ).on('turbolinks:load', function() {

  $("#fake_stripe_button").on( "click", function() {
    $("#real_stripe_button .stripe-button-el").click()
  })

})
