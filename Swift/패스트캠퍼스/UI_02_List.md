# List

iPhone의 설정 앱 화면을 보고 직접 따라 그려보았다. 이번에는 `NavigationStack`과 `List`를 활용해서 레이아웃을 구상했다. `List`에 포함된 정보 중 Text와 이미지를 표현할 때 `HStack` 대신에 코드를 더 간결하게 유지하기 위해 `Label`이라는 UI 컴포넌트를 활용했다. 그리고 하나의 구조체를 생성하여 이미지, 텍스트, 그리고 이미지 색상을 전달하면 `Label`이 자동으로 생성되도록 설계했다. 이로써 코드의 가독성을 높이고 길이를 줄일 수 있었다.

또한 `Section`이라는 컴포넌트를 활용하여 리스트를 구분했다. `Section`을 사용하면 각 콘텐츠를 시각적으로 나눌 수 있어 화면이 깔끔하게 유지되며, 각 콘텐츠 영역을 쉽게 확인할 수 있다.

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
