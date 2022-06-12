# Document 객체



### 정의

​	Document 객체는 웹 페이지 그 자체를 의미한다. 웹 페이지에 존재하는 HTML 요소에 접근하고자 할 때는 반드시 Document 객체부터 시작해야 한다.



---



### HTML 요소 선택

|                   메소드                   |                   설명                    |
| :----------------------------------------: | :---------------------------------------: |
| document.getElementsByTagName('태그이름'); |    해당 태그 이름의 요소를 모두 선택함    |
|     document.getElementById('아이디')      |        해당 아이디의 요소를 선택함        |
| document.getElementsByClassName('클래스')  |   해당 클래스에 속한 요소를 모두 선택함   |
|     document.querySelectorAll(선택자)      | 해당 선택자로 선택되는 요소를 모두 선택함 |

​	자바스크립트에서 **아이디(id)**를 이용한 선택은 해당 아이디를 가지고 있는 요소 중에서 **첫 번째 요소 단 하나만**을 선택한다. 따라서 여러 요소를 선택하고 싶을 때는 '태그 이름'이나 '클래스'와 같은 다른 방법을 사용해야 한다.



---



### HTML 객체의 선택

|    객체 집합     |                            설명                             |
| :--------------: | :---------------------------------------------------------: |
|  document.body   |                     `<body>`요소 반환함                     |
| document.cookie  |              HTML 문서의 쿠키(cookie)를 반환함              |
| document.domain  | HTML 문서가 위치한 서버의 도메인 네임(domain name)을 반환함 |
| document.images  |                  `<img>`요소를 모두 반환함                  |
|  document.title  |                   `<title>`요소를 반환함                    |
|   document.URL   |            HTML 문서의 완전한 URL 주소를 반환함             |
|  document.head   |                    `<head>`요소를 반환함                    |
| document.scripts |                `<script>`요소를 모두 반환함                 |

