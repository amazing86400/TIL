# CDN이란?



​	**CDN(Contents Delivery Network)**이란 콘텐츠 전송 네트워크라는 뜻으로 영화, 뮤직비디오, 스포츠 등 콘텐츠를 인터넷망을 통해 빠르고 안정적으로 전달해 주는 서비스를 말한다. 즉, '콘텐츠 전송망'이라고 할 수 있겠다. 보통 **'Jquery'**를 사용하려면 js 파일과 CSS 파일을 일일이 다운 받아 그걸 ftp 연결해서 서버 폴더 안에 넣어주고 사용한다. 하지만 CDN은 그냥 SWIPER 서버에서 js와 CSS 파일을 갖다 쓰기 때문에 `<link>` 태그로 링크를 불러오기만 하면 된다. 이는 매우 편하고 용이하다.

​	실무에서도 CDN을 많이 사용하는데 그 이유는 **'업데이트의 자동화'** 때문이다. 예를 들어 내가 구버전 파일로 서버에 올려 Jquery를 불러왔는데, 새로운 버전으로 업데이트가 되어 swiper 사용에 오류가 날 경우 개발자는 업데이트될 때마다 새로운 버전의 파일을 다운받아 서버에 올려야 한다. 이 과정은 매우 번거롭기 때문에 실무에서는 웬만해서 모두 CDN 방식으로 일처리를 한다. 이처럼 가장 간단하고 편한 방법이어서 코딩 실력이 부족한 개발자여도 쓰기가 매우 쉽다.
