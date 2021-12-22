# CLI



**1. CLI & GUI**

   - CLI(Command Line Interface)

     - 터미널을 통해 사용자와 컴퓨터가 상호작용하는 방식
- 검은 창과 명령어를 사용
     - GUI가 나오기 전 컴퓨터의 생김

     

   - GUI(Graphic User Interface)

     - 그래픽을 통해 사용자와 컴퓨터가 상호작용하는 방식
     - 현재 우리에게 보여지는 화면
     - GUI의 등장으로 컴퓨터가 대중화 됨

     

---

 

**2. CLI를 사용하는 이유**

   - GUI에 비해 단계가 적고 GUI로는 불가능한, 세부적인 기능을 사용할 수 있음



---



 **3. 명령어**

- **폴더 생성**_*mkdir*
     - *새 폴더를 생성하는 명령어*
     - 띄어쓰기의 경우 따옴표('')로 묶어준다.


```bash
$ mkdir hi
$ mkdir 'hi hello'
```



- **파일 생성**_*touch*
  - *파일을 생성하는 명령어*
  - 여러 파일을 한 번에 생성할 땐 띄어쓰기로 구분하면 된다. 

```bash
$ touch test.txt
$ touch a.txt b.txt c.txt
$ touch .amazing.txt
```



- **폴더 및 파일 목록 확인**_*ls*
     - *현재 작업 중인 directory의 폴더 및 파일 목록을 보여주는 명령어*
     - -a : 'all' 옵션. 숨김파일까지 보여준다.
     - -l : 'long' 옵션. 용량, 수정 날짜 등 파일 정보를 자세히 보여준다.

```bash
$ ls
$ ls -a
$ ls -a -l
$ ls -al
```



- **Directory 변경**_*cd*
     - *현재 작업 중인 directory를 변경하는 명령어*
     - cd /c/users/amazing/desktop : **절대 경로**를 통한 변경
     - cd ../hi/hello : **상대 경로**를 통한 변경
     - cd ~ : home directory로 이동(~ 빼도 됨)
     - cd .. : 상위 directory로 이동
     - cd - : 이전 directory로 이동

```markdown
>>> cd 폴더
>>> cd /c/users/amazing/desktop
>>> cd ../
>>> cd ~
```



- **폴더 및 파일 삭제**_*rm*
     - *폴더 및 파일 지우는 명령어*
     - 휴지통으로 이동하지 않고, 바로 삭제한다.
     - rm *.txt : txt파일 전체 삭제
     - rm -r : recursive 옵션. 폴더를 지울 때 사용

```bash
>>> rm test.txt
>>> rm -r new
>>> rm *.txt
```



- **폴더 및 파일 열기**_*start*
  - *폴더 및 파일을 여는 명령어*
  - mac에서는 **open**을 사용

```bash
>>> start test.txt
>>> open test.txt
```




