// 버블 정렬: 인접한 두 요소를 비교하여 작은 값을 앞으로 이동시키는 방식으로 동작 방식

// array 안에 있는 숫자를 정렬해 보세요.
var array = [1, 10, 5, 8, 7, 6, 4, 3, 2, 9]

// array 요소만큼 반복문 시작
for i in 0..<array.count {
    // 큰 값을 뒤로 보내기 때문에 범위를 요소 크기 - 1로 설정
    for j in 0..<array.count - 1 {
        // 기준 요소와 그 다음 요소를 비교하여 큰 값을 뒤로 보냄
        if array[j] > array[j+1] {
            let value = array[j]
            array[j] = array[j+1]
            array[j+1] = value
        }
    }
}

// array 출력
print(array)