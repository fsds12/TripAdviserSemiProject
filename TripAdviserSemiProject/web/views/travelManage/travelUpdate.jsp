<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="/views/common/header.jsp" %>
 --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"></script>


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
			<option value="CL01">휴식거리</option>
			<option value="CL02">즐길거리</option>
			<option value="CL03">먹을거리</option>
			
		</select> 
		<select class="trvSmallCtgCode">
			<option value="소분류">소분류</option>
			<option value="CS01">호텔</option>
			<option value="CS02">게스트하우스</option>
			<option value="CS03">템플스테이</option>
			<option value="CS04">볼거리</option>
			<option value="CS05">놀거리</option>
			<option value="CS06">정식</option>
			<option value="CS07">지역특산음식</option>
			<option value="CS08">길거리음식</option>
		</select> 
	 </div>
	 <div class="inputArea">
		<label for="trvProvince">여행지 도</label> 
		<select class="trvProvince">
			<option value="서울시">서울시</option>
			<option value="경기도">경기도</option>
			<option value="대전시">대전시</option>
			<option value="부산시">부산시</option>
			<option value="대구시">대구시</option>
			<option value="전주시">전주시</option>
			<option value="광주시">광주시</option>
			<option value="세종시">세종시</option>
			<option value="춘천시">춘천시</option>
			<option value="제주시">제주시</option>
			<option value="서귀포시">서귀포시</option>
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
		<label for="trvAddress">여행지 나머지주소</label> 
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
	
		<div class="inputArea">
			<label for="trvRepresentPic">이미지1</label> 
			<input type="file" id="trImage" name="trvRepresentPic" />
		</div>
		<div class="inputArea">
			<label for="trvPic">이미지2</label> 
			<input type="file" id="trImage" name="trvPic" />
		</div>
		<div class="inputArea">
			<label for="trvPic">이미지3</label> 
			<input type="file" id="trImage" name="trvPic" />
		</div>
		<div class="inputArea">
			<label for="trvPic">이미지4</label> 
			<input type="file" id="trImage" name="trvPic" />
		</div>
		
		<div>
		<h3>로컬에 있는 이미지를 바로 브라우저에 표시</h3>
<img id="preview" src="" width="300" alt="로컬에 있는 이미지가 보여지는 영역">
<a id="download" download="thumbnail.jpg" target="_blank">
    <img id="thumbnail" src="" width="100" alt="썸네일영역 (클릭하면 다운로드 가능)">
</a>
<input type="file" id="getfile" accept="image/*">
</div>

<div>
		<h3>로컬에 있는 이미지를 바로 브라우저에 표시</h3>
<img id="preview" src="" width="300" alt="로컬에 있는 이미지가 보여지는 영역">
<a id="download" download="thumbnail.jpg" target="_blank">
    <img id="thumbnail" src="" width="100" alt="썸네일영역 (클릭하면 다운로드 가능)">
</a>
<input type="file" id="getfile" accept="image/*">		
</div>		                
	</div>
	
	
	<div class="inputContent">
		<label for="proContent">상품소개</label>
		<textarea rows="5" cols="50" id="proContent" name="proContent"></textarea>
	</div>


	<div class="inputBtn">
		<button type="submit" id="update_Btn" class="btn btn-primary">수정</button>
		<button type="submit" id="cancle_Btn" class="btn btn-primary">취소</button>
	</div>
	
	</form>
  </div>
 </article>



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
        
        //썸네일 이미지 생성
        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
        tempImage.onload = function() {
            //리사이즈를 위해 캔버스 객체 생성
            var canvas = document.createElement('canvas');
            var canvasContext = canvas.getContext("2d");
            
            //캔버스 크기 설정
            canvas.width = 100; //가로 100px
            canvas.height = 100; //세로 100px
            
            //이미지를 캔버스에 그리기
            canvasContext.drawImage(this, 0, 0, 100, 100);
            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
            var dataURI = canvas.toDataURL("image/jpeg");
            
            //썸네일 이미지 보여주기
            document.querySelector('#thumbnail').src = dataURI;
            
            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
            document.querySelector('#download').href = dataURI;
        };
    }; 
}; 

</script>
<%-- 
<%@ include file="/views/common/footer.jsp" %> --%>