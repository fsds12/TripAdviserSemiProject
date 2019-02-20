<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct, tripAdviser.member.model.vo.Member, java.util.*" %>

<%@ include file="/views/common/header.jsp"%>

<%
	
List<TravelProduct> list=(List)request.getAttribute("list");
String searchType=(String)request.getAttribute("searchType");
String searchKeyword=(String)request.getAttribute("searchKeyword");
String pageBar=(String)request.getAttribute("pageBar");
int cPage=(int)request.getAttribute("cPage");
int numPerPage=(int)request.getAttribute("numPerPage");

%>




<section id="trvList">
		
		<div class="container">
	<%-- <form name="AdminListFrm" id="AdminListFrm" action="<%=request.getContextPath() %>/travel/TravelAdminListView" method="post">  --%>

			
			<div id="con-bottom">


				<table class="table table-striped" style="margin-bottom: 1px">
					<thead id="pro-list">
						<tr>
							
							<th>여행제목</th>
							<th>카테고리</th>
							<th>작성일자</th>
							<th>작성자</th>
						
						</tr>
					</thead>
					<tbody>
						<%
							for(TravelProduct t : list)
							{
						%>
						 
						<tr>
							<td>
								<a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=t.getTrvNo()%>">
									<%=t.getTrvTitle() %>
								</a>
								
							</td>
							<td><%=t.getTrvSmallCtg() %></td>
							<td><%=t.getTrvDate() %></td>
							<td><%=t.getMemberId() %></td>
						</tr>
						<%  } %>
						
						
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							
						</tr>
					</tfoot>
				</table>

			</div>
				<%=pageBar %>
			
		<!-- </form>  -->
			
				
			<div class="row aln-center">

				<div class="col-12">

					<select class="custom-select" id="category">
						<option value="memberId" <%="memberId".equals(searchType)?"selected":"" %>>카테고리별</option>
						<!-- <option>휴식거리</option>
						<option>즐길거리</option>
						<option>먹을거리</option>
						<option>읽을거리</option> -->
					</select>
					
				<form action="<%=request.getContextPath() %>/travel/TravelAdminFind">
					<input type="hidden" name="searchType" value="memberId"/>
					<input type="hidden" name="cPage" value="<%=cPage %>"/>
					<input type="hidden" name="numPerPage" value="<%=numPerPage %>"/>
					<input type="text" id="item" class="form-control" name="searchKeyword" value='<%="memberId".equals(searchType)?searchKeyword:"" %>'
					placeholder="카테고리를 입력하세요"/>
					
					<!-- <input type="text" class="form-control" name="item" id="item" /> -->
					<button type="submit" id="pro-search">검색</button>
				</form>
				</div>
			</div>
		</div>
	
</section>

<%@ include file="/views/common/footer.jsp"%>