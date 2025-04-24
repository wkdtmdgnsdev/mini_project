document.getElementById("bulkForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const jsonData = document.getElementById("quizJson").value;

    try {
        const quizArray = JSON.parse(jsonData);

        // POST 전송
        fetch("register", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(quizArray)
        })
        .then(res => res.text())
        .then(msg => {
            location.href = "/mini";
        })
        .catch(err => {
            document.getElementById("result").innerHTML = `<div class="alert alert-danger">등록 실패: ${err}</div>`;
        });
    } catch (e) {
        alert("유효한 JSON 형식이 아닙니다.");
    }
});