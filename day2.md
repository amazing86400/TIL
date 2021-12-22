## Git 기초



**Git과 Github의 차이점**

- Git은 local에서 버전관리를 하는 프로그램이다.
- Github는 그 버전을 공유하는 remote 저장소이다.



---



**Git의 파일구조**

- Working Directory, Staging Area, Commits
- WD에서 add를 입력해 SA로 파일을 보낸다.
- SA에서 commit을 입력해 CM으로 보낸다. >> version 생성



---



**status**

- Working Directory와 Staging Area에 있는 *파일의 현재 상태를 알려주는 명령어*

- 수시로 확인하기!

  - **Untracked** : Git이 관리하지 않는 파일(한번도 SA에 올라간 적 없는 파일)

  - **Tracked** : Git이 관리하는 파일

    - *Unmodified* : 최신 상태
    - *Modified* : 수정되었지만 아직 SA에는 반영하지 않은 상태
    - *Staged* : SA에 올라간 상태

    

---



**commit**

- Staging Area에 올라온 파일의 변경 사항을 *하나의 version(commit)으로 저장하는 명령어*
- 각각의 commits은 **SHA-1** 알고리즘에 의해 반환된 고유의 hash 값을 ID로 갖는다.



---



**log**

- *commits의 내역을 조회할 수 있는 명령어*
- ID, 작성자, 시간, Message 등
- **옵션**

  - --oneline : 한 줄로 축약해서 보여준다.
  - --graph : branch와 merge 내역을 그래프로 보여준다.
  - --all : 현재 branch를 포함한 모든 branch 내역을 보여준다.
  - --reverse : commits 내역의 순서를 반대로 보여준다.
  - -p : 파일의 변경 내용도 같이 보여준다.
  - -2 : 원하는 갯수 만큼의 내역을 보여준다.
  
  