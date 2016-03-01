
<download-button>
	<a onclick={ requestForms } class='btn btn-md btn-danger' href="">Request Forms</a>

<script>
	requestForms(){
		alertify.set({ labels: 
			{
		    ok     : "Email Forms",
		    cancel : "Cancel"
			} 
		});
		alertify.prompt("Enter email address", function (e, str) {
		    // str is the input text
		    if (e) {
	    		alertify.set({ delay: 3000 });
	    		scroll(0,0)
					data = {
						csrfmiddlewaretoken: opts.token,
						email: str,
						id: opts.type,
						plan: opts.plan
					}
					$.post('http://localhost:8000/api/send-email',data).then((res) => {
						alertify.log(`${res} ${str}`);
					}).fail((e) => {
						console.log(e)
						alertify.log(`${str} : Invalid Email`);	
					})
		    } else {
	    		scroll(0,0)
	        alertify.log(`Email Cancelled`);
		    }
		}, "user@email.com");
	}
</script>

</download-button>