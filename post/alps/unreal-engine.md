---
marp: true
theme: tum
title: Unreal-Engine
footer: 1515 서영원
author: 1515 서영원
class: invert
paginate: true 
math: true
---

# Unreal-Engine 심화편

다시 한번의 주제 뺏기

---

# 이거 또 해도 됨?

- 저번 발표는 살짝, `언리얼_엔진 = 뭐`라는 느낌이다
- 이번 발표는 언리얼 엔진을 왜 쓰는지, 뭐가 좋은지 알아볼 예정
- 업계 2위, 유니티 엔진과도 비교해 볼 예정

---

# 왜 씀?

- 강력한 엔진
- 소규모 사업에선 사실상 무료
- 업계를 선도하는 기술들
    - Nanite 나나이트
    - Lumen 루멘
    - Niagara 나이아가라
    - Meta-Sound 메타 사운드

---

<iframe width="100%" height="100%"
        src="https://www.youtube.com/embed/8sY9dune0zQ?controls=0"
        frameborder="0"
        allow="autoplay"
        allowfullscreen>
</iframe>

---

# Lumen

<p style="width: 50%; margin-left: auto; margin-right: auto; display: flex; justify-content: center; align-items: center;">
    <img src="https://docs.unrealengine.com/5.0/Images/building-virtual-worlds/lighting-and-shadows/global-illumination/lumen/LumenGI_Apartment.webp">
    <img src="https://docs.unrealengine.com/5.0/Images/building-virtual-worlds/lighting-and-shadows/global-illumination/lumen/LumenTechDemo_3.webp">
</p>

---

# Lumen

<p style="width: 50%; margin-left: auto; margin-right: auto; display: flex; justify-content: center; align-items: center;">
    <img src="https://docs.unrealengine.com/5.0/Images/building-virtual-worlds/lighting-and-shadows/global-illumination/lumen/Lumen_Emissive.webp">
    <img src="https://docs.unrealengine.com/5.0/Images/building-virtual-worlds/lighting-and-shadows/global-illumination/lumen/LumenReflections.webp">
</p>

---

# Lumen

놀랍게도, 네 사진 전부 언리얼 엔진 5에서 구현된 모습

---

# Lumen?

- 언리얼 엔진 5에서는 독자적인 GI를 구현했다

- 그 이름이 바로 Lumen

- 그럼 GI는 뭘까?

---

# GI?

- Global Illumination(전역 조명)의 약자
- 대충 말해서는, Ray-Tracing(광선 추적)을 활용해 빛을 표현하는 방식
- 다른 재질, 물체, 벽 등에 반사되는 간접광까지 계산한다
- 무겁다
- RTX에서만 돌릴 수 있(었)다

---

# Lumen

- 루멘은 다르다
- 지금까지 사용되던 GI를 갈아엎고, 새로 구현했다
- RTX가 아니어도 좋다
- 성능도 더 잘 나온다

---

# Nanaite?

- Nanaite도 고전적인 폴리곤은 맞다
- LOD + (압축기술) = Nanaite
- Mesh를 폴리곤 그룹의 클러스터로 나눈다

---

# Nanaite

- 여러개의 Mesh를 한번에 그린다
- 100% GPU 기반
- 자세한 내용은 [문서](https://docs.unrealengine.com/5.0/ko/nanite-virtualized-geometry-in-unreal-engine/)를 참고하자

---

# Niagara?

- [문서](https://docs.unrealengine.com/5.1/en-US/overview-of-niagara-effects-for-unreal-engine/)를 참고하자

---

# Meta-Sound

<iframe width="100%" height="100%"
        src="https://www.youtube.com/embed/AQ1zPhnoGJQ?controls=0"
        frameborder="0"
        allow="autoplay"
        allowfullscreen>
</iframe>

---

# 그래서 Unity랑 Unreal중에 뭐씀?

- 사실, 쓰이는 분야가 다르고, 게임 규모에 따라 다름
- 결국, 만드는 제품의 특성에 따라 고르면 된다

구분 |유니티|언리얼
-:|:----:|:----:
규모|중소|AAA
주 분야|모바일/2D/간단한 3D|데스크톱/콘솔/3D
언어|C#|Cpp
비주얼 스크립팅|BOLT|Verse,BluePrint
난이도|중하|상

---

# 끝