# Git bash



### git config

```bash
git config --global user.name "amazing"
git config --global user.email "amazing@github.com"
```

​	repository 생성하고 연결할 시 가장 먼저 config 작업부터 해준다. 위 코드는 사용자의 이름과 이메일을 등록하는 작업이다. 이메일의 경우 깃허브에 등록한 이메일과 동일한 이메일로 입력해야 한다.



```bash
git config --list
```

​	잘 등록되었는지 확인한다. user와 email을 확인해서 잘 등록되었는지를 확인한다.



----



### repository 연결

```bash
git init
```

​	init은 initialize의 준말로 'git을 쓸 준비, 내가 초기화를 해주겠다'라는 의미이다. 프로젝트 가장 첫 단계에서 init을 해준다.



```bash
git remote add origin git@github.com:amazing/first-project.git

git remote -v
```

​	로컬과 깃허브 연결하는 코드다. 이렇게 연결하면 연결고리가 생성되어 push와 pull이 가능해진다. 두 번째 코드로 확인해 주면 된다.



---



### 연동 오류

```visual basic
hint: updates were rejected because the remote contains work that you do
hint: not have locally. this is usually caused by another repository pushing
hint: to the same ref. you may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again. 
hint: see the 'note about fast-forwards' in 'git push --help' for details.
```

​	이러한 에러가 난 이유는 원격 저장소와 현재 로컬 저장소가 동기화되어 있지 않기 때문이다. 해결 방법의 경우 동기화 시켜주면 간단히 해결된다.



```bash
git pull --rebase origin master
```

​	위 코드를 입력한 뒤 다시 push 하면 정상적으로 작동할 것이다.