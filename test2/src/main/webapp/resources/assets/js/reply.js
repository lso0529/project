/**
 * reply 기능과 관련된 자바스크립트 파일
 */
 console.log("reply Module");
 
 //자바스크립트의 즉시 실행 함수는 ()인에 함수를 선언하고, 바깥쪽에서 실행
 var replyService= (function(){
		
	//return {name:"AAAA"};
	
	//등록 처리
	function add(reply, callback) {
		console.log("reply");
		
		$.ajax({
			type : 'post',
			url : '../replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8", success : function(result, status, xhr) {
				if (callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}	
		})
	}
	
	//목록 처리 : getList함수는 param 객체를 통해서 필요한 파라미터를 전달받음
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/project/replies/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					//callback(data);		//댓글 목록만 가져오는 경우
					callback(data.replyCnt, data.list);		//댓글 총 갯수와 목록 가져오는 경우
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
	}
	
	//댓글삭제, 갱신처리
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '../replies/'+rno,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
			
		});
	}
	
	//댓글 수정
	function update(reply, callback,error) {
		console.log("RNO : "+reply.rno);
		
		$.ajax({
			type : 'put',
			url : '../replies/'+reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json;charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
	}
	
	//댓글 보기(조회)
	function get(rno, callback, error){
		$.get("../replies/"+rno+".json", function(result){
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error) {
				error();
			}
		});
	}
	
	//날짜 처리
	function displayTime(timeValue){
		var today = new Date();		//오늘 날짜
		
		var gap = today.getTime() - timeValue;		//오늘기점으로 얼마나 차이나는지
		
		var dateObj = new Date(timeValue);	//작성 날짜
		
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {  //1000MilliSecond(초가 됨) 하루 값을 출력// 하루가 안되면 시,분,초로 표시/이후는 날짜로
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0')+hh,':',(mi>9 ? '' : '0')+mi,':', 	//01,02,03..표현 위해서
			(ss>9 ? '' : '0')+ss].join('')	//"00:00:00"인 문자열로 변경
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;	//getMonth는 zero-base값
			var dd = dateObj.getDate();
			
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
			//"2022/09/29"인 문자열로 변경
		}
	}
	
	return {
		add:add, 	//key:value
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
	
})();