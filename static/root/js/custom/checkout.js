$(function(){
  
  var state;

  $('#paymentmethod1').change(function(e){
    $('#checkPaymentForm').hide()
    state = $('#paymentmethod1').val()
    if (state == 'credit') {
      $('#creditCardForm').show('slow')
    } 
  });

  $('#paymentmethod2').change(function(e){
    state = $('#paymentmethod2').val()
    if (state == 'check') {
      $('#creditCardForm').hide()
      $('#checkPaymentForm').show('slow')
    }else{
      $('#checkPaymentForm').slideUp();
    }
  });  

  function stripeResponseHandler(status, response) {
      var $form = $('#payment-form');

      if (response.error) {
        // Show the errors on the form
        $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
      } else {
        // response contains id and card, which contains additional card details
        var token = response.id;
        
        // Insert the token into the form so it gets submitted to the server
        $form.append($('<input type="hidden" name="stripeToken" id="stipe-token" />').val(token));
        // and submit
        
        sendTokenToServer(token)


        // $form.get(0).submit();
      }
  };

  function getStripeFormValues(){
    var cc = {}
    cc['name']     = $('#ccNAME').val()
    cc['number']   = $('#ccNUM').val()
    cc['cvc']      = $('#ccCVC').val()  
    cc['expMonth'] = $('#ccEXPMONTH').val()
    cc['expYear']  = $('#ccEXPYEAR').val()

    return cc
  }

  function reportError(name,message){
    if (name == 'num'){
      $('.payment-errors-num').text(message).addClass('jmi-card-error');  
    }else if (name == 'exp'){
      $('.payment-errors-exp').text(message).addClass('jmi-card-error');
    }else if (name == 'cvc') {
      $('.payment-errors-cvc').text(message).addClass('jmi-card-error');
    }
    
  }

  function sendTokenToServer(token){
    var csrf_token = $("input[name=csrfmiddlewaretoken]").val()
    $.ajax({
      type: "POST",
      url: "{% url 'process_fundraiser' %}",
      dataType: 'json',
      data: {
        csrfmiddlewaretoken: csrf_token,
        type: 'credit',
        token: token
      },
      success: function(data){
        window.location = "{% url 'process_checkout' %}";
      },
    });
    return false;
  }


  $('#pageSubmit').click(function(e){
      e.preventDefault();
      var csrf_token = $("input[name=csrfmiddlewaretoken]").val()
      
      var error = false;

      if (state == 'credit') {
        
        cc = getStripeFormValues()
        
        if (!Stripe.card.validateCardNumber(cc['number'])){
          error = true;
          reportError('num','* The card number appears to be invalid!');
        }

        if (!Stripe.card.validateCVC(cc['cvc'])){
          error = true;
          reportError('cvc','* The CVC 3 digit code appears to be invalid!');
        }

        if (!Stripe.card.validateExpiry(cc['expMonth'],cc['expYear'])){
          error = true;
          reportError('exp','* The expiration date appears to be invalid!');
        }

        if (error){
          console.log('error!');
        }

        if (error){
          
        }else{
          Stripe.card.createToken({
            number: cc['number'],
          
            exp_month: cc['expMonth'],
            exp_year: cc['expYear']
          }, stripeResponseHandler);
        }

      } else if (state == 'check') {
        $.ajax({
          type: "POST",
          url: "{% url 'process_fundraiser' %}",
          dataType: 'json',
          data: {
            csrfmiddlewaretoken: csrf_token,
            type: 'check'
          },
          success: function(data){
            window.location = "{% url 'process_checkout' %}";
          },
        });
        return false;
      } else {
          $('#checkoutErrors').show('slow');
      }
      
    })

});
