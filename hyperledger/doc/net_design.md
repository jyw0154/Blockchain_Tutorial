## 3.3 개발 환경 설정
하이퍼레저 패브릭 블록체인의 인스턴스는 채널이라고 불리며, 이는 암호학적으로 안전하게 서로 연결된 트랜잭션의 로그이다. 블록체인 응용프로그램을 설계하고 실행하기 위한 첫 번째 단계는, 필요한 채널 수를 결정하는 것이다. 하나의 채널을 사용해서 서로 다른 참가자들 간의 거래 기록을 유지할 것이다. 응용프로그램을 설치할 네트워크를 생성하고 시작하는 방법부터 알아보자.
> 하나의 패브릭 피어는 여러 채널에 속할 수 있다. 응용프로그램 관점에서 어떤 피어가 어느 채널에 속하는지는 알 수 없지만, 하나의 피어가 여러 채널에 속하면 피어의 소유자(또는 클라이언트) 대신 서로 다른 여러 응용프로그램에서 트랜잭션을 실행하는 것이 가능하다. 하나의 채널은 여러 개의 스마트 계약을 실행할 수 있으며, 각각의 계약은 독립적인 응용프로그램이나 다중 계약 응용프로그램에 함께 연결될 수 있다.


---
## 3.3.1 네트워크 설계
* 하이퍼레저 패브릭 네트워크의 구조를 결정하는 <b>첫 번째 단계는, 참여할 조직을 나열하는 것</b>
* 논리적으로 <b>조직</b>은 <b>보안 도메인인 동시에 신원과 자격 증명의 단위</b>
* 조직은 하나 이상의 네트워크 피어를 관할
* <b>스마트 계약 접근 권한을 얻기 위해</b> 피어 및 클라이언트뿐 아니라 클라이언트의 신원과 인증서를 발급하는 <b>멤버십 서비스 공급자</b><sup>membership service provider</sup>(MSP)에 의존
> MSP는 멤버심 운영 아키텍처의 추상화를 제공하는 것을 목표로하는 구성 요소이다. 특히 MSP는 인증서 발급, 유효성 검사 및 사용자 인증에 대한 모든 암호화 메커니즘 및 프로토콜을 추상화한다. MSP는 자신의 신원 개념과 해당 신원을 관리(신원 확인) 및 인증(서명 생성 및 검증)하는 규칙을 정의할 수 있다. Hyperledger Fabric의 블록체인 네트워크는 하나 이상의 MSP에 의해 관리될 수 있다. 이는 멤버쉽 운영의 모듈화와 다른 멤버쉽 표준 및 아키텍처 간의 상호 운용성을 제공한다. 조직마다 보통 하나의 MSP가 있으며 MSP ID로 구분된다. 추가 정보로 MSP는 조직마다의 로컬의 범위에도 존재하고, 채널에 들어가고 싶은 각 PEER에도 존재한다.

* <b>트랜잭션(또는 호출) 승인의 기준은 승인 정책</b>
* 승인 정책은 응용프로그램 네트워크에 참여하는 조직의 관점이며 피어와는 관련이 없음
* 적절한 서비스를 컴퓨터에 설치하고 실행하기 위해서는 피어의 집합, 피어가 소속된 조직 및 각 조직에 서비스를 제공하는 MSP가 사전에 결정되어야 함
* 신뢰 관계를 가진 여러 주체를 하나의 조직으로 그룹화하는 것은 보안 및 비용 측면에서 효율적

> 그런데, 거래 당사자와 당사자의 은행이 같은 조직에 속해 있으면 스마트 계약과 원장에 대한 접근을 제어하기 위해 당사자와 당사자의 은행을 어떻게 구별할 수 있을까? 이를 위해서는 두 가지 방법이 있다.
1. 미들웨어 및 응용프로그램 계층에 접근 제어 논리를 포함시켜, 체인코드 기능에 대한 ID를 매핑하는 접근 제어 목록과 ID(또는 로그인 이름)로 사용자를 구분할 수 있게 한다.
2. CA 서버 역할을 하는 조직의 MSP가 조직의 구성원에게 발급한 인증서 내에 고유 속성을 포함시킬 수 있다. 접근 제어 논리는 미들웨어 또는 체인코드로 구현되어 속성을 구문 분석하고, 응용프로그램 정책에 따라 작업을 허용 또는 금지할 수 있다.

