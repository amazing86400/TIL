# 함수



```html
<script>
    function sum(left, right){
        document.write(left+right+"<br>");
      }

      sum(2, 3);
      sum(5, 6);
      sum(18, 22)
</script>
```

​	함수는 영어로 'function' 혹은 'method'(메소드)라고 부른다. 함수를 정의해 사용할 경우 반복 작업을 덜 수 있고, 함수의 수정을 통해 전체적인 변화를 이끌 수도 있다.

​	함수를 정의할 때, 함수명 옆에 괄호 안에는 **'변수'**를 지정할 수 있다. 저 변수를 한국어로는 **'매개하는 변수(매개변수)'**라고 하고, 영어로는 **'parameter'**라고 부른다.

​	그리고 함수를 호출할 때, 괄호 안에 있는 입력값 숫자, 즉 2와 3은 한국어로는 **'인자'**, 영어로는 **'argument'**라고 부른다.



```html
<script>
    function master(self){
        var target = document.querySelector('body');
        if(self.value === 'GoodNight'){
            target.style.background = 'black';
            target.style.color = 'white';
            self.value = 'GoodMorning';

            var list = document.querySelectorAll('a');
            for(i = 0; i < list.length; i++){
                list[i].style.color = 'yellow';
            }
        }else{
            target.style.background = 'white';
            target.style.color = 'black';
            self.value = 'GoodNight';

            var list = document.querySelectorAll('a');
            for(i = 0; i < list.length; i++){
                list[i].style.color = 'blue';
            }
        }
    }
</script>
```

​	실습하던 버튼 코드를 함수로 만들었다. 이전에 `<input>` 코드에서는 변수와 **'this'**를 사용했다. 이때 this는 자기 자신을 가리키며, input 내의 자신을 가리켰다. 하지만 함수로 사용하게 됨으로써 this는 더 이상 버튼 하나를 가리키지 않게 된다. 그래서 사용하는 것이 **'self'**이며 함수의 매개변수에도 지정해 줘야 한다.