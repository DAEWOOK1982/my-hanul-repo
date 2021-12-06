$(document).ready(function() {
	$("#updateBtn").click(function (){
		if(confirm("수험자 수정 화면으로 이동하시겠습니까?") == false){
			swal("취소되었습니다.");
			return false;
		}
	});
	
	$("#deleteBtn").click(function (){
		if(confirm("수험자 정보를 삭제하시겠습니까?\n삭제하면 되돌릴 수 없습니다.") == false){
			swal("취소되었습니다.");
			return false;
		}
	});
	
	$("#listBtn").click(function(){
		if(confirm("전체 수험자 목록으로 돌아가시겠습니까?") == false){
			swal("취소되었습니다.");
			return false;
		}else {
			location.href="gals.do";
		}
	});
	
	
	
});	//document