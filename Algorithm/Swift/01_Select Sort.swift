// 선택 정렬: 배열을 정렬된 부분과 정렬되지 않은 부분으로 나눈 뒤, 정렬되지 않은 부분에서 최솟값을 선택하여 정렬된 부분의 끝에 추가하는 방식

// array 안에 있는 숫자를 정렬해 보세요.
var array = [6, 10, 5, 8, 7, 1, 4, 3, 2, 9]

// array 요소만큼 반복문 시작
for i in 0..<array.count {
    // 최솟값 설정: 가장 첫 요소부터 정렬 시작
    var minIndex = i

    // 기준 요소 다음부터 반복문 시작: 기준과 비교하여 데이터 설정
    for j in i+1..<array.count {
        // 값이 더 작으면 최솟값으로 설정
        if array[minIndex] > array[j] {
            minIndex = j
        }
    }
    
    // array value 스와핑
    let value = array[i]
    array[i] = array[minIndex]
    array[minIndex] = value
}

// array 출력
print(array)
