// 삽입 정렬: 각 요소를 삽입할 때마다 이전에 정렬된 부분과 비교하여 적절한 위치에 삽입하는 방식

// array 안에 있는 숫자를 정렬해 보세요.
var array = [1, 10, 5, 8, 7, 6, 4, 3, 2, 9]

// array 요소만큼 반복문 시작
for i in 0..<array.count {
    var j = i
    // j가 0이 아니면서 기준 요소보다 앞 쪽에 위치한 요소의 크기가 작으면 값 변경
    while j > 0 && array[j-1] > array[j] {
        var temp = array[j]
        array[j] = array[j-1]
        array[j-1] = temp
        j -= 1
    }
}

// array 출력
print(array)