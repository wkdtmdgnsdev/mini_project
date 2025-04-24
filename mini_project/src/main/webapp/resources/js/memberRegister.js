let registerForm = document.querySelector("#registerForm");
		let isUserIdValid = false;

		if (registerForm) {
			// 아이디 유효성 검사
			document.querySelector("#userid").addEventListener("input", function () {
				let useridMessage = document.querySelector("#useridMessage");
				let userid = this.value;
				if (userid.length < 8) {
					useridMessage.textContent = "아이디는 최소 8글자 이상이어야 합니다.";
					useridMessage.style.color = "red";
					isUserIdValid = false;
				} else {
					useridMessage.textContent = "사용할 수 있는 아이디입니다.";
					useridMessage.style.color = "green";
					isUserIdValid = true; // 일단 길이만 통과 (중복은 blur에서 체크됨)
				}
			});

			// 아이디 중복 검사 (blur 이벤트)
			document.querySelector("#userid").addEventListener("blur", function () {
				let userid = this.value;
				if (userid.length >= 8) {
					fetch("isExistUserId", {
						method: 'post',
						headers: {
							'Content-Type': 'application/json;charset=utf-8'
						},
						body: JSON.stringify({ userid: userid })
					})
						.then(response => response.json())
						.then(json => {
							let useridMessage = document.querySelector("#useridMessage");
							if (json.existUserId) {
								useridMessage.textContent = userid +` 아이디는 이미 사용 중입니다.`;
								useridMessage.style.color = "red";
								isUserIdValid = false;
								this.focus();
							} else {
								useridMessage.textContent = userid +` 아이디는 사용 가능합니다.`;
								useridMessage.style.color = "green";
								isUserIdValid = true;
							}
						})
						.catch(error => {
							console.error("중복 확인 중 오류 발생:", error);
						});
				}
			});

			// 폼 제출 처리
			registerForm.addEventListener("submit", e => {
				e.preventDefault();

				// 클라이언트 유효성 검사
				if (!isUserIdValid) {
					alert("아이디를 다시 확인해주세요.");
					return;
				}

				const param = {
					userid: registerForm.userid.value,
					passwd: registerForm.passwd.value,
					name: registerForm.name.value,
					age: registerForm.age.value
				};

				fetch("register", {
					method: 'post',
					headers: {
						'Content-Type': 'application/json;charset=utf-8'
					},
					body: JSON.stringify(param)
				})
					.then(response => response.json())
					.then(json => {
						if (json.status == "error") {
							alert(json.message);
						} else {
							location = "loginForm";
						}
					});
			});
		}