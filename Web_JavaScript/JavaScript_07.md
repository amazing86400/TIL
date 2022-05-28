# 리팩토링(Refactoring)



​	Refactoring의 뜻부터 살펴보면, **'re'**라는 것은 **'다시'**를 의미하고 **'factory'**는 **'공장'**을 의미한다. 즉, "공장으로 다시 보내서 좀 더 개선한다"라고 생각하면 될 것 같다.

​	우리가 코딩을 하다 보면 코드가 좀 비효율적일 때가 있기 마련이다. 이럴 때 **코드의 가독성을 높이고, 중복된 것은 낮추고, 유지 보수는 편하게 만들어 최종적으로 코드를 효율적으로 만들어 주는 작업**을 하는 것이 바로 '리팩토링'이다. 그래서 틈틈이 리팩토링을 해줘야 좋은 프로그램을 만들 수 있다.



```html
<input type="button" value="GoodNight" onclick="
    if(this.value === 'GoodNight'){
    document.querySelector('body').style.background='black';
    document.querySelector('body').style.color='white';
    this.value='GoodMorning';}
    else{
    document.querySelector('body').style.background='white';
    document.querySelector('body').style.color='black';
    this.value = 'GoodNight';
    }">
```

​	이전 조건문 수업에서 버튼의 'value'에 따라서 화면이 바뀌도록 했다. 그래서 'id'도 활용해 코딩을 했다. 하지만 생각해 보면 'onclick' 안에 있는 내용은 바로 자기 자신을 나타내는 코드이다. 이 부분을 좀 더 효율적으로 쓰려면 **'this'**라는 것을 사용하면 된다. 이렇게 해주면 코드도 짧아지고, 아무리 코드를 많이 복사해도 문제없이 작동된다. 이전 코드로는 복사를 해주면 id가 중복되는 문제가 발생해 버튼의 기능이 제대로 작동하질 않았다.



```html
<input type="button" value="GoodNight" onclick="
    var target = document.querySelector('body');
    if(this.value === 'GoodNight'){
    target.style.background='black';
    target.style.color='white';
    this.value='GoodMorning';}
    else{
    target.style.background='white';
    target.style.color='black';
    this.value = 'GoodNight';
    }">
```

​	그리고 'body'를 선택하는 부분의 코드도 'target' 변수를 활용해 코드의 양을 줄이고, 좀 더 효율적으로 바꿔주었다.

