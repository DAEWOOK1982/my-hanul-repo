<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모의고사 로그인</title>
<style >
	@import url("css/index.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript">
	/* 수험자번호 글자수제한 */
	function maxLenthCheck(e) {
	  if(e.value.length > e.maxLength)  {
	    e.value  = e.value.slice(0, e.maxLength);
	  }//if
}//function

//EnterKey금지
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
$(document).ready(function(){ 
	$("#adminBtn").click(function() {
		var testerid = $("#testerid").val();
		var testername = $("#testername").val();
		
		if (!testerid || !testername) {
			swal("관리자만 접근 가능합니다.");
		} else {
			$.ajax({ //ajax 실행
				url : "cs.do",
				type : "POST",
				data : {
					testerid : testerid,
					testername : testername
				}, 
				success : function(result) {
					if (result == 0) {
							swal("관리자 정보가 잘못됐습니다.");
							$("#testerid").focus();
					} else if (result == 3) {
							if(confirm("관리자 페이지로 이동하시겠습니까?") == false){
								swal("취소되었습니다.");
							}else {
								location.href="Manager.jsp";
							}
					}//if
				}//success
			});//ajax 
		}//if
	});//click
})//ready
</script>
</head>
<body>
	<div class="container">
		<div id="wrap">
		<span>A 시험 대비</span>
		<h1>최종 모의고사</h1>
		<br />
		<p>아래의 사항을 정확하게 입력해주세요.</p>
		<form method="post" action="ls.do" id="testerform">
			<table>
				<tr>
					<th><label for="testerid">수험자 번호</label></th>
					<td>
						<input type="number" class="input" placeholder="수험자 번호" name="testerid" id="testerid" 
						 maxlength="5" autofocus="autofocus" oninput="maxLenthCheck(this);"/>
					</td>
				</tr>
				<tr>
					<th><label for="testername">수험자 이름</label></th>
					<td>
						<input type="text" class="input" placeholder="수험자 이름"name="testername" id="testername" maxlength="6">
					</td>
				</tr>
				<tr>
					<td colspan="2" >			
					<input type="submit" class="submitBtn" id="submitBtn" value="응시하기" />
					<input type="reset" class="resetBtn" id="resetBtn" value="초기화" />
					<input type="button" class="plustBtn" id="plusBtn" value="추가접수" />
					<input type="button" class="adminBtn" id="adminBtn" value="관리자" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="http://www.hanuledu.co.kr/"><img alt="" src="css/images/Logo.jpg"></a>
					</td>
				</tr>
			 </table>
		</form>
		</div>
	</div>	<!-- class: container  -->

</body>
</html>
