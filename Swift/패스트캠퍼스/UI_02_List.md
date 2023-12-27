# List

이번 시간에는 `List`를 활용한 설정 화면을 그려봤다. 아래는 예제 코드이다.

우선 코드 중복을 방지하기 위해 `List`에 들어가는 정보 중 `Text`와 `이미지`, 그리고 `이미지 색상`을 구조체로 선언하여 설정하도록 했다. 또한 이번에 `Label`이라는 UI 컴포넌트도 사용했는데, `Label`은 이미지(icon)와 텍스트를 함께 표시해 주는 기능이다. 만일 이 컴포넌트를 몰랐다면 `HStack` 이미지와 텍스트를 각각 배치했을 것이다.

그리고 `Section`이라는 컴포넌트도 사용했는데, `Section`은 리스트를 구분하여 나타내준다. `Section`을 사용하지 않고 `List`를 각각 나누게 되면 화면이 아예 분할되어 나타나는데, `Section`을 사용하면 콘텐츠 별로 영역을 나눠서 확인할 수 있다.

## 소스 코드

```swift
struct SetInfo: Hashable {
    var nameLable: String
    var imgName: String
    var backgroundColor: Color
}

struct SettingView: View {

    var data: [[SetInfo]] = [
        [
            SetInfo(nameLable: "스크린 타임", imgName: "hourglass", backgroundColor: .indigo),
            SetInfo(nameLable: "동작 버튼", imgName: "iphone.and.arrow.forward", backgroundColor: .blue)
        ],
        [
            SetInfo(nameLable: "일반", imgName: "gear", backgroundColor: .gray),
            SetInfo(nameLable: "손쉬운 사용", imgName: "accessibility", backgroundColor: .blue),
            SetInfo(nameLable: "개인정보 보호 및 보안", imgName: "hand.raised.fill", backgroundColor: .blue)
        ],
        [
            SetInfo(nameLable: "암호", imgName: "key.fill", backgroundColor: .gray)
        ],
        [
            SetInfo(nameLable: "Safari", imgName: "safari", backgroundColor: .blue),
            SetInfo(nameLable: "사진", imgName: "photo", backgroundColor: .cyan)
        ],
        [
            SetInfo(nameLable: "개발자", imgName: "hammer.fill", backgroundColor: .gray)
        ]
    ]

    var body: some View {
        NavigationStack {
            List {

                ForEach(data, id: \.self) { section in
                    Section {
                        ForEach(section, id: \.self) { label in
                            Label(
                                title: { Text(label.nameLable) },
                                icon: {
                                    Image(systemName: label.imgName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 23, height: 23)
                                        .padding(.all, 4)
                                        .background(label.backgroundColor)
                                        .foregroundStyle(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 7))
                                }
                            )
                        }
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}
```

<br>

### 화면 이미지

<p align="center">
  <img src="./asset/02_설정 화면.png" width="50%" height="50%" />
</p>
