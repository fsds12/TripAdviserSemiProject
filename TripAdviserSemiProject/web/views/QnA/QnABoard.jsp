<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Board> list=(List)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	String type=(String)request.getAttribute("type");
	String key=(String)request.getAttribute("key");
	Member m = (Member)session.getAttribute("loginMember");
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<style>
	div#search-id{
		display: none;
	}
	div#search-content{
		display: none;
	}
	div#search-title{
		display: inline-block;
	}
	input#viewBtn{
		border: none;
		background-color: white;
		cursor: pointer;
		color: slategrey;
	}
	input#viewBtn:hover{
		background-color: whitesmoke;
	}
</style>
<script>
	$(function(){		
	
	var title=$('#search-title');
	var user=$('#search-id');
	var content=$('#search-content');
	var searchType=$('#searchType');
	
	searchType.on("change", function(){
		title.css("display", "none");		
		content.css("display", "none");
		user.css("display", "none");
		
		$('[name=cPage]').val('1');
		$('[name=numPerPage]').val('10');
		
		$('#search-'+$(this).val()).css("display", "inline-block");
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
            	<%if(loginMember!=null){ %>                        	
            	<td colspan="5">            	
            		<input type="button" value="쓰기" class="write-btn" onclick="location.href='<%=request.getContextPath()%>/QnA/QnAWrite'"/>
            	</td>
            	<%} %>
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
            <tr id="boardList-tr">
                <td><%=b.getBoardNo() %></td>
                <td><%=b.getMemberId() %></td>                
                <td>               	
                	<%-- <form name="qnaViewFrm" action="<%=request.getContextPath()%>/QnA/QnABoardView" method="post">
						<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="userId" value="<%=b.getMemberId()%>"/>
						<input type="submit" id="viewBtn" value="<%=b.getTitle()%>"/>
					</form> --%>
					<a href="<%=request.getContextPath()%>/QnA/QnABoardView?boardNo=<%=b.getBoardNo()%>"><%=b.getTitle()%></a>
                </td>                
                <td><%=b.getBoardDate() %></td>
                <td><%=b.getHits() %></td>
            </tr>
            <%}%>                    
    	</tbody>                   
	</table>
	
        <div id="search-container">
        	<button id="search-btn" onclick="location.href='<%=request.getContextPath()%>/QnA/QnAList'">목록</button>
            <select id="searchType">
                <option value="title" <%="title".equals(type)?"selected":"" %>>제목</option>                
                <option value="content" <%="content".equals(type)?"selected":"" %>>내용</option>
                <%-- <option value="user" <%="memberId".equals(type)?"selected":"" %>>작성자</option> --%>                
            </select>
            <div id="search-title">
            	<form action="<%=request.getContextPath()%>/QnA/QnAFind">
            		<input type="hidden" name="type" value="title"/>
            		<input type="hidden" name="cPage" value="<%=cPage%>"/>
            		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"/>            	
            		<input type="search" name="key" value='<%="title".equals(type)?key:"" %>' placeholder="title"/>
            		<button type="submit" id="search-btn">검색</button>
            	</form>
            </div>            
            <div id="search-content">
            	<form action="<%=request.getContextPath()%>/QnA/QnAFind">
            		<input type="hidden" name="type" value="content"/>
            		<input type="hidden" name="cPage" value="<%=cPage%>"/>
            		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"/>            	
            		<input type="search" name="key" value='<%="content".equals(type)?key:""%>' placeholder="content"/>
            		<button type="submit" id="search-btn">검색</button>
            	</form>
            </div>
            <%-- <div id="search-id">
            	<form action="<%=request.getContextPath()%>/QnA/QnAFind">
            		<input type="hidden" name="type" value="user"/>
            		<input type="hidden" name="cPage" value="<%=cPage%>"/>
            		<input type="hidden" name="numPerPage" value="<%=numPerPage%>"/>            	
            		<input type="search" name="key" value='<%="user".equals(type)?key:""%>' placeholder="user"/>
            		<button type="submit" id="search-btn">검색</button>
            	</form>
            </div> --%>                      	               
        </div>        
         <div id="paging-container"> 
            <ul class="pagination pagination-sm justify-content-center">
    			<%=pageBar %>
  			</ul>            
   		</div>
</section>

<%@ include file="/views/common/footer.jsp" %>