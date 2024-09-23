require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' } });
require(['vs/editor/editor.main'], function () {
    const editor = monaco.editor.create(document.getElementById('editor'), {
        value: '<h1>안녕하세요</h1>', // 초기 값으로 HTML 태그 포함
        language: 'html', // 언어를 HTML로 설정
        automaticLayout: true,
        theme: 'vs-dark',
    });

    // 전송 버튼 클릭 시 HTML 코드 실행
    document.getElementById('submitBtn').addEventListener('click', function () {
        const code = editor.getValue();
        const resultDiv = document.getElementById('result');
        const outputDiv = document.getElementById('output');

        try {
            // 입력된 HTML 코드를 출력 영역에 추가
            outputDiv.innerHTML = code; // innerHTML을 사용하여 HTML 출력
            resultDiv.innerText = 'HTML 코드가 정상적으로 렌더링되었습니다.';
            resultDiv.style.color = 'green';
        } catch (error) {
            resultDiv.innerText = '오류: ' + error.message;
            resultDiv.style.color = 'red';
        }
    });
});