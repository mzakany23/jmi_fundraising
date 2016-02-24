<message-notification>
	<style type="text/css">
      .messages {
          border: 2px solid green;
          background-color: #B6C4C6;
      }

      .messages li{
          color: green;
      }

      .errors {
          border: 2px solid red;
          background-color: #B6C4C6;
      }

      .errors li{
          color: red;
      }

   

  </style>

	<div if={ opts.messages } class="row">
      <div class="col-md-12">
          <h3>{ opts.title }</h3>
          <ul class="{ css[opts.type] }">
              <li each={ message in opts.messages }>{ message }</li>
          </ul>        
      </div>
  </div>	

<script>
	this.on('mount',function(){
    this.css = {
      error: 'errors',
      success: 'messages'
    }

  })
</script>

</message-notification>