<payment-processing>
	<virtual if={ !creditCard }>
		<select onchange={ updatePaymentType } class="form-control" name='paymentSelect'>
				<option value='None'>None</option>
		    <option value='check'>Pay By Check</option>
		    <option value='creditCard'>Charge Card Now</option>
		</select>
	</virtual>

<script>
	var self = this
	var handler = StripeCheckout.configure({
    key: 'pk_test_G0K67FwSKkcdKKLDcwTjrXzy',
    image: 'https://s3.amazonaws.com/stripe-uploads/acct_14btMWBeYKhPzJaEmerchant-icon-1444693401040-logo_Ekictsq.png',
    locale: 'auto',
    token: function(token) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
    }
  });

	updatePaymentType(){
		option = this.paymentSelect.value
		if (option === 'creditCard'){
			handler.open({
	      name: 'Jose Madrid Salsa Fundraising',
	      description: '2 widgets',
	      amount: 2000
    	});
		}
	}

</script>

</payment-processing>