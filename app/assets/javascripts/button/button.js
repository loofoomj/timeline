window.onload = function(){
    var button = document.getElementsByClassName("button");
    for (var i = 0; i < button.length; i++) {
	    button[i].addEventListener('click', function(){

	    	/* Sec_button_id is the id of the button that changes together through random numbers. */
	    	var sec_button_id = Math.floor(Math.random() * button.length);
	    	while(sec_button_id == this.id){
	    		sec_button_id = Math.floor(Math.random() * button.length);
	    	}
	    	var sec_button = document.getElementById(sec_button_id);
	  		
	  		/* ON, OFF change function */
	    	function change(button){
	    		if (button.value == 'ON') {
	    			button.value = 'OFF';
	    		} else{
	    			button.value = 'ON';
	    		};
	    	}
	    	change(this);
	    	change(sec_button);

	    	/* Check the number of OFF buttons */
	    	var check = 0;
			for (var i = 0; i < button.length; i++) {
				if (button[i].value == 'OFF') {
					check++;
				};
			};

			var on_cnt = document.getElementById("on_cnt");
			var off_cnt = document.getElementById("off_cnt");
			var cnt_hidden = document.getElementById("cnt_hidden").value;
			on_cnt.value = cnt_hidden - check;
			off_cnt.value = check;

			/* Complete message */
			if(check == button.length){
				
				/* Using Modal Popup to show Complete message */
				// Get the modal
				var modal = document.getElementById('myModal');

				// Get the image and insert it inside the modal - use its "alt" text as a caption
				var img = document.getElementById('myImg');
				var modalImg = document.getElementById("img01");
				var captionText = document.getElementById("caption");
				function complete(){
				    modal.style.display = "block";
				    modalImg.src = img.src;
				    captionText.innerHTML = img.alt;
				}
				complete();

				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];
				// When the user clicks on <span> (x), close the modal
				span.onclick = function() { 
					modal.style.display = "none";
					history.go(-1);
				}
			}
	    })
    };
}
