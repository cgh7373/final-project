<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>코드 입력 및 오류 검출</title>
        <script src="https://unpkg.com/monaco-editor@latest/min/vs/loader.js"></script>
        <style>
            #editor {
                width: 800px;
                height: 400px;
                border: 1px solid #ccc;
            }

            #result {
                margin-top: 20px;
            }

            #output {
                border: 1px solid #ccc;
                margin-top: 20px;
                padding: 10px;
                min-height: 100px;
            }
        </style>
    </head>

    <body>
        <h1>코드 입력 및 오류 검출</h1>
        <select id="languageSelector">
            <option value="javascript">JavaScript</option>
            <option value="html">HTML</option>
            <option value="jsp">JSP</option>
        </select>
        <div id="editor"></div>
        <button id="submitBtn">전송</button>
        <div id="result"></div>
        <div id="output"></div>

        <script>
            require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' } });
            require(['vs/editor/editor.main'], function () {
                const editor = monaco.editor.create(document.getElementById('editor'), {
                    value: '// 코드를 입력하세요',
                    language: 'javascript',
                    automaticLayout: true,
                    theme: 'vs-dark',
                });

                const initialValues = {
                    javascript: '// JavaScript 예제\nconsole.log("안녕하세요!");',
                    html: `<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>안녕하세요!</h1>
</body>
</html>`,
                    jsp: `&lt;%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %&gt;
<%-- JSP 예제 --%>
<html>
<head>
    <title>JSP 예제</title>
</head>
<body>
    <h1>안녕하세요 JSP!</h1>
</body>
</html>`
                };

                // 초기값 설정
                editor.setValue(initialValues.javascript);

                document.getElementById('languageSelector').addEventListener('change', function (e) {
                    const language = e.target.value;
                    editor.getModel().setLanguage(language);
                    editor.setValue(initialValues[language]);
                });

                document.getElementById('submitBtn').addEventListener('click', function () {
                    const code = editor.getValue();
                    const resultDiv = document.getElementById('result');
                    const outputDiv = document.getElementById('output');
                    const selectedLanguage = document.getElementById('languageSelector').value;

                    try {
                        if (selectedLanguage === 'javascript') {
                            eval(code);
                            resultDiv.innerText = 'JavaScript 코드에 오류가 없습니다.';
                            resultDiv.style.color = 'green';
                        } else if (selectedLanguage === 'html') {
                            outputDiv.innerHTML = code;
                            resultDiv.innerText = 'HTML 코드가 정상적으로 렌더링되었습니다.';
                            resultDiv.style.color = 'green';
                        } else if (selectedLanguage === 'jsp') {
                            fetch('executeJsp.jsp', {
                                method: 'POST',
                                body: JSON.stringify({ code: code }),
                                headers: { 'Content-Type': 'application/json' }
                            })
                                .then(response => response.text())
                                .then(data => {
                                    resultDiv.innerText = 'JSP 코드 실행 결과:\n' + data;
                                    resultDiv.style.color = 'green';
                                })
                                .catch(error => {
                                    resultDiv.innerText = '오류: ' + error.message;
                                    resultDiv.style.color = 'red';
                                });
                        }
                    } catch (error) {
                        resultDiv.innerText = '오류: ' + error.message;
                        resultDiv.style.color = 'red';
                    }
                });
            });
        </script>
    </body>

    </html>