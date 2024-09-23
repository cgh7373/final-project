require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' } });
require(['vs/editor/editor.main'], function () {
    const editor = monaco.editor.create(document.getElementById('editor'), {
        value: '// 코드를 입력하세요',
        language: 'javascript'
    });

    document.getElementById('editor').addEventListener('input', function () {
        const code = editor.getValue();
        const resultDiv = document.getElementById('result');

        try {
            eval(code); // 코드 실행 및 오류 검출
            resultDiv.innerText = '코드에 오류가 없습니다.';
            resultDiv.style.color = 'green';
        } catch (error) {
            resultDiv.innerText = '오류: ' + error.message;
            resultDiv.style.color = 'red';
        }
    });

    document.getElementById('submitBtn').addEventListener('click', function () {
        const code = editor.getValue();

        fetch('https://your-api-endpoint.com', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ code: code })
        })
            .then(response => response.json())
            .then(data => {
                console.log('서버 응답:', data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });
});