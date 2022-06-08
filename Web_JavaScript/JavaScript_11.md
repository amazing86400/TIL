# 객체(Object)



### 객체 기본 지식

```js
document.querySelector('body').style.color = 'red';
```

​	오늘은 객체의 특성, 존재 이유, 기능들에 대해서 공부했다. 객체의 기능 중 하나는 바로 **'정리 정돈의 수단'**이다. 객체는 정보의 양이 많아졌을 때 서로 연관된 정보끼리 그룹핑하여 정리하는 기능을 한다. 즉, 서로 연관된 함수와 또 서로 연관된 변수들을 그룹핑해서 정리 정돈하기 위한 수납장으로써 존재한다.

​	위 코드에서 'document'가 바로 오늘 배울 '객체'이며, **'querySelector'**가 그 객체의 함수 역할을 하는데, 이것은 함수라기 보다 **메소드('method')**라고 부른다.



---



### 객체 만드는 방법 & 데이터 가져오기

```html
<script>
    var whoamI = {
        "name":"Mike",
        "age":"26"
    };
    document.write("name: " + whoamI.name +"<br>");
    document.write("age: " + whoamI.age + "<br>");
    whoamI.job = "developer";
    document.write("job: " + whoamI.job + "<br>");
    whoamI["country"] = "Korea";
    document.write("country: " + whoamI.country);
</script>
```

​	지금부터는 객체를 만드는 방법과 객체에서 데이터를 가져오는 방법에 대해 알아보자. 우선 배열은 대괄호를 사용해 생성하고, 객체를 만들 때는 **'중괄호{}'**를 사용한다.  그냥 '{}'만 사용하면 비어있는 객체가 생성된다. 그리고 객체는 key와 value 형태로 만들어진다.

​	"whoamI.name"에서 '.'은 **'object access poerator'**라고 불리며, 객체에 접근한다는 의미다. 객체가 이미 만들어졌을 때 데이터를 추가하고 싶다면, 'job'과 'country'처럼 추가하면 된다. 참고로 'country' 안에 내용은 **'띄어쓰기도'** 가능하다.



---



### 객체 반복문

```html
<script>
    for(var key in whoamI){
        document.write(key + "<br>");
        document.write(whoamI[key] + "<br>")
    }
</script>
```

​	변수가 가리키는 객체에 있는 key 값들을 하나씩 가져오는 반복문이다. **'for in'** 반복문은 배열에서 사용하면 **'index'**를 불러와 객체에서 사용하는 것과는 조금 다르다. key만 출력하고 싶으면 두 번째 코드처럼 바로 사용하면 되고, value 값을 가져오고 싶다면 대괄호를 사용하면 된다.



---



### 객체 Property와 Method

```html
<script>
    whoamI.showAll = function(){
        for(var key in this){
            document.write(key + "<br>");
            document.write(this[key] + "<br>");
        }
    }
    whoamI.showAll();
</script>
```

​	객체에는 문자, 숫자, 배열, 함수 등 많은 것을 담을 수 있다. 앞서서는 문자를 담았다면 이번에는 함수를 담아보자. 함수를 객체 안에 담을 때는 위 예시처럼 function을 만들어주면 된다. 즉, 함수는 한 가지 방법으로만 만드는 것이 아니다. **'var showAll = function()'**으로도 함수를 정의할 수 있다. 이렇게 객체에 소속된 함수를 만들 수 있다. 그리고 이를 **'method'**라고 부르고, 객체에 소속된 변수(key)는 **'property'**라고 부른다.



---



### 객체 활용

```html
<script>
    var body = {
        backcolor: function(color){
            document.querySelector('body').style.background = color;
        },

        fontcolor: function(color){
            document.querySelector('body').style.color = color;
        }
    };

    var link = {
        acolor: function(color){
            var list = document.querySelectorAll('a');
            for(i=0; i<list.length; i++){
                list[i].style.color = color;
            }
        }
    };

    function master(self){
        var target = document.querySelector('body');
        if(self.value === 'GoodNight'){
            body.backcolor('black');
            body.fontcolor('white');
            self.value = 'GoodMorning';
            link.acolor('yellow');
        }else{
            body.backcolor('white');
            body.fontcolor('black');
            self.value = 'GoodNight';
            link.acolor('blue');
        }
    }
</script>
```

