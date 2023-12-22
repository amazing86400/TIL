# Layout

UI를 그릴 때 가장 먼저 레이아웃을 잡는다. 오늘은 iPhone의 사진 앱의 온보딩 화면을 그려봤다. 아래는 예제 코드이다.

나는 중간 영역에 중복되는 UI를 `구조체`로 따로 선언하여 코드 중복을 최소화하였다.

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
