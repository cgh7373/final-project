<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        
        #editor {
            width: 100vw;
            height: 90vh;
            border-bottom: 2px solid #ccc; 
        }
    
        #errors {
            width: 100vw;
            height: 10vh; 
            overflow-y: auto; 
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            box-sizing: border-box;
            font-size: 14px; 
        }
</style>
</head>
<body>

    <!-- 이거 eslint 말고 오류검출부터 외부api가져와서 해보기 -->





	<jsp:include page="../common/menubar.jsp" />
	
	
    <div id="editor"></div>
    
    <div id="errors" class="error"></div>
	

	<script src="https://unpkg.com/monaco-editor@latest/min/vs/loader.js"></script>
    <script src="https://unpkg.com/eslint@latest/eslint.js"></script>
    
    <script>
        require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' }});
        require(['vs/editor/editor.main'], function () {
            const editor = monaco.editor.create(document.getElementById('editor'), {
                value: `// Write your code here\nconsole.log('Hello, world!');`,
                language: 'javascript',
                theme: 'vs-light'
            });

            async function lintCode(code) {
                const eslint = await import('https://unpkg.com/eslint@latest/eslint.js');
                const linter = new eslint.ESLint();
                const results = await linter.lintText(code);

                const errorDiv = document.getElementById('errors');
                errorDiv.innerHTML = '';
                results[0].messages.forEach(message => {
                    const error = document.createElement('div');
                    error.textContent = `${message.line}:${message.column} ${message.message} (${message.ruleId})`;
                    errorDiv.appendChild(error);
                });
            }

            editor.onDidChangeModelContent(() => {
                const code = editor.getValue();
                lintCode(code);
            });
        });
        
    </script>

</body>
</html>