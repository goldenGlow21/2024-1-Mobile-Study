# 목표

- State에 대해 이해해보자
- 상태관리 툴들을 알아보자

# State, Stateless, Stateful

## 명령형 UI / 선언형 UI

### 명령형 UI

- 전통적 방식의 UI
- UI 구성 방식의 'How'에 집중한다
- 기술적 구현 방식의 세부 사항을 유저가 하나하나 짚어주는 방식
- 따라서 명확한 구현을 위해서는 구현 사항의 정확한 명세를 알아야 한다

### 선언형 UI

- UI 가 무엇을 구성할지, 즉 'What'에 집중한다
- 기술적 구현 사항은 정확히 몰라도 괜찮다
- 도형의 좌표면 상 방정식을 몰라도 도형 자체는 그릴 수 있는 것과 같은 맥락

- **F(State) = View**
- 위젯 / 함수에 인자로 State를 넘겨주면 View의 형태로 나온다는 것을 의미

## 플러터의 UI

- 플러터는 선언형 UI 차용
- 여러가지 위젯들에 State를 제공하는 방식으로 UI를 구성

# State?

**"State는 곧 Data"**

이 문장에 기반하여 Data에 대해 알아보자.
페이지에서 나타나는 정보들을 살펴보면 이들을 두가지로 구분할 수 있는데, 그것이 AppData와 WidgetData
## AppData

- 앱의 전반에서 널리 사용되는 데이터
- 일종의 전역변수 느낌
## WidgetData

- 위젯 내부에서 운용되는 데이터
- 일종의 지역변수 느낌

이 데이터들은 앱을 사용하는 과정에서 그 내용이 보여지게 되며, 그 자체로 State로서의 성질을 가진다.

즉, State는 앱이 보여주려는 데이터와 그 모습이다.

# Stateless / Stateful

## Stateless

- 표현할 데이터가 없음을 의미
- 완전한 void가 아닌, 정적으로 표시되는 모습을 의미
- 즉, 새로고침을 통해 update되는 data를 지니지 않음을 의미

## Stateful

- '상태'를 가지는 위젯
- 즉, 변화할 여지를 가진다
- 새로고침을 통해 update되는 data를 지님을 의미
- 유저와의 상호작용이 대부분 이를 통하여 이루어진다

## Stateful Widget의 템플릿

```
class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State createState() => _HomePageState();

}

class _HomePageState extends State {
	CalendarFormat calenderFormat = CalendarFormat.month;

	DateTime selectedDate = DateTime.now();

	@override
	Widget build(BuildContext context) {
		return Container();
	}
}
```

- setState() 함수: 위젯을 다시 그리기 전 적용할 명령어 집합을 매개변수로 받아 '새로고침'을 수행하는 함수


# 상태관리 tool들의 예시

## Provider

- 간단한 앱 state 관리 도구
## Riverpod

- Provider와 비슷한 결로 작동
- compile safety 제공: 코드가 언어의 규칙을 따름, 즉 사용하는 언어의 명세에 따라 컴파일러가 특정 에러는 발생하지 않는다고 판단할 수도 있음
- Flutter SDK에 기반하지 않고도 testing 기능을 수행 가능
## GetX

- 경량 / 간편화
- 시각적으로 관측 가능한 형태로, 특정 event에 대해 지속적으로 반응하며 '새로고침'되는 상태를 구현하기 위한 솔루션

## setState

- 특정 위젯에 대한 순간적인 state를 처리하기 위한 저수준 상에서의 접근 방법

## Redux

- 가장 보편적이며 많이 알려진, 그리고 가장 많이 사용되는 state container
- "app-level state management": 여러 컴포넌트가 공유하는 상태를 관리하기 위해 사용되는 라이브러리
- 주로 Javascript에서 상태관리를 위해 사용됨
- Node.js 의 모듈에 근본을 둔다
- Redux의 state: component의 안에서 관리되는 것을 의미
	- component: 재사용이 가능한 각각의 독립된 모듈