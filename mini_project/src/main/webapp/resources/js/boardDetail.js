var passwordModal = document.getElementById('passwordModal');
passwordModal.addEventListener('show.bs.modal', function (event) {
    var button = event.relatedTarget;
    var action = button.getAttribute('data-action');

    var actionForm = document.getElementById('actionForm');
    var actionInput = document.getElementById('action');

    actionInput.value = action;

    if (action === 'update') {
        actionForm.action = 'updateForm';
    } else if (action === 'delete') {
        actionForm.action = 'delete';
    }
});

// 확인 버튼 클릭 시
document.getElementById('confirmActionButton').addEventListener('click', function () {
    var password = document.getElementById('password').value;
    var bno = document.getElementById('bno').value;
    var action = document.getElementById('action').value;
    var errorDiv = document.getElementById('passwordError');
    var modalDialog = document.querySelector('#passwordModal .modal-dialog'); // 모달 대화상자 요소

    const param = {
        bno: bno,
        passwd: password
    };

    fetch('passwdCheck', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json;charset=utf-8',
        },
        body: JSON.stringify(param)
    })
    .then(response => response.json())
    .then(data => {
        if (data.succ) {
            errorDiv.style.display = 'none';
            errorDiv.textContent = '';

            const modalElement = document.getElementById('passwordModal');
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (!modalInstance) {
                modalInstance = new bootstrap.Modal(modalElement);
            }
            modalInstance.hide();

            if (action === 'update') {
                window.location.href = 'updateForm?bno=' + bno;
            } else if (action === 'delete') {
                window.location.href = 'delete?bno=' + bno;
            }
        } else {
            // 실패 시 메시지 출력 + 흔들기
            errorDiv.textContent = '비밀번호가 틀렸습니다.';
            errorDiv.style.display = 'block';

            // 모달을 흔드는 애니메이션을 추가
            modalDialog.classList.add('shake');
            setTimeout(() => {
                modalDialog.classList.remove('shake');
            }, 500);
        }
    })
    .catch(error => {
        errorDiv.textContent = '서버 오류가 발생했습니다.';
        errorDiv.style.display = 'block';
    });
});

// 입력 시 에러 메시지 숨김
document.getElementById('password').addEventListener('input', function () {
    const errorDiv = document.getElementById('passwordError');
    errorDiv.style.display = 'none';
    errorDiv.textContent = '';
});

document.getElementById('password').addEventListener('keydown', function (event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // 폼 제출 방지 (필요 시)
        document.getElementById('confirmActionButton').click();
    }
});
