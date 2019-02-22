<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,tripAdviser.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp" %>

<%
	List<Board> list=(List)request.getAttribute("list");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	String pageBar=(String)request.getAttribute("pageBar");
	String searchType=(String)request.getAttribute("searchType");
	String searchKey=(String)request.getAttribute("searchKey");
%>
<style>	
	div#search-content{
		display:none;
	}
	div#search-title{
		margin-left: 10px;
		display: inline-block;
	}
</style>
<script>
	$(function(){		
		var searchTitle=$('#search-title');
		var searchContent=$('#search-content');		
		var searchType=$('#searchType');
		
		searchType.on("change", function(){
			searchTitle.css("display", "none");
			searchContent.css("display", "none");			
			
			$('[name=cPage]').val('1');
			$('[name=numPerPage]').val('10');
			$('#search-'+$(this).val()).css("display", "inline-block");
		});
		
		 $('#searchType').trigger("change"); 
	});
</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
 <section id="notice-section" class="notice-section">    
    	<div class="caption">
			<img src="<%=request.getContextPath()%>/images/notice.png" width="800px"/>
		</div>    	  	
        <table align="center" class="notice-tbl">                    
            <thead>
            <tr>
            	<td colspan="5">
            		<input type="button" value="쓰기" class="write-btn" onclick="location.href='<%=request.getContextPath()%>/notice/noticeWrite'"/>
            	</td>
            </tr>                        
            <tr class="title">
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <%for(Board b : list){ %>                        
            <tr>
                <td><%=b.getBoardNo()%></td>
                <td><%=b.getMemberId() %></td>
                <td><a href="<%=request.getContextPath()%>/notice/noticeView?boardNo=<%=b.getBoardNo()%>"><%=b.getTitle()%></a></td> 
                <td><%=b.getBoardDate() %></td>
                <td><%=b.getHits() %></td>
            </tr>
            <%} %>            
            </tbody>                   
        </table>
        
        <div id="search-container">
        	<button id="search-btn" onclick="location.href='<%=request.getContextPath()%>/notice/noticeList'">목록</button>
            <select id="searchType">
                <option value="title" <%="title".equals(searchType)?"selected":"" %>>제목</option>
                <option value="content" <%="content".equals(searchType)?"selected":"" %>>내용</option>                
            </select>            
            <div id="search-title">
            	<form action="<%=request.getContextPath()%>/notice/noticeFind">
            		<input type="hidden" name="searchType" value="title"/>            		
            		<input type="hidden" name="cPage" value='<%=cPage%>'/>
            		<input type="hidden" name="numPerPage" value='<%=numPerPage%>'/>
            		<input type="search" name="searchKey" value='<%="title".equals(searchType)?searchKey:""%>' placeholder="title"/>
            		<button type="submit" id="search-btn">검색</button>
            	</form>
            </div>
            
            <div id="search-content">
            	<form action="<%=request.getContextPath()%>/notice/noticeFind">
            		<input type="hidden" name="searchType" value="content"/>            		
            		<input type="hidden" name="cPage" value="<%=cPage%>"/>
            		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"/>
            		<input type="search" name="searchKey" value='<%="content".equals(searchType)?searchKey:""%>' placeholder="content"/>
            		<button type="submit" id="search-btn">검색</button>
            	</form>
            </div>                     
                     	               
        </div> 
              
         <div id="paging-container"> 
            <ul class="pagination pagination-sm justify-content-center">
    			<%=pageBar %>
  			</ul>             
   		</div>
</section>
<%@ include file="/views/common/footer.jsp" %>