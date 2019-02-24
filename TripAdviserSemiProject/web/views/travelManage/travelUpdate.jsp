<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"></script>


<section id="trvUpdate">
 <article id="trArt">
  <div class="container">
	
	<form action="<%=request.getContextPath()%>/travel/travelAdminUpdateView"
	name="ajaxFile" method="post" enctype="multipart/form-data">
	
  <div class="inputData">
	 <div class="inputArea">
		<label for="trvTitle">여행제목</label> 
		<input type="text" class="form-control" id="trvTitle" name="trvTitle" />
	 </div>
	 <div class="inputArea">
		<label>카테고리</label> 
		<select class="custom-select" id="trvCtgCode" name="trvCtg">
			<option value="CS01">호텔</option>
			<option value="CS02">게스트하우스</option>
			<option value="CS03">템플스테이</option>
			<option value="CS04">볼거리</option>
			<option value="CS05">놀거리</option>
			<option value="CS06">정식</option>
			<option value="CS07">지역음식</option>
			<option value="CS08">길거리음식</option>
		</select> 
		
	 </div>
	 <div class="inputArea">
		<label for="trvProvince">여행지 도</label> 
		<select class="custom-select" id="trvProvince" name="trvProvince">
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충청북도">충청북도</option>
			<option value="충청남도">충청남도</option>
			<option value="전라북도">전라북도</option>
			<option value="전라남도">전라남도</option>
			<option value="경상북도">경상북도</option>
			<option value="경상남도">경상남도</option>
			<option value="제주도">제주도</option>
		</select> 
	 </div>
	 <div class="inputArea">
		<label for="trvCity">여행지 시군구</label> 
		<input type="text" class="form-control" id="trvCity" name="trvCity" />
	 </div>
	  <div class="inputArea">
		<label for="trvAddress">나머지 주소</label> 
		<input type="text" class="form-control" id="trvAddress" name="trvAddress" />
	 </div>
	 
	 
   </div>
	
   <div class="inputImage">
	
					<div id="trvImg1" style="width:250px">
						<img id="preview" src="" width="200" alt="">
						<input type="file" name="trvRepresentPic" id="getfile" style="width:200px">
					</div>


					<div id="trvImg2" style="width:250px">
						<img id="preview2" src="" width="200" alt="">
						<input type="file" name="trvPicSrc1" id="getfile2" style="width:200px">
					</div>
					
					
					<div id="trvImg3" style="width:250px">
						<img id="preview3" src="" width="200" alt="">
						<input type="file" name="trvPicSrc2" id="getfile3" style="width:200px" multiple>
					</div>
					
					<div id="trvImg4" style="width:250px">
						<img id="preview4" src="" width="200" alt="">
						<input type="file" name="trvPicSrc3" id="getfile4" style="width:200px" multiple>
					</div>

	</div>
	
	
	<div class="inputContent">
		<label for="proContent">상품소개</label>
		<textarea class="form-control" rows="5" cols="50" id="proContent" name="proContent"></textarea>
	</div>


	<div class="inputBtn">
		<button type="submit" id="update_Btn" class="btn btn-primary">수정</button>
		<button type="submit" id="cancle_Btn" class="btn btn-primary">취소</button>
	</div>
	
	</form>
  </div>
 </article>
</section>


<script>

var file = document.querySelector('#getfile');

file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        //로컬 이미지를 보여주기
        document.querySelector('#preview').src = reader.result;

    }; 
}; 



var file2 = document.querySelector('#getfile2');

file2.onchange = function () { 
    var fileList2 = file2.files ;
    
    // 읽기
    var reader2 = new FileReader();
    reader2.readAsDataURL(fileList2 [0]);

    //로드 한 후
    reader2.onload = function  () {
        //로컬 이미지를 보여주기
        document.querySelector('#preview2').src = reader2.result;
        

    }; 
}; 


var file3 = document.querySelector('#getfile3');

file3.onchange = function () { 
    var fileList3 = file3.files ;
    
    // 읽기
    var reader3 = new FileReader();
    reader3.readAsDataURL(fileList3 [0]);

    //로드 한 후
    reader3.onload = function  () {
        //로컬 이미지를 보여주기
        document.querySelector('#preview3').src = reader3.result;
        

    }; 
}; 



var file4 = document.querySelector('#getfile4');

file4.onchange = function () { 
    var fileList4 = file4.files ;
    
    // 읽기
    var reader4 = new FileReader();
    reader4.readAsDataURL(fileList4 [0]);

    //로드 한 후
    reader4.onload = function  () {
        //로컬 이미지를 보여주기
        document.querySelector('#preview4').src = reader4.result;
        

    }; 
}; 




</script>

<%@ include file="/views/common/footer.jsp" %>