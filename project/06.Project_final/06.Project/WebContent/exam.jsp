<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.getAttribute("code");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Subject</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function fnSelect() {
		var msg = "선택하신 과목이 맞습니까?";
		msg += "\n시험에 응시하기를 누르세요";
		if (confirm(msg)) {
			subject();
			return true;
		}
		return false;
	}
	function fnSubmit() {
		var msg = "시험이 끝났습니까?";
		msg += "\n답안을 제출합니다";
		if (confirm(msg)) {
			return true;
		}
		return false;
	}
	function subject() {
		if ($("select option:selected").val() == '정보처리기사') {
			$(".test").css("display", "block");
			$(".test2").css("display", "none");
			$(".test3").css("display", "none");
			$("#submit").show();
		} else if ($("select option:selected").val() == '전기기능사') {
			$(".test").css("display", "none");
			$(".test2").css("display", "block");
			$(".test3").css("display", "none");
			$("#submit").show();
		} else if ($("select option:selected").val() == '자동차정비기능사') {
			$(".test").css("display", "none");
			$(".test2").css("display", "none");
			$(".test3").css("display", "block");
			$("#submit").show();

		}
	}
</script>
</head>
<body>
	<form action="result.do" method="post">
		<div align="center">
		<div>
			<select name="subject">
				<option selected="selected">과목을 선택하세요</option>
				<option value="정보처리기사">정보처리기사</option>
				<option value="전기기능사">전기기능사</option>
				<option value="자동차정비기능사">자동차정비기능사</option>
			</select>
		</div>
			<input type="button" value="응시하기" onclick="return fnSelect();" />
		</div>
	<img alt="" src="" />
		<div>
			<div class="test" style="display:none;">
				<div>
					<h1>정보처리기사</h1>
					<h4>1. 운영체제 분석을 위해 리눅스에서 버전을 확인하고자 할 때 사용되는 명령어는?</h4>
					<input type="hidden" name="code" value= "<%= request.getAttribute("code")%>"/>
					<label><input type="radio" name="code1" value="1"/>① ls</label><br>
					<label><input type="radio" name="code1" value="2"/>② cat</label><br>
					<label><input type="radio" name="code1" value="3"/>③ pwd</label><br>
					<label><input type="radio" name="code1" value="4"/>④ uname</label><br>
					<input type="radio" name="code1" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>2. 통신을 위한 프로그램을 생성하여 포트를 할당하고, 클라이언트의<br> 통신 요청 시 클라이언트와 연결하는 내·외부 송·수신 연계기술은?</h4>
					<label><input type="radio" name="code2" value="1">① DB링크 기술</label><br>
					<label><input type="radio" name="code2" value="2">② 소켓 기술</label><br>
					<label><input type="radio" name="code2" value="3">③ 스크럼 기술</label><br>
					<label><input type="radio" name="code2" value="4">④ 프로토타입 기술</label><br>
					<input type="radio" name="code2" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>3. 객체지향 개념에서 연관된 데이터와 함수를 함께 묶어<br> 외부와 경계를 만들고 필요한 인터페이스만을 밖으로 드러내는 과정은?</h4>
					<label><input type="radio" name="code3" value="1">① 메시지(Message)</label><br>
					<label><input type="radio" name="code3" value="2">② 캡슐화(Encapsulation)</label><br>
					<label><input type="radio" name="code3" value="3">③ 다형성(Polymorphism)</label><br>
					<label><input type="radio" name="code3" value="4">④ 상속(Inheritance)</label><br>
					<input type="radio" name="code3" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>4. GoF(Gangs of Four) 디자인 패턴의 생성패턴에 속하지 않는 것은?</h4>
					<label><input type="radio" name="code4" value="1">① 추상 팩토리(Abstract Factory)</label><br>
					<label><input type="radio" name="code4" value="2">② 빌더(Builder)</label><br>
					<label><input type="radio" name="code4" value="3">③ 어댑터(Adapter)</label><br>
					<label><input type="radio" name="code4" value="4">④ 싱글턴(Singleton)</label><br>
					<input type="radio" name="code4" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>5. 응용프로그램의 프로시저를 사용하여 원격 프로시저를 로컬 프로시저처럼 호출하는 방식의 미들웨어는?</h4>
					<label><input type="radio" name="code5" value="1">① WAS(Web Application Server)</label><br>
					<label><input type="radio" name="code5" value="2">② MOM(Message Oriented Middleware)</label><br>
					<label><input type="radio" name="code5" value="3">③ RPC(Remote Procedure Call)</label><br>
					<label><input type="radio" name="code5" value="4">④ ORB(Object Request Broker)</label><br>
					<input type="radio" name="code5" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>6. 바람직한 소프트웨어 설계 지침이 아닌 것은?</h4>
					<label><input type="radio" name="code6" value="1">① 모듈의 기능을 예측할 수 있도록 정의한다.</label><br>
					<label><input type="radio" name="code6" value="2">② 이식성을 고려한다.</label><br>
					<label><input type="radio" name="code6" value="3">③ 적당한 모듈의 크기를 유지한다.</label><br>
					<label><input type="radio" name="code6" value="4">④ 가능한 모듈을 독립적으로 생성하고<br> 결합도를 최대화한다.</label><br>
					<input type="radio" name="code6" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>7. 현행 시스템 분석에서 고려하지 않아도 되는 항목은?</h4>
					<label><input type="radio" name="code7" value="1">① DBMS 분석</label><br>
					<label><input type="radio" name="code7" value="2">② 네트워크 분석</label><br>
					<label><input type="radio" name="code7" value="3">③ 운영체제 분석</label><br>
					<label><input type="radio" name="code7" value="4">④ 인적 자원 분석</label><br>
					<input type="radio" name="code7" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>8. 분산 컴퓨팅 환경에서 서로 다른 기종 간의 하드웨어나<br> 프로토콜, 통신환경 등을 연결하여 응용프로그램과 운영환경 간에 원만한 통신이<br> 이루어질 수 있게 서비스를 제공하는 소프트웨어는?</h4>
					<label><input type="radio" name="code8" value="1">① DB링크 기술</label><br>
					<label><input type="radio" name="code8" value="2">② 소켓 기술</label><br>
					<label><input type="radio" name="code8" value="3">③ 스크럼 기술</label><br>
					<label><input type="radio" name="code8" value="4">④ 프로토타입 기술</label><br>
					<input type="radio" name="code8" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>9. CASE(Computer Aided Software Engineering)에 대한 설명으로 틀린 것은?</h4>
					<label><input type="radio" name="code9" value="1">① 소프트웨어 모듈의 재사용성이 향상된다.</label><br>
					<label><input type="radio" name="code9" value="2">② 자동화된 기법을 통해 소프트웨어 품질이 향상된다.</label><br>
					<label><input type="radio" name="code9" value="3">③ 소프트웨어 사용자들에게 사용 방법을 신속히 <br>숙지시키기 위해 사용된다.</label><br>
					<label><input type="radio" name="code9" value="4">④ 소프트웨어 유지보수를 간편하게 수행할 수 있다.</label><br>
					<input type="radio" name="code9" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>10. 기본 유스케이스 수행 시 특별한 조건을 만족할 때 수행하는 유스케이스는?</h4>
					<label><input type="radio" name="code10" value="1">① 연관</label><br>
					<label><input type="radio" name="code10" value="2">② 확장</label><br>
					<label><input type="radio" name="code10" value="3">③ 선택</label><br>
					<label><input type="radio" name="code10" value="4">④ 특화</label><br>
					<input type="radio" name="code10" value="0" style="display:none;" checked="checked"/>
				</div>
			</div>
			
			<div class="test2" style="display:none;">
				<div>
					<h1>전기기능사</h1>
					<h4>1. 2전력계법으로 3상 전력을 측정할 때 지시값이 P1=200W, P2=200W이었다. 부하전력(W)은?</h4>
					<label><input type="radio" name="sub1" value="1">① 600</label><br>
					<label><input type="radio" name="sub1" value="2">② 500</label><br>
					<label><input type="radio" name="sub1" value="3">③ 400</label><br>
					<label><input type="radio" name="sub1" value="4">④ 300</label><br>
					<input type="radio" name="sub1" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>2. 플레밍의 왼손법칙에서 전류의 방향을 나타내는 손가락은?</h4>
					<label><input type="radio" name="sub2" value="1">① 엄지</label><br>
					<label><input type="radio" name="sub2" value="2">② 검지</label><br>
					<label><input type="radio" name="sub2" value="3">③ 중지</label><br>
					<label><input type="radio" name="sub2" value="4">④ 약지</label><br>
					<input type="radio" name="sub2" value="0" style="display:none;" checked="checked"/>
					
				</div>
				<div>
					<h4>3. 진공 중에 10μC과 20μC의 점전하를 1m의 거리로 놓았을 때 작용하는 힘(N)은?</h4>
					<label><input type="radio" name="sub3" value="1">① 18×10-1</label><br>
					<label><input type="radio" name="sub3" value="2">② 2×10-2</label><br>
					<label><input type="radio" name="sub3" value="3">③ 9.8×10-9</label><br>
					<label><input type="radio" name="sub3" value="4">④ 98×10-9</label><br>
					<input type="radio" name="sub3" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>4. 전력량 1Wh와 그 의미가 같은 것은?</h4>
					<label><input type="radio" name="sub4" value="1">① 1C</label><br>
					<label><input type="radio" name="sub4" value="2">② 1J</label><br>
					<label><input type="radio" name="sub4" value="3">③ 3600C</label><br>
					<label><input type="radio" name="sub4" value="4">④ 3600J</label><br>
					<input type="radio" name="sub4" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>5. 응용프로그램의 프로시저를 사용하여 원격 프로시저를 로컬 프로시저처럼 호출하는 방식의 미들웨어는?</h4>
					<label><input type="radio" name="sub5" value="1">① WAS(Web Application Server)</label><br>
					<label><input type="radio" name="sub5" value="2">② MOM(Message Oriented Middleware)</label><br>
					<label><input type="radio" name="sub5" value="3">③ RPC(Remote Procedure Call)</label><br>
					<label><input type="radio" name="sub5" value="4">④ ORB(Object Request Broker)</label><br>
					<input type="radio" name="sub5" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>6. 평형 3상 회로에서 1상의 소비전력이 P(W)라면, 3상회로 전체 소비전력(W)은?</h4>
					<label><input type="radio" name="sub6" value="1">① 2P</label><br>
					<label><input type="radio" name="sub6" value="2">② √2 P</label><br>
					<label><input type="radio" name="sub6" value="3">③ 3P</label><br>
					<label><input type="radio" name="sub6" value="4">④ √3 P</label><br>
					<input type="radio" name="sub6" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>7. 어떤 교류회로의 순시값이 v=√2Vsinωt(V)인 전압에서 ωt=π/6(rad)일 때<br> 100√2V이면 이 전압의 실효값(V)은?</h4>
					<label><input type="radio" name="sub7" value="1">① 100</label><br>
					<label><input type="radio" name="sub7" value="2">② 100√2</label><br>
					<label><input type="radio" name="sub7" value="3">③ 200</label><br>
					<label><input type="radio" name="sub7" value="4">④ 200√2</label><br>
					<input type="radio" name="sub7" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>공기 중에서 m(Wb)의 자극으로부터 나오는 자속수는?(</h4>
					<label><input type="radio" name="sub8" value="1">① m</label><br>
					<label><input type="radio" name="sub8" value="2">② μ0m</label><br>
					<label><input type="radio" name="sub8" value="3">③ 1/m</label><br>
					<label><input type="radio" name="sub8" value="4">④ m/μ0</label><br>
					<input type="radio" name="sub8" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>9. 0.2℧의 컨덕턴스 2개를 직렬로 접속하여 3A의 전류를 흘리려면 몇 V의 전압을 공급하면 되는가?</h4>
					<label><input type="radio" name="sub9" value="1">① 12</label><br>
					<label><input type="radio" name="sub9" value="2">② 15</label><br>
					<label><input type="radio" name="sub9" value="3">③ 30</label><br>
					<label><input type="radio" name="sub9" value="4">④ 45</label><br>
					<input type="radio" name="sub9" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>10. 1차 전지로 가장 많이 사용되는 것은?</h4>
					<label><input type="radio" name="sub10" value="1">① 니켈·카드뮴전지</label><br>
					<label><input type="radio" name="sub10" value="2">② 연료전지</label><br>
					<label><input type="radio" name="sub10" value="3">③ 망간건전지</label><br>
					<label><input type="radio" name="sub10" value="4">④ 납축전지</label><br>
					<input type="radio" name="sub10" value="0" style="display:none;" checked="checked"/>
				</div>
			</div>
			
			<div class="test3" style="display:none;">
				<div>
					<h1>자동차정비기능사</h1>
					<h4>1. 디젤기관의 연소실 형식으로 틀린 것은?</h4>
					<label><input type="radio" name="car1" value="1">① 직접분사식</label><br>
					<label><input type="radio" name="car1" value="2">② 예연소실식</label><br>
					<label><input type="radio" name="car1" value="3">③ 와류식</label><br>
					<label><input type="radio" name="car1" value="4">④ 연료실식</label><br>
					<input type="radio" name="car1" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>2. EGR(Exhaust Gas Recirculation) 밸브에 대한 설명 중 틀린 것은?</h4>
					<label><input type="radio" name="car2" value="1">① 배기가스 재순환 장치이다.</label><br>
					<label><input type="radio" name="car2" value="2">② 연소실 온도를 낮추기 위한 장치이다.</label><br>
					<label><input type="radio" name="car2" value="3">③ 증발가스를 포집하였다가 연소시키는 장치이다.</label><br>
					<label><input type="radio" name="car2" value="4">④ 질소산화물(NOx) 배출을 감소하기 위한 장치이다.</label><br>
					<input type="radio" name="car2" value="0" style="display:none;" checked="checked"/>
					
				</div>
				<div>
					<h4>3. 가솔린 기관의 흡기 다기관과 스로틀 보디사이에 설치되어 있는 서지탱크의 역할 중 틀린 것은?</h4>
					<label><input type="radio" name="car3" value="1">① 실린더 상호간에 흡입공기 간섭 방지</label><br>
					<label><input type="radio" name="car3" value="2">② 흡입공기 충진 효율을 증대</label><br>
					<label><input type="radio" name="car3" value="3">③ 연소실에 균일한 공기 공급</label><br>
					<label><input type="radio" name="car3" value="4">④ 배기가스 흐름 제어</label><br>
					<input type="radio" name="car3" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>4. 전자제어 연료분사 가솔린 기관에서 연료펌프의 체크 밸브는 어느 때 닫히게 되는가?</h4>
					<label><input type="radio" name="car4" value="1">① 기관 회전 시</label><br>
					<label><input type="radio" name="car4" value="2">② 기관 정지 후</label><br>
					<label><input type="radio" name="car4" value="3">③ 연료 압송 시</label><br>
					<label><input type="radio" name="car4" value="4">④ 연료 분사 시</label><br>
					<input type="radio" name="car4" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>5. 기관에 사용하는 윤활유의 기능이 아닌 것은?</h4>
					<label><input type="radio" name="car5" value="1">① 마멸 작용</label><br>
					<label><input type="radio" name="car5" value="2">② 기밀 작용</label><br>
					<label><input type="radio" name="car5" value="3">③ 냉각 작용</label><br>
					<label><input type="radio" name="car5" value="4">④ 방청 작용</label><br>
					<input type="radio" name="car5" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>6. 가솔린기관 압축압력의 단위로 쓰이는 것은?</h4>
					<label><input type="radio" name="car6" value="1">① rpm</label><br>
					<label><input type="radio" name="car6" value="2">② ㎜</label><br>
					<label><input type="radio" name="car6" value="3">③ PS</label><br>
					<label><input type="radio" name="car6" value="4">④ kgf/cm2</label><br>
					<input type="radio" name="car6" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>7. 압력식 라디에이터 캡을 사용하므로 얻어지는 장점과 거리가 먼 것은?</h4>
					<label><input type="radio" name="car7" value="1">① 비등점을 올려 냉각 효율을 높일 수 있다.</label><br>
					<label><input type="radio" name="car7" value="2">② 라디에이터를 소형화 할 수 있다.</label><br>
					<label><input type="radio" name="car7" value="3">③ 라디에이터의 무게를 크게 할 수 있다.</label><br>
					<label><input type="radio" name="car7" value="4">④ 냉각장치 내의 압력을 높일 수 있다.</label><br>
					<input type="radio" name="car7" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>8. 실린더의 안지름이 100㎜, 피스톤 행정 130㎜, 압축비가 21일 때 연소실용적은 약 얼마인가?</h4>
					<label><input type="radio" name="car8" value="1">① 25cc</label><br>
					<label><input type="radio" name="car8" value="2">② 32cc</label><br>
					<label><input type="radio" name="car8" value="3">③ 51cc</label><br>
					<label><input type="radio" name="car8" value="4">④ 58cc</label><br>
					<input type="radio" name="car8" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>9. 가솔린의 주요 화합물로 맞는 것은?</h4>
					<label><input type="radio" name="car9" value="1">① 탄소와 수소</label><br>
					<label><input type="radio" name="car9" value="2">② 수소와 질소</label><br>
					<label><input type="radio" name="car9" value="3">③ 탄소와 산소</label><br>
					<label><input type="radio" name="car9" value="4">④ 수소와 산소</label><br>
					<input type="radio" name="car9" value="0" style="display:none;" checked="checked"/>
				</div>
				<div>
					<h4>10. 점화지연 의 3가지에 해당되지 않는 것은?</h4>
					<label><input type="radio" name="car10" value="1">① 기계적 지연</label><br>
					<label><input type="radio" name="car10" value="2">② 점성적 지연</label><br>
					<label><input type="radio" name="car10" value="3">③ 전기적 지연</label><br>
					<label><input type="radio" name="car10" value="4">④ 화염 전파지연</label><br>
					<input type="radio" name="car10" value="0" style="display:none;" checked="checked"/>
				</div>
			</div>
			<div id="submit" align="center" style="display:none;">
				<input type="submit" value="제출하기"
					onclick="return fnSubmit()">
			</div>	
		</div>
	</form>
</body>
</html>