# display(property)



`display` 속성은 요소를 어떻게 보여줄지를 결정한다. 주로 4가지 속성 값이 쓰이는데 태그마다 기본값이 다르다.



---



### none

​	**요소를 렌더링하지 않도록 설정**한다. 이는 `visibility` property를 'hidden'으로 설정한 것과 달리, **<u>영역도 차지하지 않는다.</u>**



---



### block

​	`<div>`, `<p>`, `<h>`, `<li>` 태그 등이 이에 해당된다. 기본적으로 **가로 영역(전체)를 모두 차지**하고, block 요소 다음에 등장하는 태그는 줄바꿈이 된 것처럼 보인다. block은 width와 height property를 지정할 수 있다.



---



### inline

​	`<span>`, `<b>`, `<i>`, `<a>` 태그 등이 이에 해당된다. block의 반대 개념이라고 생각하면 되고, width와 height를 지정할 수 없다. 또한 inline 뒤에 나오는 태그는 줄바꿈 되지 않고 바로 오른쪽에 표시된다.



---



### inline-block

​	block과 inline의 중간 형태라고 볼 수 있다. 줄 바꿈이 되지 않지만 크기를 지정할 수 있다는 장점이 있다.