---
marp: true
theme: tum
title: How-To-Avoid-Bug
footer: 1515 서영원
author: 1515 서영원
class: invert
paginate: true 
math: true
---

# 버그 피하는 습관

---

# 목차

- 만약 버그가 발생하기 전이라면
    1. `Google` 사용하기 (**영어**로)
    2. 공식 문서 읽기 (**영어**로)
    3. 비공식 튜토리얼 읽지 않기
- 만약 버그가 이미 발생했다면
    1. `Google` 사용하기 (**영어**로)
    2. 공식 문서 읽기 (**영어**로)
    3. 기타 등등...

---

# `Google` 사용하기 (**영어**로)

> 오류가 발생했다고, 아무것도 안하고 다른 사람부터 찾는 사람들이 많다.
> 만약 오류가 발생했다면, 먼저 그 오류를 읽자.

- 필수적으로 들어가야하는 키워드는 `"`로 감싸자.
- 오류가 발생했을때, `<언어-이름>  <오류-종류>  <오류-메시지>`와 같이 검색하자.
- 절대 모든 로그를 복붙하지 말자
- 개발자 1대 언어는 **영어**다
- 수학 제외하곤 인도인 믿지마라

---

# 공식 문서 읽기 (**영어**로)

> 제발 어디 이상한 블로그에서 코드 복붙해오고선 동작하지 않는다고 칭얼대지 말자

- 공식문서는 니가 사용한 함수들의 올바른 사용법은 물론, **언제** 오류가 발생하는지, **어떤** 매개변수를 **왜**, **언제** 받는지, **언제** **어떤** 반환 값을 가지는지 전부 기록한다.
- `JS`는 `Mozilla docs`, `C#`은 `MS docs`, `C`는 `gcc`혹은 `msvc docs` 등등

---

# 비공식 튜토리얼 따라하지 않기

> 모든 언어는 공식 문서에서 최신 버전의 튜토리얼을 제공한다

- 니가 영어만 되면 최신 버전의 튜토리얼을 공식 사이트에서 받아볼 수 있다
    - `C/C++`: MS docs (사실상 공식)
      `JS`: W3C school
      등등...
- 언어가 아니더라도, 모든 툴, IDE 등등 또한 사용법을 어딘가에 남겨놓는다
- 비공식 튜토리얼은 대부분 Best Practice를 지키지 않고, 먼 옛날 구형 버전을 사용하는 경우가 많다

---

# 유료 강좌 보지 않기

- 비공식 튜토리얼에는 유료 강좌도 포함이다
- 영어만 되고, 기본적인 코딩만 되면, 공식 튜토리얼을 따라하는게 좋다
- 기본적인 코딩이 안되면 아직 그걸 할때가 아닌 것이다; C부터 제대로 배우고 오자

---

# 로그 읽는 습관 들이기

- 니가 기본적으로 프로그램을 짜기 시작하면, 로그를 남기는게 정석이다
- 어느 정도 규모가 있는 프로그램에서 로그를 안남기고 있다면 프로그램을 잘못짜고 있는 것이다
- 프로그램에 문제가 생기면 먼저 로그를 읽자
- 로그 분석하면서 구글링하면 대부분의 문제는 해결된다
- 해결되지 않는다면 StackOverflow나 해당 프로그램의 포럼에 글을 남기자

---

# 질문하는 방법

다음과 같은 정보를 포함하자

- OS 정보
- 프로그램 버전
- 문제가 생긴 소스 파일의 내용 (필요하다면 소스 전체를 공유할 수 있다)
- 프로그램의 예상되었던 행동/출력
- 프로그램의 실제 행동/출력

---

# 끝
