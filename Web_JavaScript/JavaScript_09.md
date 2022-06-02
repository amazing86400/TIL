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
            i ++
        }
        document.write('<li>4</li>')
    </script>
</ul>
```

​	while문은 if문과 같이 괄호 안에 값이 'true'이면 반복문 안에 내용을 실행하고, 값이 'false'를 반환하면 멈추게 된다. 위 예제는 1부터 4까지의 목록에서 2와 3을 반복하여 생성했다. i를 0으로 설정해 i가 3보다 작을 때까지(3번 반복) 반복하도록 했고, 그래서 i에 1씩 더해주는 코드를 넣었다.



```js
var alist = document.querySelectorAll('a');
var i = 0;
while(i < alist.length){
    console.log(alist[i])
    i++;}
```

​	또 다른 예시이다. 홈페이지 내 모든 `<a>`태그에 관하여 반복문을 돌려 모두 가져올 수 있도록 했다.



---



### for문

```html
<ul>
    <script>
        document.write("<li>1</li>");
        for(var i = 0; i < 3; i++){
            document.write("<li>2</li>")
            document.write("<li>3</li>")
        }
        document.write('<li>4</li>')
    </script>
</ul>
```

​	for문을 사용하면 while문 보다 코드를 더 짧고 효율적으로 짤 수 있다. 그 이유는 while문은 괄호 안에 조건만 들어가는 반면, for문은 **초기문, 조건문, 증감문**을 한 번에 사용할 수 있기 때문이다. 반복문의 내용은 위와 동일하다.



```js
var alist = document.querySelectorAll('a');
var i = 0;
while(i < alist.length){
    console.log(alist[i])
    i++;}
```

​	위에 while문 예제와 같은 내용의 for 반복문이다.



---



### for of문

```html
<ul>
    <script>
        var i = 0;
        while(i < arr.length){
            document.write('<li>'+arr[i]+'</li>');
            i ++;
        }
    </script>
</ul>
<ul>
    <script>
        var arr = ['제니','지수','로제','리사'];
        for(i of arr){
            document.write('<li>'+i+'</li>');
        }
    </script>
</ul>
```

​	for of문은 배열의 요소들을 반복하여 반환한다. 위 두 예제 코드는 모두 동일한 값을 반환하며, 배열의 값이 계속해서 변해도 변하는 대로 결과를 반환받도록 코딩을 했다.