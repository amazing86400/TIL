# 조건문

​	Javascript는 Python과 달리 if문을 괄호'()' 안에 넣고, 중괄호'{}'를 사용한다.



### 수업 전 혼자 실습

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
</head>
<body>
    <h1>Display Change</h1>
    <input type="button" value="GoodMorning" onclick="
    document.querySelector('body').style.background='white';
    document.querySelector('body').style.color='black'">

    <input type="button" value="GoodNight" onclick="
    document.querySelector('body').style.background='black';
    document.querySelector('body').style.color='white'">

    <input type="button" value="Master" onclick="
    if(document.querySelector('body').style.background === 'black'){
    document.querySelector('body').style.background='white';
    document.querySelector('body').style.color='black'}
    else{
        document.querySelector('body').style.background='black';
        document.querySelector('body').style.color='white'
    }">


</body>
</html>
```

​	기존에 있던 버튼은 클릭을 하면 지정한 배경색으로 변화하는 기능을 주었다. 이번에는 그 기능에 조건문을 주어 흰색 배경일 때는 검정색으로 바꾸고, 반대로 검정 배경색이면 하얗게 변경되도록 코드를 짜봤다. 수업 전에 혼자서 실습해 본 코드라 잘 짠 코드인지는 모르겠지만 결과는 성공적으로 나왔다.



### 수업 코드

```html
<h2>수업 코드</h2>
    <input id="book" type="button" value="GoodMorning" onclick="
    if(document.querySelector('#book').value === 'GoodMorning'){
    document.querySelector('body').style.background='black';
    document.querySelector('body').style.color='white';
    document.querySelector('#book').value='GoodNight';}
    else{
    document.querySelector('body').style.background='white';
    document.querySelector('body').style.color='black';
    document.querySelector('#book').value = 'GoodMorning';
    }">
```

​	수업에서는 `<input>`태그에 'id'를 지정하고 그 값의 value에 따라 구분하는 조건문을 주었다. 그래서 value가 'GoodMorning'이면 어둡게 바꾸고, value는 다시 'GoodNight'으로 지정하게 했다. 그리고 else에는 이 조건과는 반대 조건을 주었다.

​	value를 사용할 줄은 생각도 못 했는데, 좋은 접근이라고 생각한다.
