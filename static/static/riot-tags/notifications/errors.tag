<errors-list>
	<style type="text/css">
      .errors {
          border: 2px solid red;
          background-color: #B6C4C6;
      }

      .errors li{
          color: red;
      }

  </style>

	<div if={ opts.errors } class="row">
      <div class="col-md-12">
          <h3>Errors!</h3>
          <ul class='errors'>
              <li each={ error in opts.errors }>{ error }</li>
          </ul>        
      </div>
  </div>	
  
<script>

</script>

</errors-list>