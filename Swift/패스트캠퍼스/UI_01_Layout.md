# Layout

iPhone의 사진 앱 온보딩 화면을 보고 직접 따라 그려보았다. 먼저 `Layout`을 그리고, 필요한 세부 컴포넌트를 구상했다. 화면이 세로로 정렬돼 있어 `VStack`이 필요하다고 판단했고, 그 후, 아이콘 이미지, 텍스트, 그리고 하단에 배치된 버튼이 필요했다.

중복된 코드를 피하기 위해 콘텐츠를 담을 하나의 구조체 뷰를 만들었다. 이 구조체에 이미지와 텍스트를 전달하면 해당 콘텐츠가 자동으로 생성되도록 설계했다. 이를 통해 코드의 가독성과 재사용성을 높일 수 있었다.

### 소스 코드

```swift
import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
            Text("What's New in Photos")
                .font(.system(size: 35))
                .bold()
                .padding(.vertical, 60)

            VStack(alignment: .leading) {
                MyContent(imgTxt: "rectangle.stack", headLineTxt: "Albums in the Photos Widget", bodyTxt: "Enjoy your photos from any custom album in the Photos widget.")
                    .padding(.bottom, 15)

                MyContent(imgTxt: "pawprint", headLineTxt: "Pets Album", bodyTxt: "Find Photos and videos of your cat or dog in the Albums tab, along with people.")
                    .padding(.bottom, 15)

                MyContent(imgTxt: "crop.rotate", headLineTxt: "Pinch to Crop", bodyTxt: "Crop, rotate, or flip any photo faster by pinching to zoom, then tapping Crop.")
                    .padding(.bottom, 15)

                MyContent(imgTxt: "memories", headLineTxt: "More Cutomizable Memories", bodyTxt: "Reorder the photos and videos in a Memory or add any photo from your library.")
            }
            Spacer()

            Button {

            } label: {
                Text("Continue")
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 60)

        }
    }
}

// 콘텐츠 뷰 struct
struct MyContent: View {
    var imgTxt: String
    var headLineTxt: String
    var bodyTxt: String

    var body: some View {
        HStack {
            Image(systemName: imgTxt)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(.blue)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(headLineTxt)
                    .font(.headline)
                Text(bodyTxt)
                    .font(.body)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
    }
}


#Preview {
    Onboarding()
}
```

<br>

### 화면 이미지

<p align="center">
  <img src="./asset/01_온보딩 화면.png" width="50%" height="50%" />
</p>
