<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct" %>

<%@ include file="/views/common/header.jsp" %>


<%


TravelProduct tp=(TravelProduct)request.getAttribute("TravelProduct");

%>


<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"></script>
    
<section id="trvWrite">
 <article id="trArt">
  <div class="container">
 					   
	<form action="<%=request.getContextPath()%>/travel/travelAdminWriteView"
	name="ajaxFile" method="post" enctype="multipart/form-data">
			
<div id="ljbGps">
	
	
	<div id="map" style="dipslay:inline-block; width:300px; height: 300px; float: right; margin-right:250px "></div>
</div>
	

 
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
		<select class="custom-select" id="province" name="trvProvince">
			<option value="서울시">서울시</option>
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
		<input type="text" class="form-control" id="city" name="trvCity" />
	 </div>
	  <div class="inputArea">
		<label for="trvAddress">나머지 주소</label> 
		<input type="text" class="form-control" id="address" name="trvAddress" />
	 </div>
	 
	
	
    		
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 36.721916, lng: 127.907956}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
          map.zoom = 15;
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        address = $("#province").val() + " " + $("#city").val() + " " + $("#address").val();
        var gps = "222";
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
            var lat = results[0]['geometry']['location']['lat']();
            var lng = results[0]['geometry']['location']['lng']();
            gps = lat + ", " + lng;
            $("input[name=trvGps]").val(gps);
            console.log(gps);
            $("#testGps").append(gps);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDSMMBC3FVr1gSB2QtcPfMFJwHW0-m9WA&callback=initMap">
    </script>
    <div style="display:none;"><input type="hidden" name="trvGps" value="" /></div>
    		
    	<div id="ljbGpsBtn">
			<input id="submit" type="button" value="Gps입력" style="margin-left:378px; margin-top:10px; margin-bottom:5px;">	
			<span id="testGps"></span>
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
        document.querySelector('#preview4')

    }; 
}; 




</script>











<%@ include file="/views/common/footer.jsp" %>