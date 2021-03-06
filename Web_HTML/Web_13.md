# dl, dt, dd



### 하나의 용어와 하나의 정의

```html
<dl>
  <dt>고진감래</dt>
  <dd>
    쓴 것이 다하면 단 것이 온다는 뜻으로, 고생 끝에 즐거움이 옴을 이르는 말
  </dd>
</dl>
```

​	`<dl>` 요소는 '설명 목록'을 나타내며 오늘 다룰 태그 중 가장 밖에 위치한 부모 태그이다.  `<dt>`와 `<dd>`태그는 자식 태그가 되며 `<dl>`태그로 감싸준다.

​	`dt`는 주로 '용어'를 의미하고, `<dd>`는 그 용어에 대한 설명을 나타낸다. 이렇게 해서 설명 목록을 만들 수 있고, 그래서 이 세 태그는 주로 용어 사전 구현이나 메타데이터(키-값 쌍 목록)를 표시할 때 사용한다.



### 여러 개의 용어와 하나의 정의

```html
<dl>
  <dt>안녕</dt>
  <dt>hello</dt>
  <dt>ni hao</dt>
  <dd>
    만났을 때의 인사로 '안녕(하세요)'라는 의미
  </dd>
</dl>
```



### 하나의 용어와 여러 개의 정의

```html
<dl>
  <dt>go</dt>
  <dd>
    (한 장소에서 다른 장소로) 가다
  </dd>
  <dd>
    (특히 다른 사람과 함께 어떤 장소행사에) 가다[다니다]
  </dd>
  <dd>
    (특정한 방식으로 또는 특정한 거리를) 가다
  </dd>
</dl>
```



### 여러 개의 용어와 여러 개의 정의

```html
<dl>
  <dt>Name</dt>
  <dd>kbshin</dd>
  <dt>Born</dt>
  <dd>1997</dd>
  <dt>Birthplace</dt>
  <dd>Korea</dd>
  <dt>Color</dt>
  <dd>blue</dd>
</dl>
```

```css
dt:after {
  content: ": ";
}
```

​	아래 CSS로 쉽게 만들 수도 있다.



---



### 참고

​	페이지에서 들여 쓰기를 하기 위한 목적으로 `<dl>`, `<ul>` 태그를 쓰지 말자. 작동할 수는 있으나 좋지 않은 방법이고, 설명 목록의 원래 목적을 흐리게 된다. <u>용어의 들여 쓰기를 수정하려면 CSS의 'margin' 속성을 사용하자.</u>

​	국내 사이트에는 구조화하여 마크업 하기 쉽다는 이유로 `<dl>` 태그를 많이 사용한다. 특히 포털사이트 중 메뉴를 `<dl>`태그로 사용하는 경우가 종종 있다. 이렇게 사용할 경우 문제 되는 것이 스크린리더 사용자들은 전체 메뉴 구조를 파악할 수 없다는 것이다. 단지 레이아웃 배치를 위해 정의형에 사용하는 태그를 사용한 구조인 것이다.

​	`<dl>`, `<dt>`, `<dd>`는 1:1로 쌍을 이룰 때 사용하는 것을 권장한다. 반드시 정의형이나 설명형을 만족하지 않더라도 제목과 데이터가 1:1로 쌍을 이룰 때만 사용하는 것을 권장한다. 