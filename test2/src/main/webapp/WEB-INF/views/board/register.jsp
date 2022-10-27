<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@ include file="../include/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header bg-primary text-white">게시글 등록</div>
			<div class="card-body">



				<form role="form" action="register" method="post" id="regForm" role='form'
					enctype="multipart/form-data">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							id='title'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="5" name='content'
							id='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							id='writer'>
					</div>
					<hr>
					<button type="submit" class="btn btn-primary" >등록</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='list?pageNum=${cri.pageNum}&count=${cri.count }'">취소</button>
				</form>
			</div>
			<!--  end card-body -->
		</div>
		<!--  end card-body -->
	</div>
	<!-- end card -->
</div>
<!-- /.row -->

<!-- 파일 업로드 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="card-header bg-primary text-white">파일 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>

				<div class='uploadResult'>
					<ul>

					</ul>
				</div>

			</div>
			<!-- end panel body -->
		</div>
		<!-- end panel body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<!-- submit 처리 -->
<script>

$(document).ready(function(e){
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
		
	    $(".uploadResult ul li").each(function(i, obj){
	        
	    var jobj = $(obj);
	        
	    console.dir(jobj);
	    console.log("-------------------------");
	    console.log(jobj.data("filename"));
	        
	    //hidden 처리된 첨부파일 정보는 boardVO로 수집    
	    str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	    str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";		
	});
	    
	    console.log(str);
	    
	    formObj.append(str).submit();	//submit될때 업로드된 항목을 hidden태그로 만들어서 전송
	    
	  });
	
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	  }
	  
	  $("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/project/uploadAjaxAction',
	      processData: false, 
	      contentType: false,data: 
	      formData,type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	    
	  });  
});

function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length ==0){return;}
	var uploadUL = $(".uploadResult ul");
	var str ="";
	
	$(uploadResultArr).each(function(i,obj){
		
		//image type
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/project/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}
	});
	
	uploadUL.append(str);
}
</script>

<!-- 
<script type="text/javascript">
	function register() {
		
		if($("#title").val() == "") {
			
			$("#myModal").modal("show");
		}else if($("#writer").val() == "") {
			
			$("#myModal").modal("show");
		}else{
			$("#regForm").submit();
		}
	}
</script>
-->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">제목, 작성자는 필수 사항입니다.</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

