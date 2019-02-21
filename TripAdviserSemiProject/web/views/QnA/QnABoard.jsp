<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.Board" %>
<%
	List<Board> list=(List)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<style>
	div#search-user, div#search-content{
		display: none;
	}
	div#search-title{
		display: inline-block;
	}
</style>
<script>
	$(function(){		
	
	var title=$('#search-title');
	var user=$('#search-user');
	var content=$('#search-content');
	
	$('#searchType').on("change", function(){
		title.css("display", "none");
		user.css("display", "none");
		content.css("display", "none");
		
		$('#search-' + $(this).val()).css("display", "inline-block");
	});
	
		$('#searchType').trigger("change");
	})
</script>
 <section id="notice-section" class="notice-section">    
    <div class="caption">
    	<img src="<%=request.getContextPath()%>/images/qnaBoard4.png" width="800px"/>
    </div>    	  	
    <table align="center" class="notice-tbl">                    
    	<thead>
            <tr>
            	<td colspan="5">
            		<input type="button" value="쓰기" class="write-btn" onclick="location.href='<%=request.getContextPath()%>/QnA/QnAWrite'"/>
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
                <td><%=b.getBoardNo() %></td>
                <td><%=b.getMemberId() %></td>
                <td><a href="<%=request.getContextPath()%>/QnA/QnABoardView?boardNo=<%=b.getBoardNo()%>"><%=b.getTitle() %></a></td>
                <td><%=b.getBoardDate() %></td>
                <td><%=b.getHits() %></td>
            </tr>
            <%} %>                    
    	</tbody>                   
	</table>
        <div id="search-container">
        	<button id="search-btn" onclick="location.href='<%=request.getContextPath()%>/QnA/QnAList'">목록</button>
            <select id="searchType">
                <option value="title">제목</option>
                <option value="userId">작성자</option>
                <option value="content">내용</option>                
            </select>
            <div id="search-title">
            	<input type="hidden" name="type"/>
            	<input type="hidden" name="key"/>            	
            	<input type="search" name="search" placeholder="title"/>
            	<button id="search-btn">검색</button>
            </div>
            <div id="search-user">
            	<input type="hidden" name="type"/>
            	<input type="hidden" name="key"/>            	
            	<input type="search" name="search" placeholder="user"/>
            	<button id="search-btn">검색</button>
            </div>
            <div id="search-content">
            	<input type="hidden" name="type"/>
            	<input type="hidden" name="key"/>            	
            	<input type="search" name="search" placeholder="content"/>
            	<button id="search-btn">검색</button>
            </div>            
            
                      	               
        </div>        
         <div id="paging-container"> 
            <ul class="pagination pagination-sm justify-content-center">
    			<%=pageBar %>
  			</ul>            
   		</div>
</section>
<%@ include file="/views/common/footer.jsp" %>