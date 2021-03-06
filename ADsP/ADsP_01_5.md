# 빅데이터 위기 요인 및 통제 방안



### 사생활 침해

**1. 위기 요인**

   - 정보 수집 센서들이 점점 증가하고 있고, 특정 데이터가 본래 목적이 아닌 다른 목적으로 사용될 가능성 증가
   - ex) 어느 날 목소리를 수집하는 기술로 인해 내 목소리가 수집 및 가공되어 보이스피싱에 사용될 수도 있다.

**2. 통제 방안**

   - 익명화(Anonymization): 데이터에서 개인 식별이 가능한 정보를 삭제하거나 알아볼 수 없는 형태로 변환
   - 개인 정보 활용 동의제가 아닌, 개인 정보 사용자에 대한 책임제로 전환



---



### 책임 원칙의 훼손

**1. 위기 요인**

   - 예측 기술이 발전하면서 정확도가 증가한 만큼 분석 대상이 예측 알고리즘의 희생양이 될 가능성이 증가
   - 잠재적 위험 사항에 대해서도 책임을 추궁하는 사회로 변질되어 민주주의 사회 원칙을 크게 훼손할 수 있음
   - ex) 범죄 예측 프로그램을 통해 범죄 전 체포

**2. 통제 방안**

   - 기존 책임 원칙을 강화할 수 밖에 없음



---



### 데이터 오용

**1. 위기 요인**

   - 예측의 정확도가 증가했지만, 항상 맞을 순 없음
   - 주어진 데이터에 잘못된 insight를 얻어 비즈니스에 직접 손실을 불로 올 수 있음

**2. 통제 방안**

   - 데이터 알고리즘에 대한 접근권 허용 및 객관적 인증 방안을 도입 필요성 제기



*알고리즈미스트: 데이터 분석 알고리즘으로 부당한 피해를 보는 사람을 방지하기 위해 새로 생겨난 직업*



---



### 개인 정보 비식별화 기법

**1. 데이터 마스킹(Masking)**: 개인을 식별하는데 기여할 확률이 높은 주요 개인 식별자가 보이지 않도록 처리하는 기술 (카드 뒤 4자리 숨기기, 주민 번호 뒷자리 숨기기 등)



**2. 데이터 범주화**: 변수가 가질 수 있는 가능한 값들을 몇 개의 구간으로 범주화하는 기술 

   (홍길동, 34세 >> 홍씨, 30-40세)



**3. 가명**: 개인식별 정보를 삭제 또는 알아볼 수 없는 형태로 변환

   (홍길동, 서울대 재학 >> 김한국, 한국대 재학)



**4. 잡음 첨가**: 자료 값에 잡음을 추가하거나 곱해 기존 자료를 약간 변형하여 공개

   (비디오나 음성 자료에 활용)



**5. 총계 처리 / 평균값 대체**: 데이터의 총합 값을 모임으로 개별 데이터의 값이 보이지 않도록 함



**6. 데이터 값 삭제**: 데이터 셋의 값 중 필요 없는 값 또는 개인 식별에 중요한 값 삭제