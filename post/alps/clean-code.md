---
marp: true
theme: tum
title: Clean-Code
footer: 1515 서영원
author: 1515 서영원
class: invert
paginate: true 
math: true
---

# 좋은 코드 작성하기

---

# 좋은 코드?

- 보기 좋은
- 알아보기 쉬운
- 유지보수하기 쉬운
- 수정하기 쉬운
- 취약점이 없는

---

# 좋은 코드 왜 짬?

굳이 해야됨?

---

# 좋은 코드 왜 짬?

```c
int t[3];
char buf[128];
scanf("%s", buf);
char *p = &buf[0];
for (int i = 0, k = 0; i <= strlen(p); ++i)
    if (p[i] == '.' || p[i] == 0)
    {
        p[i] = 0;
        t[k++] = atoi(p);
        p += i + 1;
        i = 0;
    }
```

```c
int t[3];
scanf("%d.%d.%d", t, t + 1, t + 2);
```

놀랍게도 같은 역할을 하는 코드임

---

# 좋은 코드 왜 짬?

```python
i=input;print(["대박나는","무난한","운이 안좋은"][sum(map(int,i().split('.')+[i()]))%100//10%3],"해")
```

```python
birth = input().split('.')
current = input()
total = sum(map(int,birth+[current]))
status = total % 100 // 10 % 3
if status == 0:
    print("대박나는 해")
elif status == 1:
    print("무난한 해")
elif status == 2:
    print("운이 안좋은 해")
```

놀랍게도 같은 역할을 하는 코드임

---

# ? 저따구로 짜는 사람이 있음?

ㅇㅇ 있음

실제 사례를 보자

---

<p style="width: 50%; margin-left: auto; margin-right: auto;">
    <img src="https://logos-world.net/wp-content/uploads/2020/11/League-of-Legends-Logo.png"/>
</p>

---

# LoL의 사례

- 10년 넘게 서비스하는 대형 게임인 만큼, 게임 전체가 스파게티 코드 덩어리
- 비슷한 스킬들이 전부 다르게 설계됨
- 새로운게 추가될 때마다 기존 것과 호환이 안됨
- 새로 만드는 것은 임시방편으로 **예외 케이스들을 일일히 처리**하는 식으로 버그를 수정
- 결국, **임시방편**

---

# LoL의 사례

- 특히 렝가는 코드가 심하게 꼬여 있어서 몇 년째 버그를 수정하는데도 계속해서 버그가 나오고 있음
- 2021년 기준으로 발견된 버그만 해도 50개에 달함
- 그 중 게임 플레이에 영향을 미치지 않는 버그는 **단 3개**
- 나머지 버그들은 죄다 인게임에 치명적인 영향을 줬던 버그 
- 그 뒤를 사일러스와 비에고가 이으며 현재까지도 **임시방편**식 버그 수정을 거듭

---

# 스파게티 코드

<p style="width: 50%; margin-left: auto; margin-right: auto; display: flex; justify-content: center; align-items: center;">
    <img src="spaghetti-code.jpg"/>
    <img src="https://blog.finxter.com/wp-content/uploads/2020/11/image-46.png"/>
</p>

---

# 그래서 어떻게 해결함?

몇가지 원칙이 있음

---

# 소프트웨어 개발 3대 원칙

- **KISS** : **K**eep **I**t **S**imple **S**tupid
- **YAGNI** : **Y**ou **A**in't **G**onna **N**eed **I**t
- **DRY** : **D**o not **R**epeat **Y**ourself

---

# KISS

```c
float add_or_sub(float a, float b, bool isPlus) {
  if(isPlus) {
    return a + b;
  } else {
    return a - b;
  }
}
```

```c
float add(float a, float b) {
  return a + b;
}

float sub(float a, float b) {
  return a - b;
}
```

* **하나의 함수는 하나의 일**만 해야 한다

---

# YAGNI

```c
void you_may_not_need_it(void) {
    /* do stuff.. */
}

int main(void) {
    /* do something... */
    return 0;
}
```

```c
int main(void) {
    /* do something... */
    return 0;
}
```

* **사용하지 않는 기능은 없애라**

---

# DRY

```c
int foo[100];
// do a stuff...
for (int i = 0; i < 100; ++i)
    foo[i] = 0;
// do last stuff...
for (int i = 0; i < 100; ++i)
    foo[i] = 0;
// do real last stuff...
for (int i = 0; i < 100; ++i)
    foo[i] = 0;
// do super real last stuff...
```

---

# DRY

```c
void reset(int arr[100]) {
    for (int i = 0; i < 100; ++i)
        arr[i] = 0;
}

int foo[100];
// do a stuff...
reset(foo);
// do last stuff...
reset(foo);
// do real last stuff...
reset(foo);
// do super real last stuff...
```

* **똑같은거 여러번** 쓰지 마라

---

# 끝?

그럴리가

---

# SOLID 원칙

- **S**RP : Single Responsibility Principle
- **O**CP : Open/Closed Principle
- **L**SP : Liskov Subsitution Principle
- **I**SP : Interface Segregation Principle
- **D**IP : Dependency Inversion Principle

---

# 이뭔씹

객체지향을 먼저 이해해보자

<p style="width: 50%; margin-left: auto; margin-right: auto; display: flex; justify-content: center; align-items: center;">
    <img src="https://jongminfire.dev/static/375a067573d73f987cc12f19f7e7d341/bbfed/What-is-OOP.png"/>
</p>

---

# SRP : 단일 책임 원칙

- **하나의 클래스는 하나의 일**만 하자
- 왜? 하나 변경한다고 다른 클래스도 수정할 일이 생김
- 귀찮기도 하고, 휴먼-에러의 확률이 높아짐

---

# OCP : 개방-폐쇄 원칙

- **확장은 쉽게, 변경은 어렵게**
- 기존의 코드를 수정하지 않고, 기능을 추가할 수 있도록

---

# LSP : 리스코프 치환 법칙

- **하위 타입 객체는 상위 타입 객체에서 가능한 행위를 수행**할 수 있어야 함
    - 상위 타입 객체를 하위 타입 객체로 치환해도, 코드는 작동해야 한다
- 상속 관계가 아닌데도 클래스들을 상속 관계로 지정하면 안된다

---

# ISP : 인터페이스 분리 원칙

- **하나의 인터페이스는 하나의 일**만 하자
- 클래스가 사용하지도 않는 함수를 구현하지 않게 하기 위해

---

# DIP : 의존관계 역전 원칙

- **추상화에 의존**하고, **구체화에는 의존하지 마**라
- 변하기 쉬운 것(구체적인 것) 보다는 변하기 어려운 것(추상적인 것)에 의존해라
- 유지보수가 쉬우니까

---

# 이런거 쉽게 하는 언어 없음?

있음!

---

# C# 쓰세요

---

# 끝
