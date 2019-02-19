<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct, tripAdviser.member.model.vo.Member, java.util.*" %>
<%@ include file="/views/common/header.jsp"%>

<%
	
/* String id = "admin";	//세션에서 로그인한 사용자의 객체를 불러와서 초기화할예정 임시로 스트링객체선언
Member m = (Member)session.getAttribute("loginMember");
boolean logined = m != null? true:false; */
List<TravelProduct> list=(List)request.getAttribute("list");
/* TravelProduct tp = (TravelProduct)request.getAttribute("travelProduct"); */ 
String pageBar=(String)request.getAttribute("pageBar");
/* int cPage=(int)request.getAttribute("cPage");
int numPerPage=(int)request.getAttribute("numPerPage");
 */
%>

<section id="trvList">
	<form action="<%=request.getContextPath() %>/travel/TravelAdminListView" method="post">
		<input type="hidden" name="trvNo" value=""/>
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
						<%if(!list.isEmpty()) { 
							for(TravelProduct tp : list)
							{
						%>
						 
						<tr>
							<td><%=tp.getTrvTitle() %></td>
							
						</tr>
						<%  }
						}%>
						<!-- <tr>
							
							<td></td>
							<td>리스트값</td>
							<td>리스트값</td>
							<td>리스트값</td>
						
						
						</tr>

						<tr>
							<td>리스트값</td>
							<td>리스트값</td>
							<td>리스트값</td>
							<td>리스트값</td>
							
							
						</tr>

						<tr>
							<td>리스트값</td>
							<td>리스트값</td>
							<td>리스트값</td>
							<td>리스트값</td>
				
						
						</tr> -->
						
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
			

			
			<!-- <nav id="trvList" aria-label="Page navigation example" style="text-align: center;">
<				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
					
				</ul> 
			</nav> -->
				<div>
					<%=pageBar %>
				</div>
			<div class="row aln-center">

				<div class="col-12">

					<select id="category">
						<option>항목</option>
						<option>카테고리명</option>
						<option>상품제목</option>
					</select>

					<input type="text" name="item" id="item" />
					<button id="pro-search">검색</button>

				</div>
			</div>
		</div>
	</form>
</section>

<%@ include file="/views/common/footer.jsp"%>