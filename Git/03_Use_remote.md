# Remote 활용하기



#### git remote

- local 저장소에 remote 저장소를 **등록, 조회, 삭제** 할 수 있는 명령어

  - 등록_remote add

    - remote 저장소가 등록된다.
    - git remote add <이름> <주소>

    ```bash
    $ git remote add origin https://github.com/주소
    ```

    

  - 조회_remote -v

    - add를 이용해 추가했던 remote 저장소의 이름과 주소가 출력된다.

    ```bash
    $ git remote -v
    origin https://github.com/주소 (fetch)
    origin https://github.com/주소 (push)
    ```

    

  - 삭제_remote rm

    - local 저장소와 remote 저장소의 연결을 끊는다.
    - 단, remote 저장소 자체를 삭제하는 것이 아니다.

    ```bash
    $ git remote rm origin
    $ gir remote remove origin
    ```

    

---



#### push

- local 저장소의 commits을 **remote 저장소에 업로드**하는 명령어
- git push <저장소 이름> <branch 이름> 형식으로 작성한다.
- -u 옵션을 사용하면 다음 commits부터는 저장소, branch 이름을 생략해도 된다.

```bash
$ git push origin master
$ git push -u origin master
```



---



#### clone

- remote 저장소의 commits 내역을 모두 가져와서, **local 저장소를 생성**하는 명령어
- clone은 '복제'라는 뜻으로, git clone 명령어를 사용하면 remote 저장소를 통째로 복제해서 내 컴퓨터에 옮길 수 있다.
- git bash에 들어가서 git clone <주소> 형식으로 작성한다.
- git clone을 통해 생성된 local 저장소는 git init과 git remote add가 이미 수행되어 있다.

```bash
$ git clone https://github.com/주소
```



---



#### pull

- remote 저장소의 **변경 사항을 가져와서, local 저장소를 업데이트**하는 명령어
- git pull <저장소 이름> <branch 이름> 형식으로 작성한다.
- 만약 local 저장소와 remote 저장소의 내용이 완전 일치하면 git pull을 해도 아무 변화가 일어나지 않는다.

```bash
$ git pull
```

