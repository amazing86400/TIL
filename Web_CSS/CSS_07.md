# 그리드 소개



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>grid</title>
    <style>
        #grid{
            border: 5px solid pink;
            display: grid;
            grid-template-columns: 150px 1fr;
        }
        div{
            border: 5px solid black;
        }
    </style>
</head>
<body>
    <div id="grid">
        <div>NAVIGATION</div>
        <div>ARTICLE</div>
    </div>
</body>
</html>
```

​	무색무취와 같은 태그가 바로 `<div>`태그이다. 'division'의 약자이다. `<div>`태그는 아무런 의미가 없고 **단지 디자인의 용도로만 쓰는** 태그이다. 그리고 div는 기본적으로 **'block level element'**이기 때문에 **화면 전체를 쓴다.**

​	이와 똑같은 기능을 하는 것이 바로 `<span>`태그이다. 쓰임새는 비슷한데 큰 차이점이 있다. `<span>`태그는 **'inline element'**이다. 그래서 우리는 block이냐 inline이냐에 따라 div, span을 골라서 쓰면 되겠다. 

​	부피를 명확하게 보기 위해 div를 선택자로 두고 테두리를 그렸다. 이제 'NAVIGATION'과 'ARTICLE'을 양옆으로 나란히 놓는 작업을 할 건데, 이때 부모 태그가 필요하다. 그래서 `<div>`태그를 부모로 두고, id를 지정해 주겠다. 그리고 id에 대해서 한 번 더 테두리를 그려준다.

​	이처럼 우리가 무엇을 배치하고 싶다면 그것을 받는 부모 태그가 있어야 한다. 그리고 'display' property를 'grid'로 지정하고 grid-template를 cloumns로 주게 되면 양옆으로 배치할 수 있다. 그리고 NAVIGATION을 150px만큼 주고, 나머지 공간은 'ARTICLE'이 다 쓰게 하고 싶다면 **'1fr;'**을 입력한다. 여기서 'fr'은 자동적으로 단위를 정해주는 역할을 하는데, 만약 '2fr 1fr'로 입력한다면 2/3과 1/3으로 영역을 구분한다.

​	그리고 grid의 장점 중 하나는 자동적으로 칸이 조절된다는 점이다. 내용이 아무리 많아도 그만큼 사이즈가 조절이 된다.

**'caniuse.com'**을 들어가 보면 현재 HTML, CSS, Javascript들 중 현재 웹브라우저들이 얼마나 그 기술을 채택하고 있는가에 대한 통계를 볼 수 있다. 아주 유용하고 중요한 사이트이다.