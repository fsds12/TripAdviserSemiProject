<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<section id="search-after">
        <form id="semi2" action="" method="post">
            <br>
             <input class="form-control" type="text" id="search2" name="search2"  placeholder="여행지 입력" style="display:inline-block">&nbsp;
             <button type="button" id="searchbtn2" name="searchbtn2" class="btn btn-secondary" style="padding: 0px;display:inline-block">여행지 검색</button>
        </form>
        <br><br><br><br>
        
&nbsp;&nbsp;&nbsp;<span style="font-size: 25px">선택된 카테고리 : </span> +선택된카테고리
<hr id="hrf" >

     <div class="container" >	
<%for(int i=1; i<=9; i++) {%>
<%if(i%3 == 1)  {%>
<div class="card-group" id="sear-af">
<%} %>
 	
      <div class="card" style="border:1px solid black; width:300px; display: inline-block; margin-bottom: 20px;">
         <div style="background:#333; height:300px;"></div>
         <div class="card-block">
            <h5 class="card-title">제목</h5>
            <p class="card-text">설명</p>
            <p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
                  aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
                  class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
               5 Stars</p>
         </div>
      </div>
   
 <%if(i%3 == 0)  {%>     
   </div>
   <%} %>
  <%} %>
   </div>

        

       

    </section>

<%@ include file="/views/common/footer.jsp" %>