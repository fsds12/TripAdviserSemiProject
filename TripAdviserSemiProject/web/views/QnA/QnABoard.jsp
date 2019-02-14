<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<%-- <%@ include file="/views/notice/nav.jsp" %> --%>

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
            <tr>
                <td>10</td>
                <td>user01</td>
                <td><a href="<%=request.getContextPath()%>/QnA/QnABoardView">testQnA</a></td>
                <td>19.02.12</td>
                <td>19</td>
            </tr>
            <tr>
                <td>2</td>
                <td>아무개</td>
                <td>공지사항</td>
                <td>19/01/23</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>이순신</td>
                <td>공지사항</td>
                <td>19/01/24</td>
                <td>1</td>
            </tr>
            <tr>
                <td>4</td>
                <td>관리자</td>
                <td>공지사항</td>
                <td>19/01/25</td>
                <td>1</td>
            </tr>
            <tr>
                <td>5</td>
                <td>관리자</td>
                <td>공지사항</td>
                <td>19/01/26</td>
                <td>1</td>
            </tr>            
    	</tbody>                   
	</table>
        <div id="search-container">
            <select id="search-category">
                <option value="제목">제목</option>
                <option value="제목">작성자</option>
                <option value="글번호">글번호</option>                
            </select>            
            <input type="search" name="search" id="search-text"/>
            <input type="button" value="검색" id="search-btn"/>           	               
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