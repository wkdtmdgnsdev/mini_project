document.addEventListener("DOMContentLoaded", function () {
    const quizModalElement = document.getElementById('quizModal');
    const quizModal = bootstrap.Modal.getOrCreateInstance(quizModalElement);
    const quizContent = document.getElementById('quizContent');
    const startBtn = document.getElementById('startQuizBtn');

    startBtn.addEventListener('click', function () {
        quizContent.innerHTML = '<p>문제를 불러오는 중...</p>';
        startQuiz();
        
    });

    function startQuiz() {
        fetch('quiz/randomQuiz')
            .then(response => response.json())
            .then(data => {
                let optionsHtml = '';
                data.options.forEach((option, index) => {
                    optionsHtml += `
                        <button class="btn btn-outline-primary w-100 my-2 option-btn" data-index="${index}" data-answer="${data.answer}">
                            ${option}
                        </button>
                    `;
                });

                quizContent.innerHTML = `
                    <h5 class="mb-3">${data.question}</h5>
                    ${optionsHtml}
                    <div id="answerResult" class="mt-3"></div>
                `;

                document.querySelectorAll('.option-btn').forEach(button => {
                    button.addEventListener('click', function () {
                        const selectedIndex = parseInt(this.getAttribute('data-index')); // 번호로 변환
                        const correctIndex = parseInt(this.getAttribute('data-answer')); // 정답 인덱스도 번호로 변환
                        const resultDiv = document.getElementById('answerResult');
                        // 정답 체크
                        if (selectedIndex === correctIndex) {
                            resultDiv.innerHTML = '<p class="text-success fw-bold">정답입니다! 🎉</p>';

                            // 일정 시간 후에 다음 문제로 넘어가기
                            setTimeout(() => {
                                startQuiz(); // 새 퀴즈 시작
                            }, 2000); // 2초 후에 새 문제 로드

                        } else {
                            resultDiv.innerHTML = `<p class="text-danger fw-bold">틀렸어요! 😢<br>정답: ${data.options[correctIndex]}</p>`;
                            // 일정 시간 후에 다음 문제로 넘어가기
                            setTimeout(() => {
                                startQuiz(); // 새 퀴즈 시작
                            }, 2000); // 2초 후에 새 문제 로드
                        }

                        // 모든 버튼 비활성화
                        document.querySelectorAll('.option-btn').forEach(btn => btn.disabled = true);
                    });
                });

                quizModal.show();
            })
            .catch(() => {
                quizContent.innerHTML = '<p class="text-danger">퀴즈를 불러오는 데 실패했습니다.</p>';
                quizModal.show();
            });
    }
});