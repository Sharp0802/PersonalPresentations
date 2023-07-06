---
marp: true
theme: tum
title: Optimization-For-Large-Scale-IoT-Environment
footer: 1515 서영원
author: 1515 서영원
class: invert
paginate: true 
math: true
---

# Optimization For Large Scale IoT Environment

거대 IoT 환경에 대한 최적화 기법 연구

---

# IoT

- IoT가 뭔지는 잘 알았다
- 지금도 잘 쓰고 있는데, 딱히 별 문제 있나?

---

# 비대화

집 안에 있는 물품들을 나열해보자

|||||||
|:--|:--|:--|:--|:--|:--|
| 오븐 | 냉장고 | 에어컨 | 선풍기 | 화분 | 문 |
| 책장 | 침대 | 의자 | 휴대폰 | 컴퓨터 | 개수대 |
| 변기 |  책장 | TV | 보일러 | 정수기 | 싱크대 |

---

# IoT를 붙여보자

P2P 네트워크 모형을 그려보면...

<p>
    <img style="width: 50%;" src="structure-ittange.png" />
</p>

여기에 전파를 어떻게 쏴요;;

---

# 웨 몼솜?(진짜 모름)

- 전파 방해(낮은 안정성)
- 낮은 효율성
- 낮은 전성비(높은 비용)

---

# 좀 어떻게 우아하게 못함?

<p>
    <img style="width: 50%;" src="structure-choechumdan.png" />
</p>

공돌이는 무료로 해줍니다.

---

# 그 이게 백준도 아니고

어떻게 만드는지는 알려줘야죠

---

# Voronoi Diagram

<p>
    <img style="display: inline; width: 37%;" src="https://www.researchgate.net/publication/325582898/figure/fig1/AS:634324529451008@1528246161046/Voronoi-diagram-in-a-plane.png" />
    <img style="display: inline; width: 35%;" src="https://www.toolfarm.com/images/uploads/blog/voronoi-in-nature.jpg" />
    <img style="display: inline; width: 25.5%;" src="https://parametrichouse.com/wp-content/uploads/2022/10/Voronoi-in-Nature-05.jpg" />
<p>

1. 자연은 답을 알고있다
2. O(n log n)에 찾을 수 있으니 빠르다

---

# 그래서 이걸 어떻게 씀?

---

# Delaunay Triangulation

<p>
    <img style="display: inline; width: 30%;" src="https://www.researchgate.net/publication/324045163/figure/fig1/AS:608971782107136@1522201595268/Delaunay-triangulation-solid-lines-and-Voronoi-diagram-dashed-lines-for-20-points.png" />
    <img style="display: inline; width: 62%;" src="https://www.researchgate.net/publication/341330506/figure/fig2/AS:895364609622017@1590482966597/a-Landmark-face-detection-b-Delaunay-computation-c-Voronoi-triangulation.png" />
</p>

1. Voronoi Diagram이랑 1:1 매칭됨
2. O(n)에 그릴 수 있음
3. 즉, O(n log n)에 찾을 수 있다

---

# 그러면?

IoT에 연결될 기기를 하나의 정점으로 보면 되지 않을까?

*(편의상 기기들이 2차원 평면에 있다고 가정: 원래는 3차원 voronoi diagram을 그려야 함)*

---

# 적용 후

<p>
    <img style="display: inline; width: 58%;" src="voronoi-applied.png" />
</p>

전선 길이가 줄어든건 알겠는데, 전파가 벽을 뚫는건 똑같은거 아님?

---

# (유사)충돌감지

- ping이 뭘까?
    - 전파가 송신되고 수신되기까지의 시간(term)
    - 이게 길면 길수록
        1. 중간에 방해물이 있거나
        2. 송신자와 수신자의 거리가 멀다

그렇다면, 대충 ping이 낮은 몇몇개의 연결만을 유지하면 되지 않을까?

---

# 적용 후

<p>
    <img style="display: inline; width: 58%;" src="mst-applied.png" />
</p>

조금 더 적절한 네트워크 모델을 얻을 수 있게 되었다

---

# 근데

- 굳이 여러개가 망처럼 연결되야함?
- 실제로, 망처럼 관리하는 것은 보안상으로도 그렇고, 그냥 관리하기 힘들다

