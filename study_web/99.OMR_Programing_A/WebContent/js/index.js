$(document).ready(function() {
	// 이름 정규식
	var regname = /^[가-힣]{2,6}$/;
	
	$("#plusBtn").click(function(){
		if(confirm("추가접수 화면으로 이동하시겠습니까?") == false){
			swal("취소되었습니다.");
		}else{
			location.href="TesterJoin.jsp"			
		}
	});

	/*제출*/
	$("#submitBtn").click(function(){
		if(!$("#testerid").val() || $.trim($("#testerid").val().trim()) == 0){
			swal("수험자 번호 입력해주세요.");
			$("#testerid").focus();
			return false;
		} else if(!$("#testername").val() || $.trim($("#testername").val().trim()) == 0){
			swal("수험자 이름을 입력해주세요.");
			$("#testername").focus();
			return false;
		} else if(!regname.test(testername.value)){
			swal("수험자 이름을 다시 확인해주세요.");
			return false;
		} 
	});	//submit
	
	/*관리자*/
	$("#adminBtn").click(function(){
		if(!$("#testerid").val() || $.trim($("#testerid").val().trim()) == 0){
			swal("잘못 입력하셨습니다.");
			$("#testerid").focus();
			return false;
		} else if(!$("#testername").val() || $.trim($("#testername").val().trim()) == 0){
			swal("잘못 입력하셨습니다.");
			$("#testername").focus();
			return false;
		} else if(!regname.test(testername.value)){
			swal("잘못 입력하셨습니다.");
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
	

});