<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://
www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.uploadResult{
 	width:100%;
 	background-color: gray;
 }
.uploadResult ul{
	display:flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
} 
.uploadResult ul li{
	list-style: none;
	padding: 10px;
}
.uploadResult ul li img{
	width: 20px;
}
</style>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
</div>


<!-- 첨부파일 이름을 목록으로 처리 -->
<div class='uploadResult'>
	<ul>
	
	</ul>
</div>

<button id='uploadBtn'>Upload</button>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	
	//이미지 파일 보여주는 부분 
	var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {
		var str = "";
		$(uploadResultArr).each(
			function(i, obj) {
			
			if(!obj.image) {		//이미지가 아니면 파일아이콘으로 보여줌
				str += "<li><img src='/resources/img/attach.png'>"
					+ obj.fileName + "<li>";
			}else{
				str += "<li>" + obj.fileName + "</li>";
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" +obj.uuid+"_" +obj.fileName);
				console.log(fileCallPath);
				str += "<li><img src='/project/display?fileName="+fileCallPath+"'><li>";
			}
	});
		uploadResult.append(str);
	}
	
	//파일 종류,사이즈 구분
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;	//5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
	}
	return true;
}
	//첨부파일 업로드 전 빈 <input type='file'>객체 포한된 <div>를 복사(clone)
	var cloneObj = $(".uploadDiv").clone();		
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//add filedate to formdata
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/project/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);
				
				showUploadedFile(result);
				
				//복사된 객체를 <div>내에 다시 추가해서 첨부파일 부분 초기화
				$(".uploadDiv").html(cloneObj.html());
			}
		}); //$.aja
		
	});
	
});
</script>

</body>
</html>