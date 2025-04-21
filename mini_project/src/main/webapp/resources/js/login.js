document.addEventListener("DOMContentLoaded", function () {
	const loginForm = document.querySelector("#loginForm");
			
		if (loginForm) {
	 		loginForm.addEventListener("submit", e => {
				e.preventDefault();

				const param = {
					userid : userid.value,   	
					passwd : passwd.value   	
				}
				
				fetch("login", { 
					  method: 'post', 
					  headers: {
					    'Content-Type': 'application/json;charset=utf-8'
					  },
					  body: JSON.stringify(param)
					})
					  .then(response => response.json())
					  .then(json => {
						  if (json.status == "error") {
							  const errorMessage = document.querySelector("#errorMessage");
                              errorMessage.style.display = "block";
                              errorMessage.textContent = json.errorMessage;
                              
							  userid.value = "";
							  passwd.value = "";
							  userid.focus();
						  } else {
							  location = "${pageContext.request.contextPath}/";
						  }
				})	 			

					  
		//		registerForm.submit();
	 		})
	 	}
});