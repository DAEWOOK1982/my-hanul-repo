$(document).ready(function() {
	//응시번호 클릭 시
	$("#testerid").click(function(){
		swal("수정할 수 없습니다.");
	});
	
	//응시 여부 클릭시
	$("#test").click(function(){
		swal("수정할 수 없습니다.");
	});
	
	//합격 여부 클릭시
	$("#pup").click(function(){
		swal("수정할 수 없습니다.");
	});
	
	//점수 클릭시
	$("#score").click(function(){
		swal("수정할 수 없습니다.");
	});
	
	// 이름 정규식
	var regname = /^[가-힣]{2,6}$/;
	
	/*제출*/
	$("#submitBtn").click(function(){
		if(!$("#testername").val() || $.trim($("#testername").val().trim()) == 0){
			swal("수험자 이름을 입력해주세요.");
			$("#testername").focus();
			return false;
		} else if(!regname.test(testername.value)){
			swal("수험자 이름을 다시 확인해주세요.");
			return false;
		} 
	});	//submit
	
	/*초기화*/
	$("#resetBtn").click(function(){
		if(confirm("초기화 하시겠습니까?")== false	) {
			swal ("취소되었습니다.");
			return false;
		}else {
			swal("초기화 되었습니다. 다시 입력해주세요.")
		}
	});	//reset
	
	/*초기화*/
	$("#cancleBtn").click(function(){
		if(confirm("접수를 취소 하시겠습니까?")== false	) {
			swal ("취소되었습니다.");
			return false;
		}else {
			location.href="index.jsp"
		}
	});	//reset
	
});