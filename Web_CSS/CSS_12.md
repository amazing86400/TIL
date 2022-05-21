# list 태그 블릿, 기호, 점 없애기



### 블릿 없애기

```css
<style>
ul{
   list-style:none;
   }
</style>
```

​	property는 'list-style'을 사용하고 value를 'none'으로 주면 쉽게 제거할 수 있다.



### 블릿 + 들여쓰기 없애기

```css
<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>
```

​	들여쓰기는 왼쪽 padding을 없애주면 된다.