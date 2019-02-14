<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<style>
section#myComment-container {
}
</style>

<section id="myComment-container" style="text-align: center;">
	<article style="display:inline-block; text-align: left; margin-top: 20px;">
		<table id="myComment-table" class="table">
			<thead>
				<tr>
					<th>여행지제목</th>
					<th>작성일자</th>
					<th>평점</th>
					<th>코멘트내용</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0; i<4; i++) {%>
				<tr>
					<td>테스트공원ㅁ</td>
					<td>2019.02.11</td>
					<td>★★★★★</td>
					<td>테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트</td>
					<td></td>
				</tr>
			<%} %>
				<tr>
					<td>테스트공원테스트공원</td>
					<td>2019.02.11</td>
					<td>★★★★★</td>
					<td>테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트</td>
					<td>
					<span class="comment-btn">
						<button class='btn btn-primary' onclick="fn_comment_modify(5)">수정</button> <button class='btn btn-light' onclick="fn_comment_delete(5)">삭제</button>
					</span>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<nav id="pageBar">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
							</ul> 
						</nav>
					</td>
				</tr>
			</tfoot>
		</table>
	</article>
</section>

<%@ include file="/views/common/footer.jsp" %>