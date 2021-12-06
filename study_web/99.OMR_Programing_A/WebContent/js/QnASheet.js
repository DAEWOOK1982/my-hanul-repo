$(document).ready(function() {
	
	swal("시험을 시작합니다.");
	
	//타이머 설정
	   var time = 3600;   //기준시간
	   var min = "";   //분
	   var sec="";   //초
	   
	   var x = setInterval(function(){
	      min = parseInt(time/60);   //전체 주어진 시간을 60으로 나누어 분을 구함
	      sec = time%60;   //나머지 (초)
	      
	      document.getElementById("output").innerHTML = min + "분" + "&nbsp;&nbsp;&nbsp;" + sec +"초";
	      time--;
	      
	      //시간 경과시
	      if (time<0){
	         clearInterval(x);
	         document.getElementById("output").innerHTML="시간초과"
	      }
	   },1000);
	
	//이미지 슬라이드 구현
	   let curPos = 0;
	   let postion = 0;
	   const IMAGE_WIDTH = 1140;
	   const prevBtn = document.querySelector(".prev")
	   const nextBtn = document.querySelector(".next")
	   const images = document.querySelector(".test")
	    
	   function prev(){
	     if(curPos > 0){
	       nextBtn.removeAttribute("disabled")
	       postion += IMAGE_WIDTH;
	       images.style.transform = `translateX(${postion}px)`;
	       curPos = curPos - 1;
	     }
	     if(curPos == 0){
	       prevBtn.setAttribute('disabled', 'true')
	     }
	   }
	   function next(){
	     if(curPos < 3){
	       prevBtn.removeAttribute("disabled")
	       postion -= IMAGE_WIDTH;
	       images.style.transform = `translateX(${postion}px)`;
	       curPos = curPos + 1;
	     }
	     if(curPos == 3){
	       nextBtn.setAttribute('disabled', 'true')
	     }
	   }
	    
	   function init(){
	     prevBtn.setAttribute('disabled', 'true')
	     prevBtn.addEventListener("click", prev)
	     nextBtn.addEventListener("click", next)
	   }
	   init();

	//제출
	$("#submitBtn").click(function(){
		if($('input:radio[name=Q1]').is(':checked')==false){
			swal("문제 1번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q2]').is(':checked')==false){
			swal("문제 2번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q3]').is(':checked')==false){
			swal("문제 3번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q4]').is(':checked')==false){
			swal("문제 4번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q5]').is(':checked')==false){
			swal("문제 5번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q6]').is(':checked')==false){
			swal("문제 6번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q7]').is(':checked')==false){
			swal("문제 7번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q8]').is(':checked')==false){
			swal("문제 8번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q9]').is(':checked')==false){
			swal("문제 9번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q10]').is(':checked')==false){
			swal("문제 10번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q11]').is(':checked')==false){
			swal("문제 11번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q12]').is(':checked')==false){
			swal("문제 12번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q13]').is(':checked')==false){
			swal("문제 13번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q14]').is(':checked')==false){
			swal("문제 14번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q15]').is(':checked')==false){
			swal("문제 15번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q16]').is(':checked')==false){
			swal("문제 16번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q17]').is(':checked')==false){
			swal("문제 17번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q18]').is(':checked')==false){
			swal("문제 18번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q19]').is(':checked')==false){
			swal("문제 19번에 대해 답을 체크해주세요.");
			return false;
		} else if($('input:radio[name=Q20]').is(':checked')==false){
			swal("문제 20번에 대해 답을 체크해주세요.");
			return false;
		} else {
			if(confirm("제출하시겠습니까?")==true){
				location.href='ss.do';
			}else {
				swal("취소되었습니다.");
				return false;
			}
		}
	});
	
	
	/*리셋*/
	$("#resetBtn").click(function(){
		if(confirm("초기화 하시겠습니까?\n모든 입력값이 사라집니다") ==false){
			swal("취소되었습니다.");
			return false;
		}else {
			swal("초기화 되었습니다.");
		}
	});	//reset
	
});