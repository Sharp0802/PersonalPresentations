---
marp: true
theme: tum
title: Multi-Threading
footer: 1515 서영원
author: 1515 서영원
class: invert
paginate: true 
math: true
---

# Multi-Threading

18년, 개발자들의 뻘짓을 알아보자

---

# 차례

1. 옛날 옛적에
2. 조금 지나서
3. 작금에 이러서는
4. 조금 더 빠르게

---

# 옛날 옛적에

`싱글코어`라는 친구가 살았어요

---

# 조금 지나서

인텔에서 `하이퍼스레딩`이라는 아이가 태어났어요

> 명령을 수행하면서 로딩 화면을 띄울 수 있다니!

---

# 작금에 이러서는

`멀티코어`라는 기술이 생겼어요

<p style="width: 50%">
<img src="https://i.namu.wiki/i/V7Cs7M_y7YxErPixcEqRkHvL2y0dGG2KCkLGTmzz9XcXVSJgHrH9H5ath1E_-BfiHDaxneKA99t2OUJH4GkIw_lDozEb-qdSCsR8Bxq_qNZ04tY__jvWJ80ZDqcqZkfhtyodK-NC7KPF_lHumTuW7Q.webp"/>
</p>

---

# 웨 않뒘?

- 동시에 한 자원에 접근(동시성 문제)
- **Non-volatile**한 자원들

---

# 해결하기

<p style="width: 45%">
<img src="https://i.namu.wiki/i/AF8QsYQXGKN60DY_nOUfT5wWubzCSBrSnnoB8UU2k3zYHtAlzmxnxmMIemyg-SFeZKhNG8m18-o3dKQe8XLuWCfQDeaOXwf9BtISMqviIYbFoXy49Ctp4dY6izRViNOK7WdhFHYGoQYUc8Wgef-McQ.webp"/>
</p>

- 자원을 잠그기(**Lock**)
- 애초에 자원을 **잠글 필요가 없게** 설계하기(**Thread-Static**)
- 해결하지 않기

---

# 웨 뒘?

<video style="width: 45%;" src="video.mp4"></video>

- 점유 문제(**`Deadlock`**)
- 제대로 일이 분배되지 않음

---

# `Deadlock`

만악의 근원

- 철학자 두명이 젓가락 한 쌍으로 밥을 먹는다
- 철학자는 한번에 하나의 젓가락만 들수 있다
- 철학자는 밥을 먹기위해 두개의 젓가락을 들어야 한다

**두명이 동시에 젓가락을 하나씩 든다면?**

-> 컴퓨터가 멈춘다(**`Deadlock`**)

---

# 조금 더 빠르게

하드웨어의 발전은 멈추었고,
이젠 소프트웨어 적으로 프로그램을 빠르게 해야할 차례

- 잡 시스템
- 비동기화
- `GPGPU`
- `Big-Little` 솔루션

---

# 비동기화

작업을 실행 할때만 스레드를 만들면 안됨?

- A작업은 시간이 오래걸린다
- B작업은 시간이 조금 걸린다

-> A작업은, 실행**할 때마다** 스레드를 만들면 어떨까?

---

# 잡 시스템

스레드를 미리 만들어 두면 안됨?

- 사용할 스레드를 미리 만들어둠(**Thread-Pool**)
- 일이 들어오면, 일이 없는 스레드에 일을 줌(스케쥴링)

---

# 잡 시스템

<p style="width: 60%;">
<img src="https://blog.kakaocdn.net/dn/mU0Ot/btqSXjAHwWo/Ptby9XyGK2ClF2H350Gd00/img.png"/>
</p>

빠르다!

---

# GPGPU

왜 CPU만 갈굼?

-> GPU도 갈궈

---

# GPGPU

GPU는 느리지만, 많다.

![Alt](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2141F4455171054917)

---

# `Big-Little` 솔루션

## ARM : Big-Little Solution

- 정말 빠르지만 비효율적인 코어
- 느리지만 효율적인 코어

둘을 섞어서 CPU에 넣는다

효율적인 작업 수행이 가능

---

# `Big-Little` 솔루션

## Intel : E코어, P코어

기본적으로 ARM과 같음

지금은 그렇게만 이해해도 상관 없다

---

# 어떻게 씀?

언어|라이브러리|비고
:-:|-|-
`C`|POSIX-`pthread`/`OpenMP`|비동기화는 알아서
`C++`|기본 지원/`OpenMP`|비동기화는 알아서
`C#`|기본 지원|다 해줌
`Java`|기본 지원|`C#`만큼은 아니지만 다 해줌
`Python`|기본 지원|비동기만 지원함
`JS`|기본 지원|`C#`만큼은 아니지만 다 해줌

---

# 이 외에도

`C++/AMP`, `OpenCL`, `DirectCompute`, `OpenGL`을 통해서 GPU연산을 쓸 수 있다!

---

# 끝
