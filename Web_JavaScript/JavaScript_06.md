# 조건문



### 수업전 혼자 실습

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

