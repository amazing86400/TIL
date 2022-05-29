# 반복문



### while문

```html
<ul>
    <script>
        document.write('<li>1</li>')
        var i = 0
        while(i < 3){
            document.write('<li>2</li>')
            document.write('<li>3</li>')
            i += 1
        }
        document.write('<li>4</li>')
    </script>
</ul>
```

​	while문은 if문과 같이 괄호 안에 값이 'true'이면 반복문 안에 내용을 실행하고, 값이 'false'를 반환하면 멈추게 된다. 위 예제는 1부터 4까지의 목록에서 2와 3을 반복하여 생성했다. i를 0으로 설정해 i가 3보다 작을 때까지(3번 반복) 반복하도록 했고, 그래서 i에 1씩 더해주는 코드를 넣었다.