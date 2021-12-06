<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="com.hanul.study.testDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8"); 
	//오브젝트로 전달됨 -> 클래스로 받고, 클래스로 캐스팅
	ArrayList<Integer> list = (ArrayList<Integer>) request.getAttribute("list");
	ArrayList<Integer> answerList = (ArrayList<Integer>) request.getAttribute("answerList");
	
	Integer testerid = Integer.parseInt(request.getParameter("testerid"));
	String testername = request.getParameter("testername");
	Integer score = (Integer) request.getAttribute("score");
	
	String pup = null;
	if(score>=60){
		pup = "합격";
	}else {
		pup ="불합격";
	}//if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
<style >
	@import url("css/resultScore.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/resultScore.js"></script>
</head>
<body>
	<div class="container">
	<div id="wrap">
		<h1>시험 결과</h1>
			<%
				if(score <60 ){
					out.print("<div class = 'score'>");
					out.print("점수 : " + score + "점<br /><br />");
					out.print("<span class='unpass'>불합격입니다. 좀 더 노력하세요.</span>");
					out.print("</div>");
				}else {
					out.print("<div class = 'score'>");
					out.print("점수 : " + score + "점<br /><br />");
					out.print("<span class='pass'>축하드립니다. 합격입니다.</span>");
					out.print("</div>");
				}//if
			%>
		
		<table>
			<tr>
				<th>구분</th>
				<%for (int i = 1; i <= 20; i++) {%>
				<th>문제 <%=i%> 번</th>
				<%} %>
			</tr>
			<tr>
				<td>수험자<br/>선택</td>
				<%
					for (int i = 0; i < list.size(); i++) {
						out.print("<td>");
						out.print(list.get(i) + "번");
						out.print("</td>");
					}
				%>
			</tr>

			<tr>
				<td>정답</td>
				<%
					for (int i = 0; i < answerList.size(); i++) {
						out.print("<td>");
						out.print(answerList.get(i) + "번");
						out.print("</td>");
					}
				%>
			</tr>
			
			<tr>
				<td>정답<br/>비교</td>
				<%
					for(int i=0; i <20; i++){
						out.print("<td>");
						if(list.get(i)==answerList.get(i)) {
							out.print("<span class='right'>정답</span>");
						}else {
							out.print("<span class='wrong'>오답</span>");
						}
						out.print("</td>");
					}
				%>
			</tr>
			
			<!-- 버튼 -->
			<tr>
				<td>해설<br/>보기</td>
				<td><input type="button" value="해설보기" id="ex1" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex2" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex3" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex4" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex5" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex6" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex7" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex8" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex9" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex10" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex11" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex12" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex13" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex14" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex15" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex16" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex17" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex18" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex19" class="ex"></td>
				<td><input type="button" value="해설보기" id="ex20" class="ex"></td>
			</tr>
		</table>
		
	<form action="exit.jsp" method="get" name="testresult">
		<div id="testresult">
			<input type="number" name="tester_id" id="tester_id" value="<%=testerid %>" readonly="readonly"/>
			<input type="text" name="tester_name" id="tester_name" value="<%=testername %>"  readonly="readonly"/>
			<input type="text" name="pup" id="pup" value =<%=pup %> readonly="readonly" /> 
			<input type="number" name="score" id="score" value = <%=score %> readonly="readonly" /> 
			<input type="text" name="test" id="test" value="응시" readonly="readonly" />
		</div>
		<div>
			<input type="submit" value="종료" class="exit" id="exit"/>
		</div>
	</form>
	</div>
	</div>
	<!-- 해설값 클래스 부여해서 한번에 스타일 주기-->
	<div id="Q1" class="popup" >
		<div id="Q1_A" class="popmenu">
       <p>문제 1번</p>
       <img src="css/images/question/Q1.png">
       <div class="scroll">
       		[정답] : 3 번 <br /> <br />
       		[문제 해설]	<br /><br />
						시스템 구성요소<br />
	
						1. 입력 (Input) : 처리 방법, 처리할 데이터, 조건을 시스템에 투입하는 것
						<br />2. 처리 (Process) : 입력된 데이터를 처리 방법과 조건에 따라 처리하는 것
						<br />3.출력 (Output) : 처리된 결과를 시스템에서 산출하는 것
						<br />4.제어 (Control) : 자료를 입력하여 출력될 때까지의 처리 과정이 올바르게 진행되는지 감독하는 것
						<br />5.피드백 (Feedback) : 출력된 결과가 예정된 목표를 만족시키지 못할 경우 목표 달성을 위해 반복 처리하는 것
						<br />
						▶ Maintenance는 유지보수로서, 시스템 구성요소에는 포함되지 않음.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  	<div id="Q2" class="popup" >
		<div id="Q2_A" class="popmenu">
       <p>문제 2번</p>
       <img src="css/images/question/Q2.png">
       <div class="scroll">
       		[정답] : 2 번 <br /><br />
       		[문제 해설]	<br /><br />
					<br />유스케이스는 시스템이 액터에게 제공해야 하는 기능으로, 시스템의 요구사항이자 기능을 의미

					<br />유스케이스 다이어그램은 사용자의 요구를 추출하고 분석하기 위해 주요 사용
					<br />여기서 액터는 시스템 외부에서 시스템과 상호작용하는 사람 혹은 시스템을 말함

					<br />사용자 액터: 기능을 요구하는 대상이나 시스템의 수행결과를 통보받는 사용자 혹은 기능을 사용하게 될 대상으로
					<br />시스템이 제공해야하는 기능인 유스케이스의 권한을 가지는 대상, 역할

					<br />시스템 액터: 사용자 액터가 사용한 유스케이스를 처리해주는 외부 시스템, 시스템의 기능 수행을 위해서 연동이 되는 또 다른 시스템 액터를 의미
      		<br />
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
 	<div id="Q3" class="popup" >
		<div id="Q3_A" class="popmenu">
       <p>문제 3번</p>
       <img src="css/images/question/Q3.png">
       <div class="scroll">
       		[정답] : 1 번 <br /><br />
       		[문제 해설]	<br /><br />
					요구사항을 "도출"해야 "분석"하고, 분석해야 자세히 쓸수 있고(=명세), 명세를 검토해야 한다.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  <div id="Q4" class="popup" >
		<div id="Q4_A" class="popmenu">
       <p>문제 4번</p>
       <img src="css/images/question/Q4.png">
       <div class="scroll">
       		[정답] : 1 번 <br /><br />
       		[문제 해설]	<br /><br />
       		<br />2번의 message는 객체에게 어떤 행위를 하도록 지시하는 명령
					<br />3번의 method는 객체에 소속된 함수를 의미
					<br />4번의 module은 실행코드와 객체들(함수, 클래스, 변수)의 묶음
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  <div id="Q5" class="popup" >
		<div id="Q5_A" class="popmenu">
       <p>문제 5</p>
       <img src="css/images/question/Q5.png">
       <div class="scroll">
       		[정답] : 4 번 <br /><br />
       		[문제 해설]	<br /><br />
       		최악의 수행시간은 O(nlog n) 이다.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  <div id="Q6" class="popup" >
		<div id="Q6_A" class="popmenu">
       <p>문제 6</p>
       <img src="css/images/question/Q6.png">
       <div class="scroll">
       		[정답] : 3 번 <br /><br />
       		[문제 해설]	<br /><br />
       		단위 테스트는 테스트 코드가 독립적이어야 함으로 각 모듈간의 상호작용은 해당되지 않는다
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  <div id="Q7" class="popup" >
		<div id="Q7_A" class="popmenu">
       <p>문제 7</p>
       <img src="css/images/question/Q7.png">
       <div class="scroll">
       		[정답] : 2 번 <br /><br />
       		[문제 해설]	<br /><br />
       		1번 : 살충제 패러독스: 동일한 테스트 케이스로 반복 실행하면 더이상 새로운 결함을 발견할 수 없으므로 주기적으로 테스트 케이스를 점검하고 개선.
					<br />3번 : 오류 부재의 궤변: 사용자의 요구사항을 만족하지 못한다면 오류를 발견하고 제거해도 품질이 높다고 말할 수 없음.
      		<br />4번 : 완벽 테스팅 불가 : 모든 경우의 테스팅 불가하며, 효율적 테스팅이 필요함.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

  <div id="Q8" class="popup" >
		<div id="Q8_A" class="popmenu">
       <p>문제 8</p>
       <img src="css/images/question/Q8.png">
       <div class="scroll">
       		[정답] : 4 번 <br /><br />
       		[문제 해설]	<br /><br />
					형상 감사: 기준선의 무결성을 평가하기 위해 확인, 검증, 검열 과정을 통해 공식적으로 승인하는 작업
					<br /><br />
					<b>[소프트웨어 버전 등록 관련 주요 용어]</b> <br />
					<br />- 저장소: 최신 버전의 파일들과 변경 내역에 대한 정보들이 저장되어 있는 곳
					<br />- 가져오기(import): 버전 관리가 되고 있지 않은 아무것도 없는 저장소에 처음으로 파일을 복사
					<br />- 체크아웃: 프로그램을 수정하기 위해 저장소에서 파일을 받아 옴, 소스 파일과 함께 버전 관리를 위한 파일들을 받아 옴
					<br />- 체크인: 체크아웃한 파일의 수정을 완료한 후 저장소의 파일을 새로운 버전으로 갱신
					<br />- 커밋: 체크인을 수행할 때 이전에 갱신된 내용이 있는 경우에는 충돌을 알리고 diff 도구를 이용해 수정한 후 갱신 완료
					<br />- 동기화: 저장소에 있는 최신 버전으로 자신의 작업공간을 동기화
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

  <div id="Q9" class="popup" >
		<div id="Q9_A" class="popmenu">
       <p>문제 9</p>
       <img src="css/images/question/Q9.png">
       <div class="scroll">
					[정답] : 4 번 <br /><br />
       		[문제 해설]	<br /><br />
					1. 개념적 설계: 사용자의 요구사항 분석 후, 데이터베이스에 대한 추상적인 형태를 설계
					<br />&nbsp;- 개념적 모델을 이용한 개념적 스키마 생성(데이터베이스에 대한 추상적인 설계도, 개체 관계 다이어그램)
					<br /><br />
					2. 논리적 설계: 논리적 모델을 이용하여 논리적 스키마 생성
					<br />&nbsp;- ERD를 이용하여 데이터베이스 스키마를 설계, 테이블 구조도, 개념적 설계 단계에서 생성된 ERD를 바탕으로 생성되는 테이블들의 집합
					<br /><br />
					3. 물리적 설계: 특정 DBMS가 제공하는 물리적 구조에 따라 테이블 저장 구조 설계
					<br />&nbsp;- 필드의 데이터 타입, 인덱스, 테이블 저장 방법 등을 정의

       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

  <div id="Q10" class="popup" >
		<div id="Q10_A" class="popmenu">
       <p>문제 10</p>
       <img src="css/images/question/Q10.png">
       <div class="scroll">
					[정답] : 1 번 <br /><br />
					[문제 해설]	<br /><br />
					시스템 카탈로그는 DBMS가 스스로 생성하고 유지하기 때문에, INSERT, DELETE, UPDATE문으로 시스템 카탈로그를 갱신하는 것은 허용되지 않음.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

  <div id="Q11" class="popup" >
		<div id="Q11_A" class="popmenu">
       <p>문제 11</p>
       <img src="css/images/question/Q11.png">
       <div class="scroll">
					[정답] : 2 번 <br /><br />
					[문제 해설]	<br /><br />
					검색결과에 중복되는 레코드를 없애기 위해서는 'SELECT' 명령 뒤에 'DISTINCT'키워드를 사용
					<br /><br />WHERE절 뒤는 원하는 조건.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

  <div id="Q12" class="popup" >
		<div id="Q12_A" class="popmenu">
       <p>문제 12</p>
       <img src="css/images/question/Q12.png">
       <div class="scroll">
					[정답] : 3 번 <br /><br />
					[문제 해설]	<br /><br />
					뷰는 데이터베이스 객체이기 때문에 DDL로 작성하거나 삭제. 작성할 때는 CREATE VIEW, 삭제할 때는 DROP VIEW를 사용.
					<br />- 뷰의 작성
					<br /> CREATE VIEW 뷰명 AS SELECT 명령
					<br /><br />- 뷰는 필요에 따라 열을 지정할 수도 있는데, 이 경우엔 이름 뒤에 괄호로 묶어 열을 나열. 
					<br /> CREATE VIEW 뷰명 (열명1, 열명2, ... ) AS SELECT 명령 
					<br /><br />- 뷰의 삭제 
					<br /> DROP VIEW 뷰명
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	 <div id="Q13" class="popup" >
		<div id="Q13_A" class="popmenu">
       <p>문제 13</p>
       <img src="css/images/question/Q13.png">
       <div class="scroll">
					[정답] : 3 번 <br /><br />
					[문제 해설]	<br /><br />
					- Collision Domain : 충돌 발생을 검출할 수 있는 브리지 간 혹은 다른 계층 장치 간의 이더넷 세그먼트 범위
					<br />- CSMA/CD : 이더넷에서 각 단말이 정송 공유 매체에 규칙있게 접근하기 위한 매체 엑세스 제어 방식
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	<div id="Q14" class="popup" >
		<div id="Q14_A" class="popmenu">
       <p>문제 14</p>
       <img src="css/images/question/Q14.png">
       <div class="scroll">
					[정답] : 4 번 <br /><br />
					[문제 해설]	<br /><br />
					결합도 (강→약)
					<br />
					내용(content) → 공통(common) → 외부(external) → 제어(control)→
					<br/> 스탬프 → (stamp) → 자료(data)
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	<div id="Q15" class="popup" >
		<div id="Q15_A" class="popmenu">
       <p>문제 15</p>
       <img src="css/images/question/Q15.png">
       <div class="scroll">
					[정답] : 3 번 <br /><br />
					[문제 해설]	<br /><br />
						a = 4 → 2진수 변환 시 : 100
					<br/>b = 7 → 2진수 변환 시 : 111
					<br/>
					<br/>	| : or 연산자 : 둘 중 하나만 1이여도 1로 나타내므로 111 이되고, 10진수로 변환 시 7이 됨.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	<div id="Q16" class="popup" >
		<div id="Q16_A" class="popmenu">
       <p>문제 16</p>
       <img src="css/images/question/Q16.png">
       <div class="scroll">
					[정답] : 2 번 <br /><br />
					[문제 해설]	<br /><br />
					 - Detection(탐지) : 교착상태 발생을 허용하고 발생 시 원인을 규명하여 해결 (ex 자원할당 그래프)
					<br /> - Avoidance (회피) : 교착상태 가능성을 배제하지 않고 적절하게 피해나가는 방법 (ex 은행원 알고리즘)
					<br /> - Recovery (예방) : 교착상태 발견 후 현황대기를 배제시키거나 자원을 중단하는 메모리 할당 기법 (ex 선점, 프로세스 중지(희생자 선택)
					<br /> - Prevention(예방) : 교착상태의 필요조건을 부정함으로써 교착상태가 발생하지 않도록 미리 예방하는 방법 (ex 현황대기, 비선점, 점유와 대기, 상호배제 4가지 부정)
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	<div id="Q17" class="popup" >
		<div id="Q17_A" class="popmenu">
       <p>문제 17</p>
       <img src="css/images/question/Q17.png">
       <div class="scroll">
					[정답] : 1 번 <br /><br />
					[문제 해설]	<br /><br />
					MBR : memory buffer register으로, 기억장치를 출입하는 데이터가 잠시 기억되는 레지스터
					<br />NAC : network access control, PC의 MAC주소를 IP 관리 시스템에 등록, 일관된 보안관리 기능을 제공
					<br />NIC : 물리 계층과 데이터 계층의 서비스를 제공
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>

	<div id="Q18" class="popup" >
		<div id="Q18_A" class="popmenu">
       <p>문제 18</p>
       <img src="css/images/question/Q18.png">
       <div class="scroll">
					[정답] : 1 번 <br /><br />
					[문제 해설]	<br /><br />
					SSH의 기본 네트워크 포트는 22번.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>
  
  	<div id="Q19" class="popup" >
		<div id="Q19_A" class="popmenu">
       <p>문제 19</p>
       <img src="css/images/question/Q19.png">
       <div class="scroll">
					[정답] : 4 번 <br /><br />
					[문제 해설]	<br /><br />
					- COCOMO : 시스템의 비용을 산정하기 위해 시스템을 구성하고 있는 모듈과 서브 시스템의 비용 합계를 계산하는 방식
					<br /> - Putnam : 소프트웨어 개발 주기의 간 단계별로 요구할 인력의 분포를 가정하는 모형
					<br /> - Function-Point(FP) : 요구 기능을 증가시키는 인자별로 가중치를 부여하여 기능의 점수를 계산하여 비용을 산정하는 방식
					<br /> - PERT : 계획 평가 및 재검토 기술, 프로젝트 관리를 분석하거나 주어진 완성 프로젝트를 포함한 일을 묘사하는데 쓰이는 모델
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>


	<div id="Q20" class="popup" >
		<div id="Q20_A" class="popmenu">
       <p>문제 20</p>
       <img src="css/images/question/Q20.png">
       <div class="scroll">
					[정답] : 3 번 <br /><br />
					[문제 해설]	<br /><br />
					 BLP 기밀성 모델: 정보의 불법적인 파괴나 변조보다는 불법적인 비밀 유출 방지에 중점 - 기밀성 강조
					<br /> 1번 : Clark-Wilson 무결성 모델: 비밀 노출 방지보다 자료의 변조 방지가 더 중요함(금융, 회계관련 데이터, 기업 재무재표 등)
					<br /> 4번 : Chinese Wall: 충돌을 야기시키는 어떠한 정보의 흐름도 없어야 한다. 이익의 충돌 금지, 최근 일을 한 적 있는 파트너는 동일 영역에 있는 다른 회사 자료에 접근해서는 안된다.
       </div>
     <div class="exit">닫기</div>
    </div>
  </div>



			
</body>
</html>