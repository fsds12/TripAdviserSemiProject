<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct" %>

<%@ include file="/views/common/header.jsp" %>

<%-- <%
	
List<TravelProduct> list=(List)request.getAttribute("list");
String searchType=(String)request.getAttribute("searchType");
String searchKeyword=(String)request.getAttribute("searchKeyword");
String pageBar=(String)request.getAttribute("pageBar");
int cPage=(int)request.getAttribute("cPage");
int numPerPage=(int)request.getAttribute("numPerPage");
TravelProduct tp=(TravelProduct)request.getAttribute("TravelProduct");

%> --%>
<%
TravelProduct tp=(TravelProduct)request.getAttribute("TravelProduct");

%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"></script>


<section id="trvWrite">
 <article id="trArt">
  <div class="container">
	<form action="<%=request.getContextPath() %>/travel/travelAdminWrite?trvNo=<%=tp.getTrvNo()%>"
	name="ajaxFile" method="post" enctype="multipart/form-data">
	
  <div class="inputData">
	 <div class="inputArea">
		<label for="trvTitle">여행제목</label> 
		<input type="text" class="form-control" id="trvTitle" name="trvTitle" />
	 </div>
	 <div class="inputArea">
		<label>카테고리</label> 
		<select class="custom-select" id="trvCtgCode" name="trvCtg">
			<option value="trvCtgLargeName">대분류</option>
			<option value="trvCtgSmallName">소분류</option>
			<!-- <option value="기타">기타</option> -->
		</select> 
		
	 </div>
	 <div class="inputArea">
		<label for="trvProvince">여행지 도</label> 
		<select class="custom-select" id="trvProvince" name="trvProvince">
			<option value="trvProvince1">경기도</option>
			<option value="trvProvince2">강원도</option>
			<option value="trvProvince3">충청북도</option>
			<option value="trvProvince4">충청남도</option>
			<option value="trvProvince5">전라북도</option>
			<option value="trvProvince6">전라남도</option>
			<option value="trvProvince7">경상북도</option>
			<option value="trvProvince8">경상남도</option>
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
	 
	 <div class="inputArea">
		<label for="trvDateStart">기간시작</label> 
		<input type="text" class="form-control" id="from" name="trvDateStart" readonly/>
		<label for="trvDateEnd">기간종료</label> 
		<input type="text" class="form-control" id="to" name="trvDateEnd" readonly/>
		
	 </div>
   </div>
	
   <div class="inputImage">
	
					<div id="trvImg1" style="width:250px">
						<img id="preview" src="" width="200" alt="">
						<input type="file" name="trvRepresentPic" id="getfile" style="width:200px" accept="image/*">
					</div>


					<div id="trvImg2" style="width:250px">
						<img id="preview2" src="" width="200" alt="">
						<input type="file" name="trvPicSrc1" id="getfile2" style="width:200px" accept="image/*">
					</div>
					
					
					<div id="trvImg3" style="width:250px">
						<img id="preview3" src="" width="200" alt="">
						<input type="file" name="trvPicSrc2" id="getfile3" style="width:200px" accept="image/*">
					</div>
					
					<div id="trvImg4" style="width:250px">
						<img id="preview4" src="" width="200" alt="">
						<input type="file" name="trvPicSrc3" id="getfile4" style="width:200px" accept="image/*">
					</div>

	</div>
	
	
	<div class="inputContent">
		<label for="proContent">상품소개</label>
		<textarea class="form-control" rows="5" cols="50" id="proContent" name="proContent"></textarea>
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



<%-- <script>
		$(function(){
			$("[name=trvRepresentPic]").change(function(){
				$.each(ajaxFile.ajaxFileTest.files,function(index,item){
					/* console.log(item); */
				var reader=new FileReader();
				reader.onload=function(e){
					var img=$("<img></img>").attr("src",e.target.result).css({'width':'100px','height':'100px'});
					/* $('#image').html(img); */
					$('#trvImg1').append(img);
				}
				reader.readAsDataURL(item);
			});
			});
			$('#register_Btn').on("click", function(){
				var fd=new FormData();
				/* console.log(ajaxFile.ajaxFileTest.files[0]); */
				/* fd.append("test",ajaxFile.ajaxFileTest.files[0]); */
				$.each(ajaxFile.ajaxFileTest.files,function(i,item){
					fd.append("test"+i,item);
				});
				$.ajax({
					url:"<%=request.getContextPath()%>/travel/travelAdminWrite",
					data:fd,
					type:"post",
					processData:false,
					contentType:false,
					success:function(data){
						alert("업로드 완료");
						$('#trvImg1').html('');
						$('[name=trvRepresentPic]').val('');
					}
				});
			});
			
		});
	</script> --%>








<%@ include file="/views/common/footer.jsp" %>