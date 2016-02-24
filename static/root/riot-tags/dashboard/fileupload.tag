<fileupload-box>
	<style type="text/css">
		
		.buttonRow{
			margin-top: 10px;
		}

		.buttonRow button{
			width: 70px;
		}

	</style>

	<input onchange={ saveImage } type='file' id='fileInput'>	

	<div if={ activateSubmit } class="buttonRow">
		<button onclick={ editImage } class='btn btn-default edit'>Edit</button>
		<button onclick={ uploadImage } class='btn btn-warning edit'>Upload</button>
	</div>

<script>
	self = this
	this.activateSubmit = false
	this.event = false

	editImage(){
		$('#fileInput').trigger('click')
	}

	uploadImage(){
		// send with file upload web api
		formData = new FormData();
		formData.append('file',this.selectedFile)
		
		// csrf token
		if (opts.csrftoken){formData.append('csrfmiddlewaretoken',opts.csrftoken)}
		
		xhr = new XMLHttpRequest();

		url = opts.server + opts.action + '/'
		
		xhr.open("POST",url, true);

		// set up xhr
		xhr.onreadystatechange = function() {
			// success
			if (xhr.status == 200) {
				alert(xhr.responseText)
			// error
			}else{
				
			}

		}

		xhr.send(formData)
	}

	saveImage(){
    // imageVal
    this.selectedFile = $('#fileInput').get(0).files[0];
    if (
	    	this.selectedFile.type === 'image/png' || 
	    	this.selectedFile.type === 'image/jpg' || 
	    	this.selectedFile.type === 'image/jpeg'
    	){
        fileDisplayArea = document.getElementById('imageArea');
        reader = new FileReader();
        // init
        reader.onload = function(e) {
            fileDisplayArea.innerHTML = ''
            var img = new Image(200,175);
            img.src = reader.result;

            fileDisplayArea.appendChild(img);
        }
        // url
        reader.readAsDataURL(this.selectedFile); 

        this.activateSubmit = true
    }else{
        alert('use a png file!')
    }
}
</script>

</fileupload-box>