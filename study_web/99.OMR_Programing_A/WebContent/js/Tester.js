$(document).ready(function() {
	
	/*수험자 삭제 화면 이동*/
	$(".deleteBtn").click(function(){
		if(confirm("수험자를 삭제하시겠습니까?\n삭제하면 되돌릴 수 없습니다.")== false) {
			swal("취소되었습니다.");
			return false;
		}
	});	//deleteBtn
	
	/*수험자 수정 이동*/
	$(".updateBtn").click(function(){
		if(confirm("수험자 정보 수정화면으로 이동하시겠습니까?")== false) {
			swal ("취소되었습니다.");
			return false;
		}
	});	//updateBtn
	
	/*관리자메뉴 이동*/
	$("#returnBtn").click(function(){
		if(confirm("관리자 메뉴로 이동하시겠습니까?")== false) {
			swal ("취소되었습니다.");
			return false;
		}else {
			location.href="Manager.jsp"
		}
	});	//reset
	
});