---

# 왜 Mesh처럼 연결하는게 위험함?

1. 각각의 기기들은 모두 같은 권한을 가진다
2. 기기들은 자신에게 정보가 들어오면
    1. 가지고 있던 정보라면 버린다
    2. 안가지고 있던거면 남들한테도 뿌리고 저장한다

- 위와 같은 과정을 거칠텐데, 만약 해커가 기기들 중 하나를 해킹했다면?
    - 나머지 기기들도 해커에 의한 정보를 아무 의심 없이 읽어온다

---

# 대안 있음?

- 있다
- 트리형태로 관리하면 된다
- 비교적 안전하고, 관리하기 쉽다

---

# 그래프를 어떻게 트리로?

- 최소 팽창 트리(Minimum-Spanning-Tree: MST)라는게 있다
- 총 간선들의 길이를 최소로 하면서 모든 정점들이 연결되게 하는 알고리즘

\* 단, 이 네트워크 모델에서 각 간선의 길이는 ping이 된다.

---

# 결과물

<p>
    <img style="display: inline; width: 58%;" src="mst-applied+.png" />
</p>

---

# Before-After


<p>
    <img style="display: inline; width: 32%;" src="voronoi-applied.png" />
    <img style="display: inline; width: 32%;" src="mst-applied.png" />
    <img style="display: inline; width: 32%;" src="mst-applied+.png" />
</p>

---

# 그러면...

<p>
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
    <img style="display: inline; width: 15%;" src="mst-applied+.png" />
</p>

학봉관 중앙에 서버가 있고,
한 호실이 클러스터가 되어 작동하면 되겠네?

---

# 보안관리는?

여기서부터는 봐야할 사람들과 관심있는 사람만 보면 된다

- 개발자
    - 내가 이런걸 안봐도 될꺼라고 생각이 든다면 봐야한다
    - 자신감 곡선을 기억하자
- 보안쪽에 관심있는 사람들

---

# 비대칭키/대칭키 암호화

- 대칭키: 암호화와 복호화가 같은 비밀키로 이뤄진다
- 비대칭키:
    - 키가 A, B두 개가 있다.
    - A로 암호화된건 B로 복호화할 수 있고
    - B로 암호화된건 A로 복호화될 수 있다.

---

# 통신에 활용하기 1: 키 교환

1. BoB에게는 공개 키 $K_u$와 개인 키 $K_r$이 있다
2. Alice가 임의의 문자열을 만들고 이걸 $K_u$로 암호화한다 $\rightarrow M_u$
3. Alice는 $M_u$을 Bob에게 전송한다
4. Bob은 개인 키 $K_r$를 통해 $M_u$의 내용을 알 수 있다

이 방법을 통해 통신하는 Alice와 Bob은 대칭키 암호화를 위한 키를 교환할 수 있다

---

# 통신에 활용하기 2: 전자서명

1. Alice가 보낼 메시지의 해시값을 만들고 이걸 Alice의 개인 키 $K_a$로 암호화하여 메시지 평문과 함께 전송한다 $\rightarrow H_a$
2. Bob은 $M_a$를 잘 알려진 Alice의 공개키인 $K_b$로 복호화할 수 있다. $\rightarrow H_b$
3. 만약 $H_a = H_b$라면, Bob은 Alice를 신뢰할 수 있다

이 짓을 서버와 클라이언트 둘 다 하게되면 각각은 서로를 신뢰할 수 있게 된다.
즉, 서버측에는 사용할 기기들을 미리 등록해둬야 하고, 클라이언트 측에는 서버를 등록해둬야 한다.

---

# 그럼 이제 프로토콜만 정하면 되겠다

연결이 지속되어야 하니까

- TCP
- QUIC
- 기타 등등...

(단, Application Layer에 있는 것들은 되도록 쓰지 말고 Transport Layer에 있는 것들을 쓰자: Application Layer는 무겁다)

---

# TCP vs QUIC

- 아무튼 QUIC이 더 빠르고 좋다
- 궁금한 사람은 아래 링크로 들어가보자
- https://github.com/Shenggan/quic_vs_tcp

---

# 학습 내용

- Voronoi Dia