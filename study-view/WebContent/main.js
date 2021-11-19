/*
 여러줄 주석
 */

// 한줄 주석

// 자바스크립트 문법
//window.onload=function(){
//	// html, css 로딩 끝나면~ 스크립트 실행
//	alert("test");	
//}	

/* 1. 자바스크립트 자료형(p.462)
	숫자형, 문자형, NULL, function, object, symbol, class
	- 자동 캐스팅 ==> 자바 큰 차이!!
	
   2. 변수 선언 초기화(p.463)
   var         : es5   <---> javascript, jquery
    ~ 과도기 : es5 --> es6 ~ 
   const, let  : es6   <---> javascript, react/vue/angular (framework)
   (immutable)               + node.js > npm 프로젝트 | babel, webpack
   
   var var1 = 5;
   var str1 = "aaaa";
   var class1 = {classNo: '101', className: 'HTML,CSS & Javascript'};
*/

//var var1 = 5;
//var str1 = "aaaa";
//var class1 = {classNo: '101', className: 'HTML,CSS & Javascript'};
//
//$(function(){                                   window.onload=function(){
//	alert("test!");	                              alert("test!");
//	var Body = document.querySelector("body");    $("body").css("","");
//	Body.style.backgroundColor="aqua";
//})                                                }

// p.468 제이쿼리를 이용한 태그 제어
// alert();
	// console.log();
	// document.write();
$(function(){
	$(".btn1").click(function(){
		// .html() : set
		$("#displayArea").html("<img src=\"https://picsum.photos/200/300\" alt=\"설명\">");
		
		// .html() : get
		console.log($("#displayArea").html());
	});
	
	/* 제이쿼리 기본 사용법 */
	$(".btn2").click(function(){
		$("#displayArea").hide(fast,function(){
			alert("애니메이션 끝!!");
		}); // 엘리먼트(?)를 숨김!
	});
	
	$(".btn3").click(function(){
		$("#displayArea").show("slow"); // 엘리먼트(?)를 보여줘!
	});
	
})
2












