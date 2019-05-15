/* global $, Stripe, stripeResponseHandler */
//Use rails version of document ready function.
  $(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-signup-btn');
  
  //Set our stripe public key.
  Stripe.publishableKey( $('meta[name="stripe-key"]').attr('content') );
  
  //When user clicks form submit button,
  submitBtn.click(function(event){
    //prevent default submission behavior.
    event.preventDefault();
    //Collect the credit card fields,
    var ccNum = $('#card_number').val(),
      cvcNum = $('#card_code').val(),
      expMonth = $('#card_month'),
      expYear = $('#card_year');
    //and send card info to Stripe.
    Stripe.createToken({
      number: ccNum,
      cvc: cvcNum,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler);
  });
  
  //and stripe will return a card token.
  //Inject card token as hidden field into form.
  //Submit form to our Rails app
  
});
