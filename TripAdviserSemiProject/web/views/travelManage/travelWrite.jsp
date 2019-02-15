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

<input type="file" id="getfile" accept="image/*">
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


<%@ include file="/views/common/footer.jsp" %>