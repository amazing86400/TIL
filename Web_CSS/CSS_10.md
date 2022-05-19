# CSS의 재사용



```css
body{
    margin: 0px;
}
#grid{
    display: grid;
    grid-template-columns: 230px 1fr;
}
a{
    color: black;
    text-decoration: none;
}
h1{
    text-align: center;
    font-size: 55px;
    border-bottom: 1px solid gray;
    margin: 0px;
    padding: 20px;
}
#grid ol{
    border-right: 1px solid gray;
    width: 150px;
    margin: 0px;
    padding-left: 40px;
    padding-top: 20px;
}
@media(max-width:700px){
    h1{
        text-align: left;
        font-size: 35px;
        padding: 10px;
    }
    #grid{
        display: block;
    }
    #grid ol{
        border-right: none;
    }
}
```

​	나는 앞서 **'Media Query'**라는 개념에 대해 배웠다. 정말 좋은 기능이다. 여기서 좀 극단적으로 생각해 볼 필요가 있다. 만약 지금까지 디자인 한 작업을 1억 개의 파일에 똑같이 적용해야 한다면? 말도 안 된다. 일일이 작업하기란 거의 불가능한 작업이다. 이때 알아둬야 할 것이 바로 **'중복의 제거'**이다. 중복되는 작업을 줄이는 것은 매우 중요한 일이다.

​	중복된 작업을 줄이기 위해 앞서 디자인한 `<style>`태그 안의 내용을 복사해서, CSS 파일을 새로 만들어 붙여넣기 한다. 그리고 기존에 `style`태그 위치에 **`<link>`**태그를 추가한다. 이 태그는 내가 저장한 CSS를 활용할 수 있도록 해주는 태그이다.

​	이렇게 하면 코드 한 줄로 인해 수많은 웹 페이지를 매우 효율적으로 디자인할 수 있다. 그리고 **'캐싱'**이란 기술로 인해 CSS를 파일이 수정되기 전까지 우리 컴퓨터에 저장해 놓는다. 이렇게 되면 우리는 네트워크를 사용하지 않기 때문에 속도를 더 높을 수 있고, 사업자에서는 금액을 절약할 수 있다는 장점이 있다. 그래서 가급적이면 CSS 파일을 따로 생성하여 사용하는 것이 좋다.