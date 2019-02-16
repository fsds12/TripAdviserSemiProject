<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"></script>


<section id="trvWrite">
 <article id="trArt">
  <div class="container">
	<form action="" method="post">
	
  <div class="inputData">
	 <div class="inputArea">
		<label for="trvTitle">여행제목</label> 
		<input type="text" id="trvTitle" name="trvTitle" />
	 </div>
	 <div class="inputArea">
		<label>카테고리</label> 
		<select class="trvBigCtgCode">
			<option value="대분류">대분류</option>
			<option value="기타">기타</option>
		</select> 
		<select class="trvSmallCtgCode">
			<option value="소분류">소분류</option>
			<option value="기타">기타</option>
		</select> 
	 </div>
	 <div class="inputArea">
		<label for="trvProvince">여행지 도</label> 
		<select class="trvProvince">
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충청북도">충청북도</option>
			<option value="충청남도">충청남도</option>
			<option value="전라북도">전라북도</option>
			<option value="전라남도">전라남도</option>
			<option value="경상북도">경상북도</option>
			<option value="경상남도">경상남도</option>
		</select> 
	 </div>
	 <div class="inputArea">
		<label for="trvCity">여행지 시군구</label> 
		<input type="text" id="trvCity" name="trvCity" />
	 </div>
	  <div class="inputArea">
		<label for="trvAddress">나머지 주소</label> 
		<input type="text" id="trvAddress" name="trvAddress" />
	 </div>
	 
	 <div class="inputArea">
		<label for="trvDateStart">기간시작</label> 
		<input type="text" id="from" name="trvDateStart" readonly/>
		<label for="trvDateEnd">기간종료</label> 
		<input type="text" id="to" name="trvDateEnd" readonly/>
		
	 </div>
   </div>
	
   <div class="inputImage">
	
					<div id="trvImg1" style="width:250px">
						<img id="preview" src="" width="200" alt="">
						<input type="file" id="getfile" style="width:200px" accept="image/*">
					</div>


					<div id="trvImg2" style="width:250px">
						<img id="preview2" src="" width="200" alt="">
						<input type="file" id="getfile2" style="width:200px" accept="image/*">
					</div>
					
					
					<div id="trvImg3" style="width:250px">
						<img id="preview3" src="" width="200" alt="">
						<input type="file" id="getfile3" style="width:200px" accept="image/*">
					</div>
					
					<div id="trvImg4" style="width:250px">
						<img id="preview4" src="" width="200" alt="">
						<input type="file" id="getfile4" style="width:200px" accept="image/*">
					</div>

	</div>
	
	
	<div class="inputContent">
		<label for="proContent">상품소개</label>
		<textarea rows="5" cols="50" id="proContent" name="proContent"></textarea>
	</div>


	<div class="inputBtn">
		<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
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