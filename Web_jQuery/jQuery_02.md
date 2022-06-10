# CSS



```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    var test = {
        setbackground : function(color){
            $('body').css("background", color);
        }

        setfontcolor : function(color){
            $('a').css("color", color);
        }
    }
</script>
```

​	HTML에서 [CDN](https://developers.google.com/speed/libraries#jquery)을 통해 jQuery 라이브러리를 불러온다.(나는 Google의 가장 최신 CDN을 사용했다.) 다운로드 받아서 사용해도 되지만 CDN이 편리하기에 이 방법을 택했다.

​	jQuery를 사용하여 CSS 작업을 해주면 기존에 했던 Javascript 보다 훨씬 수월하게 코딩을 할 수 있다