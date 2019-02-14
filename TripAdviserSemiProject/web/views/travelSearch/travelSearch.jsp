<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,tripAdviser.travel.product.model.vo.*,tripAdviser.travel.search.model.service.*" %>

<%@ include file="/views/common/header.jsp" %>

   
<% 
	List<TravelProduct> tplist = new ArrayList(); 
	TravelProduct tp=new TravelProduct();
	tplist = new travelSearchService().travelSearchAll();

%>
     


    <section id="search-before">
        <form id="search" action="" method="post">
            <br>         
             <input class="form-control" type="text" id="search1" name="search1"  placeholder="여행지 입력" style="display:inline-block">&nbsp;
             <button type="button" id="searchbtn1" name="searchbtn1" class="btn btn-secondary" style="padding: 0px;display:inline-block">여행지 검색</button>
             
        </form>
        <br><br><br><br>
        
       &nbsp;&nbsp;&nbsp;<span style="font-size: 25px;">검색어 Top3</span> &nbsp;&nbsp;<a href="/TripAdviserProject/views/travelSearch/travelSearchDetail.jsp">more</a>
        <hr id="hrf" >
        
<div class="box-padding-big light-bg" >
	<div class="container">	
		<div class="card-group">
			<div class="card">
				
				<a href=""><img class="card-img-top" src="http://travel.chosun.com/site/data/img_dir/2017/06/30/2017063001239_0.jpg" style="height:300px"></a>
	
		<div class="card-block">
			<h5 class="card-title"><%=tp.getTrvTitle() %></h5>
			<p class="card-text"><%=tp.getAvgStarRate() %></p>
			<p class="card-text">
			


<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
</div>
			</p>
			
		</div>
		</div>
<div class="card">
	<a href=""><img class="card-img-top" src="http://travel.chosun.com/site/data/img_dir/2017/06/30/2017063001239_0.jpg" style="height:300px"></a>
	<div class="card-block">
		<h5 class="card-title">여행지</h5>
		<p class="card-text">설명</p>
		<p class="card-text">
		<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
</div>
		</p>
	</div>
</div>
<div class="card">
	<a href=""><img class="card-img-top" src="http://travel.chosun.com/site/data/img_dir/2017/06/30/2017063001239_0.jpg" style="height:300px"></a>
				<div class="card-block">
					<h5 class="card-title">여행</h5>
					<p class="card-text">설명</p>
					<p class="card-text">
					<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
</div>
					
					</p>
				</div>
			</div>
		</div>
	</div>
</div> 
    <br><br><br>

&nbsp;&nbsp;&nbsp;<span style="font-size: 25px">숙박 Top3</span> &nbsp;&nbsp;<a href="">more</a>
        <br>
        <hr id="hrf" >
<div class="box-padding-big white-bg" >
<div class="container">	
<div class="card-group">
	<div class="card">
		<div style="background:#333; height:300px;"></div>
		<div class="card-block">
			<h5 class="card-title">숙박업소</h5>
			<p class="card-text">설명</p>
			<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
					aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
					class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
				5 Stars</p>
		</div>
	</div>
	<div class="card">
		<div style="background:#333; height:300px;"></div>
		<div class="card-block">
			<h5 class="card-title">숙박업소</h5>
			<p class="card-text">설명</p>
			<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
					aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
					class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
				5 Stars</p>
		</div>
	</div>
	<div class="card">
		<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">숙박업소</h5>
				<p class="card-text">설명</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
	</div>
</div>
</div>
        <br><br><br>

       &nbsp;&nbsp;&nbsp;<span style="font-size: 25px">액티비티 Top3</span> &nbsp;&nbsp;<a href="">more</a>
        <hr id="hrf" >
<div class="box-padding-big light-bg" >
<div class="container">
	<div class="card-group">
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">액티비티</h5>
				<p class="card-text">설명</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">액티비티</h5>
				<p class="card-text">설명</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
				<div class="card-block">
					<h5 class="card-title">액티비티</h5>
					<p class="card-text">설명</p>
					<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
							aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
							class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
						5 Stars</p>
				</div>
			</div>
		</div>
	</div>
</div>
    <br><br><br>

       &nbsp;&nbsp;&nbsp; <span style="font-size: 25px">맛집 Top3</span> &nbsp;&nbsp;<a href="">more</a>
        <hr id="hrf" >
      <div class="box-padding-big white-bg" >
<div class="container">
	<div class="card-group">
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">맛집</h5>
				<p class="card-text">설명</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">맛집</h5>
				<p class="card-text">설명</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
				<div class="card-block">
					<h5 class="card-title">맛집</h5>
					<p class="card-text">설명</p>
					<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
							aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
							class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
						5 Stars</p>
				</div>
			</div>
		</div>
	</div>

</div>
 <br><br><br>
    </section>
    
    <!-- <script>
    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  return false;
    	});
    </script>
    
     -->
    
    
    
    
    
    
    
    
    

<%@ include file="/views/common/footer.jsp" %>