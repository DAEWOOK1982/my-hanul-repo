<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8"); 

	//오브젝트로 전달됨 -> 클래스로 받고, 클래스로 캐스팅
	Integer testerid = (Integer) request.getAttribute("testerid");
	String testername = (String) request.getAttribute("testername");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모의고사</title>
<style >
	@import url("css/QnASheet.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/QnASheet.js"></script>
<script type="text/javascript">
//새로고침 금지, 백스페이스 금지
function noRefresh()
{
    if (event.keyCode == 116) 
    {
        swal("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if(event.keyCode == 8){
    		swal("뒤로 가기를 할 수 없습니다.");
    		event.keyCode = 2;
        return false;
    }else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noRefresh;
</script>
</head>
<body>
	<div class="container"> 
	<div id="wrap">		
		<div id ="tester">
		수험자 번호 : <input type="text" id="testerid" name="testerid" readonly="readonly" value="<%=testerid %>"/> 
		수험자 이름 : <input type="text" id="testername" name="testername" readonly="readonly" value="<%=testername %>"/> 
		</div>
		<div id="time">
		남은 시간 : <b><span id="output"></span></b>
		</div>
		<div id="Question">
			<!-- 문제지 -->
			<div	id="QuestionSheet">
				<div class="test">
				<img src="css/images/test001.png">
				<img src="css/images/test002.png">
				<img src="css/images/test003.png">
				<img src="css/images/test004.png">
				</div>
			</div>
			<div>
				<input type = "button" value="이전" class="prev"/>
				<input type = "button" value="다음" class="next"/>	
			</div>
		</div>
		
		<div	id="AnswerSheet">
				<h2>최종 모의고사</h2>
			<div id="scroll">
			<form action="ss.do" method="post" name="userAnswer" id="userAnswerSheet">
				<div id ="hide">
					수험자 번호 : <input type="text" id="testerid" name="testerid" readonly="readonly" value="<%=testerid %>"/> 
					수험자 이름 : <input type="text" id="testername" name="testername" readonly="readonly" value="<%=testername %>"/> 
				</div>
				<table id="userAnswer" >
					<tr>
						<th>문제 1번</th> 
						<td><input type="radio" name="Q1" id="A1-1" value="1"/><label for="A1-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q1" id="A1-2" value="2" /><label for="A1-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q1" id="A1-3" value="3" /><label for="A1-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q1" id="A1-4" value="4" /><label for="A1-4"><img src="css/images/number4.png"></label></td>
							
					</tr>
					
					<tr>
						<th>문제 2번</th> 
						<td><input type="radio" name="Q2" id="A2-1" value="1" /><label for="A2-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q2" id="A2-2" value="2" /><label for="A2-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q2" id="A2-3" value="3" /><label for="A2-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q2" id="A2-4" value="4" /><label for="A2-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 3번</th> 
						<td><input type="radio" name="Q3" id="A3-1" value="1" /><label for="A3-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q3" id="A3-2" value="2" /><label for="A3-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q3" id="A3-3" value="3" /><label for="A3-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q3" id="A3-4" value="4" /><label for="A3-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 4번</th> 
						<td><input type="radio" name="Q4" id="A4-1" value="1" /><label for="A4-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q4" id="A4-2" value="2" /><label for="A4-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q4" id="A4-3" value="3" /><label for="A4-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q4" id="A4-4" value="4" /><label for="A4-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 5번</th>
						<td><input type="radio" name="Q5" id="A5-1" value="1" /><label for="A5-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q5" id="A5-2" value="2" /><label for="A5-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q5" id="A5-3" value="3" /><label for="A5-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q5" id="A5-4" value="4" /><label for="A5-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 6번</th> 
						<td><input type="radio" name="Q6" id="A6-1" value="1" /><label for="A6-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q6" id="A6-2" value="2" /><label for="A6-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q6" id="A6-3" value="3" /><label for="A6-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q6" id="A6-4" value="4" /><label for="A6-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 7번</th>
						<td><input type="radio" name="Q7" id="A7-1" value="1" /><label for="A7-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q7" id="A7-2" value="2" /><label for="A7-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q7" id="A7-3" value="3" /><label for="A7-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q7" id="A7-4" value="4" /><label for="A7-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 8번</th> 
						<td><input type="radio" name="Q8" id="A8-1" value="1" /><label for="A8-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q8" id="A8-2" value="2" /><label for="A8-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q8" id="A8-3" value="3" /><label for="A8-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q8" id="A8-4" value="4" /><label for="A8-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 9번</th> 
						<td><input type="radio" name="Q9" id="A9-1" value="1" /><label for="A9-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q9" id="A9-2" value="2" /><label for="A9-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q9" id="A9-3" value="3" /><label for="A9-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q9" id="A9-4" value="4" /><label for="A9-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 10번</th> 
						<td><input type="radio" name="Q10" id="A10-1" value="1" /><label for="A10-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q10" id="A10-2" value="2" /><label for="A10-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q10" id="A10-3" value="3" /><label for="A10-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q10" id="A10-4" value="4" /><label for="A10-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 11번</th> 
						<td><input type="radio" name="Q11" id="A11-1" value="1" /><label for="A11-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q11" id="A11-2" value="2" /><label for="A11-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q11" id="A11-3" value="3" /><label for="A11-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q11" id="A11-4" value="4" /><label for="A11-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 12번</th> 
						<td><input type="radio" name="Q12" id="A12-1" value="1" /><label for="A12-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q12" id="A12-2" value="2" /><label for="A12-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q12" id="A12-3" value="3" /><label for="A12-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q12" id="A12-4" value="4" /><label for="A12-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 13번</th> 
						<td><input type="radio" name="Q13" id="A13-1" value="1" /><label for="A13-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q13" id="A13-2" value="2" /><label for="A13-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q13" id="A13-3" value="3" /><label for="A13-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q13" id="A13-4" value="4" /><label for="A13-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 14번</th> 
						<td><input type="radio" name="Q14" id="A14-1" value="1" /><label for="A14-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q14" id="A14-2" value="2" /><label for="A14-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q14" id="A14-3" value="3" /><label for="A14-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q14" id="A14-4" value="4" /><label for="A14-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 15번</th> 
						<td><input type="radio" name="Q15" id="A15-1" value="1" /><label for="A15-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q15" id="A15-2" value="2" /><label for="A15-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q15" id="A15-3" value="3" /><label for="A15-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q15" id="A15-4" value="4" /><label for="A15-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 16번</th> 
						<td><input type="radio" name="Q16" id="A16-1" value="1" /><label for="A16-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q16" id="A16-2" value="2" /><label for="A16-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q16" id="A16-3" value="3" /><label for="A16-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q16" id="A16-4" value="4" /><label for="A16-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 17번</th> 
						<td><input type="radio" name="Q17" id="A17-1" value="1" /><label for="A17-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q17" id="A17-2" value="2" /><label for="A17-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q17" id="A17-3" value="3" /><label for="A17-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q17" id="A17-4" value="4" /><label for="A17-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 18번</th> 
						<td><input type="radio" name="Q18" id="A18-1" value="1" /><label for="A18-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q18" id="A18-2" value="2" /><label for="A18-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q18" id="A18-3" value="3" /><label for="A18-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q18" id="A18-4" value="4" /><label for="A18-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 19번</th> 
						<td><input type="radio" name="Q19" id="A19-1" value="1" /><label for="A19-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q19" id="A19-2" value="2" /><label for="A19-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q19" id="A19-3" value="3" /><label for="A19-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q19" id="A19-4" value="4" /><label for="A19-4"><img src="css/images/number4.png"></label></td>
					</tr>
					
						<tr>
						<th>문제 20번</th>
						<td><input type="radio" name="Q20" id="A20-1" value="1" /><label for="A20-1"><img src="css/images/number1.png"></label></td>
						<td><input type="radio" name="Q20" id="A20-2" value="2" /><label for="A20-2"><img src="css/images/number2.png"></label></td>
						<td><input type="radio" name="Q20" id="A20-3" value="3" /><label for="A20-3"><img src="css/images/number3.png"></label></td>
						<td><input type="radio" name="Q20" id="A20-4" value="4" /><label for="A20-4"><img src="css/images/number4.png"></label></td>
					</tr>
				</table>
				<input type="submit" id="submitBtn" />
				<input type="reset" id="resetBtn" />
			</form>
			</div>
			</div>
	</div>	 <!-- wrap -->
	</div>		<!-- container -->
</body>
</html>