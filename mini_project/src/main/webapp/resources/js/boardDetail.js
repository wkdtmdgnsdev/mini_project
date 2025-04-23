 // 모달의 행동에 따라 처리할 폼 action 변경
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

        // 비밀번호 확인 버튼 클릭
        document.getElementById('confirmActionButton').addEventListener('click', function() {
            var password = document.getElementById('password').value;
            var bno = document.getElementById('bno').value;
            var action = document.getElementById('action').value;

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
                    // 모달 닫기 (Bootstrap 5 방식)
                    const modalElement = document.getElementById('passwordModal');
                    let modalInstance = bootstrap.Modal.getInstance(modalElement);
                    if (!modalInstance) {
                        modalInstance = new bootstrap.Modal(modalElement);
                    }
                    modalInstance.hide();

                    // 액션 수행
                    if (action === 'update') {
                        window.location.href = 'updateForm?bno=' + bno;
                    } else if (action === 'delete') {
                        window.location.href = 'delete?bno=' + bno;
                    }
                } else {
                    alert('비밀번호가 틀렸습니다.');
                }
            })
            .catch(error => {
                alert('서버와의 통신에 실패했습니다.');
            });
        });