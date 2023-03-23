1. Python에서 `~a`는 C에서의 `~a`와 다름(왜 다른지는 나도 모름)
2. 따라서, `~a`를 직접 구현해야 함

방법은 두가지 임

## `^` 연산자

a가 1비트라고 해보자

1 ^ a는 a의 비트를 반전한 것과 같다

1|a|1^a
-|-|:-:
1|1|0
1|0|1

따라서, `0b1...1 ^ a`는 C에서의 `~a`와 같음

## `-` 연산자

a가 1비트라고 해보자

1 - a는 a의 비트를 반전한 것과 같다

1|a|1-a
-|-|:-:
1|1|0
1|0|1

따라서 `0b1...1 - a`는 C에서의 `~a`와 같음
a가 16-bit이므로, 0xFFFF ^ a또는 0xFFFF - a는 ~a와 같다

## 결론

a가 16-bit이므로,
`0xFFFF ^ a`또는 `0xFFFF - a`는 `~a`와 같다