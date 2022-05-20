# Grid로 menu 오른쪽 배치하기



### HTML

```html
<div id="header">
        <div class="swoosh">
            <img src="Logo.png" width="200px">
        </div>
        <div class="menu">
            <img src="bag.png" width="50px">
            <img src="glass.png" width="50px">
            <img src="menu.png" width="50px">
        </div>
    </div>
```

​	`<div>`태그를 활용해 하나는 로고를 나머지 하나는 메뉴바를 묶었다. 그리고 이 둘을 다시 `<div>`태그로 묶어 id를 'header'라고 지정했다. 이제 이 둘을 상단에 위치시키고 메뉴바는 오른쪽에 배치시키는 작업을 할 것이다.



### CSS

```css
#header{
  display: grid;
  grid-auto-flow: column;
  grid-template-columns: 1fr;
}
.menu{
    display: grid;
    grid-auto-flow: column;
    grid-template-columns: 1fr;
    padding-top: 90px;
    padding-right: 50px;
}
```

​	'display'를 grid로 지정하고 column(열) 배치했다. 배분은 '1fr'로 했는데 알아서 메뉴바가 오른쪽으로 배치되었다. 하지만 메뉴바 이미지들이 세로로 되어 있어 이것도 grid로 한 다음 column으로 재배치했다.