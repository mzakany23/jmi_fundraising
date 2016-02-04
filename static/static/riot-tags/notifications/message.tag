<message-notification>
	<style type="text/css">
      .messages {
          border: 2px solid green;
          background-color: #B6C4C6;
      }

      .messages li{
          color: green;
      }

  </style>

	<div if={ opts.messages } class="row">
      <div class="col-md-12">
          <h3>{ opts.title }</h3>
          <ul class='messages'>
              <li each={ message in opts.messages }>{ message }</li>
          </ul>        
      </div>
  </div>	

<script>
	
</script>

</message-notification>