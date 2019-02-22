<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct, tripAdviser.member.model.vo.Member, java.util.*" %>

<%@ include file="/views/common/header.jsp"%>

<%
	
List<TravelProduct> list=(List)request.getAttribute("list");
String pageBar=(String)request.getAttribute("pageBar");

%>




<section id="trvList">
	<form name="AdminListFrm" id="AdminListFrm" action="<%=request.getContextPath() %>/travel/TravelAdminListView" method="post">
		<!-- <input type="hidden" name="trvNo" value=""/> -->
		<div class="container">

			
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
			

			
				<div>
					<%=pageBar %>
				</div>
			<div class="row aln-center">

				<div class="col-12">

					<select class="custom-select" id="category">
						<option>항목</option>
						<option>카테고리명</option>
						<option>상품제목</option>
					</select>

					<input type="text" class="form-control" name="item" id="item" />
					<button id="pro-search">검색</button>

				</div>
			</div>
		</div>
	</form>
</section>

<%@ include file="/views/common/footer.jsp"%>