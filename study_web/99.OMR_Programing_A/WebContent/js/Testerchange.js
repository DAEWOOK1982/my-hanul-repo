$(document).ready(function() {
	$("#submitBtn").click(function() {
		var testername = document.getElementById("testername");
		var score = document.getElementById("score");
		var regtestername = /^[가-힣]{2,5}$/;
		if ($('input:radio[name=test]').is(':checked') == false) {
			swal("응시 여부에대해 체크해주세요.");
			return false;
		}else if($('input:radio[name=pup]').is(':checked') == false){
			swal("합격 여부에대해 체크해주세요.");
			return false;
		}else if(!regtestername.test(testername.value)){
			swal("이름을 정확히 입력해주세요.\n이름은 2~5자의 한글로만 입력가능합니다.")
			testername.value ="";
			testername.focus();
			return false;
		}else if(score.value < 0 || score.value > 100){
			swal("점수를 다시 입력해주세요.\n점수는 0~100점으로만 입력가능합니다.")
			score.value = "";
			score.focus();
			return false;
		} else if(score.value % 5 != 0) {
			swal("점수를 다시 입력해주세요.\n점수는 5의배수로만 입력가능합니다.")
			score.value = "";
			score.focus();
			return false;
		}else {
			if(confirm("수정하시겠습니까?") == false){
				return false;
			}
		}
	});
	
	$("#resetBtn").click(function(){
		if(confirm("초기화 하시겠습니까?\n모든 입력값이 사라집니다") ==false){
			swal("취소되었습니다.");
			return false;
		}else {
			swal("초기화 되었습니다.");
		}
	});	//reset
	
	$("#cancleBtn").click(function(){
		if(confirm("취소하시겠습니까?") ==false){
			return false;
		}else {
			location.href='gals.do'
		}
	});	//reset
});