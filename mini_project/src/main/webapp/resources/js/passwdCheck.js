// 비밀번호 패턴 검사
document.querySelector("#passwd").addEventListener("input", function () {
	let passwdMessage = document.querySelector("#passwdMessage");
	let passwd = this.value;
	const passwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,}$/;

	if (!passwdPattern.test(passwd)) {
		passwdMessage.textContent = "비밀번호는 영문자, 숫자, 특수문자를 포함해 최소 8자 이상이어야 합니다.";
		passwdMessage.style.color = "red";
	} else {
		passwdMessage.textContent = "안전한 비밀번호입니다.";
		passwdMessage.style.color = "green";
	}
});