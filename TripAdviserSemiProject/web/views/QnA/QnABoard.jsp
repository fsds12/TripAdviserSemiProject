<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.Board" %>
<%
	List<Board> list=(List)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">

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
                <td><a href="<%=request.getContextPath()%>/QnA/QnABoardView"><%=b.getTitle() %></a></td>
                <td><%=b.getBoardDate() %></td>
                <td><%=b.getHits() %></td>
            </tr>
            <%} %>                    
    	</tbody>                   
	</table>
        <div id="search-container">
        	<button id="search-btn" onclick="location.href='<%=request.getContextPath()%>/QnA/QnAList'">목록</button>
            <select id="search-category">
                <option value="제목">제목</option>
                <option value="제목">작성자</option>
                <option value="글번호">글번호</option>                
            </select>            
            <input type="search" name="search" id="search-text"/>
            <button id="search-btn">검색</button>          	               
        </div>        
         <div id="paging-container"> 
            <ul class="pagination pagination-sm justify-content-center">
    			<li class="page-item"><a class="page-link" href="#"><<</a></li>
    			<li class="page-item"><a class="page-link" href="#">1</a></li>
    			<li class="page-item"><a class="page-link" href="#">2</a></li>
    			<li class="page-item"><a class="page-link" href="#">3</a></li>
    			<li class="page-item"><a class="page-link" href="#">4</a></li>
    			<li class="page-item"><a class="page-link" href="#">5</a></li>
    			<li class="page-item"><a class="page-link" href="#">>></a></li>
  			</ul>            
   		</div>
</section>
<%@ include file="/views/common/footer.jsp" %>